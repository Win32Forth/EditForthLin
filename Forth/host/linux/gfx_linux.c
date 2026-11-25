/* Public domain.
   GRAPHICS window for EditForthLin. X11, same calls as the Windows host.
   Pixel rows are top-down BGRA. Mouse y is the Forth bottom-left origin.
   Arrow keys are 200/205/208/203. Shift is 256, Control 512, Alt 1024. */

#if !defined(_DEFAULT_SOURCE) && !defined(_POSIX_C_SOURCE)
#define _DEFAULT_SOURCE
#endif

#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if !defined(__linux__)

void host_set_headless(int on)
{
    (void)on;
}

long long host_app_open(long long cols, long long rows)
{
    (void)cols;
    (void)rows;
    return -1;
}

void host_app_close(void) {}

void host_app_blit(const void *addr, long long nbytes)
{
    (void)addr;
    (void)nbytes;
}

void host_app_cblit(const void *addr, long long nbytes, long long depth)
{
    (void)addr;
    (void)nbytes;
    (void)depth;
}

void host_app_pblit(const void *addr, long long nbytes)
{
    (void)addr;
    (void)nbytes;
}

long long host_app_keyq(void) { return 0; }

long long host_app_key(void) { return -1; }

void host_app_name(const void *addr, long long nbytes)
{
    (void)addr;
    (void)nbytes;
}

void host_app_tone(long long freq, long long dur)
{
    (void)freq;
    (void)dur;
}

void host_app_pump(void) {}

void host_app_mouse(long long *x, long long *y, long long *buttons)
{
    if (x)
        *x = 0;
    if (y)
        *y = 0;
    if (buttons)
        *buttons = 0;
}

long long host_app_size(long long *cols, long long *rows)
{
    if (cols)
        *cols = 0;
    if (rows)
        *rows = 0;
    return 0;
}

long long host_app_img_choose(void) { return -1; }

long long host_app_img_load(const void *path, long long nbytes)
{
    (void)path;
    (void)nbytes;
    return -1;
}

void host_app_img_size(long long *w, long long *h)
{
    if (w)
        *w = 0;
    if (h)
        *h = 0;
}

long long host_app_img_render(void *dest, long long dest_w, long long dest_h,
                              long long x, long long y, long long w, long long h)
{
    (void)dest;
    (void)dest_w;
    (void)dest_h;
    (void)x;
    (void)y;
    (void)w;
    (void)h;
    return -1;
}

long long host_app_file_choose(void) { return -1; }

long long host_app_file_save_as(void) { return -1; }

long long host_app_file_save_picture(void) { return -1; }

long long host_app_file_path(void *dest, long long max)
{
    (void)dest;
    (void)max;
    return -1;
}

long long host_app_file_slurp(void *dest, long long max, long long *out_n)
{
    (void)dest;
    (void)max;
    if (out_n)
        *out_n = 0;
    return -1;
}

long long host_app_file_spew(const void *src, long long nbytes)
{
    (void)src;
    (void)nbytes;
    return -1;
}

long long host_oop_call(long long a, long long b, long long c, long long d, long long op)
{
    (void)a;
    (void)b;
    (void)c;
    (void)d;
    (void)op;
    return -1;
}

#else

#include <errno.h>
#include <pthread.h>
#include <spawn.h>
#include <strings.h>
#include <sys/select.h>
#include <sys/wait.h>
#include <unistd.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

extern char **environ;

#define GFX_COLS_MAX 384
#define GFX_ROWS_MAX 192
#define GFX_CELL_MAX (GFX_COLS_MAX * GFX_ROWS_MAX)
#define GFX_PIX_MAX (36 * 1024 * 1024)
#define KEY_MAX 64

static pthread_mutex_t g_mu = PTHREAD_MUTEX_INITIALIZER;
static int g_xinit;
static int g_headless;
static int g_opened;
static int g_cols = 80;
static int g_rows = 25;
static unsigned char g_cells[GFX_CELL_MAX];
static unsigned char *g_pix;
static int g_pix_w;
static int g_pix_h;
static int g_has_pix;
static long long g_keys[KEY_MAX];
static int g_key_n;
static long long g_mouse_x;
static long long g_mouse_y;
static long long g_mouse_b;
static long long g_pend_cols;
static long long g_pend_rows;
static int g_size_dirty;
static uint32_t g_pal[256];
static int g_pal_ready;
static char g_title[256] = "EditForthLin Graphics";
static char g_staged[1024];
static Display *g_dpy;
static Window g_win;
static GC g_gc;
static XFontStruct *g_font;
static XImage *g_ximg;
static Atom g_wm_delete;

