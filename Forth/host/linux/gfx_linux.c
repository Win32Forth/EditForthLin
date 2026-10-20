/* Public domain.
   GRAPHICS / APP host stubs for EditForthLin.
   Return failure / no-op until an X11 or Qt helper lands. */

#include <stdint.h>
#include <stddef.h>

void host_set_headless(int on)
{
    (void)on;
}

long long host_app_open(long long cols, long long rows)
{
    (void)cols;
    (void)rows;
    return -1; /* ior: 0 open ok, -1 failed (Windows host convention) */
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
