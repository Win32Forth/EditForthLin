# EditForthWin → EditForthLin port checklist

Scaffold date: 2026-10-20. Source snapshot: EditForthWin 1.3.1.  
**Marketing version:** **0.1.5** (`0.1.5-x64`). Install steps: [INSTALLER.md](INSTALLER.md).

Linux is a desktop sibling of Windows (Qt + process companion), not an
in-process Android-style embed. Prefer System V ABI growth in the translator,
not a second OS-specific kernel dialect beyond ABI and host calls.

## Done for 0.1.0

- [x] Sibling tree `EditForthLin` copied from EditForthWin (no Windows Install/dist)
- [x] Product README, CHANGELOG, `LINUXMINT.md`, Mint setup / host / smoke docs
- [x] Linux editor CMake target name `editforthlin` / `editforthlinx64` (project VERSION 0.1.5)
- [x] `ForthPipe_linux.cpp` skeleton (Unix domain socket / `QLocalServer`)
- [x] `Forth/host/linux/` host (agent + companion + file/path host)
- [x] `build-x64.sh` and `scripts/mint-deps.sh`
- [x] System V / NASM translator `GrokTools/arm64_to_nasm_sysv.py`
- [x] Generated `Forth/kernel/x64-linux/asm/*.asm`
- [x] Hand-written `identity.asm`, `vmregs.asm`, `find_host.asm` (System V)
- [x] `nasm -f elf64` smoke assemble of all 18 objects (2026-10-20)
- [x] Host C compile-checked on Darwin; ELF link of `forthx64` designed for Mint
- [x] Version strings `0.1.5-x64` / `Oct 21, 2026 2:00 PM` / `EditForthLin x64`
- [x] GitHub `Win32Forth/EditForthLin` + tag `v0.1.5`

## Kernel / ABI

- [x] System V x64 translator (NASM) from `Forth/kernel/arm64`
  - Windows `GrokTools/arm64_to_ml64.py` emits ml64 + **Windows** x64 ABI
  - Linux `arm64_to_nasm_sysv.py` emits NASM + **System V** (`rdi`…`r9`, stack args)
- [x] Hand-written `identity` + `vmregs` / `find_host` for linux-x64
- [x] Run `./build-x64.sh` on Mint to link `forthx64` and smoke `--agent -e "2 3 + ."` (2026-10-21, prints `5`)
- [ ] Optional later: linux-arm64 native kernel (Mint on Arm devices)
- [x] Host provides `sa_win_file_op` / `sa_win_putchar` (names kept for first link)

## Forth host (`Forth/host/linux/`)

| Windows | Linux | Status |
| --- | --- | --- |
| `main.c` | `main_linux.c` | Done — `~/Documents/EditForthLin`, POSIX I/O |
| `console_win.c` | `console_linux.c` | Done — `--agent` / `--companion` (no GUI console) |
| `companion.c` | `companion_linux.c` | Done — AF_UNIX, Qt `/tmp/<name>` path |
| `bigint.c` | `bigint.c` | Done — shared copy |
| `float_win.c` | `float_linux.c` | Done |
| `exec_win.c` | `exec_linux.c` | Done — mmap/mprotect |
| `facility_win.c` | `facility_linux.c` | Grid done; clipboard stub |
| `gfx_win.c` | `gfx_linux.c` | Stub (GRAPHICS deferred) |
| `debug_win.c` | `debug_linux.c` | Done |

## Editor (`Edit/`)

- [x] Drop `WIN32` / `advapi32` from CMake; output `editforthlin`
- [x] `ForthPipe.cpp` length-prefixed JSON frames; companion starts and debugger pause reaches the editor
- [ ] Replace Credential Manager AskForth key storage with libsecret / file fallback (Linux stubs return failure)
- [x] Product strings: EditForthLin, `~/Documents/EditForthLin`
- [x] Locate companion as `Forth/build/x64/forthx64` (no `.exe`)
- [ ] `linuxdeployqt` or manual Qt plugin deploy for releases

## Packaging (Mint)

- [ ] `.deb` or AppImage for x64
- [ ] Desktop entry + icon
- [x] Seed `~/Documents/EditForthLin` from `Forth/Resources` on first run (verified on Mint, 2026-10-21)

## Validation

- [ ] `FROMLIB FLOAD Testing/ANSValidate/ANS-VALIDATE.fth`
- [ ] `FROMLIB FLOAD Testing/HayesTest/HayesTest.fth`

## Explicit non-goals for first Mint boot

- Windows installers / Inno Setup
- Android in-process `libforthnative.so`
- Full GRAPHICS / Emitter Windows packer parity on day one
- Dual-arch Mint arm64+x64 installers
