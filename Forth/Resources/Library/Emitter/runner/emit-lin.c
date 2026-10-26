/* emit-lin.c — Linux runner for a 64EMIT02 image. Public domain.
 * Loads the image, binds HOST-APP slots, and draws the pixel grid with X11.
 *
 *   emit-lin image.img
 *   emit-lin            (app.img beside this binary)
 */
#if !defined(_DEFAULT_SOURCE) && !defined(_POSIX_C_SOURCE)
#define _DEFAULT_SOURCE
#endif

#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <limits.h>
#include <time.h>
#include <sys/mman.h>
#include <sys/select.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

#include "emit-bi.inc"

#define EMIT_HDR 64
#define EMIT_PAGE 0x10000u
#define EMIT_STACK_BYTES (2 * 1024 * 1024)
#define EMIT_RP_BYTES (256 * 1024)
#define EMIT_COLS_MAX 256
#define EMIT_ROWS_MAX 128
#define EMIT_KEYCAP 64

typedef int64_t (*emit_host_fn)(int64_t, int64_t);

static uint8_t *g_code;
static uint64_t g_code_len;
static int emit_headless;
static int emit_opened;
static int emit_cols = 80, emit_rows = 25;
static char emit_app_name[256] = "64Emitter";
static uint8_t *emit_cells;
static int emit_cell_n;
static uint8_t *emit_pix;
static int emit_pix_n, emit_pix_w, emit_pix_h, emit_pix_stride;
static int emit_pix_depth = 1;
static int emit_has_pix;
static uint8_t *emit_bgra;
static int emit_bgra_n;
static int64_t emit_keys[EMIT_KEYCAP];
static int emit_kr, emit_kw;
static int64_t emit_mouse_x, emit_mouse_y, emit_mouse_buttons;
static Display *emit_dpy;
static Window emit_win;
static GC emit_gc;
static XFontStruct *emit_font;
static XImage *emit_ximg;
static Atom emit_wm_delete;

static void die(const char *msg) {
    fprintf(stderr, "emit-lin: %s\n", msg);
    exit(1);
}

static void emit_key_push(int64_t k) {
    int next = (emit_kw + 1) % EMIT_KEYCAP;
    if (next == emit_kr)
        return;
    emit_keys[emit_kw] = k;
    emit_kw = next;
}

static int64_t emit_key_pop(void) {
    int64_t k;
    if (emit_kr == emit_kw)
        return -1;
    k = emit_keys[emit_kr];
    emit_kr = (emit_kr + 1) % EMIT_KEYCAP;
    return k;
}

static uint64_t rd_u64(const uint8_t *p) {
    uint64_t v;
    memcpy(&v, p, 8);
    return v;
}

static uint32_t rd_u32(const uint8_t *p) {
    uint32_t v;
    memcpy(&v, p, 4);
    return v;
}

static void rebase_cell(uint8_t *cell, uint64_t code_base, uint64_t code_len,
                        uint64_t data_base, uint64_t data_len,
                        uint8_t *code, uint8_t *data) {
    uint64_t v = rd_u64(cell);
    if (v >= code_base && v < code_base + code_len) {
        uint64_t nv = v - code_base + (uint64_t)(uintptr_t)code;
        memcpy(cell, &nv, 8);
    } else if (data_len && v >= data_base && v < data_base + data_len) {
        uint64_t nv = v - data_base + (uint64_t)(uintptr_t)data;
        memcpy(cell, &nv, 8);
    }
}

static int resolve_default_img(char *out, size_t out_sz) {
    char exe[PATH_MAX];
    char resolved[PATH_MAX];
    ssize_t n;
    char *slash;

    n = readlink("/proc/self/exe", exe, sizeof exe - 1);
    if (n <= 0)
        return -1;
    exe[n] = '\0';
    if (!realpath(exe, resolved))
        return -1;
    slash = strrchr(resolved, '/');
    if (!slash)
        return -1;
    *slash = '\0';
    if ((size_t)snprintf(out, out_sz, "%s/app.img", resolved) >= out_sz)
        return -1;
    if (access(out, R_OK) == 0)
        return 0;
    return -1;
}

static uint32_t emit_palette[256];
static int emit_palette_ready;