static int x_error(Display *dpy, XErrorEvent *ev)
{
    char buf[160];

    XGetErrorText(dpy, ev->error_code, buf, (int)sizeof buf);
    fprintf(stderr, "EditForthLin graphics: %s\n", buf);
    return 0;
}

static void palette_init(void)
{
    int i;
    int idx;
    int r;
    int g;
    int b;
    static const unsigned char rgb16[16][3] = {
        {0, 0, 0}, {0, 0, 170}, {0, 170, 0}, {0, 170, 170},
        {170, 0, 0}, {170, 0, 170}, {170, 85, 0}, {170, 170, 170},
        {85, 85, 85}, {85, 85, 255}, {85, 255, 85}, {85, 255, 255},
        {255, 85, 85}, {255, 85, 255}, {255, 255, 85}, {255, 255, 255}
    };

    if (g_pal_ready)
        return;
    for (i = 0; i < 16; i++) {
        g_pal[i] = (uint32_t)rgb16[i][2]
            | ((uint32_t)rgb16[i][1] << 8)
            | ((uint32_t)rgb16[i][0] << 16)
            | 0xFF000000u;
    }
    idx = 16;
    for (r = 0; r < 6; r++) {
        for (g = 0; g < 6; g++) {
            for (b = 0; b < 6; b++) {
                g_pal[idx++] = (uint32_t)(b * 51)
                    | ((uint32_t)(g * 51) << 8)
                    | ((uint32_t)(r * 51) << 16)
                    | 0xFF000000u;
            }
        }
    }
    for (i = 0; i < 24; i++) {
        unsigned v = (unsigned)(8 + i * 10);
        if (v > 255)
            v = 255;
        g_pal[232 + i] = v | (v << 8) | (v << 16) | 0xFF000000u;
    }
    g_pal_ready = 1;
}

static void push_key(long long c)
{
    if (g_key_n < KEY_MAX)
        g_keys[g_key_n++] = c;
}

static long long take_key(void)
{
    long long c;
    int i;

    if (g_key_n <= 0)
        return -1;
    c = g_keys[0];
    for (i = 1; i < g_key_n; i++)
        g_keys[i - 1] = g_keys[i];
    g_key_n--;
    return c;
}

static void drop_image(void)
{
    if (g_ximg == NULL)
        return;
    g_ximg->data = NULL;
    XDestroyImage(g_ximg);
    g_ximg = NULL;
}

static int ensure_display(void)
{
    if (!g_xinit) {
        XInitThreads();
        g_xinit = 1;
    }
    if (g_dpy != NULL)
        return 1;
    XSetErrorHandler(x_error);
    g_dpy = XOpenDisplay(NULL);
    if (g_dpy == NULL)
        return 0;
    g_wm_delete = XInternAtom(g_dpy, "WM_DELETE_WINDOW", False);
    return 1;
}

static void ensure_font(void)
{
    int ascent;

    if (g_dpy == NULL || g_gc == 0 || g_font != NULL)
        return;
    g_font = XLoadQueryFont(g_dpy,
        "-misc-fixed-medium-r-normal--13-120-75-75-c-80-iso8859-1");
    if (g_font == NULL)
        g_font = XLoadQueryFont(g_dpy, "fixed");
    if (g_font == NULL)
        return;
    ascent = g_font->ascent;
    if (ascent < 1 || ascent > 16)
        g_font->ascent = ascent < 1 ? 12 : 16;
    XSetFont(g_dpy, g_gc, g_font->fid);
}

static void draw_cells(void)
{
    int col;
    int row;
    int ascent;
    unsigned long last = 0xFFFFFFFFUL;

    if (g_dpy == NULL || g_gc == 0 || g_cols < 1 || g_rows < 1)
        return;
    ensure_font();
    if (g_font == NULL)
        return;
    ascent = g_font->ascent;
    for (row = 0; row < g_rows; row++) {
        for (col = 0; col < g_cols; col++) {
            unsigned char ch = g_cells[row * g_cols + col];
            char s[2];

            if (ch <= 32 || ch > 126)
                continue;
            if (last != 0xB2FFB2UL) {
                XSetForeground(g_dpy, g_gc, 0xB2FFB2UL);
                last = 0xB2FFB2UL;
            }
            s[0] = (char)ch;
            s[1] = 0;
            XDrawString(g_dpy, g_win, g_gc, col * 8, row * 16 + ascent, s, 1);
        }
    }
}

