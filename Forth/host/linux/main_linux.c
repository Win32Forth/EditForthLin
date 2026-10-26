/* Public domain.
   Linux Forth host entry — port of Forth/host/main.c.
   User tree: ~/Documents/EditForthLin (or $XDG_DOCUMENTS_DIR/EditForthLin).
   Override with EDITFORTHLIN (absolute path). */

#if !defined(_DEFAULT_SOURCE) && !defined(_POSIX_C_SOURCE)
#define _DEFAULT_SOURCE
#endif

#include "kernel_api.h"

#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <fnmatch.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <sys/select.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

extern unsigned char data_stack[];
extern unsigned long long vm_dsp;
extern unsigned long long latest_var;
extern unsigned long long current_var;
extern unsigned long long search_order[8];
extern unsigned long long search_order_n;
extern unsigned long long wordlist_reg[32];
extern unsigned long long wordlist_reg_n;

/* cut is a CFA. A VOCABULARY or WORDLIST created after that cut is gone
   with the dictionary. Drop it from the registry, the search order, and
   CURRENT. An empty order becomes FORTH. */
void host_forget_drop_stale(unsigned long long cut)
{
    unsigned long long forth_wid;
    unsigned long long n;
    unsigned long long i;
    unsigned long long j;
    unsigned long long wid;

    forth_wid = (unsigned long long)(uintptr_t)&latest_var;
    n = wordlist_reg_n;
    if (n > 32)
        n = 32;
    i = 0;
    while (i < n) {
        wid = wordlist_reg[i];
        if (wid != 0 && wid >= cut) {
            for (j = i + 1; j < n; j++)
                wordlist_reg[j - 1] = wordlist_reg[j];
            n--;
            continue;
        }
        i++;
    }
    wordlist_reg_n = n;

    n = search_order_n;
    if (n > 8)
        n = 8;
    i = 0;
    while (i < n) {
        wid = search_order[i];
        if (wid != 0 && wid >= cut) {
            for (j = i + 1; j < n; j++)
                search_order[j - 1] = search_order[j];
            n--;
            continue;
        }
        i++;
    }
    if (n == 0) {
        search_order[0] = forth_wid;
        n = 1;
    }
    search_order_n = n;

    if (current_var != 0 && current_var >= cut)
        current_var = forth_wid;
}

/* Windows FILE_ATTRIBUTE_* bits — FILE-STATUS consumers often test directory. */
#ifndef FILE_ATTR_DIRECTORY
#define FILE_ATTR_DIRECTORY 0x10
#endif
#ifndef FILE_ATTR_NORMAL
#define FILE_ATTR_NORMAL 0x80
#endif

static void sink_discard(const void *p, size_t n)
{
    (void)p;
    (void)n;
}

static void (*host_sink)(const void *, size_t) = sink_discard;
static int (*key_hook)(void);

void host_set_sink(void (*fn)(const void *, size_t))
{
    host_sink = fn != NULL ? fn : sink_discard;
}

void host_out(const void *p, size_t n)
{
    if (p != NULL && n != 0)
        host_sink(p, n);
}

void host_outs(const char *s)
{
    if (s != NULL && s[0] != '\0')
        host_out(s, strlen(s));
}

void forth_set_key_hook(int (*fn)(void))
{
    key_hook = fn;
}

long long forth_depth(void)
{
    unsigned long long sp0;

    sp0 = (unsigned long long)(uintptr_t)data_stack + 4096ULL;
    if (vm_dsp == 0 || vm_dsp > sp0)
        return 0;
    return (long long)((sp0 - vm_dsp) / 8ULL);
}

unsigned long long host_ms(void)
{
    struct timespec ts;

    if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0)
        return 0;
    return (unsigned long long)ts.tv_sec * 1000ull +
           (unsigned long long)ts.tv_nsec / 1000000ull;
}

/* File slots are 1-based. Slot 0 is never a file. */
#define HOST_FILES 16
#define HOST_PATH 1024
#define HOST_LOADS 8
#define HOST_REGS 64

static FILE *host_fp[HOST_FILES];
static char *host_mem[HOST_FILES];
static long long host_mem_len[HOST_FILES];
static long long host_mem_pos[HOST_FILES];
static char load_dir[HOST_LOADS][HOST_PATH];
static char load_prev[HOST_LOADS][HOST_PATH];
static int load_len[HOST_LOADS];
static int load_n;
static int fromlib_armed;
static void (*host_edit_fn)(const char *path, int kind);
static void (*host_edit_at_fn)(const char *path, long long line);
static char user_root[HOST_PATH];
static char library_root[HOST_PATH];
static char reg_path[HOST_REGS][256];
static int reg_len[HOST_REGS];
static int reg_n;
static char last_path[256];
static int last_len;

static void host_slashes(char *s);

/* ~ and ~/name expand to HOME. ~someone is left unchanged. */
static int host_expand_home(char *dst, size_t cap, const char *src)
{
    const char *home;
    size_t home_n;
    size_t rest_n;
    const char *rest;
    int sep;

    if (src == NULL)
        return 0;
    if (src[0] != '~') {
        rest_n = strlen(src);
        if (rest_n >= cap)
            return 0;
        memcpy(dst, src, rest_n + 1);
        return 1;
    }
    rest = src + 1;
    if (*rest == '/' || *rest == '\\')
        rest++;
    else if (*rest != '\0') {
        rest_n = strlen(src);
        if (rest_n >= cap)
            return 0;
        memcpy(dst, src, rest_n + 1);
        return 1;
    }
    home = getenv("HOME");
    if (home == NULL || home[0] == '\0')
        return 0;
    home_n = strlen(home);
    rest_n = strlen(rest);
    sep = (rest_n > 0 && home[home_n - 1] != '/' && home[home_n - 1] != '\\') ? 1 : 0;
    if (home_n + (size_t)sep + rest_n >= cap)
        return 0;
    memcpy(dst, home, home_n);
    if (sep)
        dst[home_n++] = '/';
    memcpy(dst + home_n, rest, rest_n + 1);
    return 1;
}

static int host_copy_path(const char *p, long long n, char *dst, size_t cap)
{
    char raw[HOST_PATH];
    char expanded[HOST_PATH];
    size_t nout;

    if (p == NULL || n <= 0 || (unsigned long long)n >= sizeof raw || dst == NULL)
        return 0;
    memcpy(raw, p, (size_t)n);
    raw[n] = '\0';
    if (!host_expand_home(expanded, sizeof expanded, raw))
        return 0;
    host_slashes(expanded);
    nout = strlen(expanded);
    if (nout >= cap)
        return 0;
    memcpy(dst, expanded, nout + 1);
    return 1;
}

static void host_mkdir_parents(const char *path)
{
    char buf[HOST_PATH];
    char *p;
    size_t n;

    if (path == NULL)
        return;
    n = strlen(path);
    if (n == 0 || n >= sizeof buf)
        return;
    memcpy(buf, path, n + 1);
    host_slashes(buf);
    p = buf;
    if (*p == '/')
        p++;
    for (; *p != '\0'; p++) {
        if (*p != '/')
            continue;
        *p = '\0';
        if (buf[0] != '\0')
            mkdir(buf, 0755);
        *p = '/';
    }
}

static int host_slot(void)
{
    for (int i = 1; i < HOST_FILES; i++) {
        if (host_fp[i] == NULL && host_mem[i] == NULL)
            return i;
    }
    return 0;
}

static FILE *host_lookup(long long id)
{
    if (id < 1 || id >= HOST_FILES)
        return NULL;
    return host_fp[id];
}

static int host_abs(const char *s, long long n)
{
    if (n >= 1 && (s[0] == '/' || s[0] == '~'))
        return 1;
    return 0;
}

/* Virtual Config/HYPER.SPECS. The Mac host expands HYPER.CFG the same way.
   Forth OPEN-FILE never sees a disk file; READ-LINE walks the generated list. */

typedef struct HostList {
    char **v;
    int n;
    int cap;
} HostList;

static void host_list_free(HostList *list)
{
    int i;

    if (list == NULL)
        return;
    for (i = 0; i < list->n; i++)
        free(list->v[i]);
    free(list->v);
    list->v = NULL;
    list->n = 0;
    list->cap = 0;
}

static int host_list_add(HostList *list, const char *s)
{
    char *copy;
    char **grown;
    int cap;

    if (list == NULL || s == NULL)
        return 0;
    if (list->n >= list->cap) {
        cap = list->cap == 0 ? 64 : list->cap * 2;
        grown = (char **)realloc(list->v, (size_t)cap * sizeof(char *));
        if (grown == NULL)
            return 0;
        list->v = grown;
        list->cap = cap;
    }
    copy = strdup(s);
    if (copy == NULL)
        return 0;
    list->v[list->n++] = copy;
    return 1;
}

static int host_list_has_ci(const HostList *list, const char *s)
{
    int i;

    for (i = 0; i < list->n; i++) {
        if (strcasecmp(list->v[i], s) == 0)
            return 1;
    }
    return 0;
}

static int host_contains_ci(const char *hay, const char *needle)
{
    size_t nlen;

    if (hay == NULL || needle == NULL || needle[0] == '\0')
        return 0;
    nlen = strlen(needle);
    for (; *hay != '\0'; hay++) {
        if (strncasecmp(hay, needle, nlen) == 0)
            return 1;
    }
    return 0;
}

static int host_prefix_ci(const char *s, const char *prefix)
{
    size_t n;

    if (s == NULL || prefix == NULL)
        return 0;
    n = strlen(prefix);
    return strncasecmp(s, prefix, n) == 0;
}

static int host_suffix_ci(const char *s, const char *suffix)
{
    size_t ns;
    size_t nsu;

    if (s == NULL || suffix == NULL)
        return 0;
    ns = strlen(s);
    nsu = strlen(suffix);
    if (nsu > ns)
        return 0;
    return strcasecmp(s + (ns - nsu), suffix) == 0;
}

