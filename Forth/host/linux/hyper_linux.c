/* Public domain.
   Background HYPER-REINDEX for Linux. The Forth word (HX-BG-REINDEX) calls
   host_hyper_reindex. A second forth* --agent writes Config/HYPER.NDX.building.
   The live index is replaced only after that child prints HX-BUILD-OK and
   exits 0. The editor companion returns at once and reloads later. A
   standalone agent waits, then returns 1 so Forth reloads before
   HYPER-REINDEX returns. */

#if !defined(_DEFAULT_SOURCE) && !defined(_POSIX_C_SOURCE)
#define _DEFAULT_SOURCE
#endif

#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#define HYPER_PATH 1024
#define HYPER_SOURCES 4096
#define HYPER_CAPTURE 8192

int host_documents_dir(char *dst, size_t cap);
char *host_hyper_source_list(long long *out_len);
void host_outs(const char *s);

int companion_is_active(void);
int companion_is_ready(void);
void companion_status_note(const char *text);
int companion_eval_idle(const char *text);

static volatile int g_hyper_busy;

static void hyper_note(const char *text)
{
    if (text == NULL)
        return;
    if (companion_is_active())
        companion_status_note(text);
    else
        host_outs(text);
}

static void hyper_console(const char *text)
{
    host_outs(text);
}

static int hyper_abs_path(const char *rel)
{
    if (rel == NULL || rel[0] == '\0')
        return 0;
    if (rel[0] == '/' || rel[0] == '\\')
        return 1;
    return 0;
}

static int hyper_join(char *dst, int cap, const char *dir, const char *rel)
{
    int n;
    int i;

    if (hyper_abs_path(rel))
        n = snprintf(dst, (size_t)cap, "%s", rel);
    else
        n = snprintf(dst, (size_t)cap, "%s/%s", dir, rel != NULL ? rel : "");
    if (n <= 0 || n >= cap)
        return 0;
    for (i = 0; dst[i] != '\0'; i++) {
        if (dst[i] == '\\')
            dst[i] = '/';
    }
    return 1;
}

static int hyper_mtime(const char *path, time_t *out, int *exists, long long *size)
{
    struct stat st;

    *exists = 0;
    *size = 0;
    *out = 0;
    if (path == NULL || path[0] == '\0')
        return 0;
    if (stat(path, &st) != 0)
        return 0;
    if (!S_ISREG(st.st_mode))
        return 0;
    *exists = 1;
    *out = st.st_mtime;
    *size = (long long)st.st_size;
    return 1;
}

static char hyper_fold(char c)
{
    if (c == '\\')
        return '/';
    if (c >= 'A' && c <= 'Z')
        return (char)(c - 'A' + 'a');
    return c;
}

static int hyper_same_path(const char *a, const char *b)
{
    int i;

    if (a == NULL || b == NULL)
        return 0;
    for (i = 0;; i++) {
        char ca = hyper_fold(a[i]);
        char cb = hyper_fold(b[i]);
        if (ca != cb)
            return 0;
        if (ca == '\0')
            return 1;
    }
}

static int hyper_has(char **list, int n, const char *path)
{
    int i;

    for (i = 0; i < n; i++) {
        if (hyper_same_path(list[i], path))
            return 1;
    }
    return 0;
}

static void hyper_free_list(char **list, int n)
{
    int i;

    for (i = 0; i < n; i++)
        free(list[i]);
}

static int hyper_split(char *text, char **list, int cap)
{
    int n = 0;
    char *p = text;

    if (text == NULL)
        return 0;
    while (*p != '\0' && n < cap) {
        char *end = p;
        int len;

        while (*end != '\0' && *end != '\n' && *end != '\r')
            end++;
        len = (int)(end - p);
        while (len > 0 && (p[len - 1] == ' ' || p[len - 1] == '\t'))
            len--;
        if (len > 0) {
            char *copy = (char *)malloc((size_t)len + 1);
            if (copy == NULL)
                break;
            memcpy(copy, p, (size_t)len);
            copy[len] = '\0';
            list[n++] = copy;
        }
        if (*end == '\r')
            end++;
        if (*end == '\n')
            end++;
        p = end;
    }
    return n;
}