static void present(void)
{
    int w;
    int h;

    if (g_dpy == NULL || g_win == 0 || !g_opened)
        return;
    if (g_has_pix && g_pix != NULL && g_pix_w > 0 && g_pix_h > 0) {
        w = g_pix_w;
        h = g_pix_h;
        if (g_ximg == NULL || g_ximg->width != w || g_ximg->height != h) {
            drop_image();
            g_ximg = XCreateImage(g_dpy, DefaultVisual(g_dpy, DefaultScreen(g_dpy)),
                                  24, ZPixmap, 0, (char *)g_pix,
                                  (unsigned)w, (unsigned)h, 32, 0);
            if (g_ximg != NULL) {
                g_ximg->byte_order = LSBFirst;
                g_ximg->bitmap_bit_order = LSBFirst;
            }
        } else {
            g_ximg->data = (char *)g_pix;
        }
        if (g_ximg != NULL)
            XPutImage(g_dpy, g_win, g_gc, g_ximg, 0, 0, 0, 0, (unsigned)w, (unsigned)h);
    } else {
        XSetForeground(g_dpy, g_gc, BlackPixel(g_dpy, DefaultScreen(g_dpy)));
        XFillRectangle(g_dpy, g_win, g_gc, 0, 0,
                       (unsigned)(g_cols * 8), (unsigned)(g_rows * 16));
    }
    draw_cells();
    XFlush(g_dpy);
}

static void note_mouse(int x, int y, unsigned state)
{
    Window root = 0;
    int wx = 0;
    int wy = 0;
    unsigned ww = 1;
    unsigned wh = 1;
    unsigned border = 0;
    unsigned depth = 0;
    int pw;
    int ph;
    long long px;
    long long py;
    long long buttons = 0;

    if (g_dpy != NULL && g_win != 0)
        XGetGeometry(g_dpy, g_win, &root, &wx, &wy, &ww, &wh, &border, &depth);
    pw = g_has_pix ? g_pix_w : g_cols * 8;
    ph = g_has_pix ? g_pix_h : g_rows * 16;
    if (pw < 1)
        pw = 1;
    if (ph < 1)
        ph = 1;
    if (ww < 1)
        ww = 1;
    if (wh < 1)
        wh = 1;
    if (x < 0)
        x = 0;
    if (y < 0)
        y = 0;
    px = (long long)x * pw / (long long)ww;
    py = (long long)ph - 1 - ((long long)y * ph / (long long)wh);
    if (px < 0)
        px = 0;
    if (py < 0)
        py = 0;
    if (px >= pw)
        px = pw - 1;
    if (py >= ph)
        py = ph - 1;
    if (state & Button1Mask)
        buttons |= 1;
    if (state & Button3Mask)
        buttons |= 2;
    if (state & Button2Mask)
        buttons |= 4;
    if (buttons != 0 && (state & Mod1Mask))
        buttons |= 1024;
    g_mouse_x = px;
    g_mouse_y = py;
    g_mouse_b = buttons;
}

static int nav_code(KeySym sym)
{
    switch (sym) {
    case XK_Up: return 200;
    case XK_Prior: return 201;
    case XK_Left: return 203;
    case XK_Right: return 205;
    case XK_End: return 207;
    case XK_Down: return 208;
    case XK_Next: return 209;
    case XK_Home: return 199;
    default: return 0;
    }
}