static void emit_init_palette(void) {
    static const uint8_t rgb16[16][3] = {
        {0, 0, 0}, {0, 0, 170}, {0, 170, 0}, {0, 170, 170},
        {170, 0, 0}, {170, 0, 170}, {170, 85, 0}, {170, 170, 170},
        {85, 85, 85}, {85, 85, 255}, {85, 255, 85}, {85, 255, 255},
        {255, 85, 85}, {255, 85, 255}, {255, 255, 85}, {255, 255, 255}
    };
    int i, r, g, b, idx;
    if (emit_palette_ready)
        return;
    for (i = 0; i < 16; i++) {
        emit_palette[i] = (uint32_t)rgb16[i][2] | ((uint32_t)rgb16[i][1] << 8) |
                          ((uint32_t)rgb16[i][0] << 16) | 0xFF000000u;
    }
    idx = 16;
    for (r = 0; r < 6; r++)
        for (g = 0; g < 6; g++)
            for (b = 0; b < 6; b++) {
                uint8_t R = (uint8_t)(r * 51);
                uint8_t G = (uint8_t)(g * 51);
                uint8_t B = (uint8_t)(b * 51);
                emit_palette[idx++] = (uint32_t)B | ((uint32_t)G << 8) |
                                      ((uint32_t)R << 16) | 0xFF000000u;
            }
    for (i = 0; i < 24; i++) {
        uint8_t v = (uint8_t)(8 + i * 10);
        emit_palette[232 + i] = (uint32_t)v | ((uint32_t)v << 8) |
                                ((uint32_t)v << 16) | 0xFF000000u;
    }
    emit_palette_ready = 1;
}

/* Character cells sit on the 8×16 grid over the pixel buffer.
 * 8-wide misc-fixed is 13px tall; the extra pixels stay at the bottom of the cell.
 * Ink is the classic green, including where a tick crosses a letter. */
static void emit_draw_cells(void) {
    int col, row, ascent;
    unsigned long fg, last;

    if (!emit_dpy || !emit_gc || !emit_cells || emit_cols < 1 || emit_rows < 1)
        return;
    if (!emit_font) {
        emit_font = XLoadQueryFont(emit_dpy,
            "-misc-fixed-medium-r-normal--13-120-75-75-c-80-iso8859-1");
        if (!emit_font)
            emit_font = XLoadQueryFont(emit_dpy, "fixed");
        if (!emit_font)
            return;
        XSetFont(emit_dpy, emit_gc, emit_font->fid);
    }
    ascent = emit_font->ascent;
    if (ascent < 1)
        ascent = 12;
    if (ascent > 16)
        ascent = 16;
    last = 0xFFFFFFFFUL;
    for (row = 0; row < emit_rows; row++) {
        for (col = 0; col < emit_cols; col++) {
            unsigned char ch = emit_cells[row * emit_cols + col];
            char s[2];
            if (ch <= 32 || ch > 126)
                continue;
            fg = 0xB2FFB2UL;
            if (fg != last) {
                XSetForeground(emit_dpy, emit_gc, fg);
                last = fg;
            }
            s[0] = (char)ch;
            s[1] = 0;
            XDrawString(emit_dpy, emit_win, emit_gc, col * 8, row * 16 + ascent, s, 1);
        }
    }
}