static int host_path_cmp(const void *a, const void *b)
{
    const char *sa = *(const char *const *)a;
    const char *sb = *(const char *const *)b;
    return strcasecmp(sa, sb);
}

static int host_library_dir(char *dst, size_t cap)
{
    int n;

    if (library_root[0] != '\0') {
        n = snprintf(dst, cap, "%s", library_root);
        return n > 0 && (size_t)n < cap;
    }
    if (user_root[0] != '\0') {
        n = snprintf(dst, cap, "%s/Library", user_root);
        return n > 0 && (size_t)n < cap;
    }
    n = snprintf(dst, cap, "Library");
    return n > 0 && (size_t)n < cap;
}

static int host_user_dir(char *dst, size_t cap)
{
    int n;

    if (user_root[0] != '\0') {
        n = snprintf(dst, cap, "%s", user_root);
        return n > 0 && (size_t)n < cap;
    }
    if (getcwd(dst, cap) == NULL)
        return 0;
    return 1;
}

int host_documents_dir(char *dst, size_t cap)
{
    return host_user_dir(dst, cap);
}

static int host_under_root(const char *full, const char *root, const char **rest)
{
    size_t n;

    if (full == NULL || root == NULL || root[0] == '\0')
        return 0;
    n = strlen(root);
    if (strncasecmp(full, root, n) != 0)
        return 0;
    if (full[n] == '\\' || full[n] == '/') {
        *rest = full + n + 1;
        return 1;
    }
    if (full[n] == '\0') {
        *rest = full + n;
        return 1;
    }
    return 0;
}

/* Disk path to the NDX key Forth will OPEN-FILE (Library/…, forward slashes). */
static int host_to_ndx(const char *full, char *ndx, size_t cap)
{
    char lib[HOST_PATH];
    char user[HOST_PATH];
    char tmp[HOST_PATH];
    const char *rest = NULL;
    const char *prefix = "";
    char *p;
    int n;

    if (!host_library_dir(lib, sizeof lib) || !host_user_dir(user, sizeof user))
        return 0;
    if (host_under_root(full, lib, &rest))
        prefix = "Library/";
    else if (host_under_root(full, user, &rest))
        prefix = "";
    else
        return 0;
    if (rest == NULL)
        return 0;
    n = snprintf(tmp, sizeof tmp, "%s%s", prefix, rest);
    if (n <= 0 || (size_t)n >= sizeof tmp || (size_t)n >= cap)
        return 0;
    for (p = tmp; *p != '\0'; p++) {
        if (*p == '\\')
            *p = '/';
    }
    if (strchr(tmp, '/') == NULL)
        return 0;
    memcpy(ndx, tmp, (size_t)n + 1);
    return 1;
}

static int host_spec_disk(const char *spec, char *disk, size_t cap)
{
    char norm[HOST_PATH];
    char lib[HOST_PATH];
    char user[HOST_PATH];
    const char *rel;
    size_t i;
    size_t n;
    int out;

    n = strlen(spec);
    if (n == 0 || n >= sizeof norm)
        return 0;
    for (i = 0; i <= n; i++)
        norm[i] = (spec[i] == '\\') ? '/' : spec[i];
    if (!host_library_dir(lib, sizeof lib) || !host_user_dir(user, sizeof user))
        return 0;
    if (host_prefix_ci(norm, "Resources/Library/"))
        rel = norm + strlen("Resources/Library/");
    else if (host_prefix_ci(norm, "Library/"))
        rel = norm + strlen("Library/");
    else if (host_prefix_ci(norm, "Resources/")) {
        rel = norm + strlen("Resources/");
        out = snprintf(disk, cap, "%s/%s", user, rel);
        return out > 0 && (size_t)out < cap;
    } else {
        rel = norm;
        out = snprintf(disk, cap, "%s/%s", user, rel);
        return out > 0 && (size_t)out < cap;
    }
    out = snprintf(disk, cap, "%s/%s", lib, rel);
    return out > 0 && (size_t)out < cap;
}

static const char *host_glob_ext(const char *spec)
{
    if (host_suffix_ci(spec, ".fth"))
        return ".fth";
    if (host_suffix_ci(spec, ".fs"))
        return ".fs";
    return NULL;
}

static void host_walk_files(const char *dir, const char *ext, HostList *out, int depth)
{
    DIR *d;
    struct dirent *ent;
    char child[HOST_PATH];
    struct stat st;
    int n;

    if (dir == NULL || dir[0] == '\0' || depth > 32)
        return;
    d = opendir(dir);
    if (d == NULL)
        return;
    while ((ent = readdir(d)) != NULL) {
        if (strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0)
            continue;
        if (ent->d_name[0] == '.')
            continue;
        n = snprintf(child, sizeof child, "%s/%s", dir, ent->d_name);
        if (n <= 0 || n >= (int)sizeof child)
            continue;
        if (stat(child, &st) != 0)
            continue;
        if (S_ISDIR(st.st_mode))
            host_walk_files(child, ext, out, depth + 1);
        else if (S_ISREG(st.st_mode) &&
                 (ext == NULL || host_suffix_ci(ent->d_name, ext)))
            host_list_add(out, child);
    }
    closedir(d);
}

static void host_expand_spec(const char *spec, HostList *batch)
{
    char disk[HOST_PATH];
    char lib[HOST_PATH];
    char user[HOST_PATH];
    struct stat st;

    if (spec == NULL || spec[0] == '\0')
        return;
    if (strchr(spec, '*') == NULL && strchr(spec, '?') == NULL) {
        if (!host_spec_disk(spec, disk, sizeof disk))
            return;
        if (stat(disk, &st) != 0 || !S_ISREG(st.st_mode))
            return;
        host_list_add(batch, disk);
        return;
    }
    if (!host_library_dir(lib, sizeof lib) || !host_user_dir(user, sizeof user))
        return;
    if (host_prefix_ci(spec, "Resources/Library/") || host_prefix_ci(spec, "Library/"))
        host_walk_files(lib, host_glob_ext(spec), batch, 0);
    else
        host_walk_files(user, host_glob_ext(spec), batch, 0);
}

static void host_trim_span(const char *s, size_t n, char *dst, size_t cap)
{
    while (n > 0 && (s[0] == ' ' || s[0] == '\t' || s[0] == '\r')) {
        s++;
        n--;
    }
    while (n > 0 && (s[n - 1] == ' ' || s[n - 1] == '\t' || s[n - 1] == '\r'))
        n--;
    if (n >= cap)
        n = cap - 1;
    memcpy(dst, s, n);
    dst[n] = '\0';
}

static void host_parse_hyper_cfg(const char *text, HostList *specs, HostList *excludes)
{
    const char *p;
    char line[HOST_PATH];
    char rest[HOST_PATH];

    if (text == NULL)
        return;
    p = text;
    while (*p != '\0') {
        const char *eol = p;
        size_t n;
        while (*eol != '\0' && *eol != '\n')
            eol++;
        n = (size_t)(eol - p);
        host_trim_span(p, n, line, sizeof line);
        p = (*eol == '\n') ? eol + 1 : eol;
        if (line[0] == '\0' || line[0] == '#')
            continue;
        if (strcmp(line, ";") == 0)
            break;
        if (host_prefix_ci(line, "*EXCLUDE")) {
            host_trim_span(line + 8, strlen(line + 8), rest, sizeof rest);
            if (rest[0] != '\0')
                host_list_add(excludes, rest);
            continue;
        }
        if (host_prefix_ci(line, "SPECS")) {
            host_trim_span(line + 5, strlen(line + 5), rest, sizeof rest);
            if (rest[0] != '\0')
                host_list_add(specs, rest);
        }
    }
}

static void host_hyper_defaults(HostList *specs, HostList *excludes)
{
    static const char *default_specs[] = {
        "Resources/Library/Sources/forth.s",
        "Resources/Library/Sources/boot_words.inc",
        "Resources/Library/Sources/boot_words_end.inc",
        "Resources/Library/Sources/colon_words.inc",
        "Resources/Library/Sources/kernel_api.h",
        "Resources/Library/**/*.fth",
        "Resources/Library/**/*.FTH",
    };
    static const char *default_excludes[] = {
        "Testing", "HayesTest", "ANSValidate", "DbgSpanSmoke",
        "Benchmarks", "HYPER.NDX",
    };
    int i;

    if (specs->n == 0) {
        for (i = 0; i < (int)(sizeof default_specs / sizeof default_specs[0]); i++)
            host_list_add(specs, default_specs[i]);
    }
    if (excludes->n == 0) {
        for (i = 0; i < (int)(sizeof default_excludes / sizeof default_excludes[0]); i++)
            host_list_add(excludes, default_excludes[i]);
    }
}

static char *host_read_file(const char *path)
{
    FILE *fp;
    char *buf;
    long sz;

    fp = fopen(path, "rb");
    if (fp == NULL)
        return NULL;
    if (fseek(fp, 0, SEEK_END) != 0) {
        fclose(fp);
        return NULL;
    }
    sz = ftell(fp);
    if (sz < 0 || sz > 1024 * 1024) {
        fclose(fp);
        return NULL;
    }
    if (fseek(fp, 0, SEEK_SET) != 0) {
        fclose(fp);
        return NULL;
    }
    buf = (char *)malloc((size_t)sz + 1);
    if (buf == NULL) {
        fclose(fp);
        return NULL;
    }
    if (sz > 0 && fread(buf, 1, (size_t)sz, fp) != (size_t)sz) {
        free(buf);
        fclose(fp);
        return NULL;
    }
    buf[sz] = '\0';
    fclose(fp);
    return buf;
}

static int host_excluded(const char *ndx, const char *full, const HostList *excludes)
{
    int i;

    for (i = 0; i < excludes->n; i++) {
        if (host_contains_ci(ndx, excludes->v[i]) || host_contains_ci(full, excludes->v[i]))
            return 1;
    }
    return 0;
}

