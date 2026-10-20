/* Public domain.
   Linux entry: headless --agent and --companion (Unix socket).
   No standalone GUI console yet — use the Qt editor or --agent. */

#include "kernel_api.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void host_set_sink(void (*fn)(const void *, size_t));
void host_set_headless(int on);
void host_out(const void *p, size_t n);
void host_outs(const char *s);
void forth_set_key_hook(int (*fn)(void));
long long forth_depth(void);
int forth_eval(const char *text, size_t n);
void forth_prompt(void);
int forth_boot(void);
int forth_eval_file(const char *path);
int companion_run(const char *sock_name);
void forth_autoload(void);
void forth_autoload_set(int on);

static FILE *g_tee;

static void agent_write(const void *p, size_t n)
{
    if (p == NULL || n == 0)
        return;
    fwrite(p, 1, n, stdout);
    fflush(stdout);
}

static void agent_write_tee(const void *p, size_t n)
{
    agent_write(p, n);
    if (g_tee != NULL) {
        fwrite(p, 1, n, g_tee);
        fflush(g_tee);
    }
}

static int agent_read_byte(void)
{
    unsigned char c;
    ssize_t n = read(STDIN_FILENO, &c, 1);
    if (n <= 0)
        return -1;
    return (int)c;
}

static int env_is_one(const char *name)
{
    const char *v = getenv(name);
    return v != NULL && v[0] == '1' && v[1] == '\0';
}

static int companion_name(int argc, char **argv, char *dst, size_t cap)
{
    int i;

    for (i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--companion") != 0)
            continue;
        if (i + 1 < argc && argv[i + 1][0] != '-')
            snprintf(dst, cap, "%s", argv[i + 1]);
        else
            snprintf(dst, cap, "%s", "EditForthLin");
        return 1;
    }
    return 0;
}

static int agent_requested(int argc, char **argv)
{
    int i;

    if (env_is_one("FORTH64_AGENT") || env_is_one("EDITFORTH_AGENT") ||
        env_is_one("EDITFORTHLIN_AGENT"))
        return 1;
    for (i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--agent") == 0 || strcmp(argv[i], "-agent") == 0)
            return 1;
    }
    return 0;
}

static void agent_help(void)
{
    static const char help[] =
        "EditForthLin agent channel — headless load / eval / capture\n"
        "\n"
        "forthx64 --agent [options]\n"
        "\n"
        "Options:\n"
        "  -e, --eval <line>       Evaluate a Forth line\n"
        "  -f, --file <path>       Evaluate a file (also --fload / --include)\n"
        "  -c, --cwd <path>        Change directory before work\n"
        "  -o, --out <path>        Write the transcript to path (stdout always)\n"
        "  --repl                  Read further lines from stdin until EOF or BYE\n"
        "  --no-autoload           Skip ~/Documents/EditForthLin/AutoLoad/autoload.fth\n"
        "  -h, --help              This help\n"
        "\n"
        "Environment:\n"
        "  FORTH64_AGENT=1         Same as --agent\n"
        "  EDITFORTH_AGENT=1       Same as --agent\n"
        "  EDITFORTHLIN_AGENT=1    Same as --agent\n"
        "\n"
        "Examples:\n"
        "  forthx64 --agent -e \"2 3 + .\"\n"
        "  forthx64 --agent -f smoke.fth -o out.txt\n"
        "  forthx64 --agent --repl\n"
        "\n"
        "Exit 0 means every step returned 0. Exit 1 means a step failed.\n";
    host_out(help, sizeof help - 1);
}

static int agent_is_bye(const char *s)
{
    while (*s == ' ' || *s == '\t')
        s++;
    if ((s[0] == 'B' || s[0] == 'b') &&
        (s[1] == 'Y' || s[1] == 'y') &&
        (s[2] == 'E' || s[2] == 'e')) {
        s += 3;
        while (*s == ' ' || *s == '\t')
            s++;
        return *s == '\0';
    }
    return 0;
}

static int agent_read_line(char *dst, int cap)
{
    int n = 0;

    if (cap <= 1)
        return -1;
    for (;;) {
        int c = agent_read_byte();
        if (c < 0)
            return n == 0 ? -1 : n;
        if (c == '\n')
            break;
        if (c == '\r')
            continue;
        if (n + 1 < cap)
            dst[n++] = (char)c;
    }
    dst[n] = '\0';
    return n;
}