static void emit_present(void) {
    int w, h, x, y, need;
    uint8_t *src;
    uint8_t *dst;

    if (!emit_dpy || !emit_opened || !emit_has_pix || !emit_pix)
        return;
    w = emit_pix_w;
    h = emit_pix_h;
    if (w < 1 || h < 1)
        return;
    need = w * h * 4;
    if (emit_pix_depth == 32 && emit_pix_n < need)
        return;
    if (emit_pix_depth == 8 && emit_pix_n < w * h)
        return;
    if (!emit_bgra || emit_bgra_n < need) {
        free(emit_bgra);
        emit_bgra = (uint8_t *)malloc((size_t)need);
        emit_bgra_n = need;
    }
    if (!emit_bgra)
        return;
    src = emit_pix;
    dst = emit_bgra;
    emit_init_palette();
    if (emit_pix_depth == 32) {
        /* XY>ADDR already stores Forth y-up as top-down rows (row 0 = top). */
        memcpy(dst, src, (size_t)need);
    } else if (emit_pix_depth == 8) {
        for (y = 0; y < h; y++) {
            uint8_t *row = src + (size_t)y * (size_t)w;
            uint8_t *out = dst + (size_t)y * (size_t)w * 4;
            for (x = 0; x < w; x++) {
                uint32_t c = emit_palette[row[x]];
                out[x * 4] = (uint8_t)(c & 0xFF);
                out[x * 4 + 1] = (uint8_t)((c >> 8) & 0xFF);
                out[x * 4 + 2] = (uint8_t)((c >> 16) & 0xFF);
                out[x * 4 + 3] = 0xFF;
            }
        }
    } else {
        memset(dst, 0, (size_t)need);
        for (y = 0; y < h; y++) {
            int row = y * emit_pix_stride;
            uint8_t *out = dst + (size_t)y * (size_t)w * 4;
            for (x = 0; x < w; x++) {
                int o = x * 4;
                if (src[row + (x >> 3)] & (1u << (x & 7))) {
                    out[o] = 178;
                    out[o + 1] = 255;
                    out[o + 2] = 178;
                    out[o + 3] = 255;
                }
            }
        }
    }
    if (!emit_ximg || emit_ximg->width != w || emit_ximg->height != h) {
        if (emit_ximg) {
            emit_ximg->data = NULL;
            XDestroyImage(emit_ximg);
        }
        emit_ximg = XCreateImage(emit_dpy, DefaultVisual(emit_dpy, DefaultScreen(emit_dpy)),
                                 24, ZPixmap, 0, (char *)emit_bgra, (unsigned)w, (unsigned)h, 32, 0);
        if (!emit_ximg)
            return;
        emit_ximg->byte_order = LSBFirst;
        emit_ximg->bitmap_bit_order = LSBFirst;
    } else {
        emit_ximg->data = (char *)emit_bgra;
    }
    XPutImage(emit_dpy, emit_win, emit_gc, emit_ximg, 0, 0, 0, 0, (unsigned)w, (unsigned)h);
    emit_draw_cells();
    XFlush(emit_dpy);
}

static void emit_handle(XEvent *ev) {
    KeySym sym;
    char buf[8];
    int n;

    if (ev->type == ClientMessage &&
        (Atom)ev->xclient.data.l[0] == emit_wm_delete) {
        emit_key_push(27);
        return;
    }
    if (ev->type != KeyPress)
        return;
    n = XLookupString(&ev->xkey, buf, (int)sizeof buf, &sym, NULL);
    if (sym == XK_Escape)
        emit_key_push(27);
    else if (sym == XK_Return)
        emit_key_push(13);
    else if (n > 0)
        emit_key_push((unsigned char)buf[0]);
}

static void emit_pump(int timeout_ms) {
    XEvent ev;
    struct timeval tv;
    fd_set fds;
    int fd;
    int ready;

    if (!emit_dpy)
        return;
    while (XPending(emit_dpy)) {
        XNextEvent(emit_dpy, &ev);
        emit_handle(&ev);
    }
    if (timeout_ms <= 0)
        return;
    fd = ConnectionNumber(emit_dpy);
    FD_ZERO(&fds);
    FD_SET(fd, &fds);
    tv.tv_sec = timeout_ms / 1000;
    tv.tv_usec = (timeout_ms % 1000) * 1000;
    ready = select(fd + 1, &fds, NULL, NULL, &tv);
    if (ready > 0) {
        while (XPending(emit_dpy)) {
            XNextEvent(emit_dpy, &ev);
            emit_handle(&ev);
        }
    }
}