static void on_key(XKeyEvent *ev)
{
    KeySym sym;
    char buf[8];
    int n;
    int nav;
    long long mods = 0;
    long long ch;
    int shift = (ev->state & ShiftMask) != 0;
    int ctrl = (ev->state & ControlMask) != 0;
    int alt = (ev->state & Mod1Mask) != 0;

    sym = XLookupKeysym(ev, 0);
    if (sym == XK_Escape) {
        push_key(27);
        return;
    }
    nav = nav_code(sym);
    if (nav != 0) {
        if (shift)
            mods |= 256;
        if (ctrl)
            mods |= 512;
        if (alt)
            mods |= 1024;
        push_key(mods != 0 ? ((long long)nav | mods) : nav);
        return;
    }
    n = XLookupString(ev, buf, (int)sizeof buf, &sym, NULL);
    if (n <= 0)
        return;
    ch = (unsigned char)buf[0];
    if (ch == 27)
        return;
    if (ch <= 0 || ch >= 128)
        return;
    if (ctrl && ch >= 1 && ch <= 26 && sym != XK_BackSpace && sym != XK_Tab
        && sym != XK_Return && sym != XK_KP_Enter) {
        mods = 512;
        if (shift)
            mods |= 256;
        if (alt)
            mods |= 1024;
        push_key((long long)('a' + (int)ch - 1) | mods);
        return;
    }
    if (ctrl)
        mods |= 512;
    if (alt)
        mods |= 1024;
    if (ch == 9 || ((ctrl || alt) && shift))
        mods |= 256;
    push_key(mods != 0 ? (ch | mods) : ch);
}

static void on_configure(XConfigureEvent *ev)
{
    int c = ev->width / 8;
    int r = ev->height / 16;

    if (c < 40)
        c = 40;
    if (r < 12)
        r = 12;
    if (c > GFX_COLS_MAX)
        c = GFX_COLS_MAX;
    if (r > GFX_ROWS_MAX)
        r = GFX_ROWS_MAX;
    if (c == g_cols && r == g_rows)
        return;
    g_pend_cols = c;
    g_pend_rows = r;
    g_size_dirty = 1;
}

static void dispatch(XEvent *ev)
{
    if (ev->type == ClientMessage &&
        (Atom)ev->xclient.data.l[0] == g_wm_delete) {
        push_key(27);
        return;
    }
    if (ev->type == ConfigureNotify) {
        on_configure(&ev->xconfigure);
        return;
    }
    if (ev->type == Expose && ev->xexpose.count == 0) {
        present();
        return;
    }
    if (ev->type == MapNotify && g_win != 0) {
        XSetInputFocus(g_dpy, g_win, RevertToParent, CurrentTime);
        return;
    }
    if (ev->type == KeyPress) {
        on_key(&ev->xkey);
        return;
    }
    if (ev->type == ButtonPress &&
        (ev->xbutton.button == 4 || ev->xbutton.button == 5)) {
        push_key(ev->xbutton.button == 4 ? 210 : 211);
        return;
    }
    if (ev->type == MotionNotify || ev->type == ButtonPress || ev->type == ButtonRelease)
        note_mouse(ev->xbutton.x, ev->xbutton.y, ev->xbutton.state);
}

static void pump(int timeout_ms)
{
    XEvent ev;
    int fd;
    fd_set fds;
    struct timeval tv;
    int ready;

    if (g_dpy == NULL)
        return;
    while (XPending(g_dpy)) {
        XNextEvent(g_dpy, &ev);
        dispatch(&ev);
    }
    if (timeout_ms <= 0)
        return;
    fd = ConnectionNumber(g_dpy);
    FD_ZERO(&fds);
    FD_SET(fd, &fds);
    tv.tv_sec = timeout_ms / 1000;
    tv.tv_usec = (timeout_ms % 1000) * 1000;
    ready = select(fd + 1, &fds, NULL, NULL, &tv);
    if (ready > 0) {
        while (XPending(g_dpy)) {
            XNextEvent(g_dpy, &ev);
            dispatch(&ev);
        }
    }
}

static void query_mouse(void)
{
    Window root;
    Window child;
    int rx;
    int ry;
    int wx;
    int wy;
    unsigned mask;

    if (g_dpy == NULL || g_win == 0)
        return;
    if (XQueryPointer(g_dpy, g_win, &root, &child, &rx, &ry, &wx, &wy, &mask))
        note_mouse(wx, wy, mask);
}

