# Changelog

## 0.1.6 — 2026-10-21

Native Linux arm64. The Windows ARM64 armasm kernel is translated to GNU
assembler and linked with the existing Linux host. The Qt editor on aarch64
starts `fortharm64`.

### In this release

- `GrokTools/arm64_to_gas_linux.py` reads `Forth/kernel/arm64` and writes GNU as into `Forth/kernel/arm64-linux/asm`. The instructions stay ARM64. `adrp` / `add reg, reg, symbol` becomes the Linux `:lo12:` form.
- Hand-written `Forth/kernel/arm64-linux/identity.s` (`0.1.6-arm64`, `EditForthLin arm64`)
- `./build-arm64.sh` assembles that kernel and links it with `Forth/host/linux` to `Forth/build/arm64/fortharm64`, then builds `Edit/build/arm64/editforthlinarm64`
- The editor companion path follows `EDITFORTH_ARCH` (`fortharm64` or `forthx64`)
- On aarch64, `_find_word` is the normal ARM64 function, so the companion calls it directly
- Agent smoke `fortharm64 --agent -e '2 3 + .'` prints `5` and exits 0. Autoload finishes, including Hyper
- The editor window opens. View opens source, the debugger steps, and the Ask Forth window appears. Ask Forth still needs a local Ollama server before it can answer
- x64 banner string is `0.1.6-x64`. This aarch64 machine did not rebuild `forthx64`

### Kernel banners

```
=== EditForthLin 0.1.6-arm64 === Oct 21, 2026 9:23 PM ===
=== EditForthLin 0.1.6-x64 === Oct 21, 2026 9:23 PM ===
```

### Still open

- Hayes / ANS-VALIDATE
- GRAPHICS and clipboard (stubs return failure)
- Ask Forth key storage (libsecret or a file fallback)
- `Config/HYPER.CFG` is not seeded; reindex uses the default file list
- Packaging (`.deb` / AppImage)

## 0.1.5 — 2026-10-21

First Mint x64 build that links, runs the editor, and steps in the debugger.
There is still no `.deb` or AppImage. Build from source with [INSTALLER.md](INSTALLER.md).

### In this release

- `./build-x64.sh` links `Forth/build/x64/forthx64` and `Edit/build/x64/editforthlinx64` on Linux Mint x64
- POSIX feature macros in the Linux host so `sigaction`, `poll`, and `mmap` compile under `-std=c11`
- `realpath` uses a `PATH_MAX` buffer (glibc rejects a shorter destination)
- Loads under `~/Documents/EditForthLin` match Windows spellings such as `Library/HYPER/HYPER.fth` to the seeded `Library/Hyper/hyper.fth`
- Ask Forth credential calls are Windows-only. On Linux the key is not saved yet
- Editor debug messages treat `"armed"` and `"paused"` as integers, so a pause opens the source and F6 / F7 step
- Agent smoke `forthx64 --agent -e '2 3 + .'` prints `5` and exits 0. Autoload finishes, including Hyper

### Kernel banner

```
=== EditForthLin 0.1.5-x64 === Oct 21, 2026 2:00 PM ===
```

### Still open

- Hayes / ANS-VALIDATE
- GRAPHICS and clipboard (stubs return failure)
- Ask Forth key storage (libsecret or a file fallback)
- `Config/HYPER.CFG` is not seeded; reindex uses the default file list
- Packaging (`.deb` / AppImage)

## 0.1.0 — 2026-10-20

First public EditForthLin cut. Sibling of EditForthWin for **Linux Mint x64**.

### In this release

- Scaffold from EditForthWin **1.3.1** (Qt editor + Forth tree; Windows host kept as reference)
- System V / NASM translator `GrokTools/arm64_to_nasm_sysv.py` → `Forth/kernel/x64-linux/asm/`
- Hand-written `identity.asm`, `vmregs.asm`, `find_host.asm` (System V)
- Linux Forth host under `Forth/host/linux/` (`--agent`, `--companion`, files, float, exec, facility, debug)
- Companion AF_UNIX IPC: `$TMPDIR/<name>` (default `/tmp/<name>`) matching Qt `QLocalSocket`
- `build-x64.sh` + `scripts/mint-deps.sh` — full ELF link of `forthx64` on Linux; Darwin compile-check only
- Product strings / user tree: `~/Documents/EditForthLin` (override `EDITFORTHLIN`)

### Kernel banner

```
=== EditForthLin 0.1.0-x64 === Oct 20, 2026 6:25 PM ===
```

(`kernel_version` / `kernel_built` / `kernel_console` in `Forth/kernel/x64-linux/identity.asm`)

### Not yet verified on Mint

- Link + smoke of `Forth/build/x64/forthx64 --agent`
- Editor companion round-trip
- Hayes / ANS-VALIDATE
- GRAPHICS and clipboard (stubs return failure)
- AskForth key storage (libsecret) and packaging (`.deb` / AppImage)

See [LINUXMINT.md](LINUXMINT.md) and [PORT.md](PORT.md).