static int64_t host_app_open(int64_t cols, int64_t rows) {
    int sw, sh;
    XSetWindowAttributes attr;

    if (emit_headless)
        return -1;
    if (cols < 1)
        cols = 80;
    if (rows < 1)
        rows = 25;
    if (cols > EMIT_COLS_MAX)
        cols = EMIT_COLS_MAX;
    if (rows > EMIT_ROWS_MAX)
        rows = EMIT_ROWS_MAX;
    emit_cols = (int)cols;
    emit_rows = (int)rows;
    emit_cell_n = emit_cols * emit_rows;
    free(emit_cells);
    emit_cells = (uint8_t *)malloc((size_t)emit_cell_n);
    if (emit_cells)
        memset(emit_cells, 32, (size_t)emit_cell_n);
    if (!emit_dpy) {
        emit_dpy = XOpenDisplay(NULL);
        if (!emit_dpy)
            return -1;
        emit_wm_delete = XInternAtom(emit_dpy, "WM_DELETE_WINDOW", False);
    }
    sw = emit_cols * 8;
    sh = emit_rows * 16;
    if (sw < 160)
        sw = 160;
    if (sh < 100)
        sh = 100;
    if (!emit_win) {
        memset(&attr, 0, sizeof attr);
        attr.background_pixel = BlackPixel(emit_dpy, DefaultScreen(emit_dpy));
        attr.event_mask = KeyPressMask | ExposureMask | StructureNotifyMask;
        emit_win = XCreateWindow(emit_dpy, DefaultRootWindow(emit_dpy),
                                 80, 80, (unsigned)sw, (unsigned)sh, 0,
                                 CopyFromParent, InputOutput, CopyFromParent,
                                 CWBackPixel | CWEventMask, &attr);
        XSetWMProtocols(emit_dpy, emit_win, &emit_wm_delete, 1);
        emit_gc = XCreateGC(emit_dpy, emit_win, 0, NULL);
    }
    XStoreName(emit_dpy, emit_win, emit_app_name);
    XMapRaised(emit_dpy, emit_win);
    XFlush(emit_dpy);
    emit_kr = emit_kw = 0;
    emit_opened = 1;
    return 0;
}

static int64_t host_app_close(int64_t a, int64_t b) {
    (void)a;
    (void)b;
    emit_opened = 0;
    emit_key_push(27);
    emit_kr = emit_kw = 0;
    if (emit_dpy && emit_win) {
        XUnmapWindow(emit_dpy, emit_win);
        XFlush(emit_dpy);
    }
    return 0;
}

static int64_t host_app_blit(int64_t addr, int64_t nbytes) {
    int n;
    (void)addr;
    if (!emit_opened || !addr || nbytes <= 0 || !emit_cells)
        return 0;
    n = (int)nbytes;
    if (n > emit_cell_n)
        n = emit_cell_n;
    memcpy(emit_cells, (const void *)(uintptr_t)addr, (size_t)n);
    /* PREFRESH blits pixels first, then the character grid. Repaint so the
     * menu line is not left under the pixel image. */
    if (emit_has_pix)
        emit_present();
    else {
        emit_draw_cells();
        if (emit_dpy)
            XFlush(emit_dpy);
    }
    return 0;
}

static int64_t host_app_cblit_depth(int64_t addr, int64_t nbytes, int64_t depth) {
    int d, stride, need, n, w, h;
    if (!emit_opened || !addr || nbytes <= 0)
        return 0;
    w = emit_cols * 8;
    h = emit_rows * 16;
    if (w < 1)
        w = 1;
    if (h < 1)
        h = 1;
    emit_pix_w = w;
    emit_pix_h = h;
    if (depth == 8) {
        d = 8;
        stride = w;
        need = w * h;
    } else if (depth == 32) {
        d = 32;
        stride = w * 4;
        need = w * h * 4;
    } else {
        d = 1;
        stride = (w + 7) / 8;
        need = stride * h;
    }
    if (need <= 0 || need > 16 * 1024 * 1024)
        return 0;
    if (!emit_pix || emit_pix_n < need) {
        free(emit_pix);
        emit_pix = (uint8_t *)malloc((size_t)need);
        emit_pix_n = need;
    }
    n = (int)nbytes;
    if (n > need)
        n = need;
    memcpy(emit_pix, (const void *)(uintptr_t)addr, (size_t)n);
    if (n < need)
        memset(emit_pix + n, 0, (size_t)(need - n));
    emit_pix_depth = d;
    emit_pix_stride = stride;
    emit_has_pix = 1;
    if (emit_dpy && emit_win) {
        XResizeWindow(emit_dpy, emit_win, (unsigned)w, (unsigned)h);
        emit_present();
    }
    return 0;
}

static int64_t host_app_pblit(int64_t addr, int64_t nbytes) {
    return host_app_cblit_depth(addr, nbytes, 1);
}

__attribute__((noinline, optimize("O0")))
static int64_t host_app_cblit_slot(int64_t addr, int64_t nbytes) {
    int64_t depth;
    __asm__ volatile("mov %0, x2" : "=r"(depth));
    return host_app_cblit_depth(addr, nbytes, depth);
}

static int64_t host_app_keyq(int64_t a, int64_t b) {
    (void)a;
    (void)b;
    emit_pump(1);
    if (emit_kr == emit_kw)
        return 0;
    return -1;
}