static void expand_pixels(const unsigned char *src, int n, int depth, int w, int h)
{
    int need;
    int stride;
    int x;
    int y;
    int i;
    unsigned char *dst;
    const unsigned char *row;

    if (depth == 8) {
        stride = w;
        need = w * h;
    } else if (depth == 32) {
        stride = w * 4;
        need = w * h * 4;
    } else {
        depth = 1;
        stride = (w + 7) / 8;
        need = stride * h;
    }
    if (need <= 0 || need > GFX_PIX_MAX)
        return;
    dst = (unsigned char *)malloc((size_t)w * (size_t)h * 4u);
    if (dst == NULL)
        return;
    if (n > need)
        n = need;
    if (depth == 32) {
        memset(dst, 0, (size_t)w * (size_t)h * 4u);
        if (n > 0)
            memcpy(dst, src, (size_t)n);
        for (i = 3; i < w * h * 4; i += 4) {
            if (dst[i] == 0)
                dst[i] = 255;
        }
    } else if (depth == 8) {
        palette_init();
        for (i = 0; i < w * h; i++) {
            uint32_t c = 0xFF000000u;
            if (i < n)
                c = g_pal[src[i]];
            dst[i * 4] = (unsigned char)(c & 255);
            dst[i * 4 + 1] = (unsigned char)((c >> 8) & 255);
            dst[i * 4 + 2] = (unsigned char)((c >> 16) & 255);
            dst[i * 4 + 3] = 255;
        }
    } else {
        memset(dst, 0, (size_t)w * (size_t)h * 4u);
        for (y = 0; y < h; y++) {
            row = src + y * stride;
            for (x = 0; x < w; x++) {
                int on = 0;
                int o = (y * w + x) * 4;
                if (y * stride + (x >> 3) < n)
                    on = (row[x >> 3] & (1 << (x & 7))) != 0;
                if (on) {
                    dst[o] = 178;
                    dst[o + 1] = 255;
                    dst[o + 2] = 178;
                    dst[o + 3] = 255;
                }
            }
        }
    }
    drop_image();
    free(g_pix);
    g_pix = dst;
    g_pix_w = w;
    g_pix_h = h;
    g_has_pix = 1;
}

void host_set_headless(int on)
{
    pthread_mutex_lock(&g_mu);
    g_headless = on ? 1 : 0;
    pthread_mutex_unlock(&g_mu);
}

long long host_app_open(long long cols, long long rows)
{
    int c = (int)cols;
    int r = (int)rows;
    int sw;
    int sh;
    long long ior = -1;
    XSetWindowAttributes attr;

    pthread_mutex_lock(&g_mu);
    if (g_headless)
        goto done;
    if (c < 1)
        c = 80;
    if (r < 1)
        r = 25;
    if (c > GFX_COLS_MAX)
        c = GFX_COLS_MAX;
    if (r > GFX_ROWS_MAX)
        r = GFX_ROWS_MAX;
    if (!ensure_display())
        goto done;
    g_cols = c;
    g_rows = r;
    memset(g_cells, ' ', (size_t)g_cols * (size_t)g_rows);
    g_has_pix = 0;
    drop_image();
    free(g_pix);
    g_pix = NULL;
    g_mouse_x = 0;
    g_mouse_y = 0;
    g_mouse_b = 0;
    g_size_dirty = 0;
    g_key_n = 0;
    sw = g_cols * 8;
    sh = g_rows * 16;
    if (g_win == 0) {
        memset(&attr, 0, sizeof attr);
        attr.background_pixel = BlackPixel(g_dpy, DefaultScreen(g_dpy));
        attr.event_mask = KeyPressMask | ButtonPressMask | ButtonReleaseMask
            | PointerMotionMask | ExposureMask | StructureNotifyMask;
        g_win = XCreateWindow(g_dpy, DefaultRootWindow(g_dpy),
                              80, 80, (unsigned)sw, (unsigned)sh, 0,
                              CopyFromParent, InputOutput, CopyFromParent,
                              CWBackPixel | CWEventMask, &attr);
        if (g_win == 0)
            goto done;
        XSetWMProtocols(g_dpy, g_win, &g_wm_delete, 1);
        g_gc = XCreateGC(g_dpy, g_win, 0, NULL);
    } else {
        XResizeWindow(g_dpy, g_win, (unsigned)sw, (unsigned)sh);
    }
    XStoreName(g_dpy, g_win, g_title);
    XMapRaised(g_dpy, g_win);
    XFlush(g_dpy);
    g_opened = 1;
    pump(50);
    present();
    ior = 0;
done:
    pthread_mutex_unlock(&g_mu);
    return ior;
}