/* Generated list, or NULL so OPEN-FILE fails and Forth uses its fallback.
   The bytes stay in the file slot. Bytes stay in the file slot (not a tmpfile that starts at EOF). */
static char *host_hyper_specs_text(long long *out_len)
{
    char cfg_path[HOST_PATH];
    char user[HOST_PATH];
    char *cfg = NULL;
    char *text = NULL;
    char ndx[HOST_PATH];
    HostList specs;
    HostList excludes;
    HostList seen;
    size_t total;
    size_t used;
    int i;
    int n;

    memset(&specs, 0, sizeof specs);
    memset(&excludes, 0, sizeof excludes);
    memset(&seen, 0, sizeof seen);
    if (host_user_dir(user, sizeof user)) {
        n = snprintf(cfg_path, sizeof cfg_path, "%s/Config/HYPER.CFG", user);
        if (n > 0 && (size_t)n < sizeof cfg_path)
            cfg = host_read_file(cfg_path);
    }
    host_parse_hyper_cfg(cfg, &specs, &excludes);
    free(cfg);
    host_hyper_defaults(&specs, &excludes);

    for (i = 0; i < specs.n; i++) {
        HostList batch;
        int j;

        memset(&batch, 0, sizeof batch);
        host_expand_spec(specs.v[i], &batch);
        if (batch.n > 1)
            qsort(batch.v, (size_t)batch.n, sizeof(char *), host_path_cmp);
        for (j = 0; j < batch.n; j++) {
            if (!host_to_ndx(batch.v[j], ndx, sizeof ndx))
                continue;
            if (host_excluded(ndx, batch.v[j], &excludes))
                continue;
            if (host_list_has_ci(&seen, ndx))
                continue;
            host_list_add(&seen, ndx);
        }
        host_list_free(&batch);
    }
    host_list_free(&specs);
    host_list_free(&excludes);

    total = 1;
    for (i = 0; i < seen.n; i++)
        total += strlen(seen.v[i]) + 1;
    if (seen.n == 0)
        total = 2;
    text = (char *)malloc(total);
    if (text == NULL) {
        host_list_free(&seen);
        return NULL;
    }
    if (seen.n == 0) {
        text[0] = '\n';
        text[1] = '\0';
        *out_len = 1;
        host_list_free(&seen);
        return text;
    }
    used = 0;
    for (i = 0; i < seen.n; i++) {
        size_t len = strlen(seen.v[i]);
        memcpy(text + used, seen.v[i], len);
        used += len;
        text[used++] = '\n';
    }
    text[used] = '\0';
    *out_len = (long long)used;
    host_list_free(&seen);
    return text;
}

char *host_hyper_source_list(long long *out_len)
{
    return host_hyper_specs_text(out_len);
}

static int host_is_hyper_specs(const char *path)
{
    const char *base;
    const char *end;
    size_t n;

    if (path == NULL)
        return 0;
    end = path + strlen(path);
    while (end > path && (end[-1] == ' ' || end[-1] == '\t' ||
                          end[-1] == '\\' || end[-1] == '/'))
        end--;
    base = path;
    for (const char *p = path; p < end; p++) {
        if (*p == '\\' || *p == '/')
            base = p + 1;
    }
    n = (size_t)(end - base);
    return n == 11 && strncasecmp(base, "HYPER.SPECS", 11) == 0;
}

long long host_open(const char *p, long long n, long long fam)
{
    char path[HOST_PATH];
    int slot;
    FILE *fp;
    const char *mode;

    if (!host_copy_path(p, n, path, sizeof path))
        return 0;
    slot = host_slot();
    if (slot == 0)
        return 0;
    if (host_is_hyper_specs(path)) {
        long long len = 0;
        char *text = host_hyper_specs_text(&len);
        if (text == NULL)
            return 0;
        host_mem[slot] = text;
        host_mem_len[slot] = len;
        host_mem_pos[slot] = 0;
        return slot;
    }
    mode = (fam == 2 || fam == 3) ? "r+b" : "rb";
    fp = fopen(path, mode);
    if (fp == NULL)
        return 0;
    host_fp[slot] = fp;
    return slot;
}

long long host_create(const char *p, long long n, long long fam)
{
    char path[HOST_PATH];
    int slot;
    FILE *fp;

    (void)fam;
    if (!host_copy_path(p, n, path, sizeof path))
        return 0;
    host_mkdir_parents(path);
    slot = host_slot();
    if (slot == 0)
        return 0;
    fp = fopen(path, "w+b");
    if (fp == NULL)
        return 0;
    host_fp[slot] = fp;
    return slot;
}

long long host_close(long long id)
{
    FILE *fp;

    if (id >= 1 && id < HOST_FILES && host_mem[id] != NULL) {
        free(host_mem[id]);
        host_mem[id] = NULL;
        host_mem_len[id] = 0;
        host_mem_pos[id] = 0;
        return 0;
    }
    fp = host_lookup(id);
    if (fp == NULL)
        return -1;
    host_fp[id] = NULL;
    return fclose(fp) == 0 ? 0 : -1;
}

long long host_read(char *buf, long long n, long long id)
{
    FILE *fp;
    size_t got;

    if (id >= 1 && id < HOST_FILES && host_mem[id] != NULL) {
        long long left;
        long long take;
        if (buf == NULL || n < 0)
            return -1;
        if (n == 0 || host_mem_pos[id] >= host_mem_len[id])
            return 0;
        left = host_mem_len[id] - host_mem_pos[id];
        take = n < left ? n : left;
        memcpy(buf, host_mem[id] + host_mem_pos[id], (size_t)take);
        host_mem_pos[id] += take;
        return take;
    }
    fp = host_lookup(id);
    if (fp == NULL || buf == NULL || n < 0)
        return -1;
    if (n == 0)
        return 0;
    got = fread(buf, 1, (size_t)n, fp);
    if (got < (size_t)n && ferror(fp))
        return -1;
    return (long long)got;
}

long long host_write(const char *buf, long long n, long long id)
{
    FILE *fp = host_lookup(id);
    size_t put;

    if (fp == NULL || buf == NULL || n < 0)
        return -1;
    if (n == 0)
        return 0;
    put = fwrite(buf, 1, (size_t)n, fp);
    return put == (size_t)n ? 0 : -1;
}

long long host_size(long long id)
{
    FILE *fp;
    off_t pos;
    off_t sz;

    if (id >= 1 && id < HOST_FILES && host_mem[id] != NULL)
        return host_mem_len[id];
    fp = host_lookup(id);
    if (fp == NULL)
        return -1;
    pos = ftello(fp);
    if (pos < 0)
        return -1;
    if (fseeko(fp, 0, SEEK_END) != 0)
        return -1;
    sz = ftello(fp);
    fseeko(fp, pos, SEEK_SET);
    if (sz < 0)
        return -1;
    return (long long)sz;
}

long long host_repos(long long id, long long lo, long long hi)
{
    FILE *fp;

    if (hi != 0)
        return -1;
    if (id >= 1 && id < HOST_FILES && host_mem[id] != NULL) {
        if (lo < 0)
            return -1;
        host_mem_pos[id] = lo > host_mem_len[id] ? host_mem_len[id] : lo;
        return 0;
    }
    fp = host_lookup(id);
    if (fp == NULL)
        return -1;
    if (fseeko(fp, (off_t)lo, SEEK_SET) != 0)
        return -1;
    return 0;
}

long long host_flush(long long id)
{
    FILE *fp;

    if (id >= 1 && id < HOST_FILES && host_mem[id] != NULL)
        return 0;
    fp = host_lookup(id);
    if (fp == NULL)
        return -1;
    return fflush(fp) == 0 ? 0 : -1;
}

void *host_alloc(unsigned long long n)
{
    return malloc(n == 0 ? 1 : (size_t)n);
}

void host_free(void *p)
{
    free(p);
}

static void host_slashes(char *s)
{
    for (; s != NULL && *s != '\0'; s++) {
        if (*s == '\\')
            *s = '/';
    }
}

static int host_is_dir(const char *path)
{
    struct stat st;

    if (path == NULL || path[0] == '\0')
        return 0;
    if (stat(path, &st) != 0)
        return 0;
    return S_ISDIR(st.st_mode);
}

static int host_join(char *dst, int cap, const char *dir, const char *rel)
{
    int n;
    int m;

    if (dst == NULL || cap < 4 || dir == NULL || rel == NULL)
        return 0;
    n = (int)strlen(dir);
    m = (int)strlen(rel);
    if (n <= 0 || n + 1 + m >= cap)
        return 0;
    memcpy(dst, dir, (size_t)n);
    if (dst[n - 1] != '/')
        dst[n++] = '/';
    memcpy(dst + n, rel, (size_t)m + 1);
    return 1;
}

/* 1 when the shipped file is newer than the Documents copy. */
static int host_src_newer(const char *src, const char *dst)
{
    struct stat a;
    struct stat b;

    if (stat(src, &a) != 0)
        return 0;
    if (stat(dst, &b) != 0)
        return 1;
    return a.st_mtime > b.st_mtime;
}

/* Copy src onto dst. overwrite 0 copies a file that is missing or older
   than the shipped copy, and leaves a newer user file alone. */
