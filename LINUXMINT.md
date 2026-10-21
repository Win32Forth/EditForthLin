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

## UTM guests (Apple Silicon Mac)

EditForthWin was already built under **UTM** for **Windows 11 Arm64** and
**Windows 11 x64** on the same class of Mac. EditForthLin reuses that UTM
habit. Install UTM from [mac.getutm.app](https://mac.getutm.app).

| Mode | Guest | Speed | Role for EditForthLin |
| --- | --- | --- | --- |
| **Virtualize** | Linux **ARM64** (Ubuntu/Debian desktop) | Near-native | Fast Linux/Qt desktop; **not** the 0.1.0 `forthx64` target |
| **Emulate** | Linux **x86_64** (Mint or Ubuntu amd64) | Slower | Matches **0.1.0** / `LINUXMINT.md` (`elf64`, `forthx64`) |

Windows 11 has official Arm64 **and** x64 SKUs. Official **Linux Mint** is
**amd64 only** (no official ARM ISO). So a true Mint guest is the same *kind*
of UTM VM as the **Win11 x64** guest: **Emulate** → x86_64.

### Guest A — Emulate Mint amd64 (primary for 0.1.0)

Same lane as the Win11 **x64** UTM VM.

1. Download **Linux Mint Cinnamon 64-bit** (amd64) from
   [linuxmint.com](https://www.linuxmint.com).
2. UTM → **+** → **Emulate** → architecture **x86_64** → Linux.
3. Attach the Mint ISO; create a disk (40 GB+).
4. Memory / cores: size like the Win11 x64 guest (emulation is hungry; on an
   Air, prefer **8 GB** RAM and **4–6** cores if the host can spare them).
5. Install Mint, shut down, remove the ISO from the virtual drive, boot from
   disk.
6. Optional: shared folder to the Mac `EditForthLin` tree, or `git clone`
   inside the guest.
7. Continue with [Mint build / smoke walkthrough](#mint-build--smoke-walkthrough-010)
   below.

Ubuntu **amd64** under Emulate is fine if you already have that ISO; packages
in `scripts/mint-deps.sh` are the same apt world.

### Guest B — Virtualize Ubuntu ARM64 (optional, fast desktop)

Same lane as the Win11 **Arm64** UTM VM: snappy, native virtualization.

1. Download **Ubuntu Desktop ARM64** (ISO name contains `arm64`, not `amd64`).
2. UTM → **+** → **Virtualize** → Linux → select the ARM64 ISO.
3. Memory **4–8 GB**, **4** cores, disk **40 GB+** is a good Air starting point.
4. Install, remove ISO, boot from disk.

Use this for general Linux desktop / Qt feel. Guest `uname -m` is `aarch64`.
EditForthLin **0.1.0** does not yet ship a linux-arm64 kernel/host; do not
expect `./build-x64.sh` to produce a native arm64 `forthx64` here. A later
linux-arm64 port would mirror EditForthWin’s dual-arch split.

UTM can also enable **Rosetta (x86_64 Emulation)** inside an ARM64 Linux
guest so some Intel binaries run there. That is optional and separate from a
full Mint amd64 install; prefer Guest A for the 0.1.0 smoke checklist.

### After the guest is up

Inside Guest A (Mint/Ubuntu **amd64**), follow the walkthrough starting at
**Clone**. Confirm once:

```bash
uname -m    # expect x86_64
```

---

## Mint build / smoke walkthrough (0.1.0)

Do this on a **Linux Mint x64** machine or VM (on Apple Silicon Mac hosts, use
[UTM Guest A](#guest-a--emulate-mint-amd64-primary-for-010) above).

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
