# Linux Mint — EditForthLin

Primary guide for building and smoking **EditForthLin** on **Linux Mint x64**.
Other Debian/Ubuntu-based distros use the same packages and steps.

| Item | Value |
| --- | --- |
| Product | EditForthLin |
| Marketing version | **0.1.0** (`0.1.0-x64`) |
| Repo | https://github.com/Win32Forth/EditForthLin |
| Tag / release | [v0.1.0](https://github.com/Win32Forth/EditForthLin/releases/tag/v0.1.0) |
| Kernel banner | `=== EditForthLin 0.1.0-x64 === Oct 20, 2026 6:25 PM ===` |
| Agent binary | `Forth/build/x64/forthx64` |
| Editor binary | `Edit/build/x64/editforthlinx64` |
| User data | `~/Documents/EditForthLin` (override with absolute `EDITFORTHLIN`) |

Desktop shape matches Windows: Qt 6 Widgets editor + process companion Forth
(`--companion`). Shared Forth cold-load `.fth`, `kernel_api.h`, and
`Forth/Resources/Library` stay common; OS-specific code lives under
`Forth/host/linux/` and the Linux editor IPC path.

On **macOS**, `./build-x64.sh` translates, assembles ELF objects, and
compile-checks host C. The ELF **link** of `forthx64` needs Linux (this
checklist).

Related docs: [README.md](README.md), [CHANGELOG.md](CHANGELOG.md),
[PORT.md](PORT.md), [docs/linux-host.md](docs/linux-host.md),
[docs/linux-mint-setup.md](docs/linux-mint-setup.md).

---

## Mint build / smoke walkthrough (0.1.0)

Do this on a **Linux Mint x64** machine (or VM).

### 0. Clone

```bash
git clone https://github.com/Win32Forth/EditForthLin.git
cd EditForthLin
git checkout v0.1.0   # or main
```

### 1. Dependencies

```bash
./scripts/mint-deps.sh
```

Or manually:

```bash
sudo apt update
sudo apt install -y \
  build-essential cmake ninja-build nasm python3 \
  qt6-base-dev qt6-base-dev-tools \
  libgl1-mesa-dev \
  pkg-config
```

Sanity checks:

```bash
nasm -v
cmake --version
pkg-config --modversion Qt6Widgets || pkg-config --modversion Qt6Core
```

Optional later:

- `qt6-tools-dev` — Designer / extra tools
- `libsecret-1-dev` — AskForth API key storage
- `fuse3` / linuxdeployqt deps — AppImage packaging

### 2. Build

```bash
./build-x64.sh
```

Expect:

- Translate ARM64 → NASM System V (`GrokTools/arm64_to_nasm_sysv.py`)
- `nasm -f elf64` objects under `Forth/build/x64-linux/`
- Compile `Forth/host/linux/*.c`
- Link `Forth/build/x64/forthx64`
- Build Qt editor `Edit/build/x64/editforthlinx64`

Agent only (skip Qt):

```bash
EDITFORTHLIN_SKIP_EDITOR=1 ./build-x64.sh
```

Custom Qt prefix (offline installer):

```bash
cmake -S Edit -B Edit/build/x64 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH="$HOME/Qt/6.x.y/gcc_64" \
  -DEDITFORTH_ARCH=x64
cmake --build Edit/build/x64 -j"$(nproc)"
```

(Normally `./build-x64.sh` runs the editor cmake step after linking
`forthx64`.)

### 3. Agent smoke (primary for 0.1.0)

```bash
Forth/build/x64/forthx64 --agent -e '2 3 + .'
```

Look for:

- Cold-load / banner with `0.1.0-x64` and `EditForthLin x64`
- Printed `5`
- Clean exit, or return to a prompt if `-e` leaves the REPL (either is fine
  for a first smoke)
- Seed of `~/Documents/EditForthLin` (`Library`, `AutoLoad`, `Docs`, `Config`)

Interactive:

```bash
Forth/build/x64/forthx64 --agent
# at the prompt:
2 3 + .
BYE
```

### 4. Companion smoke (optional for 0.1.0)

```bash
# terminal A
Forth/build/x64/forthx64 --companion EditForthLin-smoke

# terminal B
ls -l /tmp/EditForthLin-smoke
Edit/build/x64/editforthlinx64
```

Socket path: `$TMPDIR/<name>` (default `/tmp/<name>`), matching Qt
`QLocalSocket`.

Expect length-prefixed JSON frames (version / cwd / prompt) once
`ForthPipe_linux` is finished. Until that editor path is complete, companion
bind/accept alone is a useful host check.

### 5. Record results

| Check | Pass? |
| --- | --- |
| `mint-deps.sh` | |
| `build-x64.sh` → `forthx64` | |
| `--agent -e '2 3 + .'` | |
| Banner shows `0.1.0-x64` | |
| `~/Documents/EditForthLin` seeded | |
| Editor starts (if built) | |
| Companion socket accepted | |

If anything fails, note it on the
[v0.1.0 release](https://github.com/Win32Forth/EditForthLin/releases/tag/v0.1.0)
or open a GitHub issue.

---

## What 0.1.0 includes

- Scaffold from EditForthWin **1.3.1**
- NASM / System V translator → `Forth/kernel/x64-linux/`
- Hand-written `identity.asm`, `vmregs.asm`, `find_host.asm`
- Linux host under `Forth/host/linux/` (`--agent`, `--companion`, files, float,
  exec, facility, debug; GRAPHICS and clipboard stubs)
- Companion AF_UNIX IPC aligned with Qt (`/tmp/<name>`)
- `build-x64.sh` + `scripts/mint-deps.sh`

## Not yet verified / finished on Mint

- Link + smoke of `forthx64 --agent` (this checklist)
- Editor companion round-trip (`ForthPipe_linux` unfinished)
- Hayes / ANS-VALIDATE
- GRAPHICS and clipboard (stubs return failure)
- AskForth key storage (libsecret) and packaging (`.deb` / AppImage)

Port status: [PORT.md](PORT.md). Host details: [docs/linux-host.md](docs/linux-host.md).

---

## Layout (Mint-relevant)

| Path | Role |
| --- | --- |
| `scripts/mint-deps.sh` | apt packages for Mint |
| `build-x64.sh` | translate + assemble + link + Qt |
| `Forth/host/linux/` | POSIX host |
| `Forth/kernel/x64-linux/` | NASM / System V kernel |
| `GrokTools/arm64_to_nasm_sysv.py` | translator |
| `Edit/` | Qt editor (`editforthlinx64`) |
| `Forth/Resources/` | seeds for `~/Documents/EditForthLin` |