static int host_copy_tree(const char *src, const char *dst, int overwrite, int depth)
{
    DIR *d;
    struct dirent *ent;
    char from[HOST_PATH];
    char to[HOST_PATH];
    struct stat st;
    int n;
    int copied = 0;

    if (depth > 24 || src == NULL || dst == NULL)
        return 0;
    mkdir(dst, 0755);
    d = opendir(src);
    if (d == NULL)
        return 0;
    while ((ent = readdir(d)) != NULL) {
        if (strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0)
            continue;
        n = snprintf(from, sizeof from, "%s/%s", src, ent->d_name);
        if (n <= 0 || n >= (int)sizeof from)
            continue;
        n = snprintf(to, sizeof to, "%s/%s", dst, ent->d_name);
        if (n <= 0 || n >= (int)sizeof to)
            continue;
        if (stat(from, &st) != 0)
            continue;
        if (S_ISDIR(st.st_mode))
            copied += host_copy_tree(from, to, overwrite, depth + 1);
        else if (S_ISREG(st.st_mode)) {
            struct stat td;
            FILE *in;
            FILE *outf;
            char buf[8192];
            size_t got;
            int short_write = 0;

            if (!overwrite && stat(to, &td) == 0 && !host_src_newer(from, to))
                continue;
            in = fopen(from, "rb");
            if (in == NULL)
                continue;
            outf = fopen(to, "wb");
            if (outf == NULL) {
                fclose(in);
                continue;
            }
            while ((got = fread(buf, 1, sizeof buf, in)) > 0) {
                if (fwrite(buf, 1, got, outf) != got) {
                    short_write = 1;
                    break;
                }
            }
            fclose(outf);
            fclose(in);
            if (!short_write)
                copied++;
        }
    }
    closedir(d);
    return copied;
}

static int host_copy_missing(const char *src, const char *dst, int depth)
{
    return host_copy_tree(src, dst, 0, depth);
}

static void host_remove_tree(const char *dir)
{
    DIR *d;
    struct dirent *ent;
    char child[HOST_PATH];
    struct stat st;
    int n;

    if (dir == NULL || dir[0] == '\0')
        return;
    d = opendir(dir);
    if (d != NULL) {
        while ((ent = readdir(d)) != NULL) {
            if (strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0)
                continue;
            n = snprintf(child, sizeof child, "%s/%s", dir, ent->d_name);
            if (n <= 0 || n >= (int)sizeof child)
                continue;
            if (lstat(child, &st) != 0)
                continue;
            if (S_ISDIR(st.st_mode))
                host_remove_tree(child);
            else
                unlink(child);
        }
        closedir(d);
    }
    rmdir(dir);
}

static int host_has_marker(const char *dir)
{
    char marker[HOST_PATH];
    struct stat st;

    if (!host_join(marker, (int)sizeof marker, dir, "BigInteger/big-int.fth"))
        return 0;
    return stat(marker, &st) == 0 && S_ISREG(st.st_mode);
}

/* Resolve Documents/EditForthLin (or EDITFORTHLIN / XDG_DOCUMENTS_DIR). */
static int host_user_root_path(char *dst, size_t cap)
{
    const char *env;
    const char *home;
    const char *docs;
    int n;

    env = getenv("EDITFORTHLIN");
    if (env != NULL && env[0] == '/') {
        n = snprintf(dst, cap, "%s", env);
        return n > 0 && (size_t)n < cap;
    }
    docs = getenv("XDG_DOCUMENTS_DIR");
    if (docs != NULL && docs[0] != '\0') {
        n = snprintf(dst, cap, "%s/EditForthLin", docs);
        return n > 0 && (size_t)n < cap;
    }
    home = getenv("HOME");
    if (home == NULL || home[0] == '\0')
        return 0;
    n = snprintf(dst, cap, "%s/Documents/EditForthLin", home);
    return n > 0 && (size_t)n < cap;
}

/* Collapse . / .. and duplicate slashes. Path need not exist. */
static int host_normalize(char *dst, size_t cap, const char *src)
{
    char tmp[HOST_PATH];
    char *parts[HOST_PATH / 2];
    int nparts = 0;
    size_t i;
    size_t len;
    int absolute;
    char *tok;
    char *save = NULL;
    size_t outn = 0;

    if (dst == NULL || cap < 2 || src == NULL)
        return 0;
    len = strlen(src);
    if (len >= sizeof tmp)
        return 0;
    memcpy(tmp, src, len + 1);
    host_slashes(tmp);
    absolute = (tmp[0] == '/');

    for (tok = strtok_r(tmp, "/", &save); tok != NULL; tok = strtok_r(NULL, "/", &save)) {
        if (tok[0] == '\0' || (tok[0] == '.' && tok[1] == '\0'))
            continue;
        if (tok[0] == '.' && tok[1] == '.' && tok[2] == '\0') {
            if (nparts > 0)
                nparts--;
            continue;
        }
        if (nparts >= (int)(sizeof parts / sizeof parts[0]))
            return 0;
        parts[nparts++] = tok;
    }

    if (absolute) {
        if (outn + 1 >= cap)
            return 0;
        dst[outn++] = '/';
    }
    for (i = 0; i < (size_t)nparts; i++) {
        size_t pl = strlen(parts[i]);
        if (i > 0 || (absolute && outn > 1) || (!absolute && outn > 0)) {
            if (outn + 1 >= cap)
                return 0;
            dst[outn++] = '/';
        }
        if (outn + pl >= cap)
            return 0;
        memcpy(dst + outn, parts[i], pl);
        outn += pl;
    }
    if (outn == 0) {
        if (absolute) {
            dst[0] = '/';
            dst[1] = '\0';
            return 1;
        }
        dst[0] = '.';
        dst[1] = '\0';
        return 1;
    }
    dst[outn] = '\0';
    return 1;
}

static int host_exe_dir(char *dir, size_t cap)
{
    char mod[HOST_PATH];
    ssize_t n;
    int i;
    FILE *fp;
    size_t got;

    n = readlink("/proc/self/exe", mod, sizeof mod - 1);
    if (n > 0) {
        mod[n] = '\0';
    } else {
        fp = fopen("/proc/self/cmdline", "rb");
        if (fp == NULL)
            return 0;
        got = fread(mod, 1, sizeof mod - 1, fp);
        fclose(fp);
        if (got == 0)
            return 0;
        mod[got] = '\0';
    }
    host_slashes(mod);
    for (i = (int)strlen(mod) - 1; i >= 0; i--) {
        if (mod[i] == '/') {
            mod[i] = '\0';
            break;
        }
    }
    if (mod[0] == '\0')
        return 0;
    if (strlen(mod) >= cap)
        return 0;
    memcpy(dir, mod, strlen(mod) + 1);
    return 1;
}

static int host_find_ship(char *out, int cap)
{
    char dir[HOST_PATH];
    char trial[HOST_PATH];
    int i;
    size_t n;

    if (!host_exe_dir(dir, sizeof dir))
        return 0;
    for (i = 0; i < 8; i++) {
        if (host_join(trial, (int)sizeof trial, dir, "Forth/Resources/Library") &&
            host_has_marker(trial)) {
            if ((int)strlen(trial) >= cap)
                return 0;
            memcpy(out, trial, strlen(trial) + 1);
            return 1;
        }
        if (host_join(trial, (int)sizeof trial, dir, "Resources/Library") &&
            host_has_marker(trial)) {
            if ((int)strlen(trial) >= cap)
                return 0;
            memcpy(out, trial, strlen(trial) + 1);
            return 1;
        }
        if (host_join(trial, (int)sizeof trial, dir, "EditForthLin/Forth/Resources/Library") &&
            host_has_marker(trial)) {
            if ((int)strlen(trial) >= cap)
                return 0;
            memcpy(out, trial, strlen(trial) + 1);
            return 1;
        }
        n = strlen(dir);
        while (n > 0) {
            if (dir[n - 1] == '/') {
                dir[n - 1] = '\0';
                break;
            }
            n--;
        }
        if (n == 0)
            break;
    }
    return 0;
}

static void host_install_user_tree(void)
{
    char ship_lib[HOST_PATH];
    char ship_root[HOST_PATH];
    char src[HOST_PATH];
    char dst[HOST_PATH];
    const char *names[] = {"Library", "AutoLoad", "Docs"};
    int i;
    int slash;
    int copied = 0;

    if (!host_user_root_path(user_root, sizeof user_root))
        return;
    mkdir(user_root, 0755);
    if (snprintf(library_root, sizeof library_root, "%s/Library", user_root) >=
        (int)sizeof library_root)
        library_root[0] = '\0';
    if (!host_find_ship(ship_lib, (int)sizeof ship_lib)) {
        if (!host_has_marker(library_root))
            host_outs("Library source was not found. Documents/EditForthLin has no Library yet.\n");
        if (snprintf(dst, sizeof dst, "%s/Config", user_root) < (int)sizeof dst)
            mkdir(dst, 0755);
        (void)chdir(user_root);
        return;
    }
    slash = (int)strlen(ship_lib);
    while (slash > 0 && ship_lib[slash - 1] != '/')
        slash--;
    if (slash <= 1) {
        (void)chdir(user_root);
        return;
    }
    memcpy(ship_root, ship_lib, (size_t)slash - 1);
    ship_root[slash - 1] = '\0';
    for (i = 0; i < 3; i++) {
        if (!host_join(src, (int)sizeof src, ship_root, names[i]))
            continue;
        if (!host_is_dir(src))
            continue;
        if (!host_join(dst, (int)sizeof dst, user_root, names[i]))
            continue;
        copied += host_copy_missing(src, dst, 0);
    }
    if (copied > 0) {
        char msg[96];
        snprintf(msg, sizeof msg,
                 "Updated %d shipped file(s) in Documents/EditForthLin\n", copied);
        host_outs(msg);
    }
    if (snprintf(dst, sizeof dst, "%s/Config", user_root) < (int)sizeof dst)
        mkdir(dst, 0755);
    if (host_has_marker(library_root))
        host_outs("EditForthLin folder: Documents/EditForthLin\n");
    (void)chdir(user_root);
}

/* mode 0: copy Library/AutoLoad/Docs files that are missing or older.
   mode 1: replace those three folders from the ship tree. Config stays.
   mode 2: rename Documents/EditForthLin to EditForthLin.UserN, then copy fresh. */