static int64_t host_app_key(int64_t a, int64_t b) {
    int64_t k;
    (void)a;
    (void)b;
    if (emit_headless)
        return 27;
    for (;;) {
        k = emit_key_pop();
        if (k >= 0)
            return k;
        emit_pump(50);
    }
}

static int64_t host_app_name(int64_t addr, int64_t nbytes) {
    size_t n;
    if (addr && nbytes > 0) {
        n = (size_t)nbytes;
        if (n > sizeof emit_app_name - 1)
            n = sizeof emit_app_name - 1;
        memcpy(emit_app_name, (const void *)(uintptr_t)addr, n);
        emit_app_name[n] = 0;
    }
    if (emit_dpy && emit_win)
        XStoreName(emit_dpy, emit_win, emit_app_name);
    return 0;
}

static int64_t host_app_tone(int64_t freq, int64_t dur) {
    (void)freq;
    (void)dur;
    return 0;
}

static int64_t host_app_pump(int64_t a, int64_t b) {
    (void)a;
    (void)b;
    emit_pump(10);
    return 0;
}

/* Linux MS@ is `bl host_ms` with no arguments. It returns milliseconds. */
static int64_t host_ms_now(int64_t unused, int64_t unused2) {
    struct timespec ts;
    (void)unused;
    (void)unused2;
    if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0)
        return 0;
    return (int64_t)ts.tv_sec * 1000 + (int64_t)(ts.tv_nsec / 1000000);
}

static int64_t host_malloc(int64_t sz, int64_t unused) {
    (void)unused;
    if (sz <= 0)
        return 0;
    return (int64_t)(uintptr_t)malloc((size_t)sz);
}

static int64_t host_free(int64_t ptr, int64_t unused) {
    (void)unused;
    free((void *)(uintptr_t)ptr);
    return 0;
}

__attribute__((noinline, optimize("O0")))
static int64_t host_bi_mul_slot(int64_t a, int64_t b) {
    int64_t r;
    __asm__ volatile("mov %0, x2" : "=r"(r));
    emit_bi_mul(a, b, r);
    return 0;
}

__attribute__((noinline, optimize("O0")))
static int64_t host_bi_divmod_slot(int64_t num, int64_t den) {
    int64_t quot, rem;
    __asm__ volatile("mov %0, x2\n\tmov %1, x3" : "=r"(quot), "=r"(rem));
    emit_bi_divmod(num, den, quot, rem);
    return 0;
}

__attribute__((noinline, optimize("O0")))
static int64_t host_bi_isqrt_slot(int64_t a, int64_t r) {
    emit_bi_isqrt(a, r);
    return 0;
}

__attribute__((noinline, optimize("O0")))
static int64_t host_app_mouse_slot(int64_t x_ptr, int64_t y_ptr) {
    int64_t buttons_ptr;
    int64_t *x = (int64_t *)(uintptr_t)x_ptr;
    int64_t *y = (int64_t *)(uintptr_t)y_ptr;
    int64_t *buttons;
    __asm__ volatile("mov %0, x2" : "=r"(buttons_ptr));
    buttons = (int64_t *)(uintptr_t)buttons_ptr;
    if (x)
        *x = emit_mouse_x;
    if (y)
        *y = emit_mouse_y;
    if (buttons)
        *buttons = emit_mouse_buttons;
    return 0;
}

static int64_t host_stub(int64_t a, int64_t b) {
    (void)a;
    (void)b;
    return 0;
}

static int64_t host_app_size_slot(int64_t cols_ptr, int64_t rows_ptr) {
    if (cols_ptr)
        *(int64_t *)(uintptr_t)cols_ptr = emit_cols;
    if (rows_ptr)
        *(int64_t *)(uintptr_t)rows_ptr = emit_rows;
    return 0;
}

static int64_t host_time_date(int64_t ptr, int64_t unused) {
    time_t now;
    struct tm tm;
    int64_t *out;
    (void)unused;
    if (!ptr)
        return -1;
    now = time(NULL);
    if (!localtime_r(&now, &tm))
        return -1;
    out = (int64_t *)(uintptr_t)ptr;
    out[0] = tm.tm_sec;
    out[1] = tm.tm_min;
    out[2] = tm.tm_hour;
    out[3] = tm.tm_mday;
    out[4] = tm.tm_mon + 1;
    out[5] = tm.tm_year + 1900;
    return 0;
}

