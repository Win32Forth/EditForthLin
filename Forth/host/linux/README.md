# Linux host (EditForthLin)

POSIX host for `forthx64` and `fortharm64`. The C sources are shared. The x64 kernel is NASM / System V. The arm64 kernel is native AArch64.

| File | Role |
| --- | --- |
| `console_linux.c` | `main`: `--agent` and `--companion` |
| `companion_linux.c` | AF_UNIX length-prefixed JSON (matches Qt `QLocalSocket`) |
| `main_linux.c` | Files, paths, FROMLIB, SYSTEM, seed `~/Documents/EditForthLin`, `sa_win_*` |
| `float_linux.c` | Soft IEEE float stack |
| `exec_linux.c` | `mmap` / `mprotect` / `__builtin___clear_cache` |
| `facility_linux.c` | PAGE / AT-XY grid; clipboard stub |
| `debug_linux.c` | Debug JSON paint for the editor |
| `gfx_linux.c` | GRAPHICS stubs (return failure) |
| `bigint.c` | Shared big-integer helpers |

Windows `Forth/host/*_win.c` / `main.c` / `companion.c` stay as reference.

Socket name with no `/` binds as `$TMPDIR/<name>` (default `/tmp/<name>`), matching Qt `QLocalSocket`.
