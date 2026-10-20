# EditForthLin

Linux sibling of [EditForthWin](https://github.com/Win32Forth/EditForthWin).  
Public domain (same spirit as the other EditForth trees).

**Version:** 0.1.0 (`0.1.0-x64`)

**Target:** Linux Mint first (Ubuntu/Debian package base), **x64**.  
**Status:** System V/NASM kernel + Linux host C are in tree. Link and smoke
`forthx64` on Mint with **[LINUXMINT.md](LINUXMINT.md)**.

Desktop shape matches Windows: Qt 6 Widgets editor + process companion Forth
(`--companion`). Shared Forth cold-load `.fth`, `kernel_api.h`, and
`Forth/Resources/Library` stay common; OS-specific code lives under
`Forth/host/linux/` and the Linux editor IPC path.

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
| `GrokTools/arm64_to_nasm_sysv.py` | Linux translator (`python3 GrokTools/arm64_to_nasm_sysv.py`) |
| `LINUXMINT.md` | Mint build, smoke, and project notes (start here on Linux) |
| `docs/` | Host notes and shorter Mint setup snippets |
| `build-x64.sh` | Translate + assemble + link forthx64 + Qt editor (Linux) |
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
./build-x64.sh            # translate, assemble, link forthx64, build editor
Forth/build/x64/forthx64 --agent -e '2 3 + .'
```

On macOS, `./build-x64.sh` translates, assembles ELF objects, and
compile-checks host C; ELF link needs Linux.

Full Mint guide: **[LINUXMINT.md](LINUXMINT.md)**. Also
[docs/linux-host.md](docs/linux-host.md) and [PORT.md](PORT.md).

## Console banner (expected after Mint link)

```
=== EditForthLin 0.1.0-x64 === Oct 20, 2026 6:25 PM ===
```

(`Forth/kernel/x64-linux/identity.asm`)

## Related siblings

- [EditForth](https://github.com/Win32Forth/EditForth) — macOS
- [EditForthWin](https://github.com/Win32Forth/EditForthWin) — Windows
- [EditForthAnd](https://github.com/Win32Forth/EditForthAnd) — Android
- [EditForthLin](https://github.com/Win32Forth/EditForthLin) — this tree (Linux Mint)
