/* Public domain.
   Ten worker threads for CORES. schedule returns at once. A PAUSE
   (kernel_task_run result 1) keeps the same thread and the same task.
   STOP finishes the run. join blocks until every scheduled run has
   finished. wake remembers a signal that arrives before wait.

   POSIX counterpart of Forth/host/cores_win.c. The per-thread register
   file is arm_tls. Translated x64 code addresses it through r15. */

#if !defined(_GNU_SOURCE)
#define _GNU_SOURCE
#endif

#include "kernel_api.h"

#include <errno.h>
#include <pthread.h>
#include <semaphore.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/syscall.h>
#include <ucontext.h>
#include <unistd.h>

#define CORE_SLOTS 10

/* Per-thread image of x0..x30 and NZCV. xN is qword N. N is byte 248,
   Z 249, C 250, V 251. Workers and the console each have their own. */
static __thread unsigned long long arm_tls[32];

void *arm_load_base(void)
{
    return arm_tls;
}

extern unsigned long long core_sp[CORE_SLOTS];
extern unsigned long long core_task[CORE_SLOTS];
extern unsigned long long core_pthread[CORE_SLOTS];
extern int kernel_task_enter(unsigned long long task, int slot);
extern void ktr_fault_resume(void);
extern void eval_fault_resume(void);
extern unsigned long long eval_frame_sp;

static volatile sig_atomic_t eval_busy;
static unsigned long long eval_tid;

static unsigned long long host_tid(void)
{
    return (unsigned long long)syscall(SYS_gettid);
}

/* kernel_init and kernel_eval arm this on the console thread. A fault
   there resumes at eval_fault_resume. Cleared before that resume so a
   second fault does not loop. */
void host_eval_fault_enter(void)
{
    eval_tid = host_tid();
    eval_busy = 1;
}

void host_eval_fault_leave(void)
{
    eval_busy = 0;
}

static pthread_mutex_t g_lock;
static sem_t g_sem[CORE_SLOTS];
static sem_t g_event[CORE_SLOTS];
static pthread_t g_thread[CORE_SLOTS];
static sem_t g_console_sem;
static sem_t g_join_sem;
static int g_waiting[CORE_SLOTS];
static int g_pending[CORE_SLOTS];
static int g_console_waiting;
static int g_console_pending;
static int g_depth[CORE_SLOTS];
static unsigned long long g_slot_task[CORE_SLOTS];
static unsigned long long *g_backlog;
static int g_backlog_n;
static int g_backlog_cap;
static int g_inflight;
static int g_join_waiters;
static int g_started;
static int g_ready;

static void *cores_slot_main(void *arg);

static void sem_wait_retry(sem_t *sem)
{
    while (sem_wait(sem) != 0) {
        if (errno != EINTR)
            return;
    }
}

static void fault_resume(ucontext_t *uc, unsigned long long sp, void *pc)
{
#if defined(__aarch64__)
    uc->uc_mcontext.pc = (unsigned long long)(uintptr_t)pc;
    uc->uc_mcontext.sp = sp;
#elif defined(__x86_64__)
    uc->uc_mcontext.gregs[REG_RIP] = (greg_t)(uintptr_t)pc;
    uc->uc_mcontext.gregs[REG_RSP] = (greg_t)sp;
#else
#error EditForthLin faults are resumed on ARM64 and x64 only
#endif
}

/* A worker memory fault resumes at ktr_fault_resume and returns -1.
   A console kernel_init or kernel_eval fault resumes at eval_fault_resume.
   Any other thread keeps the default handler. */
static void cores_fault(int sig, siginfo_t *info, void *ctx)
{
    ucontext_t *uc = (ucontext_t *)ctx;
    unsigned long long tid;
    int i;
    unsigned long long sp;
    unsigned long long task;

    (void)info;
    tid = host_tid();
    for (i = 0; i < CORE_SLOTS; i++) {
        if (core_pthread[i] != tid)
            continue;
        task = core_task[i];
        sp = core_sp[i];
        if (task == 0 || sp == 0 || (sp & 15ull) != 0)
            break;
        fault_resume(uc, sp, (void *)ktr_fault_resume);
        return;
    }
    if (eval_busy && tid == eval_tid) {
        sp = eval_frame_sp;
        if (sp != 0 && (sp & 15ull) == 0) {
            eval_busy = 0;
            fault_resume(uc, sp, (void *)eval_fault_resume);
            return;
        }
    }
    signal(sig, SIG_DFL);
    raise(sig);
}

int kernel_task_run(uint64_t task, int slot)
{
    if (task == 0 || (unsigned)slot >= CORE_SLOTS)
        return -2;
    core_pthread[slot] = host_tid();
    return kernel_task_enter(task, slot);
}

static int idle_slot(void)
{
    int i;

    for (i = 0; i < CORE_SLOTS; i++) {
        if (g_depth[i] == 0)
            return i;
    }
    return -1;
}

static int find_slot(unsigned long long task)
{
    int i;

    for (i = 0; i < CORE_SLOTS; i++) {
        if (g_depth[i] != 0 && g_slot_task[i] == task)
            return i;
    }
    return -1;
}

static int backlog_push(unsigned long long task)
{
    unsigned long long *grown;
    int cap;

    if (g_backlog_n >= g_backlog_cap) {
        cap = g_backlog_cap == 0 ? 32 : g_backlog_cap * 2;
        grown = (unsigned long long *)realloc(g_backlog, (size_t)cap * sizeof *grown);
        if (grown == NULL)
            return 0;
        g_backlog = grown;
        g_backlog_cap = cap;
    }
    g_backlog[g_backlog_n++] = task;
    return 1;
}

