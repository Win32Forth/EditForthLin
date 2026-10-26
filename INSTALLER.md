# Installing EditForthLin

**Version 2.5.5.2.** Linux Mint, or another Debian/Ubuntu system with the same packages. The kernel banner is `EditForthLin arm64` or `EditForthLin x64`.

There is no downloaded program and no installer package. Clone the source and build it on the machine that will run it. The built programs stay in the repository tree. They are linked to that machine's Qt 6, so copying `editforthlinx64` to another distribution will not run.

## 1. Get the source

```bash
git clone https://github.com/Win32Forth/EditForthLin.git
cd EditForthLin
git checkout main
```

`main` tracks the latest commit. This tree is **2.5.5.2**.

## 2. Install the build tools

```bash
./scripts/mint-deps.sh
```

That asks for `sudo` and installs:

- `build-essential`, `cmake`, `ninja-build`, `nasm`, `python3`, `pkg-config`
- `qt6-base-dev`, `qt6-base-dev-tools`, `libgl1-mesa-dev`

The same packages, without the script:

```bash
sudo apt update
sudo apt install -y \
  build-essential cmake ninja-build nasm python3 pkg-config \
  qt6-base-dev qt6-base-dev-tools libgl1-mesa-dev
```

On **x86_64**, `uname -m` prints `x86_64`. Continue with `./build-x64.sh` below.

On **aarch64**, `uname -m` prints `aarch64`. Use this instead of the x64 steps:

```bash
./build-arm64.sh
./Edit/build/arm64/editforthlinarm64
Forth/build/arm64/fortharm64 --agent -e '2 3 + .'
```

Expect:

```
=== EditForthLin 2.5.5.2 === Oct 26, 2026 12:31 PM ===
```

and the number `5`. `./build-arm64.sh` links `Forth/build/arm64/fortharm64` and `Edit/build/arm64/editforthlinarm64`.

## 3. Build

From the repository root:

```bash
./build-x64.sh
```

That translates the ARM64 kernel to NASM System V, assembles ELF64 objects, compiles the Linux host, links the Forth engine, and builds the Qt editor.

| Result | Path |
| --- | --- |
| Forth engine | `Forth/build/x64/forthx64` |
| Editor | `Edit/build/x64/editforthlinx64` |

Forth only, without the editor:

```bash
EDITFORTHLIN_SKIP_EDITOR=1 ./build-x64.sh
```

## 4. Run

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
=== EditForthLin 2.5.5.2 === Oct 26, 2026 12:31 PM ===
```

The first run creates `~/Documents/EditForthLin` and copies `Library`, `AutoLoad`, and `Docs` from `Forth/Resources`. That folder is your Forth tree. Set `EDITFORTHLIN` to an absolute path to use a different one.

Nothing is copied to `/usr` or added to the desktop menu. To start it later, use the path above, or run it from the repository root.

## What this release does not install

- A `.deb`, AppImage, or desktop entry
- Saved Ask Forth API keys (Linux storage is still open)
- A full Hayes or ANS-VALIDATE run
- GRAPHICS or the system clipboard (those host calls still fail)

More detail: [LINUXMINT.md](LINUXMINT.md), [CHANGELOG.md](CHANGELOG.md), [PORT.md](PORT.md).