void host_user_tree(int mode)
{
    char ship_lib[HOST_PATH];
    char ship_root[HOST_PATH];
    char src[HOST_PATH];
    char dst[HOST_PATH];
    char renamed[HOST_PATH];
    const char *names[] = {"Library", "AutoLoad", "Docs"};
    int i;
    int slash;
    int n;
    int overwrite;
    int copied = 0;

    if (user_root[0] == '\0') {
        if (!host_user_root_path(user_root, sizeof user_root)) {
            host_outs("? user folder: HOME is not set\n");
            return;
        }
    }
    if (!host_find_ship(ship_lib, (int)sizeof ship_lib)) {
        host_outs("? shipped Library was not found beside the Forth program\n");
        return;
    }
    slash = (int)strlen(ship_lib);
    while (slash > 0 && ship_lib[slash - 1] != '/')
        slash--;
    if (slash <= 1) {
        host_outs("? shipped Library path is not usable\n");
        return;
    }
    memcpy(ship_root, ship_lib, (size_t)slash - 1);
    ship_root[slash - 1] = '\0';

    if (mode == 2) {
        (void)chdir("/");
        for (n = 1; n < 100; n++) {
            if (snprintf(renamed, sizeof renamed, "%s.User%d", user_root, n) >= (int)sizeof renamed) {
                host_outs("? rename path is too long\n");
                (void)chdir(user_root);
                return;
            }
            {
                struct stat st;
                if (stat(renamed, &st) != 0)
                    break;
            }
        }
        if (n >= 100) {
            host_outs("? too many EditForthLin.User folders\n");
            (void)chdir(user_root);
            return;
        }
        if (rename(user_root, renamed) != 0) {
            host_outs("? could not rename Documents/EditForthLin\n");
            (void)chdir(user_root);
            return;
        }
        mkdir(user_root, 0755);
        host_outs("Renamed Documents/EditForthLin\n");
    } else if (mode == 1) {
        for (i = 0; i < 3; i++) {
            if (!host_join(dst, (int)sizeof dst, user_root, names[i]))
                continue;
            host_remove_tree(dst);
        }
        host_outs("Replacing Library, AutoLoad, and Docs\n");
    }

    overwrite = mode == 0 ? 0 : 1;
    for (i = 0; i < 3; i++) {
        if (!host_join(src, (int)sizeof src, ship_root, names[i]))
            continue;
        if (!host_is_dir(src))
            continue;
        if (!host_join(dst, (int)sizeof dst, user_root, names[i]))
            continue;
        copied += host_copy_tree(src, dst, overwrite, 0);
    }
    if (snprintf(dst, sizeof dst, "%s/Config", user_root) < (int)sizeof dst)
        mkdir(dst, 0755);
    if (snprintf(library_root, sizeof library_root, "%s/Library", user_root) >= (int)sizeof library_root)
        library_root[0] = '\0';
    if (mode == 0) {
        char msg[96];
        if (copied > 0)
            snprintf(msg, sizeof msg,
                     "Updated %d shipped file(s) in Documents/EditForthLin\n", copied);
        else
            snprintf(msg, sizeof msg, "Documents/EditForthLin is current\n");
        host_outs(msg);
    } else
        host_outs("Restored shipped files in Documents/EditForthLin\n");
    if (mode == 2)
        (void)chdir(user_root);
}

void host_fromlib(void)
{
    fromlib_armed = 1;
}

void host_fromlib_off(void)
{
    fromlib_armed = 0;
}

long long host_fromlib_query(void)
{
    return fromlib_armed ? -1 : 0;
}

static void (*host_cls_fn)(void);

void host_set_cls(void (*fn)(void))
{
    host_cls_fn = fn;
}

void host_cls(void)
{
    if (host_cls_fn != NULL)
        host_cls_fn();
}

long long host_library_path(char *dst, long long cap)
{
    size_t n;

    if (dst == NULL || cap < 2)
        return 0;
    n = strlen(library_root);
    if (n >= (size_t)cap)
        n = (size_t)cap - 1;
    if (n > 0)
        memcpy(dst, library_root, n);
    dst[n] = '\0';
    return (long long)n;
}

/* Forth sources keep Windows spellings (Library/HYPER/HYPER.fth). The
   seeded tree under Documents/EditForthLin uses the names from the ship
   copy (Library/Hyper/hyper.fth). Walk that tree case-insensitively when
   the exact path is missing. */
static int host_ci_walk(char *built, size_t cap, const char *rest)
{
    char name[NAME_MAX + 1];
    const char *slash;
    size_t nlen;
    size_t blen;
    DIR *d;
    struct dirent *ent;
    struct stat st;

    while (rest != NULL && *rest == '/')
        rest++;
    if (rest == NULL || *rest == '\0') {
        if (stat(built, &st) != 0)
            return 0;
        return S_ISREG(st.st_mode) || S_ISDIR(st.st_mode);
    }
    slash = strchr(rest, '/');
    nlen = slash != NULL ? (size_t)(slash - rest) : strlen(rest);
    if (nlen == 0 || nlen > NAME_MAX)
        return 0;
    memcpy(name, rest, nlen);
    name[nlen] = '\0';
    d = opendir(built);
    if (d == NULL)
        return 0;
    blen = strlen(built);
    while ((ent = readdir(d)) != NULL) {
        size_t elen = strlen(ent->d_name);
        if (ent->d_name[0] == '.' &&
            (ent->d_name[1] == '\0' ||
             (ent->d_name[1] == '.' && ent->d_name[2] == '\0')))
            continue;
        if (elen != nlen || strncasecmp(ent->d_name, name, nlen) != 0)
            continue;
        if (blen + 1 + elen + 1 > cap)
            continue;
        if (blen > 0 && built[blen - 1] != '/') {
            built[blen] = '/';
            memcpy(built + blen + 1, ent->d_name, elen + 1);
        } else {
            memcpy(built + blen, ent->d_name, elen + 1);
        }
        if (host_ci_walk(built, cap, slash != NULL ? slash + 1 : "")) {
            closedir(d);
            return 1;
        }
        built[blen] = '\0';
    }
    closedir(d);
    return 0;
}

static int host_ci_under_root(char *dst, size_t cap, const char *src)
{
    size_t n;
    char built[PATH_MAX];
    const char *rest;

    if (user_root[0] == '\0' || src == NULL || src[0] != '/')
        return 0;
    n = strlen(user_root);
    if (n == 0 || n >= sizeof built)
        return 0;
    if (strncmp(src, user_root, n) != 0)
        return 0;
    if (src[n] != '\0' && src[n] != '/')
        return 0;
    memcpy(built, user_root, n + 1);
    rest = src + n;
    if (!host_ci_walk(built, sizeof built, rest))
        return 0;
    n = strlen(built);
    if (n + 1 > cap)
        return 0;
    memcpy(dst, built, n + 1);
    return 1;
}

long long host_resolve(const char *p, long long n, char *out, long long cap)
{
    char tmp[HOST_PATH];
    char joined[HOST_PATH];
    char cwd[HOST_PATH];
    /* glibc realpath() rejects a destination shorter than PATH_MAX. */
    char absbuf[PATH_MAX];
    const char *src;
    size_t sl;

    if (out == NULL || cap < 2)
        return 0;
    if (p == NULL || n < 0)
        n = 0;
    if (n > HOST_PATH - 1)
        n = HOST_PATH - 1;
    if (n > 0)
        memcpy(tmp, p, (size_t)n);
    tmp[n] = '\0';
    if (!host_expand_home(joined, sizeof joined, tmp))
        return 0;
    memcpy(tmp, joined, strlen(joined) + 1);
    host_slashes(tmp);
    src = tmp;
    if (!host_abs(tmp, (long long)strlen(tmp)) && fromlib_armed) {
        fromlib_armed = 0;
        if (library_root[0] == '\0' || !host_is_dir(library_root) ||
            !host_join(joined, (int)sizeof joined, library_root, tmp)) {
            host_outs("FROMLIB: Documents/EditForthLin/Library is missing\n");
            return 0;
        }
        src = joined;
    } else if (!host_abs(tmp, (long long)strlen(tmp)) && load_n > 0 && load_len[load_n - 1] > 0) {
        int dl = load_len[load_n - 1];
        size_t room;
        size_t cn;

        if (dl > HOST_PATH - 2)
            dl = HOST_PATH - 2;
        memcpy(joined, load_dir[load_n - 1], (size_t)dl);
        if (joined[dl - 1] != '/')
            joined[dl++] = '/';
        room = (size_t)(HOST_PATH - 1 - dl);
        cn = strlen(tmp);
        if (cn > room)
            cn = room;
        memcpy(joined + dl, tmp, cn);
        joined[dl + cn] = '\0';
        src = joined;
    } else if (!host_abs(tmp, (long long)strlen(tmp))) {
        if (getcwd(cwd, sizeof cwd) != NULL) {
            if (!host_join(joined, (int)sizeof joined, cwd, tmp))
                return 0;
            src = joined;
        }
    }
    if (realpath(src, absbuf) != NULL || host_ci_under_root(absbuf, sizeof absbuf, src)) {
        sl = strlen(absbuf);
        if (sl >= (size_t)cap)
            sl = (size_t)cap - 1;
        memcpy(out, absbuf, sl);
        out[sl] = '\0';
        return (long long)sl;
    }
    if (!host_normalize(out, (size_t)cap, src)) {
        sl = strlen(src);
        if (sl >= (size_t)cap)
            sl = (size_t)cap - 1;
        memcpy(out, src, sl);
        out[sl] = '\0';
        return (long long)sl;
    }
    return (long long)strlen(out);
}

void host_set_edit(void (*fn)(const char *path, int kind))
{
    host_edit_fn = fn;
}

static int host_is_file(const char *path)
{
    struct stat st;

    if (path == NULL || path[0] == '\0')
        return 0;
    if (stat(path, &st) != 0)
        return 0;
    return S_ISREG(st.st_mode);
}