static int64_t host_cwd_get(int64_t ptr, int64_t max) {
    char tmp[PATH_MAX];
    size_t n;
    if (!ptr || max <= 0)
        return 0;
    if (!getcwd(tmp, sizeof tmp))
        return 0;
    n = strlen(tmp);
    if (n > (size_t)max)
        n = (size_t)max;
    memcpy((void *)(uintptr_t)ptr, tmp, n);
    return (int64_t)n;
}

static int64_t host_system(int64_t cmd_ptr, int64_t len) {
    char *buf;
    int st;
    if (!cmd_ptr || len <= 0 || len > 65535)
        return -1;
    buf = (char *)malloc((size_t)len + 1);
    if (!buf)
        return -1;
    memcpy(buf, (const void *)(uintptr_t)cmd_ptr, (size_t)len);
    buf[len] = '\0';
    st = system(buf);
    free(buf);
    if (st < 0)
        return -1;
    if (WIFEXITED(st))
        return (int64_t)WEXITSTATUS(st);
    return -1;
}

/* Linux MS is `bl host_sleep` with the delay in milliseconds in x0. */
static int64_t host_sleep_ms(int64_t ms, int64_t unused) {
    struct timespec req;
    (void)unused;
    if (ms < 0)
        ms = 0;
    req.tv_sec = (time_t)(ms / 1000);
    req.tv_nsec = (long)((ms % 1000) * 1000000);
    while (nanosleep(&req, &req) != 0) {
        if (errno != EINTR)
            break;
    }
    return 0;
}

static emit_host_fn host_fn[33] = {
    host_app_open,
    host_app_close,
    host_app_blit,
    host_app_pblit,
    host_app_keyq,
    host_app_key,
    host_app_name,
    host_app_tone,
    host_app_pump,
    host_ms_now,
    host_malloc,
    host_free,
    host_bi_mul_slot,
    host_bi_divmod_slot,
    host_bi_isqrt_slot,
    host_app_mouse_slot,
    host_app_cblit_slot,
    host_stub,
    host_stub,
    host_stub,
    host_stub,
    host_stub,
    host_stub,
    host_stub,
    host_stub,
    host_stub,
    host_app_size_slot,
    host_time_date,
    host_stub,
    host_stub,
    host_cwd_get,
    host_system,
    host_sleep_ms
};

static void __attribute__((noinline)) run_itc(void *cfa, void *dsp, void *rp) {
    uint8_t *g = (uint8_t *)mmap(NULL, EMIT_PAGE, PROT_READ | PROT_WRITE,
                                 MAP_ANON | MAP_PRIVATE, -1, 0);
    uint32_t *ins;
    uint64_t retc;
    uint64_t *cfar;
    uint64_t *body;

    if (g == MAP_FAILED)
        die("gadget mmap");
    ins = (uint32_t *)g;
    ins[0] = 0xF84086FE;
    ins[1] = 0xD65F03C0;
    retc = (uint64_t)(uintptr_t)g;
    cfar = (uint64_t *)(g + 16);
    body = (uint64_t *)(g + 24);
    *cfar = retc;
    *body = (uint64_t)(uintptr_t)cfar;
    if (mprotect(g, EMIT_PAGE, PROT_READ | PROT_EXEC) != 0)
        die("gadget mprotect");
    __builtin___clear_cache((char *)g, (char *)g + 32);

    __asm__ volatile(
        "mov x19, %0\n\t"
        "mov x22, x19\n\t"
        "movz x28, #0\n\t"
        "movz x20, #0\n\t"
        "mov x23, %1\n\t"
        "mov x21, %2\n\t"
        "adr x30, 1f\n\t"
        "str x30, [x23, #-8]!\n\t"
        "mov x0, %3\n\t"
        "str x0, [x23, #-8]!\n\t"
        "add x19, x21, #8\n\t"
        "ldr x21, [x19], #8\n\t"
        "ldr x1, [x21]\n\t"
        "br x1\n\t"
        "1:\n\t"
        :
        : "r"(dsp), "r"(rp), "r"(cfa), "r"(body)
        : "x0", "x1", "x2", "x3", "x16", "x17",
          "x19", "x20", "x21", "x22", "x23", "x28", "x30", "memory");
}

