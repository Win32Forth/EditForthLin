# EditForthLin

Linux sibling of [EditForthWin](https://github.com/Win32Forth/EditForthWin).  
Public domain (same spirit as the other EditForth trees).

**Version:** 2.5.5.3 (`EditForthLin arm64` and `EditForthLin x64`)

**Target:** Linux Mint first (Ubuntu/Debian package base), **x64** and **arm64**.  
**Status:** x64 builds and runs on Linux Mint. Native arm64 builds and runs on aarch64 Linux (`bash build-arm64.sh`). Build steps are in
**[INSTALLER.md](INSTALLER.md)**. Host notes: **[LINUXMINT.md](LINUXMINT.md)**.

Desktop shape matches Windows: Qt 6 Widgets editor + process companion Forth
(`--companion`). Shared Forth cold-load `.fth`, `kernel_api.h`, and
`Forth/Resources/Library` stay common; OS-specific code lives under
`Forth/host/linux/` and the Linux editor IPC path.

### 2.5.5.3 highlights

- Linux x64 `EMIT-APP` links `emit-lin-run-x64.s` instead of the ARM64 startup
- The register file stays immediately after the code, and host slots take their extra arguments as C parameters
- Rebuilt `GCLOCK.img` on Mint x64 and the program stayed running

### 2.5.5.2 highlights

- Linux stand-alone emit builds an X11 program (`emit-lin.c`) instead of the Mac packer
- GCLOCK stays open, the hands meet the tick ring, and the title plus Esc/Enter/Space lines are drawn
- arm64 ANS-VALIDATE: 394 passed, 0 failed. Hayes: all counts zero

### 2.5.5.1 highlights

- Brought forward from EditForthWin 2.5.5.1: background Hyper reindex, FORGET wordlist cleanup, newer shipped files, Ask Forth session file and context window, line comments, and Open EditForthLin Folder
- Native arm64 and the x64 Linux host stay in this tree

### 0.1.6 highlights

- Native aarch64 kernel and `bash build-arm64.sh`
- Editor launches `fortharm64` on arm64 and `forthx64` on x64
- View, debugger step, and the Ask Forth window checked on aarch64

### 0.1.5 highlights

- Mint x64 link of `forthx64` and the Qt editor
- Case-insensitive loads under `~/Documents/EditForthLin`
- Debugger pause opens the source; F6 / F7 step
- Build and run steps in [INSTALLER.md](INSTALLER.md)

### 0.1.0 highlights

- Scaffold from EditForthWin **1.3.1**
- NASM / System V translator and `Forth/kernel/x64-linux/`
- POSIX host: `--agent`, `--companion` (AF_UNIX `/tmp/<name>` for Qt)
- `build-x64.sh` links `forthx64` on Linux; Darwin compile-checks host C
- User data under `~/Documents/EditForthLin`

See [CHANGELOG.md](CHANGELOG.md).

## Layout

| Path | Role |
| --- | --- |
| `Edit/` | Qt Widgets editor (from EditForthWin; Linux IPC in `ForthPipe_linux.cpp`) |
| `Forth/` | Interpreter tree (kernels, Resources, cold-load) |
| `Forth/host/` | Windows host kept as reference (`*_win.c`, `main.c`, `companion.c`) |
| `Forth/host/linux/` | Linux host (`--agent` / `--companion`, files, float, exec, …) |
| `Forth/kernel/arm64` | ARM64 armasm source of truth (same as Windows) |
| `Forth/kernel/x64` | Windows ml64 / Win ABI translation (reference) |
| `Forth/kernel/x64-linux` | NASM / System V translation + hand-written identity/vmregs/find_host |
| `Forth/kernel/arm64-linux` | GNU as translation of the ARM64 kernel + hand-written identity |
| `GrokTools/arm64_to_nasm_sysv.py` | x64 Linux translator (`python3 GrokTools/arm64_to_nasm_sysv.py`) |
| `GrokTools/arm64_to_gas_linux.py` | arm64 Linux translator (`python3 GrokTools/arm64_to_gas_linux.py`) |
| `LINUXMINT.md` | Mint build, smoke, and project notes (start here on Linux) |
| `docs/` | Host notes and shorter Mint setup snippets |
| `build-x64.sh` | Translate + assemble + link forthx64 + Qt editor (Linux x64) |
| `build-arm64.sh` | Translate + assemble + link fortharm64 + Qt editor (Linux aarch64) |
| `build.bat` / `build-x64.bat` | Windows reference scripts (not used on Linux) |

## Working directory

Forth starts under `~/Documents/EditForthLin` (XDG Documents), mirroring
`Documents\EditForthWin` on Windows. First run seeds `Library`, `AutoLoad`,
`Docs`, and `Config` from `Forth/Resources`. Override with absolute
`EDITFORTHLIN`.

## Build

On Linux Mint / Debian-ish:

```bash
./scripts/mint-deps.sh    # apt packages (Qt6, cmake, nasm, build-essential)
bash build-x64.sh            # translate, assemble, link forthx64, build editor
./Edit/build/x64/editforthlinx64
Forth/build/x64/forthx64 --agent -e '2 3 + .'
```

Full steps: **[INSTALLER.md](INSTALLER.md)**.

On aarch64 Linux:

```bash
bash build-arm64.sh
./Edit/build/arm64/editforthlinarm64
Forth/build/arm64/fortharm64 --agent -e '2 3 + .'
```

On macOS, `bash build-x64.sh` translates, assembles ELF objects, and
compile-checks host C; ELF link needs Linux. `bash build-arm64.sh` is aarch64 only.

Full Mint guide: **[LINUXMINT.md](LINUXMINT.md)**. Also
[docs/linux-host.md](docs/linux-host.md) and [PORT.md](PORT.md).

## Console banner (expected after Mint link)

```
=== EditForthLin 2.5.5.3 === Oct 26, 2026 1:29 PM ===
```

(`Forth/kernel/x64-linux/identity.asm`, `Forth/kernel/arm64-linux/identity.s`)

## Related siblings

- [EditForth](https://github.com/Win32Forth/EditForth) — macOS
- [EditForthWin](https://github.com/Win32Forth/EditForthWin) — Windows
- [EditForthAnd](https://github.com/Win32Forth/EditForthAnd) — Android
- [EditForthLin](https://github.com/Win32Forth/EditForthLin) — this tree (Linux Mint)