/* kind 0 opens a file. kind 1 asks the editor for a dialog at path (empty = cwd). */
void host_edit(const char *p, long long n)
{
    int armed = fromlib_armed;
    char resolved[HOST_PATH];
    char alt[HOST_PATH];
    long long rn;
    const char *leaf;
    char *slash;

    if (p == NULL || n <= 0) {
        if (armed)
            fromlib_armed = 0;
        if (armed && library_root[0] != '\0' && host_is_dir(library_root)) {
            if (host_edit_fn != NULL)
                host_edit_fn(library_root, 1);
            else
                host_outs("EDIT: choose a file in the editor\n");
            return;
        }
        if (armed) {
            host_outs("FROMLIB: Documents/EditForthLin/Library is missing\n");
            return;
        }
        if (host_edit_fn != NULL)
            host_edit_fn("", 1);
        else
            host_outs("EDIT: choose a file in the editor\n");
        return;
    }
    rn = host_resolve(p, n, resolved, (long long)sizeof resolved);
    if (rn <= 0) {
        host_outs("can't edit: ");
        host_out(p, (size_t)n);
        host_outs(" (not found)\n");
        return;
    }
    if (!host_is_file(resolved)) {
        leaf = strrchr(resolved, '/');
        leaf = leaf != NULL ? leaf + 1 : resolved;
        if (strchr(leaf, '.') == NULL && (size_t)rn + 5 < sizeof alt) {
            memcpy(alt, resolved, (size_t)rn);
            memcpy(alt + rn, ".fth", 5);
            if (host_is_file(alt)) {
                memcpy(resolved, alt, strlen(alt) + 1);
                rn = (long long)strlen(resolved);
            }
        }
    }
    if (!host_is_file(resolved)) {
        host_outs("can't edit: ");
        host_outs(resolved);
        host_outs(" (not found)\n");
        return;
    }
    if (!armed) {
        slash = strrchr(resolved, '/');
        if (slash != NULL && slash != resolved) {
            *slash = '\0';
            (void)chdir(resolved);
            *slash = '/';
        }
    }
    if (host_edit_fn != NULL)
        host_edit_fn(resolved, 0);
    host_outs("EDIT: ");
    host_outs(resolved);
    host_outs("\n");
}

void host_set_edit_at(void (*fn)(const char *path, long long line))
{
    host_edit_at_fn = fn;
}

/* Open a resolved path at a 1-based line. Line 0 opens only. No cwd change
   and no file dialog. With no editor connected this validates and returns. */
void host_edit_at(const char *p, long long n, long long line)
{
    char resolved[HOST_PATH];
    const char *s;
    long long rn;
    long long a;
    long long b;

    if (line < 0)
        line = 0;
    if (p == NULL || n <= 0) {
        host_outs("? EDIT-AT needs a path\n");
        return;
    }
    a = 0;
    b = n;
    while (a < b) {
        char c = p[a];
        if (c != ' ' && c != '\t' && c != '\r' && c != '\n')
            break;
        a++;
    }
    while (b > a) {
        char c = p[b - 1];
        if (c != ' ' && c != '\t' && c != '\r' && c != '\n')
            break;
        b--;
    }
    if (b <= a) {
        host_outs("? EDIT-AT needs a path\n");
        return;
    }
    s = p + a;
    rn = host_resolve(s, b - a, resolved, (long long)sizeof resolved);
    if (rn <= 0 || !host_is_file(resolved)) {
        host_outs("can't edit: ");
        if (rn > 0)
            host_outs(resolved);
        else
            host_out(s, (size_t)(b - a));
        host_outs(" (not found)\n");
        return;
    }
    if (host_edit_at_fn != NULL)
        host_edit_at_fn(resolved, line);
}

static void drain_fd(int fd)
{
    char buf[1024];
    ssize_t got;

    if (fd < 0)
        return;
    for (;;) {
        got = read(fd, buf, sizeof buf);
        if (got <= 0)
            return;
        host_out(buf, (size_t)got);
    }
}

/* SYSTEM ( c-addr u -- n ). Run via /bin/sh -c; return exit code or -1. */
long long host_system(const char *cmd, long long n)
{
    char *line = NULL;
    int out_pipe[2] = {-1, -1};
    int err_pipe[2] = {-1, -1};
    pid_t pid;
    int start;
    int end;
    int status = 0;
    long long rc = -1;
    int nul;

    if (cmd == NULL || n <= 0) {
        host_outs("SYSTEM: empty command\n");
        return -1;
    }
    if (n > 8192) {
        host_outs("SYSTEM: command is too long\n");
        return -1;
    }
    start = 0;
    end = (int)n;
    while (start < end && (cmd[start] == ' ' || cmd[start] == '\t' ||
                           cmd[start] == '\r' || cmd[start] == '\n'))
        start++;
    while (end > start && (cmd[end - 1] == ' ' || cmd[end - 1] == '\t' ||
                           cmd[end - 1] == '\r' || cmd[end - 1] == '\n'))
        end--;
    if (end <= start) {
        host_outs("SYSTEM: empty command\n");
        return -1;
    }
    line = (char *)malloc((size_t)(end - start) + 1);
    if (line == NULL) {
        host_outs("SYSTEM: failed to launch\n");
        return -1;
    }
    memcpy(line, cmd + start, (size_t)(end - start));
    line[end - start] = '\0';
    if (pipe(out_pipe) != 0 || pipe(err_pipe) != 0) {
        host_outs("SYSTEM: failed to launch\n");
        free(line);
        return -1;
    }
    pid = fork();
    if (pid < 0) {
        host_outs("SYSTEM: failed to launch\n");
        close(out_pipe[0]);
        close(out_pipe[1]);
        close(err_pipe[0]);
        close(err_pipe[1]);
        free(line);
        return -1;
    }
    if (pid == 0) {
        close(out_pipe[0]);
        close(err_pipe[0]);
        nul = open("/dev/null", O_RDONLY);
        if (nul >= 0) {
            dup2(nul, STDIN_FILENO);
            close(nul);
        }
        dup2(out_pipe[1], STDOUT_FILENO);
        dup2(err_pipe[1], STDERR_FILENO);
        close(out_pipe[1]);
        close(err_pipe[1]);
        execl("/bin/sh", "sh", "-c", line, (char *)NULL);
        _exit(127);
    }
    close(out_pipe[1]);
    close(err_pipe[1]);
    free(line);
    for (;;) {
        fd_set rfds;
        struct timeval tv;
        int maxfd;
        int ready;

        FD_ZERO(&rfds);
        if (out_pipe[0] >= 0)
            FD_SET(out_pipe[0], &rfds);
        if (err_pipe[0] >= 0)
            FD_SET(err_pipe[0], &rfds);
        maxfd = out_pipe[0] > err_pipe[0] ? out_pipe[0] : err_pipe[0];
        tv.tv_sec = 0;
        tv.tv_usec = 30000;
        ready = select(maxfd + 1, &rfds, NULL, NULL, &tv);
        if (ready > 0) {
            if (out_pipe[0] >= 0 && FD_ISSET(out_pipe[0], &rfds)) {
                char buf[1024];
                ssize_t got = read(out_pipe[0], buf, sizeof buf);
                if (got > 0)
                    host_out(buf, (size_t)got);
                else if (got == 0) {
                    close(out_pipe[0]);
                    out_pipe[0] = -1;
                }
            }
            if (err_pipe[0] >= 0 && FD_ISSET(err_pipe[0], &rfds)) {
                char buf[1024];
                ssize_t got = read(err_pipe[0], buf, sizeof buf);
                if (got > 0)
                    host_out(buf, (size_t)got);
                else if (got == 0) {
                    close(err_pipe[0]);
                    err_pipe[0] = -1;
                }
            }
        }
        if (waitpid(pid, &status, WNOHANG) == pid)
            break;
    }
    if (out_pipe[0] >= 0) {
        drain_fd(out_pipe[0]);
        close(out_pipe[0]);
    }
    if (err_pipe[0] >= 0) {
        drain_fd(err_pipe[0]);
        close(err_pipe[0]);
    }
    if (WIFEXITED(status))
        rc = (long long)WEXITSTATUS(status);
    else
        rc = -1;
    return rc;
}

void host_begin_load(const char *p, long long n)
{
    int len = 0;
    int found = 0;
    long long i;

    if (load_n >= HOST_LOADS)
        return;
    if (p == NULL || n < 0)
        n = 0;
    i = n;
    while (i > 0) {
        char c = p[i - 1];
        if (c == '\\' || c == '/') {
            found = 1;
            break;
        }
        i--;
    }
    if (found)
        len = (int)(i - 1);
    if (len < 0)
        len = 0;
    if (len >= HOST_PATH)
        len = HOST_PATH - 1;
    if (len > 0)
        memcpy(load_dir[load_n], p, (size_t)len);
    load_dir[load_n][len] = '\0';
    host_slashes(load_dir[load_n]);
    len = (int)strlen(load_dir[load_n]);
    load_len[load_n] = len;
    load_prev[load_n][0] = '\0';
    if (getcwd(load_prev[load_n], sizeof load_prev[load_n]) == NULL)
        load_prev[load_n][0] = '\0';
    load_n++;
    if (len > 0)
        (void)chdir(load_dir[load_n - 1]);
}

void host_end_load(void)
{
    if (load_n <= 0)
        return;
    load_n--;
    if (load_prev[load_n][0] != '\0')
        (void)chdir(load_prev[load_n]);
}

static int host_eq(const char *a, int an, const char *b, int bn)
{
    if (an != bn)
        return 0;
    for (int i = 0; i < an; i++) {
        unsigned char ca = (unsigned char)a[i];
        unsigned char cb = (unsigned char)b[i];
        if (ca == '\\')
            ca = '/';
        if (cb == '\\')
            cb = '/';
        if (ca >= 'A' && ca <= 'Z')
            ca = (unsigned char)(ca + 32);
        if (cb >= 'A' && cb <= 'Z')
            cb = (unsigned char)(cb + 32);
        if (ca != cb)
            return 0;
    }
    return 1;
}

