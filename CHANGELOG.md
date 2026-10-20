# Changelog

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