void host_app_close(void)
{
    pthread_mutex_lock(&g_mu);
    g_opened = 0;
    g_has_pix = 0;
    drop_image();
    free(g_pix);
    g_pix = NULL;
    if (g_dpy != NULL && g_win != 0) {
        XUnmapWindow(g_dpy, g_win);
        XFlush(g_dpy);
    }
    push_key(27);
    pthread_mutex_unlock(&g_mu);
}

void host_app_blit(const void *addr, long long nbytes)
{
    int need;

    if (addr == NULL || nbytes < 0)
        return;
    pthread_mutex_lock(&g_mu);
    if (!g_opened || g_cols < 1 || g_rows < 1) {
        pthread_mutex_unlock(&g_mu);
        return;
    }
    need = g_cols * g_rows;
    if (nbytes < need)
        need = (int)nbytes;
    if (need > 0)
        memcpy(g_cells, addr, (size_t)need);
    present();
    pthread_mutex_unlock(&g_mu);
}

void host_app_cblit(const void *addr, long long nbytes, long long depth)
{
    int w;
    int h;
    int d;

    if (addr == NULL || nbytes <= 0)
        return;
    pthread_mutex_lock(&g_mu);
    if (!g_opened) {
        pthread_mutex_unlock(&g_mu);
        return;
    }
    w = g_cols * 8;
    h = g_rows * 16;
    if (w < 1 || h < 1) {
        pthread_mutex_unlock(&g_mu);
        return;
    }
    d = (int)depth;
    if (d != 8 && d != 32)
        d = 1;
    expand_pixels((const unsigned char *)addr, (int)nbytes, d, w, h);
    present();
    pthread_mutex_unlock(&g_mu);
}

void host_app_pblit(const void *addr, long long nbytes)
{
    host_app_cblit(addr, nbytes, 1);
}

long long host_app_keyq(void)
{
    int n;

    pthread_mutex_lock(&g_mu);
    if (g_opened)
        pump(1);
    n = g_key_n;
    pthread_mutex_unlock(&g_mu);
    return n > 0 ? -1 : 0;
}

long long host_app_key(void)
{
    int i;
    long long c;

    pthread_mutex_lock(&g_mu);
    if (!g_opened) {
        pthread_mutex_unlock(&g_mu);
        return 27;
    }
    c = take_key();
    if (c >= 0) {
        pthread_mutex_unlock(&g_mu);
        return c;
    }
    for (i = 0; i < 10; i++) {
        if (!g_opened) {
            pthread_mutex_unlock(&g_mu);
            return 27;
        }
        pump(50);
        c = take_key();
        if (c >= 0) {
            pthread_mutex_unlock(&g_mu);
            return c;
        }
    }
    pthread_mutex_unlock(&g_mu);
    return -1;
}

void host_app_name(const void *addr, long long nbytes)
{
    int n = 0;

    pthread_mutex_lock(&g_mu);
    if (addr != NULL && nbytes > 0) {
        if (nbytes > 255)
            nbytes = 255;
        memcpy(g_title, addr, (size_t)nbytes);
        n = (int)nbytes;
    }
    g_title[n] = 0;
    if (n == 0)
        snprintf(g_title, sizeof g_title, "EditForthLin Graphics");
    if (g_dpy != NULL && g_win != 0) {
        XStoreName(g_dpy, g_win, g_title);
        XFlush(g_dpy);
    }
    pthread_mutex_unlock(&g_mu);
}

void host_app_tone(long long freq, long long dur)
{
    (void)freq;
    (void)dur;
}

void host_app_pump(void)
{
    pthread_mutex_lock(&g_mu);
    if (g_opened)
        pump(10);
    pthread_mutex_unlock(&g_mu);
}

void host_app_mouse(long long *x, long long *y, long long *buttons)
{
    pthread_mutex_lock(&g_mu);
    if (g_opened) {
        pump(0);
        query_mouse();
    }
    if (!g_opened) {
        if (x != NULL)
            *x = 0;
        if (y != NULL)
            *y = 0;
        if (buttons != NULL)
            *buttons = 0;
    } else {
        if (x != NULL)
            *x = g_mouse_x;
        if (y != NULL)
            *y = g_mouse_y;
        if (buttons != NULL)
            *buttons = g_mouse_b;
    }
    pthread_mutex_unlock(&g_mu);
}