long long host_was_included(const char *p, long long n)
{
    int len;

    if (p == NULL || n <= 0)
        return 0;
    if (n > 255)
        n = 255;
    len = (int)n;
    for (int i = 0; i < reg_n; i++) {
        if (host_eq(reg_path[i], reg_len[i], p, len))
            return 1;
    }
    return 0;
}

void host_register(const char *p, long long n)
{
    if (p == NULL || n <= 0)
        return;
    if (n > 255)
        n = 255;
    memcpy(last_path, p, (size_t)n);
    last_path[n] = '\0';
    last_len = (int)n;
    if (reg_n >= HOST_REGS)
        return;
    if (host_was_included(p, n))
        return;
    memcpy(reg_path[reg_n], p, (size_t)n);
    reg_path[reg_n][n] = '\0';
    reg_len[reg_n] = (int)n;
    reg_n++;
}

void host_last_included(long long *addr, long long *len)
{
    if (addr != NULL)
        *addr = (long long)(uintptr_t)last_path;
    if (len != NULL)
        *len = last_len;
}

void host_dot_included(void)
{
    if (reg_n <= 0) {
        host_outs("Included:\n  (none)\n");
        return;
    }
    host_outs("Included:\n");
    for (int i = 0; i < reg_n; i++) {
        host_outs("  ");
        host_out(reg_path[i], (size_t)reg_len[i]);
        host_outs("\n");
    }
}

int host_facility_emit(unsigned char byte);
void host_facility_op(int64_t op, int64_t a, int64_t b);

long long host_read_line(char *buf, long long n, long long id, long long *flag);
long long host_write_line(const char *buf, long long n, long long id);
long long host_position(long long id);
long long host_resize_file(long long id, long long lo, long long hi);
long long host_delete(const char *p, long long n);
long long host_rename(const char *a, long long an, const char *b, long long bn);
long long host_file_status(const char *p, long long n, long long *attr);

/* Stand-alone (SA-FILES) calls this when the file hook cell is zero.
   op: 1 open 2 create 3 close 4 read 5 write 6 rline 7 wline
       8 pos 9 size 10 repos 11 resize 12 delete 13 rename 14 status 15 flush
   Returns ior (0 or -1). o1/o2/o3 are the extra results. */
long long sa_win_file_op(long long op, long long a, long long b, long long c,
                         long long d, void *ptr, long long *o1, long long *o2,
                         long long *o3)
{
    long long n;
    long long flag;

    if (o1 != NULL)
        *o1 = 0;
    if (o2 != NULL)
        *o2 = 0;
    if (o3 != NULL)
        *o3 = 0;
    switch ((int)op) {
    case 1:
    case 2:
        n = (op == 1) ? host_open(ptr, b, c) : host_create(ptr, b, c);
        if (n == 0)
            return -1;
        if (o1 != NULL)
            *o1 = n;
        return 0;
    case 3:
        return host_close(a);
    case 4:
        n = host_read(ptr, b, a);
        if (n < 0)
            return -1;
        if (o1 != NULL)
            *o1 = n;
        return 0;
    case 5:
        return host_write(ptr, b, a);
    case 6:
        flag = 0;
        n = host_read_line(ptr, b, a, &flag);
        if (n < 0)
            return -1;
        if (o1 != NULL)
            *o1 = n;
        if (o2 != NULL)
            *o2 = flag;
        return 0;
    case 7:
        return host_write_line(ptr, b, a);
    case 8:
        n = host_position(a);
        if (n < 0)
            return -1;
        if (o1 != NULL)
            *o1 = n;
        return 0;
    case 9:
        n = host_size(a);
        if (n < 0)
            return -1;
        if (o1 != NULL)
            *o1 = n;
        return 0;
    case 10:
        return host_repos(a, b, c);
    case 11:
        return host_resize_file(a, b, c);
    case 12:
        return host_delete(ptr, b);
    case 13:
        return host_rename(ptr, b, (const char *)c, d);
    case 14:
        return host_file_status(ptr, b, o1);
    case 15:
        return host_flush(a);
    default:
        return -1;
    }
}

/* Stand-alone (SA-PRINT) calls this when the emit hook cell is zero. */
void sa_win_putchar(unsigned long long c)
{
    unsigned char b = (unsigned char)c;
    if (host_facility_emit(b))
        return;
    host_out(&b, 1);
}

static void emit_c(int c)
{
    sa_win_putchar((unsigned long long)(unsigned char)c);
}

static int key_c(void)
{
    if (key_hook != NULL)
        return key_hook();
    return -1;
}

long long host_read_line(char *buf, long long n, long long id, long long *flag)
{
    FILE *fp;
    long long i = 0;
    int c;

    if (flag != NULL)
        *flag = 0;
    if (id >= 1 && id < HOST_FILES && host_mem[id] != NULL) {
        long long pos = host_mem_pos[id];
        long long len = host_mem_len[id];
        const char *base = host_mem[id];
        if (n < 0 || (buf == NULL && n > 0))
            return -1;
        if (pos >= len)
            return 0;
        if (flag != NULL)
            *flag = -1;
        while (pos < len) {
            char ch = base[pos++];
            if (ch == '\n') {
                host_mem_pos[id] = pos;
                return i;
            }
            if (ch == '\r') {
                if (pos < len && base[pos] == '\n')
                    pos++;
                host_mem_pos[id] = pos;
                return i;
            }
            if (i >= n) {
                host_mem_pos[id] = pos - 1;
                return i;
            }
            if (buf != NULL)
                buf[i] = ch;
            i++;
        }
        host_mem_pos[id] = pos;
        return i;
    }
    fp = host_lookup(id);
    if (fp == NULL || n < 0 || (buf == NULL && n > 0))
        return -1;
    c = fgetc(fp);
    if (c == EOF)
        return ferror(fp) ? -1 : 0;
    if (flag != NULL)
        *flag = -1;
    for (;;) {
        if (c == '\n')
            return i;
        if (c == '\r') {
            int next = fgetc(fp);
            if (next == EOF) {
                if (ferror(fp))
                    return -1;
            } else if (next != '\n') {
                ungetc(next, fp);
            }
            return i;
        }
        if (i >= n) {
            ungetc(c, fp);
            return i;
        }
        buf[i++] = (char)c;
        c = fgetc(fp);
        if (c == EOF)
            return ferror(fp) ? -1 : i;
    }
}

long long host_write_line(const char *buf, long long n, long long id)
{
    char nl = '\n';

    if (host_write(buf, n, id) != 0)
        return -1;
    return host_write(&nl, 1, id);
}

long long host_position(long long id)
{
    FILE *fp;
    off_t pos;

    if (id >= 1 && id < HOST_FILES && host_mem[id] != NULL)
        return host_mem_pos[id];
    fp = host_lookup(id);
    if (fp == NULL)
        return -1;
    pos = ftello(fp);
    if (pos < 0)
        return -1;
    return (long long)pos;
}

long long host_resize_file(long long id, long long lo, long long hi)
{
    FILE *fp = host_lookup(id);
    int fd;

    if (fp == NULL || hi != 0 || lo < 0)
        return -1;
    if (fflush(fp) != 0)
        return -1;
    fd = fileno(fp);
    if (fd < 0)
        return -1;
    if (ftruncate(fd, (off_t)lo) != 0)
        return -1;
    return 0;
}

long long host_delete(const char *p, long long n)
{
    char path[HOST_PATH];

    if (!host_copy_path(p, n, path, sizeof path))
        return -1;
    return unlink(path) == 0 ? 0 : -1;
}

long long host_rename(const char *a, long long an, const char *b, long long bn)
{
    char from[HOST_PATH];
    char to[HOST_PATH];

    if (!host_copy_path(a, an, from, sizeof from))
        return -1;
    if (!host_copy_path(b, bn, to, sizeof to))
        return -1;
    return rename(from, to) == 0 ? 0 : -1;
}

long long host_file_status(const char *p, long long n, long long *attr)
{
    char path[HOST_PATH];
    struct stat st;
    long long a;

    if (attr != NULL)
        *attr = 0;
    if (!host_copy_path(p, n, path, sizeof path))
        return -1;
    if (stat(path, &st) != 0)
        return -1;
    a = FILE_ATTR_NORMAL;
    if (S_ISDIR(st.st_mode))
        a = FILE_ATTR_DIRECTORY;
    if (attr != NULL)
        *attr = a;
    return 0;
}

void *host_resize(void *p, unsigned long long n)
{
    return realloc(p, n == 0 ? 1 : (size_t)n);
}

void host_sleep(unsigned long long ms)
{
    struct timespec req;
    struct timespec rem;

    while (ms > 0) {
        unsigned long long chunk = ms > 1000ull ? 1000ull : ms;
        req.tv_sec = (time_t)(chunk / 1000ull);
        req.tv_nsec = (long)((chunk % 1000ull) * 1000000ull);
        while (nanosleep(&req, &rem) != 0) {
            if (errno != EINTR)
                return;
            req = rem;
        }
        ms -= chunk;
    }
}

void host_time_date(long long *out)
{
    time_t now;
    struct tm tm;

    if (out == NULL)
        return;
    now = time(NULL);
    if (localtime_r(&now, &tm) == NULL) {
        out[0] = 0;
        out[1] = 0;
        out[2] = 0;
        out[3] = 1;
        out[4] = 1;
        out[5] = 1970;
        return;
    }
    out[0] = tm.tm_sec;
    out[1] = tm.tm_min;
    out[2] = tm.tm_hour;
    out[3] = tm.tm_mday;
    out[4] = tm.tm_mon + 1;
    out[5] = tm.tm_year + 1900;
}

/* Editor companion fills the buffer. 0 means cancel or no dialog. */
extern int companion_is_active(void);
extern int companion_pick_dir(char *dst, int cap);

