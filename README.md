# EditForthLin

Linux sibling of [EditForthWin](https://github.com/Win32Forth/EditForthWin).
Public domain (same spirit as the other EditForth trees).

**Target:** Linux Mint first (Ubuntu/Debian package base), **x64**.  
**Status:** System V/NASM kernel + Linux host C are in tree. Run
`./build-x64.sh` on Linux Mint to link `forthx64` and smoke `--agent`
(see `PORT.md`).

Desktop shape matches Windows: Qt 6 Widgets editor + process companion Forth
(`--companion`). Shared Forth cold-load `.fth`, `kernel_api.h`, and
`Forth/Resources/Library` stay common; OS-specific code lives under
`Forth/host/linux/` and the Linux editor IPC path.

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
| `docs/` | Mint setup and host notes |
| `build-x64.sh` | Translate + assemble; link waits on Linux host |
| `build.bat` / `build-x64.bat` | Windows reference scripts (not used on Linux) |

## Working directory

Forth will start under `~/Documents/EditForthLin` (XDG Documents), mirroring
`Documents\EditForthWin` on Windows. First run will seed `Library`, `AutoLoad`,
`Docs`, and `Config` from `Forth/Resources`.

## Build (planned)

On Linux Mint / Debian-ish:

```bash
./scripts/mint-deps.sh    # apt packages (Qt6, cmake, nasm, build-essential)
./build-x64.sh            # translate, assemble, link forthx64, build editor
Forth/build/x64/forthx64 --agent -e '2 3 + .'
```

See [docs/linux-mint-setup.md](docs/linux-mint-setup.md),
[docs/linux-host.md](docs/linux-host.md), and [PORT.md](PORT.md).

## Version

Scaffold tracks EditForthWin **1.3.1** sources. Linux marketing version will
start at **0.1.0** when the first Mint binary boots.

## Related siblings

- [EditForth](https://github.com/Win32Forth/EditForth) — macOS
- [EditForthWin](https://github.com/Win32Forth/EditForthWin) — Windows
- [EditForthAnd](https://github.com/Win32Forth/EditForthAnd) — Android
- EditForthLin — this tree (Linux Mint)