static int hyper_index_paths(const char *index, char **list, int cap)
{
    FILE *fp;
    char line[HYPER_PATH];
    int n = 0;

    fp = fopen(index, "rb");
    if (fp == NULL)
        return 0;
    while (fgets(line, (int)sizeof line, fp) != NULL && n < cap) {
        char *s = line;
        int len;

        while (*s == ' ' || *s == '\t')
            s++;
        if (s[0] != '@' || s[1] != ' ')
            continue;
        s += 2;
        len = (int)strlen(s);
        while (len > 0 && (s[len - 1] == '\n' || s[len - 1] == '\r' ||
                           s[len - 1] == ' ' || s[len - 1] == '\t'))
            s[--len] = '\0';
        if (len <= 0)
            continue;
        list[n] = (char *)malloc((size_t)len + 1);
        if (list[n] == NULL)
            break;
        memcpy(list[n], s, (size_t)len + 1);
        n++;
    }
    fclose(fp);
    return n;
}

static int hyper_entry_count(const char *path)
{
    FILE *fp;
    char line[HYPER_PATH];
    int n = 0;

    fp = fopen(path, "rb");
    if (fp == NULL)
        return 0;
    while (fgets(line, (int)sizeof line, fp) != NULL) {
        char *s = line;
        while (*s == ' ' || *s == '\t')
            s++;
        if (*s == '\0' || *s == '\n' || *s == '\r' || *s == '#' || *s == '@')
            continue;
        n++;
    }
    fclose(fp);
    return n;
}

static int hyper_needs(const char *user, const char *index, char **sources, int nsrc)
{
    time_t index_time;
    time_t cfg_time;
    int exists = 0;
    long long size = 0;
    char cfg[HYPER_PATH];
    char **indexed;
    int nindexed;
    int i;

    if (!hyper_mtime(index, &index_time, &exists, &size) || !exists || size <= 0)
        return 1;
    if (hyper_join(cfg, (int)sizeof cfg, user, "Config/HYPER.CFG") &&
        hyper_mtime(cfg, &cfg_time, &exists, &size) && exists &&
        cfg_time > index_time)
        return 1;
    for (i = 0; i < nsrc; i++) {
        char full[HYPER_PATH];
        time_t src_time;

        if (!hyper_join(full, (int)sizeof full, user, sources[i]))
            return 1;
        if (!hyper_mtime(full, &src_time, &exists, &size) || !exists)
            continue;
        if (src_time > index_time)
            return 1;
    }
    indexed = (char **)calloc((size_t)HYPER_SOURCES, sizeof(char *));
    if (indexed == NULL)
        return 1;
    nindexed = hyper_index_paths(index, indexed, HYPER_SOURCES);
    if (nindexed != nsrc) {
        hyper_free_list(indexed, nindexed);
        free(indexed);
        return 1;
    }
    for (i = 0; i < nsrc; i++) {
        if (!hyper_has(indexed, nindexed, sources[i])) {
            hyper_free_list(indexed, nindexed);
            free(indexed);
            return 1;
        }
    }
    hyper_free_list(indexed, nindexed);
    free(indexed);
    return 0;
}

typedef struct HyperCapture {
    int read_fd;
    char buf[HYPER_CAPTURE];
    int n;
    int saw_ok;
} HyperCapture;

static void *hyper_capture_read(void *param)
{
    HyperCapture *cap = (HyperCapture *)param;
    char tmp[1024];
    char hold[9];
    int hold_n = 0;

    for (;;) {
        ssize_t got;
        char scan[9 + 1024];
        int total;
        int i;

        got = read(cap->read_fd, tmp, sizeof tmp);
        if (got < 0) {
            if (errno == EINTR)
                continue;
            break;
        }
        if (got == 0)
            break;
        if (!cap->saw_ok) {
            int k = 10;
            memcpy(scan, hold, (size_t)hold_n);
            memcpy(scan + hold_n, tmp, (size_t)got);
            total = hold_n + (int)got;
            for (i = 0; i + k <= total; i++) {
                if (memcmp(scan + i, "HX-BUILD-OK", (size_t)k) == 0) {
                    cap->saw_ok = 1;
                    break;
                }
            }
            if (total >= 9) {
                memcpy(hold, scan + total - 9, 9);
                hold_n = 9;
            } else {
                memcpy(hold, scan, (size_t)total);
                hold_n = total;
            }
        }
        if (cap->n < HYPER_CAPTURE - 1) {
            int room = HYPER_CAPTURE - 1 - cap->n;
            int take = (int)got < room ? (int)got : room;
            memcpy(cap->buf + cap->n, tmp, (size_t)take);
            cap->n += take;
            cap->buf[cap->n] = '\0';
        }
    }
    return NULL;
}

static int hyper_swap(const char *building, const char *index)
{
    char dir[HYPER_PATH];
    char *slash;

    snprintf(dir, sizeof dir, "%s", index);
    slash = strrchr(dir, '/');
    if (slash != NULL) {
        *slash = '\0';
        mkdir(dir, 0755);
    }
    if (rename(building, index) == 0)
        return 1;
    unlink(building);
    return 0;
}

