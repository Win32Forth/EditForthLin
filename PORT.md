# EditForthWin → EditForthLin port checklist

Scaffold date: 2026-10-20. Source snapshot: EditForthWin 1.3.1.

Linux is a desktop sibling of Windows (Qt + process companion), not an
in-process Android-style embed. Prefer System V ABI growth in the translator,
not a second OS-specific kernel dialect beyond ABI and host calls.

## Done in this scaffold

- [x] Sibling tree `EditForthLin` copied from EditForthWin (no Windows Install/dist)
- [x] Product README + Mint setup docs
- [x] Linux editor CMake target name `editforthlin`
- [x] `ForthPipe_linux.cpp` skeleton (Unix domain socket / `QLocalServer`)
- [x] `Forth/host/linux/` stub map from `*_win.c`
- [x] `build-x64.sh` and `scripts/mint-deps.sh` placeholders

## Kernel / ABI

- [ ] System V x64 translator (NASM or GAS) from `Forth/kernel/arm64`
  - Windows `GrokTools/arm64_to_ml64.py` emits ml64 + **Windows** x64 ABI
  - Linux needs host calls with System V argument registers / red zone rules
- [ ] Hand-written `identity` + `vmregs` / `find_host` for linux-x64
- [ ] Assemble + link `forthx64` ELF (no `.exe`, no `/SUBSYSTEM:WINDOWS`)
- [ ] Optional later: linux-arm64 native kernel (Mint on Arm devices)

## Forth host (`Forth/host/linux/`)

| Windows | Linux target | Notes |
| --- | --- | --- |
| `main.c` | `main_linux.c` or shared + ifdefs | Paths: `~/Documents/EditForthLin`; POSIX file I/O |
| `console_win.c` | `console_linux.c` | Agent TTY; optional X11/Wayland console window later |
| `companion.c` | `companion_linux.c` | Unix domain socket instead of `\\.\pipe\` |
| `bigint.c` | reuse | Likely portable as-is |
| `float_win.c` | `float_linux.c` | Soft float stack; mostly portable |
| `exec_win.c` | `exec_linux.c` | `mmap`/`mprotect`/`__builtin___clear_cache` |
| `facility_win.c` | `facility_linux.c` | Clipboard via Qt or xclip/wl-clipboard later |
| `gfx_win.c` | `gfx_linux.c` | X11 or Qt helper process (defer) |
| `debug_win.c` | `debug_linux.c` | Same JSON paint protocol over companion socket |

## Editor (`Edit/`)

- [x] Drop `WIN32` / `advapi32` from CMake; output `editforthlin`
- [ ] Finish `ForthPipe_linux` (length-prefixed JSON frames, break event)
- [ ] Replace Credential Manager AskForth key storage with libsecret / file fallback
- [ ] Product strings: EditForthLin, `~/Documents/EditForthLin`
- [ ] Locate companion as `Forth/build/x64/forthx64` (no `.exe`)
- [ ] `linuxdeployqt` or manual Qt plugin deploy for releases

## Packaging (Mint)

- [ ] `.deb` or AppImage for x64
- [ ] Desktop entry + icon
- [ ] Seed `~/Documents/EditForthLin` from `Forth/Resources` on first run

## Validation

- [ ] `FROMLIB FLOAD Testing/ANSValidate/ANS-VALIDATE.fth`
- [ ] `FROMLIB FLOAD Testing/HayesTest/HayesTest.fth`

## Explicit non-goals for first Mint boot

- Windows installers / Inno Setup
- Android in-process `libforthnative.so`
- Full GRAPHICS / Emitter Windows packer parity on day one
- Dual-arch Mint arm64+x64 installers
