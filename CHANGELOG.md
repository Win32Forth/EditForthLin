# Changelog

## 2.5.6.0 — 2026-10-26

Ask Forth circled help marks are buttons. A click opens a dialog with the section title and the help text. The kernel banner is `2.5.6.0` / `Oct 26, 2026 3:26 PM` / `EditForthLin arm64` or `EditForthLin x64`. The programs are not rebuilt in this commit. Hayes and ANS-VALIDATE were not run.

### In this release

- The circled ? beside Ask Forth and EditForthLin Agent, and the circled i beside Reference, open that dialog
- Hover tips on those marks are gone
- The Reference dialog says to open a source file, select it in the dropdown, and that it stays until deselected. New session starts a new question/Answer session

### Still open

- Interactive GRAPHICS host (the in-process window is still a stub; stand-alone emit uses the X11 runner)
- Ask Forth key storage on Linux
- Hayes / ANS-VALIDATE on x64 (checked on aarch64 only, at 2.5.5.2)
- Packaging (`.deb` / AppImage)

## 2.5.5.3 — 2026-10-26

The Linux x64 stand-alone emitter was compiling the ARM64 runner, so `EMIT-APP` failed in `cc` on `x30` and the other ARM registers. The kernel banner is `2.5.5.3` / `Oct 26, 2026 1:29 PM` / `EditForthLin arm64` or `EditForthLin x64`.

### In this release

- On x86_64, `app-build.sh` compiles `emit-lin.c` with `runner/emit-lin-run-x64.s` and links that runner
- The x64 image keeps its register file in the last 256 bytes of the data segment, placed immediately after the code so the RIP-relative fixups still reach it
- `cblit` depth, bigint multiply and divide, and the mouse-button pointer are real C parameters. The runner no longer reads ARM `x2` and `x3`
- The saved `GCLOCK.img` rebuilt on Mint x64 and the program stayed running

### Still open

- Interactive GRAPHICS host (the in-process window is still a stub; stand-alone emit uses the X11 runner)
- Ask Forth key storage on Linux
- Hayes / ANS-VALIDATE on x64 (checked on aarch64 only)
- Packaging (`.deb` / AppImage)

## 2.5.5.2 — 2026-10-26

Linux fixes after the EditForthWin 2.5.5.1 merge. The kernel banner is
`2.5.5.2` / `Oct 26, 2026 12:31 PM` / `EditForthLin arm64` or `EditForthLin x64`.

### In this release

- Stand-alone `EMIT-APP` on Linux builds an X11 ELF from `Forth/Resources/Library/Emitter/runner/emit-lin.c`. `app-build.sh` compiles that runner when `uname` is Linux
- `MS@` returns monotonic milliseconds and `MS` sleeps that many milliseconds, matching the Linux kernel. GCLOCK no longer closes as soon as the window opens
- The pixel buffer is already top-down, so the runner does not flip it. Twelve o'clock stays at the top
- Character cells are drawn on the 8×16 grid over the pixels. The GCLOCK title and the Esc / Enter / Space line show
- The emitter copies `_udivmod128` when alignment NOPs sit between that helper and `UM/MOD`. Stand-alone `*/` divides, and the clock hands meet the tick ring
- arm64 `ANS-VALIDATE`: 394 passed, 0 failed. Hayes: all counts zero, including `FPERRORS`

### Still open

- Interactive GRAPHICS host (the in-process window is still a stub; stand-alone emit uses the X11 runner)
- Ask Forth key storage on Linux
- Hayes / ANS-VALIDATE on x64 (checked on aarch64 only)
- Packaging (`.deb` / AppImage)

## 2.5.5.1 — 2026-10-26

Merged EditForthWin 2.5.5.1 into the Linux tree. The version number now
matches EditForthWin. arm64 and x64 stay one product.

### In this release

- `(HX-BG-REINDEX)` and `host_hyper_reindex`: a background `forth --agent` rebuilds `Config/HYPER.NDX`, then the companion reloads it
- `FORGET` drops wordlists whose bodies are at or above the cut
- Shipped Library, AutoLoad, and Docs files copy when they are missing or newer than the user copy
- Ask Forth session file, context window, line comments, and Open EditForthLin Folder
- Editor status line shows companion `status` notes, including Hyper reindex
- Kernel banner `2.5.5.1` / `Oct 26, 2026 11:34 AM` / `EditForthLin arm64` or `EditForthLin x64`

### Still open at 2.5.5.1

- Hayes / ANS-VALIDATE on Linux (run later; see 2.5.5.2)
- GRAPHICS and clipboard (stubs return failure)
- Ask Forth key storage on Linux
- Packaging (`.deb` / AppImage)

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