typedef struct HyperJob {
    pid_t pid;
    HyperCapture *capture;
    pthread_t reader;
    int have_reader;
    char building[HYPER_PATH];
    char index[HYPER_PATH];
    int wait_here;
} HyperJob;

static int hyper_finish(HyperJob *job)
{
    int status = 0;
    int code = 1;
    char msg[256];
    int ok;
    int entries;

    if (waitpid(job->pid, &status, 0) < 0)
        code = 1;
    else if (WIFEXITED(status))
        code = WEXITSTATUS(status);
    if (job->have_reader)
        pthread_join(job->reader, NULL);
    if (job->capture->read_fd >= 0)
        close(job->capture->read_fd);
    ok = code == 0 && job->capture->saw_ok;
    if (ok) {
        struct stat st;
        if (stat(job->building, &st) != 0 || !S_ISREG(st.st_mode))
            ok = 0;
    }
    if (!ok) {
        const char *detail = job->capture->n > 0 ? job->capture->buf : NULL;
        unlink(job->building);
        if (detail == NULL || detail[0] == '\0')
            snprintf(msg, sizeof msg, "HYPER-REINDEX: failed (child exited %d)\n", code);
        else
            snprintf(msg, sizeof msg, "HYPER-REINDEX: failed\n");
        hyper_note(msg);
        if (detail != NULL && detail[0] != '\0' && companion_is_active())
            hyper_console(detail);
        free(job->capture);
        free(job);
        return 0;
    }
    entries = hyper_entry_count(job->building);
    if (!hyper_swap(job->building, job->index)) {
        hyper_note("HYPER-REINDEX: failed (could not replace Config/HYPER.NDX)\n");
        free(job->capture);
        free(job);
        return 0;
    }
    snprintf(msg, sizeof msg, "HYPER-REINDEX: %d entries, switched in Config/HYPER.NDX\n", entries);
    hyper_note(msg);
    if (companion_is_active() && !job->wait_here) {
        while (!companion_is_ready()) {
            if (!companion_is_active())
                break;
            usleep(50000);
        }
        if (companion_is_active()) {
            int rc = companion_eval_idle("ALSO HYPER-VOC HX-APPLY-INDEX PREVIOUS");
            if (rc != 0)
                companion_status_note("HYPER-REINDEX: switched the file, reload failed\n");
        }
    }
    free(job->capture);
    free(job);
    return 1;
}

static void *hyper_worker(void *param)
{
    hyper_finish((HyperJob *)param);
    __sync_lock_release(&g_hyper_busy);
    return NULL;
}

static int hyper_self(char *dst, size_t cap)
{
    ssize_t n = readlink("/proc/self/exe", dst, cap - 1);
    if (n <= 0 || (size_t)n >= cap)
        return 0;
    dst[n] = '\0';
    return 1;
}

static int hyper_launch(const char *building, pid_t *pid, HyperCapture **out_cap, pthread_t *reader)
{
    char exe[HYPER_PATH];
    char pathfile[] = "/tmp/editforth-hyper-XXXXXX";
    char body[HYPER_PATH + 2];
    char eval_load[] =
        "ONLY FORTH DEFINITIONS VOCABULARY HYPER-VOC ONLY FORTH ALSO HYPER-VOC "
        "DEFINITIONS S\" Library/Hyper/hyper-index.fth\" INCLUDED";
    char eval_build[HYPER_PATH + 80];
    int fd;
    int fds[2];
    FILE *fp;
    pid_t child;
    HyperCapture *cap;
    char *argv[8];

    if (!hyper_self(exe, sizeof exe))
        return 0;
    if (strchr(building, '"') != NULL || strchr(building, '\n') != NULL)
        return 0;
    fd = mkstemp(pathfile);
    if (fd < 0)
        return 0;
    fp = fdopen(fd, "wb");
    if (fp == NULL) {
        close(fd);
        unlink(pathfile);
        return 0;
    }
    snprintf(body, sizeof body, "%s\n", building);
    if (fwrite(body, 1, strlen(body), fp) != strlen(body)) {
        fclose(fp);
        unlink(pathfile);
        return 0;
    }
    fclose(fp);
    snprintf(eval_build, sizeof eval_build,
             "S\" %s\" HX-SET-OUT-FILE MIN-HYPER-NOISE ON HX-BUILD-INDEX", pathfile);
    if (pipe(fds) != 0) {
        unlink(pathfile);
        return 0;
    }
    setenv("HYPER_REINDEX_CHILD", "1", 1);
    child = fork();
    if (child < 0) {
        unsetenv("HYPER_REINDEX_CHILD");
        close(fds[0]);
        close(fds[1]);
        unlink(pathfile);
        return 0;
    }
    if (child == 0) {
        int nul = open("/dev/null", O_RDONLY);
        close(fds[0]);
        if (nul >= 0) {
            dup2(nul, 0);
            close(nul);
        }
        dup2(fds[1], 1);
        dup2(fds[1], 2);
        if (fds[1] > 2)
            close(fds[1]);
        argv[0] = exe;
        argv[1] = "--agent";
        argv[2] = "--no-autoload";
        argv[3] = "-e";
        argv[4] = eval_load;
        argv[5] = "-e";
        argv[6] = eval_build;
        argv[7] = NULL;
        execv(exe, argv);
        _exit(127);
    }
    unsetenv("HYPER_REINDEX_CHILD");
    close(fds[1]);
    cap = (HyperCapture *)calloc(1, sizeof *cap);
    if (cap == NULL) {
        kill(child, SIGTERM);
        close(fds[0]);
        return 0;
    }
    cap->read_fd = fds[0];
    if (pthread_create(reader, NULL, hyper_capture_read, cap) != 0) {
        kill(child, SIGTERM);
        close(fds[0]);
        free(cap);
        return 0;
    }
    *pid = child;
    *out_cap = cap;
    return 1;
}