int main(int argc, char **argv) {
    const char *path = NULL;
    char img_buf[PATH_MAX];
    FILE *f;
    long flen;
    uint8_t *file;
    uint64_t code_len, data_len, entry_off, reloc_n, code_base, data_base;
    const uint8_t *rel;
    uint64_t host_bytes, ptr_n, need;
    uint32_t code_bytes, data_bytes, total;
    uint8_t *buf;
    uint8_t *data;
    const uint8_t *ptrs;
    uint64_t i;
    void *dsp;
    void *rp;
    void *cfa;
    int argi;

    for (argi = 1; argi < argc; argi++) {
        if (strcmp(argv[argi], "--headless") == 0)
            emit_headless = 1;
        else if (argv[argi][0] != '-' && !path)
            path = argv[argi];
    }
    if (!path) {
        if (resolve_default_img(img_buf, sizeof img_buf) != 0) {
            fprintf(stderr, "usage: %s image.img\n", argv[0]);
            return 2;
        }
        path = img_buf;
    }
    f = fopen(path, "rb");
    if (!f)
        die("open image");
    if (fseek(f, 0, SEEK_END) != 0)
        die("seek");
    flen = ftell(f);
    if (flen < (long)EMIT_HDR)
        die("image too small");
    rewind(f);
    file = (uint8_t *)malloc((size_t)flen);
    if (!file || fread(file, 1, (size_t)flen, f) != (size_t)flen)
        die("read");
    fclose(f);
    if (memcmp(file, "64EMIT02", 8) != 0)
        die("bad magic");
    code_len = rd_u64(file + 16);
    data_len = rd_u64(file + 24);
    entry_off = rd_u64(file + 32);
    reloc_n = rd_u64(file + 40);
    code_base = rd_u64(file + 48);
    data_base = rd_u64(file + 56);
    rel = file + EMIT_HDR + code_len + data_len;
    host_bytes = reloc_n * 8;
    if ((uint64_t)flen < EMIT_HDR + code_len + data_len + host_bytes + 8)
        die("truncated image");
    ptr_n = rd_u64(rel + host_bytes);
    need = EMIT_HDR + code_len + data_len + host_bytes + 8 + ptr_n * 8;
    if ((uint64_t)flen < need)
        die("truncated image (ptr)");
    code_bytes = (uint32_t)((code_len + EMIT_PAGE - 1) & ~(uint64_t)(EMIT_PAGE - 1));
    data_bytes = (uint32_t)((data_len + EMIT_PAGE - 1) & ~(uint64_t)(EMIT_PAGE - 1));
    if (data_bytes < EMIT_PAGE)
        data_bytes = EMIT_PAGE;
    total = code_bytes + data_bytes + EMIT_STACK_BYTES;
    buf = (uint8_t *)mmap(NULL, total, PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
    if (buf == MAP_FAILED)
        die("mmap");
    memcpy(buf, file + EMIT_HDR, (size_t)code_len);
    g_code = buf;
    g_code_len = code_len;
    data = buf + code_bytes;
    if (data_len)
        memcpy(data, file + EMIT_HDR + code_len, (size_t)data_len);
    ptrs = rel + host_bytes + 8;
    for (i = 0; i < ptr_n; i++) {
        uint32_t off = rd_u32(ptrs + i * 8);
        uint32_t spc = rd_u32(ptrs + i * 8 + 4);
        uint8_t *cell = spc ? (data + off) : (buf + off);
        if (spc) {
            if (off + 8 > data_len)
                die("ptr data off");
        } else if (off + 8 > code_len) {
            die("ptr code off");
        }
        rebase_cell(cell, code_base, code_len, data_base, data_len, buf, data);
    }
    for (i = 0; i < reloc_n; i++) {
        uint32_t off = rd_u32(rel + i * 8);
        uint32_t slot = rd_u32(rel + i * 8 + 4);
        uint64_t fn;
        if (off + 8 > code_len)
            die("reloc off");
        if (slot >= 33 || !host_fn[slot])
            die("reloc slot");
        fn = (uint64_t)(uintptr_t)host_fn[slot];
        memcpy(buf + off, &fn, 8);
    }
    if (mprotect(buf, code_bytes, PROT_READ | PROT_EXEC) != 0)
        die("mprotect");
    __builtin___clear_cache((char *)buf, (char *)buf + code_bytes);
    dsp = buf + total - 64;
    rp = (uint8_t *)dsp - EMIT_RP_BYTES;
    cfa = buf + entry_off;
    run_itc(cfa, dsp, rp);
    return 0;
}
