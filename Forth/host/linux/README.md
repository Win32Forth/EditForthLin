# Linux host stubs

Windows implementations remain in `Forth/host/*_win.c`, `main.c`, and
`companion.c` as the behavioural reference (same pattern as EditForthAnd
keeping the Windows host in-tree).

| Stub | Port from | First milestone |
| --- | --- | --- |
| `main_linux.c` | `main.c` | user tree, INCLUDE paths, SYSTEM |
| `console_linux.c` | `console_win.c` | `--agent` argv, help text |
| `companion_linux.c` | `companion.c` | Unix socket server + JSON frames |
| `float_linux.c` | `float_win.c` | IEEE stack host slots |
| `exec_linux.c` | `exec_win.c` | mmap / mprotect |
| `facility_linux.c` | `facility_win.c` | PAGE / AT-XY stubs; clipboard later |
| `gfx_linux.c` | `gfx_win.c` | stub returns until GRAPHICS lands |
| `debug_linux.c` | `debug_win.c` | debug JSON notify |
| `bigint.c` | `../bigint.c` | link the shared file |

Do not `#include <windows.h>` here. Prefer POSIX + thin Qt-free C.