long long host_hyper_reindex(void)
{
    char *text = NULL;
    long long text_len = 0;
    char *sources_buf[HYPER_SOURCES];
    int nsrc;
    char user[HYPER_PATH];
    char index[HYPER_PATH];
    char building[HYPER_PATH];
    const char *env;
    HyperJob *job;
    pid_t pid = -1;
    pthread_t reader;
    HyperCapture *capture = NULL;
    (void)text_len;

    env = getenv("HYPER_REINDEX_CHILD");
    if (env != NULL && env[0] == '1')
        return 0;
    if (!host_documents_dir(user, sizeof user)) {
        hyper_console("HYPER-REINDEX: no source files\n");
        return 0;
    }
    text = host_hyper_source_list(&text_len);
    nsrc = hyper_split(text, sources_buf, HYPER_SOURCES);
    free(text);
    if (nsrc <= 0) {
        hyper_console("HYPER-REINDEX: no source files\n");
        return 0;
    }
    if (!hyper_join(index, (int)sizeof index, user, "Config/HYPER.NDX") ||
        !hyper_join(building, (int)sizeof building, user, "Config/HYPER.NDX.building")) {
        hyper_free_list(sources_buf, nsrc);
        hyper_console("HYPER-REINDEX: failed (path)\n");
        return 0;
    }
    if (!hyper_needs(user, index, sources_buf, nsrc)) {
        hyper_free_list(sources_buf, nsrc);
        hyper_console("HYPER-REINDEX: up to date\n");
        return 0;
    }
    hyper_free_list(sources_buf, nsrc);
    if (__sync_val_compare_and_swap(&g_hyper_busy, 0, 1) != 0) {
        hyper_console("HYPER-REINDEX: already indexing\n");
        return 0;
    }
    if (companion_is_active())
        hyper_console("HYPER-REINDEX: indexing in the background\n");
    else
        hyper_console("HYPER-REINDEX: indexing\n");
    if (!hyper_launch(building, &pid, &capture, &reader)) {
        __sync_lock_release(&g_hyper_busy);
        hyper_console("HYPER-REINDEX: failed (could not start the indexer)\n");
        return 0;
    }
    job = (HyperJob *)calloc(1, sizeof *job);
    if (job == NULL) {
        kill(pid, SIGTERM);
        pthread_join(reader, NULL);
        if (capture->read_fd >= 0)
            close(capture->read_fd);
        free(capture);
        __sync_lock_release(&g_hyper_busy);
        hyper_console("HYPER-REINDEX: failed (memory)\n");
        return 0;
    }
    job->pid = pid;
    job->capture = capture;
    job->reader = reader;
    job->have_reader = 1;
    snprintf(job->building, sizeof job->building, "%s", building);
    snprintf(job->index, sizeof job->index, "%s", index);
    if (!companion_is_active()) {
        int ok = hyper_finish(job);
        __sync_lock_release(&g_hyper_busy);
        return ok ? 1 : 0;
    }
    {
        pthread_t worker;
        if (pthread_create(&worker, NULL, hyper_worker, job) != 0) {
            int ok;
            job->wait_here = 1;
            ok = hyper_finish(job);
            __sync_lock_release(&g_hyper_busy);
            return ok ? 1 : 0;
        }
        pthread_detach(worker);
    }
    return 0;
}
