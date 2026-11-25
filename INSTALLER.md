# Installing EditForthLin

**Version 2.7.6.** Linux Mint, or another Debian/Ubuntu system with the same packages. The kernel banner is `EditForthLin arm64` or `EditForthLin x64`, `2.7.6` / `Nov 24, 2026 6:27 PM`. The arm64 package is `Releases/editforthlin_2.7.6_arm64.deb`. The amd64 package in `Releases/` is still 2.6.3 until it is packed on Linux Mint.

## Install the package

The installer is an architecture-specific `.deb`. It does not bundle Qt. `apt` reads `Depends` and downloads the libraries the editor and the Forth engine need, including Qt 6 and the Qt platform plugin.

The arm64 package built on this host is `Releases/editforthlin_2.7.6_arm64.deb` (5954224 bytes, SHA256 `cfbf7110c932ef937a54d39c2e51cb1da4181615f45f7c5d213ce6674024350a`). From the directory that contains that file:

```bash
sudo apt update
sudo apt install ./editforthlin_2.7.6_arm64.deb
```

Use `apt install`. `dpkg -i` does not download those libraries.

The amd64 package is linked on Linux Mint x64, then packed with the same script:

```bash
bash build-x64.sh
bash scripts/pack-deb.sh amd64
sudo apt install ./Releases/editforthlin_2.7.6_amd64.deb
```

That amd64 file is not in this tree yet. `Releases/editforthlin_2.6.3_amd64.deb` is the previous Mint package.

`scripts/pack-deb.sh` runs `dpkg-shlibdeps` on the binaries and writes those packages into `Depends`. It also depends on `qt6-qpa-plugins` (Qt loads that plugin when the window opens), `libgl1`, `libxkbcommon0`, and `zenity` (bare `CHDIR` and Julia picture save). The Forth engine links `libx11-6` for the GRAPHICS window. On Ubuntu 24.04 and Linux Mint 22 the Qt packages use the `t64` names. The package does not include `cmake`, `nasm`, or the other build tools.

The install puts the editor, `fortharm64` or `forthx64`, and `Resources` in `/opt/editforthlin`, adds a menu entry, and links `/usr/bin/editforthlin` at the editor. The first run creates `~/Documents/EditForthLin` and copies `Library`, `System`, and `Docs` there. The menu icon is the generic `text-editor` icon. An arm64 package does not run on x64, and an amd64 package does not run on arm64.

## Build from source

You can also clone the source and build it on the machine that will run it. The built programs stay in the repository tree. They are linked to that machine's Qt 6, so copying `editforthlinx64` to another distribution will not run.

### 1. Get the source

```bash
git clone https://github.com/Win32Forth/EditForthLin.git
cd EditForthLin
git checkout main
```

`main` tracks the latest commit. This tree is **2.7.6**. The arm64 installer is `Releases/editforthlin_2.7.6_arm64.deb`. The amd64 installer in `Releases/` is still 2.6.3.

### 2. Install the build tools

```bash
./scripts/mint-deps.sh
```

That asks for `sudo` and installs:

- `build-essential`, `cmake`, `ninja-build`, `nasm`, `python3`, `pkg-config`
- `qt6-base-dev`, `qt6-base-dev-tools`, `libgl1-mesa-dev`, `libx11-dev`

The same packages, without the script:

```bash
sudo apt update
sudo apt install -y \
  build-essential cmake ninja-build nasm python3 pkg-config \
  qt6-base-dev qt6-base-dev-tools libgl1-mesa-dev libx11-dev
```

On **x86_64**, `uname -m` prints `x86_64`. Continue with `bash build-x64.sh` below.

On **aarch64**, `uname -m` prints `aarch64`. Use this instead of the x64 steps:

```bash
bash build-arm64.sh
./Edit/build/arm64/editforthlinarm64
Forth/build/arm64/fortharm64 --agent -e '2 3 + .'
```

Expect:

```
=== EditForthLin 2.7.6 === Nov 24, 2026 6:27 PM ===
```

and the number `5`. `bash build-arm64.sh` links `Forth/build/arm64/fortharm64` and `Edit/build/arm64/editforthlinarm64`.

### 3. Build

From the repository root:

```bash
bash build-x64.sh
```

That translates the ARM64 kernel to NASM System V, assembles ELF64 objects, compiles the Linux host, links the Forth engine, and builds the Qt editor.

| Result | Path |
| --- | --- |
| Forth engine | `Forth/build/x64/forthx64` |
| Editor | `Edit/build/x64/editforthlinx64` |

Forth only, without the editor:

```bash
EDITFORTHLIN_SKIP_EDITOR=1 bash build-x64.sh
```

### 4. Run

Editor (it starts the Forth engine itself):

```bash
./Edit/build/x64/editforthlinx64
```

Console check, without the window:

```bash
Forth/build/x64/forthx64 --agent -e '2 3 + .'
```

Expect the banner, the number `5`, and exit code 0:

```
=== EditForthLin 2.7.6 === Nov 24, 2026 6:27 PM ===
```

The first run creates `~/Documents/EditForthLin` and copies `Library`, `System`, and `Docs` from `Forth/Resources`. That folder is your Forth tree. Set `EDITFORTHLIN` to an absolute path to use a different one.

Nothing is copied to `/usr` or added to the desktop menu when you build from the clone. To start it later, use the path above, or run it from the repository root.

## Pack another .deb

Build the binaries on the machine that matches the package, then pack. Install steps are at the top of this file.

```bash
bash build-arm64.sh
bash scripts/pack-deb.sh arm64
```

```bash
bash build-x64.sh
bash scripts/pack-deb.sh amd64
```

The files are `Releases/editforthlin_<version>_arm64.deb` and `Releases/editforthlin_<version>_amd64.deb`.

## What this release does not install

- An AppImage, or a custom icon
- Saved Ask Forth API keys (Linux storage is still open)
- Hayes / ANS-VALIDATE on x64 (arm64 passed: ANS-VALIDATE 394/0, Hayes all counts zero)
- GRAPHICS or the system clipboard (those host calls still fail)

More detail: [LINUXMINT.md](LINUXMINT.md), [CHANGELOG.md](CHANGELOG.md), [PORT.md](PORT.md).