static void ensure_threads(void)
{
    int i;

    if (g_started)
        return;
    g_started = 1;
    for (i = 0; i < CORE_SLOTS; i++) {
        if (pthread_create(&g_thread[i], NULL, cores_slot_main, (void *)(intptr_t)i) != 0)
            g_thread[i] = 0;
    }
}

static unsigned long long finish_run(int idx)
{
    unsigned long long next = 0;
    int signal_join = 0;

    pthread_mutex_lock(&g_lock);
    if (g_depth[idx] > 0)
        g_depth[idx]--;
    if (g_inflight > 0)
        g_inflight--;
    g_slot_task[idx] = 0;
    if (g_depth[idx] == 0 && g_backlog_n > 0) {
        int n;

        next = g_backlog[0];
        for (n = 1; n < g_backlog_n; n++)
            g_backlog[n - 1] = g_backlog[n];
        g_backlog_n--;
        g_depth[idx]++;
        g_slot_task[idx] = next;
    }
    if (g_inflight == 0 && g_join_waiters > 0) {
        g_join_waiters--;
        signal_join = 1;
    }
    pthread_mutex_unlock(&g_lock);
    if (signal_join)
        sem_post(&g_join_sem);
    return next;
}

static void *cores_slot_main(void *arg)
{
    int idx = (int)(intptr_t)arg;

    for (;;) {
        unsigned long long task;

        sem_wait_retry(&g_event[idx]);
        pthread_mutex_lock(&g_lock);
        task = g_slot_task[idx];
        pthread_mutex_unlock(&g_lock);
        while (task != 0) {
            int rc = kernel_task_run(task, idx);

            if (rc == 1)
                continue;
            if (rc < 0)
                fprintf(stderr, "core task fault\n");
            task = finish_run(idx);
        }
    }
    return NULL;
}

static void cores_schedule(uint64_t task)
{
    int idx;

    if (!g_ready || task == 0)
        return;
    pthread_mutex_lock(&g_lock);
    ensure_threads();
    g_inflight++;
    idx = idle_slot();
    if (idx >= 0) {
        g_depth[idx]++;
        g_slot_task[idx] = task;
        pthread_mutex_unlock(&g_lock);
        sem_post(&g_event[idx]);
        return;
    }
    if (!backlog_push(task)) {
        if (g_inflight > 0)
            g_inflight--;
        pthread_mutex_unlock(&g_lock);
        fprintf(stderr, "core task fault\n");
        return;
    }
    pthread_mutex_unlock(&g_lock);
}

static void cores_wait(uint64_t task)
{
    int idx;

    if (!g_ready)
        return;
    pthread_mutex_lock(&g_lock);
    idx = find_slot(task);
    if (idx >= 0) {
        if (g_pending[idx]) {
            g_pending[idx] = 0;
            pthread_mutex_unlock(&g_lock);
            return;
        }
        g_waiting[idx] = 1;
        pthread_mutex_unlock(&g_lock);
        sem_wait_retry(&g_sem[idx]);
        pthread_mutex_lock(&g_lock);
        g_waiting[idx] = 0;
        g_pending[idx] = 0;
        pthread_mutex_unlock(&g_lock);
        return;
    }
    if (g_console_pending) {
        g_console_pending = 0;
        pthread_mutex_unlock(&g_lock);
        return;
    }
    g_console_waiting = 1;
    pthread_mutex_unlock(&g_lock);
    sem_wait_retry(&g_console_sem);
    pthread_mutex_lock(&g_lock);
    g_console_waiting = 0;
    g_console_pending = 0;
    pthread_mutex_unlock(&g_lock);
}

static void cores_wake(void)
{
    int fire[CORE_SLOTS];
    int nfire = 0;
    int fire_console = 0;
    int i;

    if (!g_ready)
        return;
    pthread_mutex_lock(&g_lock);
    for (i = 0; i < CORE_SLOTS; i++) {
        if (g_waiting[i])
            fire[nfire++] = i;
        else
            g_pending[i] = 1;
    }
    if (g_console_waiting)
        fire_console = 1;
    else
        g_console_pending = 1;
    pthread_mutex_unlock(&g_lock);
    for (i = 0; i < nfire; i++)
        sem_post(&g_sem[fire[i]]);
    if (fire_console)
        sem_post(&g_console_sem);
}

static void cores_join(void)
{
    if (!g_ready)
        return;
    pthread_mutex_lock(&g_lock);
    if (g_inflight == 0) {
        pthread_mutex_unlock(&g_lock);
        return;
    }
    g_join_waiters++;
    pthread_mutex_unlock(&g_lock);
    sem_wait_retry(&g_join_sem);
}

void cores_host_init(void)
{
    struct sigaction sa;
    int i;

    memset(&sa, 0, sizeof sa);
    if (pthread_mutex_init(&g_lock, NULL) != 0)
        return;
    if (sem_init(&g_join_sem, 0, 0) != 0)
        return;
    if (sem_init(&g_console_sem, 0, 0) != 0)
        return;
    for (i = 0; i < CORE_SLOTS; i++) {
        if (sem_init(&g_sem[i], 0, 0) != 0)
            return;
        if (sem_init(&g_event[i], 0, 0) != 0)
            return;
    }
    sa.sa_sigaction = cores_fault;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_SIGINFO;
    sigaction(SIGSEGV, &sa, NULL);
    sigaction(SIGBUS, &sa, NULL);
    g_ready = 1;
    kernel_set_core_schedule(cores_schedule);
    kernel_set_core_wait(cores_wait);
    kernel_set_core_wake(cores_wake);
    kernel_set_core_join(cores_join);
}
