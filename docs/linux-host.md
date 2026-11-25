# Linux Forth host (EditForthLin)

Companion reference: Windows `Forth/host/main.c` + `companion.c` + `*_win.c`.  
Implementation: `Forth/host/linux/`.

## Process model

1. Qt editor starts.
2. Editor launches `forthx64 --companion <name>`.
3. Companion boots the kernel, runs Autoload, serves length-prefixed JSON
   frames over an **AF_UNIX** socket.
4. Editor pane owns the transcript.

Agent mode: `forthx64 --agent` on the launching TTY. `--agent` is headless, so it does not open the GRAPHICS window or a file dialog.

## GRAPHICS

`gfx_linux.c` is an in-process X11 window. TRUECOLOR pixels are BGRA, top row first. COLOR8 uses the palette. 1-bit cells are green on black. Character cells are 8 by 16. Arrow keys are 200, 203, 205, and 208. Shift is 256, Control is 512, and Alt is 1024.

S in the Julia programs calls `(APP-FILE-SAVE-PICTURE)` in the GRAPHICS wordlist. zenity opens a Save Picture dialog. PNG is the default (`Julia.png` in the Pictures folder). JPEG and TIFF are the other filters. A name with no picture suffix becomes `.png`. Cancel returns -1 and keeps the previous path. The Forth writers in `Library/Juliav444/JV-SAVE.fth` write the file. Image load and the small OOP windows still return cancel.

## Roots

| Role | Path |
| --- | --- |
| User tree | `~/Documents/EditForthLin` (or `$XDG_DOCUMENTS_DIR/EditForthLin`) |
| Override | absolute `EDITFORTHLIN` |
| Library | `…/Library` |
| System | `…/System` (Assembler, AutoLoad, Debugger, Emitter, Hyper, Reference, Sources, Testing) |
| Autoload | `…/System/AutoLoad/autoload.fth` |
| Shipped seeds | `Forth/Resources/` (walk-up from `/proc/self/exe`) |

## Boot order (companion)

1. Bind/listen/accept AF_UNIX (`$TMPDIR/<name>`, default `/tmp/<name>` — matches Qt `QLocalSocket`)
2. `host_set_sink` / debug / edit hooks / key hook
3. `forth_boot` → `kernel_init` + banner
4. Send `version`
5. `forth_autoload`
6. `cwd` + prompt + eval loop

## IPC frame format

Unchanged from Windows: 4-byte little-endian length + UTF-8 JSON.

## Exec / JIT

| Word | Linux |
| --- | --- |
| `ALLOCATE-EXEC` | `mmap` `PROT_READ\|PROT_WRITE` |
| `MPROTECT` | `mprotect` |
| `ICACHE-INVAL` | `__builtin___clear_cache` |
| `JIT-WPROTECT` | no-op flag |

## Build

```bash
./scripts/mint-deps.sh
bash build-x64.sh
# forthx64 at Forth/build/x64/forthx64
Forth/build/x64/forthx64 --agent -e '2 3 + .'
```

On macOS, `bash build-x64.sh` assembles ELF objects and compile-checks host C;
link happens on Linux. Full Mint steps: [LINUXMINT.md](../LINUXMINT.md).

**2.7.6** kernel identity: `2.7.6` / `Nov 24, 2026 6:27 PM` / `EditForthLin x64`
(`Forth/kernel/x64-linux/identity.asm`).

On aarch64, `bash build-arm64.sh` links the same host with the native ARM64
kernel. Identity is `2.7.6` / `Nov 24, 2026 6:27 PM` / `EditForthLin arm64`
(`Forth/kernel/arm64-linux/identity.s`). The binary is
`Forth/build/arm64/fortharm64`.