long long host_app_size(long long *cols, long long *rows)
{
    long long flag = 0;

    pthread_mutex_lock(&g_mu);
    if (g_opened)
        pump(0);
    if (cols != NULL)
        *cols = g_pend_cols;
    if (rows != NULL)
        *rows = g_pend_rows;
    if (g_size_dirty) {
        g_size_dirty = 0;
        flag = -1;
    }
    pthread_mutex_unlock(&g_mu);
    return flag;
}

/* 1 PNG, 2 JPEG, 3 TIFF, 0 anything else. Same codes as the Windows dialog. */
static int picture_kind(const char *path)
{
    const char *base;
    const char *s;
    const char *dot;

    if (path == NULL)
        return 0;
    base = path;
    for (s = path; *s != '\0'; s++) {
        if (*s == '/')
            base = s + 1;
    }
    dot = strrchr(base, '.');
    if (dot == NULL || dot == base || dot[1] == '\0')
        return 0;
    if (strcasecmp(dot, ".png") == 0)
        return 1;
    if (strcasecmp(dot, ".jpg") == 0 || strcasecmp(dot, ".jpeg") == 0)
        return 2;
    if (strcasecmp(dot, ".tif") == 0 || strcasecmp(dot, ".tiff") == 0)
        return 3;
    return 0;
}

/* A name with no picture suffix becomes PNG, the first filter. */
static void picture_force_png(char *path, size_t cap)
{
    char *base;
    char *s;
    char *dot;
    size_t n;

    if (path == NULL || cap < 8 || picture_kind(path) != 0)
        return;
    base = path;
    for (s = path; *s != '\0'; s++) {
        if (*s == '/')
            base = s + 1;
    }
    dot = strrchr(base, '.');
    if (dot != NULL && dot != base)
        *dot = '\0';
    n = strlen(path);
    if (n + 4 >= cap)
        return;
    memcpy(path + n, ".png", 5);
}

static void pictures_dir(char *dir, size_t cap)
{
    char cfg[1024];
    char line[1024];
    const char *home;
    FILE *fp;

    dir[0] = '\0';
    home = getenv("HOME");
    if (home == NULL || home[0] == '\0' || cap < 2)
        return;
    snprintf(cfg, sizeof cfg, "%s/.config/user-dirs.dirs", home);
    fp = fopen(cfg, "r");
    if (fp != NULL) {
        while (fgets(line, sizeof line, fp) != NULL) {
            char *p;
            char *end;

            if (strncmp(line, "XDG_PICTURES_DIR=", 17) != 0)
                continue;
            p = strchr(line, '"');
            if (p == NULL)
                break;
            p++;
            end = strchr(p, '"');
            if (end != NULL)
                *end = '\0';
            if (strncmp(p, "$HOME", 5) == 0)
                snprintf(dir, cap, "%s%s", home, p + 5);
            else
                snprintf(dir, cap, "%s", p);
            break;
        }
        fclose(fp);
    }
    if (dir[0] == '\0')
        snprintf(dir, cap, "%s/Pictures", home);
    if (access(dir, W_OK) != 0) {
        if (getcwd(dir, cap) == NULL)
            dir[0] = '\0';
    }
}

/* A picture extension keeps that path. Anything else suggests Julia.png. */
static void picture_suggest(char *dst, size_t cap)
{
    char dir[1024];
    char staged[1024];

    pictures_dir(dir, sizeof dir);
    pthread_mutex_lock(&g_mu);
    snprintf(staged, sizeof staged, "%s", g_staged);
    pthread_mutex_unlock(&g_mu);
    if (picture_kind(staged) != 0) {
        snprintf(dst, cap, "%s", staged);
        return;
    }
    if (dir[0] == '\0')
        snprintf(dst, cap, "Julia.png");
    else
        snprintf(dst, cap, "%s/Julia.png", dir);
}