static int agent_run(int argc, char **argv)
{
    enum { STEP_EVAL, STEP_FILE };
    struct step {
        int kind;
        char text[2048];
    } steps[64];
    int nsteps = 0;
    int help = 0;
    int repl = 0;
    int failed = 0;
    int i;
    const char *cwd = NULL;
    const char *out_path = NULL;

    host_set_headless(1);
    g_tee = NULL;
    host_set_sink(agent_write_tee);
    forth_set_key_hook(agent_read_byte);

    for (i = 1; i < argc; i++) {
        const char *a = argv[i];
        if (strcmp(a, "--agent") == 0 || strcmp(a, "-agent") == 0)
            continue;
        if (strcmp(a, "-h") == 0 || strcmp(a, "--help") == 0 || strcmp(a, "-help") == 0) {
            help = 1;
            continue;
        }
        if (strcmp(a, "--repl") == 0) {
            repl = 1;
            continue;
        }
        if (strcmp(a, "--autoload") == 0)
            continue;
        if (strcmp(a, "--no-autoload") == 0) {
            forth_autoload_set(0);
            continue;
        }
        if (strcmp(a, "-e") == 0 || strcmp(a, "--eval") == 0 ||
            strcmp(a, "-f") == 0 || strcmp(a, "--file") == 0 ||
            strcmp(a, "--fload") == 0 || strcmp(a, "--include") == 0 ||
            strcmp(a, "-c") == 0 || strcmp(a, "--cwd") == 0 ||
            strcmp(a, "-o") == 0 || strcmp(a, "--out") == 0 ||
            strcmp(a, "--transcript") == 0) {
            int is_eval = (strcmp(a, "-e") == 0 || strcmp(a, "--eval") == 0);
            int is_file = (strcmp(a, "-f") == 0 || strcmp(a, "--file") == 0 ||
                           strcmp(a, "--fload") == 0 || strcmp(a, "--include") == 0);
            int is_cwd = (strcmp(a, "-c") == 0 || strcmp(a, "--cwd") == 0);
            if (i + 1 >= argc) {
                help = 1;
                break;
            }
            i++;
            if (is_cwd) {
                cwd = argv[i];
            } else if (!is_eval && !is_file) {
                out_path = argv[i];
                if (g_tee != NULL)
                    fclose(g_tee);
                g_tee = fopen(out_path, "wb");
                if (g_tee == NULL) {
                    host_outs("[EditForthLin agent] ERROR: cannot write transcript\n");
                    return 1;
                }
            } else if (nsteps < 64) {
                steps[nsteps].kind = is_eval ? STEP_EVAL : STEP_FILE;
                snprintf(steps[nsteps].text, sizeof steps[nsteps].text, "%s", argv[i]);
                nsteps++;
            }
            continue;
        }
        if (a[0] == '-') {
            char msg[256];
            snprintf(msg, sizeof msg, "[EditForthLin agent] unknown option: %s\n", a);
            host_outs(msg);
        }
    }

    if (help) {
        agent_help();
        if (g_tee != NULL)
            fclose(g_tee);
        return 0;
    }

    host_outs("[EditForthLin agent] start\n");
    if (forth_boot() != 0) {
        host_outs("[EditForthLin agent] FATAL: kernel_init failed\n");
        failed = 1;
        goto done;
    }
    forth_autoload();

    if (cwd != NULL) {
        char msg[1100];
        if (chdir(cwd) == 0) {
            snprintf(msg, sizeof msg, "[EditForthLin agent] cwd %s\n", cwd);
            host_outs(msg);
        } else {
            snprintf(msg, sizeof msg, "[EditForthLin agent] ERROR: cannot chdir %s (%s)\n",
                     cwd, strerror(errno));
            host_outs(msg);
            failed = 1;
            goto done;
        }
    }

    for (i = 0; i < nsteps; i++) {
        char msg[2200];
        int st;
        if (steps[i].kind == STEP_EVAL) {
            snprintf(msg, sizeof msg, "[EditForthLin agent] eval: %s\n", steps[i].text);
            host_outs(msg);
            st = forth_eval(steps[i].text, strlen(steps[i].text));
        } else {
            snprintf(msg, sizeof msg, "[EditForthLin agent] load: %s\n", steps[i].text);
            host_outs(msg);
            st = forth_eval_file(steps[i].text);
        }
        snprintf(msg, sizeof msg, "[EditForthLin agent] status=%d depth=%lld\n", st,
                 forth_depth());
        host_outs(msg);
        if (st != 0)
            failed = 1;
    }

    if (repl) {
        char line[2048];
        host_outs("[EditForthLin agent] repl (stdin) — EOF to finish\n");
        forth_prompt();
        while (agent_read_line(line, (int)sizeof line) >= 0) {
            if (line[0] == '\0')
                continue;
            if (agent_is_bye(line)) {
                host_outs("[EditForthLin agent] BYE\n");
                break;
            }
            if (forth_eval(line, strlen(line)) != 0)
                failed = 1;
            forth_prompt();
        }
        host_outs("\n");
    }

    if (nsteps == 0 && !repl) {
        host_outs("[EditForthLin agent] nothing to do (use -e, -f, or --repl)\n");
        host_outs("Try: forthx64 --agent --help\n");
        failed = 1;
    }

    host_outs(failed ? "[EditForthLin agent] DONE (failed)\n"
                     : "[EditForthLin agent] DONE (ok)\n");

done:
    if (g_tee != NULL) {
        fclose(g_tee);
        g_tee = NULL;
    }
    (void)out_path;
    return failed ? 1 : 0;
}

int main(int argc, char **argv)
{
    char sock_name[512];
    int i;

    for (i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--no-autoload") == 0)
            forth_autoload_set(0);
    }
    if (companion_name(argc, argv, sock_name, sizeof sock_name))
        return companion_run(sock_name);
    if (agent_requested(argc, argv))
        return agent_run(argc, argv);

    host_outs("EditForthLin: use --agent or --companion, or launch the Qt editor.\n");
    host_outs("Try: forthx64 --agent --help\n");
    return 1;
}
