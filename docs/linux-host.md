# Linux Forth host (EditForthLin)

Companion reference: Windows `Forth/host/main.c` + `companion.c` + `*_win.c`.  
Implementation: `Forth/host/linux/`.

## Process model

1. Qt editor starts.
2. Editor launches `forthx64 --companion <name>`.
3. Companion boots the kernel, runs Autoload, serves length-prefixed JSON
   frames over an **AF_UNIX** socket.
4. Editor pane owns the transcript.

Agent mode: `forthx64 --agent` on the launching TTY.

## Roots

| Role | Path |
| --- | --- |
| User tree | `~/Documents/EditForthLin` (or `$XDG_DOCUMENTS_DIR/EditForthLin`) |
| Override | absolute `EDITFORTHLIN` |
| Library | `…/Library` |
| Autoload | `…/AutoLoad/autoload.fth` |
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

**2.5.6.0** kernel identity: `2.5.6.0` / `EditForthLin x64`
(`Forth/kernel/x64-linux/identity.asm`).

On aarch64, `bash build-arm64.sh` links the same host with the native ARM64
kernel. Identity is `2.5.6.0` / `EditForthLin arm64`
(`Forth/kernel/arm64-linux/identity.s`). The binary is
`Forth/build/arm64/fortharm64`.