/* 0 ok, -1 cancel, -2 the dialog could not run. */
static int zenity_save_picture(char *dst, size_t cap, const char *suggest, int xfd)
{
    int pipefd[2];
    pid_t pid = -1;
    posix_spawn_file_actions_t actions;
    char filename_arg[1200];
    char *argv[12];
    size_t got = 0;
    int status = 0;
    int rc;

    if (dst == NULL || cap < 2 || suggest == NULL)
        return -2;
    dst[0] = '\0';
    if (pipe(pipefd) != 0)
        return -2;
    if (snprintf(filename_arg, sizeof filename_arg, "--filename=%s", suggest) >=
        (int)sizeof filename_arg) {
        close(pipefd[0]);
        close(pipefd[1]);
        return -2;
    }
    argv[0] = "zenity";
    argv[1] = "--file-selection";
    argv[2] = "--save";
    argv[3] = "--confirm-overwrite";
    argv[4] = "--title=Save Picture";
    argv[5] = "--file-filter=PNG | *.png";
    argv[6] = "--file-filter=JPEG | *.jpg *.jpeg";
    argv[7] = "--file-filter=TIFF | *.tif *.tiff";
    argv[8] = filename_arg;
    argv[9] = NULL;

    if (posix_spawn_file_actions_init(&actions) != 0) {
        close(pipefd[0]);
        close(pipefd[1]);
        return -2;
    }
    rc = posix_spawn_file_actions_adddup2(&actions, pipefd[1], STDOUT_FILENO);
    if (rc == 0)
        rc = posix_spawn_file_actions_addclose(&actions, pipefd[0]);
    if (rc == 0 && pipefd[1] != STDOUT_FILENO)
        rc = posix_spawn_file_actions_addclose(&actions, pipefd[1]);
    if (rc == 0 && xfd > 2 && xfd != pipefd[0] && xfd != pipefd[1])
        rc = posix_spawn_file_actions_addclose(&actions, xfd);
    if (rc != 0 ||
        posix_spawnp(&pid, "zenity", &actions, NULL, argv, environ) != 0) {
        posix_spawn_file_actions_destroy(&actions);
        close(pipefd[0]);
        close(pipefd[1]);
        return -2;
    }
    posix_spawn_file_actions_destroy(&actions);
    close(pipefd[1]);
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
    if (!WIFEXITED(status))
        return -2;
    if (WEXITSTATUS(status) != 0 || got == 0)
        return -1;
    return 0;
}

long long host_app_file_save_picture(void)
{
    char suggest[1024];
    char chosen[1024];
    int xfd = -1;
    int rc;

    pthread_mutex_lock(&g_mu);
    if (g_headless) {
        pthread_mutex_unlock(&g_mu);
        return -1;
    }
    if (g_dpy != NULL)
        xfd = ConnectionNumber(g_dpy);
    pthread_mutex_unlock(&g_mu);

    picture_suggest(suggest, sizeof suggest);
    rc = zenity_save_picture(chosen, sizeof chosen, suggest, xfd);
    if (rc != 0)
        return rc;
    picture_force_png(chosen, sizeof chosen);
    if (picture_kind(chosen) == 0 || strlen(chosen) >= sizeof g_staged)
        return -2;
    pthread_mutex_lock(&g_mu);
    memcpy(g_staged, chosen, strlen(chosen) + 1);
    pthread_mutex_unlock(&g_mu);
    return 0;
}

long long host_app_file_path(void *dest, long long max)
{
    size_t n;

    if (dest == NULL || max <= 0)
        return 0;
    pthread_mutex_lock(&g_mu);
    n = strlen(g_staged);
    if (n > (size_t)max)
        n = (size_t)max;
    if (n > 0)
        memcpy(dest, g_staged, n);
    pthread_mutex_unlock(&g_mu);
    return (long long)n;
}

long long host_app_img_choose(void) { return -1; }

long long host_app_img_load(const void *path, long long nbytes)
{
    (void)path;
    (void)nbytes;
    return -1;
}

void host_app_img_size(long long *w, long long *h)
{
    if (w)
        *w = 0;
    if (h)
        *h = 0;
}

long long host_app_img_render(void *dest, long long dest_w, long long dest_h,
                              long long x, long long y, long long w, long long h)
{
    (void)dest;
    (void)dest_w;
    (void)dest_h;
    (void)x;
    (void)y;
    (void)w;
    (void)h;
    return -1;
}

long long host_app_file_choose(void) { return -1; }

long long host_app_file_save_as(void) { return -1; }

long long host_app_file_slurp(void *dest, long long max, long long *out_n)
{
    (void)dest;
    (void)max;
    if (out_n)
        *out_n = 0;
    return -1;
}

long long host_app_file_spew(const void *src, long long nbytes)
{
    (void)src;
    (void)nbytes;
    return -1;
}

long long host_oop_call(long long a, long long b, long long c, long long d, long long op)
{
    (void)a;
    (void)b;
    (void)c;
    (void)d;
    (void)op;
    return -1;
}

#endif
