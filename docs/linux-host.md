# Linux Forth host (EditForthLin)

Companion reference: Windows `Forth/host/main.c` + `companion.c` + `*_win.c`.

## Process model

Same as Windows desktop:

1. Qt editor starts.
2. Editor launches `forthx64 --companion <name>`.
3. Companion boots the kernel, runs Autoload, serves length-prefixed JSON
   frames over a **Unix domain socket** (Windows used a named pipe).
4. Editor pane owns the transcript; Forth has no separate console window in
   companion mode.

Agent mode stays `forthx64 --agent` on the launching TTY.

## Roots

| Role | Path |
| --- | --- |
| User tree | `~/Documents/EditForthLin` |
| Library | `~/Documents/EditForthLin/Library` |
| Autoload | `~/Documents/EditForthLin/AutoLoad/autoload.fth` |
| Shipped seeds | `Forth/Resources/` beside the executable (walk-up search) |

Override with `EDITFORTHLIN` (absolute path to the user tree) when set.

## Boot order

Match Windows companion:

1. `kernel_init`
2. Product banner (`=== EditForthLin … ===`)
3. Autoload (`AutoLoad/autoload.fth` then `[DEFINED] MAIN [IF] MAIN [THEN]`)
4. Interactive eval loop on the socket

## IPC frame format

Unchanged from Windows companion:

- 4-byte little-endian length + UTF-8 JSON body
- Ops: `out`, `cwd`, `edit`, `debug`, `breaks`, `last`, `err`, eval requests, keys

Linux transport: `AF_UNIX` socket under `$XDG_RUNTIME_DIR` (fallback `/tmp`),
name prefix `EditForthLin-`.

## Exec / JIT

| Word | Windows | Linux |
| --- | --- | --- |
| `ALLOCATE-EXEC` | `VirtualAlloc` | `mmap` `PROT_READ|PROT_WRITE` |
| `MPROTECT` | `VirtualProtect` | `mprotect` |
| `ICACHE-INVAL` | `FlushInstructionCache` | `__builtin___clear_cache` |
| `JIT-WPROTECT` | no-op flag | no-op flag (or `pthread` JIT write if needed) |

## Stub status

`Forth/host/linux/` holds the port map and empty `.c` placeholders. Link them
from `build-x64.sh` only after the System V kernel objects exist.