/* Terminal REPL: zenity folder panel. A non-interactive host gets no dialog. */
static int host_pick_zenity(char *dst, size_t cap)
{
    int pipefd[2];
    pid_t pid;
    char cwd[HOST_PATH];
    char filename[HOST_PATH + 2];
    size_t got;
    size_t cwd_n;
    int status;

    if (!isatty(STDIN_FILENO) || getenv("DISPLAY") == NULL || cap < 2)
        return 0;
    if (pipe(pipefd) != 0)
        return 0;
    if (getcwd(cwd, sizeof cwd) == NULL)
        cwd[0] = '\0';
    cwd_n = strlen(cwd);
    if (cwd_n + 2 >= sizeof filename) {
        close(pipefd[0]);
        close(pipefd[1]);
        return 0;
    }
    memcpy(filename, cwd, cwd_n);
    if (cwd_n > 0 && filename[cwd_n - 1] != '/')
        filename[cwd_n++] = '/';
    filename[cwd_n] = '\0';

    pid = fork();
    if (pid < 0) {
        close(pipefd[0]);
        close(pipefd[1]);
        return 0;
    }
    if (pid == 0) {
        close(pipefd[0]);
        if (dup2(pipefd[1], STDOUT_FILENO) < 0)
            _exit(127);
        if (pipefd[1] != STDOUT_FILENO)
            close(pipefd[1]);
        execlp("zenity", "zenity", "--file-selection", "--directory",
               "--title=CHDIR", "--filename", filename, (char *)NULL);
        _exit(127);
    }
    close(pipefd[1]);
    got = 0;
    while (got + 1 < cap) {
        ssize_t nread = read(pipefd[0], dst + got, cap - 1 - got);
        if (nread < 0) {
            if (errno == EINTR)
                continue;
            break;
        }
        if (nread == 0)
            break;
        got += (size_t)nread;
    }
    dst[got] = '\0';
    close(pipefd[0]);
    while (waitpid(pid, &status, 0) < 0 && errno == EINTR)
        ;
    while (got > 0 && (dst[got - 1] == '\n' || dst[got - 1] == '\r'))
        dst[--got] = '\0';
    if (!WIFEXITED(status) || WEXITSTATUS(status) != 0 || got == 0)
        return 0;
    return 1;
}

static int host_pick_directory(char *dst, size_t cap)
{
    int n;

    if (companion_is_active()) {
        n = companion_pick_dir(dst, (int)cap);
        return n > 0;
    }
    return host_pick_zenity(dst, cap);
}

long long host_chdir(const char *p, long long n)
{
    char path[HOST_PATH];

    /* n == 0 is bare CHDIR: the editor (or zenity) picks the folder. */
    if (n <= 0) {
        if (!host_pick_directory(path, sizeof path))
            return -1;
        host_slashes(path);
    } else if (!host_copy_path(p, n, path, sizeof path)) {
        return -1;
    }
    return chdir(path) == 0 ? 0 : -1;
}

void host_pwd(void)
{
    char buf[HOST_PATH];

    if (getcwd(buf, sizeof buf) == NULL)
        return;
    host_out(buf, strlen(buf));
    host_outs("\n");
}

long long host_cwd(char *buf, long long max)
{
    char tmp[HOST_PATH];
    long long copy;
    size_t n;

    if (buf == NULL || max <= 0)
        return 0;
    if (getcwd(tmp, sizeof tmp) == NULL)
        return 0;
    n = strlen(tmp);
    copy = (long long)n < max ? (long long)n : max;
    memcpy(buf, tmp, (size_t)copy);
    return copy;
}

static int host_has_wild(const char *s)
{
    for (; *s != '\0'; s++) {
        if (*s == '*' || *s == '?')
            return 1;
    }
    return 0;
}

void host_dir(const char *p, long long n)
{
    char spec[HOST_PATH];
    char dirpath[HOST_PATH];
    char pattern[HOST_PATH];
    DIR *d;
    struct dirent *ent;
    size_t len = 0;
    char *slash;
    struct stat st;

    if (p == NULL || n <= 0) {
        if (getcwd(spec, sizeof spec) == NULL)
            return;
        len = strlen(spec);
    } else {
        if (!host_copy_path(p, n, spec, sizeof spec))
            return;
        host_slashes(spec);
        len = strlen(spec);
    }
    if (!host_has_wild(spec)) {
        if (n <= 0 || (stat(spec, &st) == 0 && S_ISDIR(st.st_mode))) {
            if (len > 0 && spec[len - 1] != '/') {
                if (len + 3 >= sizeof spec)
                    return;
                spec[len++] = '/';
            }
            if (len + 2 >= sizeof spec)
                return;
            spec[len++] = '*';
            spec[len] = '\0';
        }
    }
    slash = strrchr(spec, '/');
    if (slash != NULL) {
        size_t dlen = (size_t)(slash - spec);
        if (dlen >= sizeof dirpath)
            return;
        if (dlen == 0) {
            dirpath[0] = '/';
            dirpath[1] = '\0';
        } else {
            memcpy(dirpath, spec, dlen);
            dirpath[dlen] = '\0';
        }
        if (strlen(slash + 1) >= sizeof pattern)
            return;
        memcpy(pattern, slash + 1, strlen(slash + 1) + 1);
    } else {
        if (getcwd(dirpath, sizeof dirpath) == NULL)
            return;
        if (strlen(spec) >= sizeof pattern)
            return;
        memcpy(pattern, spec, strlen(spec) + 1);
    }
    if (pattern[0] == '\0')
        memcpy(pattern, "*", 2);
    d = opendir(dirpath);
    if (d == NULL)
        return;
    while ((ent = readdir(d)) != NULL) {
        if (strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0)
            continue;
        if (fnmatch(pattern, ent->d_name, FNM_NOESCAPE) != 0)
            continue;
        host_out(ent->d_name, strlen(ent->d_name));
        host_outs("\n");
    }
    closedir(d);
}

long long host_accept(char *buf, long long n)
{
    long long i = 0;
    int c;

    if (buf == NULL || n <= 0)
        return 0;
    while (i < n) {
        c = key_c();
        if (c < 0 || c == '\n')
            break;
        if (c == '\r')
            continue;
        buf[i++] = (char)c;
    }
    return i;
}

int forth_eval(const char *text, size_t n)
{
    return kernel_eval(text, n);
}

void forth_prompt(void)
{
    char buf[64];
    int n = snprintf(buf, sizeof buf, "ok(%lld)> ", forth_depth());
    if (n > 0)
        host_out(buf, (size_t)n);
}

int host_bi_selftest(void);

int forth_boot(void)
{
    kernel_set_emit(emit_c);
    kernel_set_key(key_c);
    kernel_set_facility_op(host_facility_op);
    if (kernel_init() != 0) {
        host_outs("kernel_init failed\n");
        return 1;
    }
    {
        char ban[192];
        int bn = snprintf(ban, sizeof ban, "=== EditForthLin %s === %s ===\n",
                          kernel_version, kernel_built);
        if (bn > 0)
            host_outs(ban);
    }
    host_install_user_tree();
    host_bi_selftest();
    return 0;
}

int forth_eval_file(const char *path);

static int autoload_enabled = 1;

void forth_autoload_set(int on)
{
    autoload_enabled = on ? 1 : 0;
}

/* Evaluate AutoLoad/autoload.fth as one buffer from Documents/EditForthLin.
   Relative Library/ names then resolve against that folder. INCLUDE would
   push AutoLoad/ and look for Library beside the script. */
void forth_autoload(void)
{
    char path[HOST_PATH];
    static const char main_line[] = "[DEFINED] MAIN [IF] MAIN [THEN]";
    struct stat st;
    int rc;

    if (!autoload_enabled || user_root[0] == '\0')
        return;
    if (snprintf(path, sizeof path, "%s/AutoLoad/autoload.fth", user_root) >= (int)sizeof path)
        return;
    if (stat(path, &st) != 0 || !S_ISREG(st.st_mode))
        return;
    (void)chdir(user_root);
    rc = forth_eval_file(path);
    if (rc != 0)
        host_outs("autoload did not finish\n");
    forth_eval(main_line, sizeof main_line - 1);
    (void)chdir(user_root);
}

/* One kernel_eval of the whole file. kernel1.fth defines words across lines. */
int forth_eval_file(const char *path)
{
    FILE *fp;
    long sz;
    char *buf;
    size_t nread;
    int rc;
    char msg[HOST_PATH + 64];

    fp = fopen(path, "rb");
    if (fp == NULL) {
        snprintf(msg, sizeof msg, "cannot open %s\n", path);
        host_outs(msg);
        return -1;
    }
    if (fseek(fp, 0, SEEK_END) != 0) {
        fclose(fp);
        snprintf(msg, sizeof msg, "cannot size %s\n", path);
        host_outs(msg);
        return -1;
    }
    sz = ftell(fp);
    if (sz < 0) {
        fclose(fp);
        snprintf(msg, sizeof msg, "cannot size %s\n", path);
        host_outs(msg);
        return -1;
    }
    if (fseek(fp, 0, SEEK_SET) != 0) {
        fclose(fp);
        snprintf(msg, sizeof msg, "cannot read %s\n", path);
        host_outs(msg);
        return -1;
    }
    buf = (char *)malloc((size_t)sz + 1);
    if (buf == NULL) {
        fclose(fp);
        host_outs("out of memory\n");
        return -1;
    }
    nread = fread(buf, 1, (size_t)sz, fp);
    fclose(fp);
    buf[nread] = '\0';
    rc = forth_eval(buf, nread);
    free(buf);
    return rc;
}

/* Bare INCLUDE / FLOAD with no path: no GUI dialog on Linux host. */
long long host_include_dialog(void **out_ptr)
{
    if (out_ptr != NULL)
        *out_ptr = NULL;
    return 0;
}

