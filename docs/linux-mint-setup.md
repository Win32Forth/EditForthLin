# Linux Mint setup (EditForthLin)

Target: **Linux Mint** (Ubuntu/Debian package names). Other Debian-ish distros
should work with the same packages.

Version **0.1.0** — see [mint-build-smoke.md](mint-build-smoke.md) for the
full build and smoke sequence.

## Packages

From the repo root:

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

Optional later:

- `qt6-tools-dev` — Designer / extra tools
- `libsecret-1-dev` — AskForth API key storage
- `fuse3` / linuxdeployqt deps — AppImage packaging

## Qt discovery

CMake should find system Qt 6 via:

```bash
cmake -S Edit -B Edit/build/x64 -DCMAKE_BUILD_TYPE=Release
cmake --build Edit/build/x64 -j"$(nproc)"
```

If Qt is in a custom prefix (a Qt offline installer):

```bash
cmake -S Edit -B Edit/build/x64 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH="$HOME/Qt/6.x.y/gcc_64"
```

## Build order

1. `./scripts/mint-deps.sh`
2. `./build-x64.sh` — translate / assemble linux-x64 kernel, link
   `Forth/build/x64/forthx64`, build editor `Edit/build/x64/editforthlinx64`
3. Smoke agent: `Forth/build/x64/forthx64 --agent -e '2 3 + .'`
4. Run editor; it should start `forthx64 --companion <socket-name>` once
   `ForthPipe_linux` is finished

## Documents tree

Runtime user data: `~/Documents/EditForthLin`  
(`XDG_DOCUMENTS_DIR` when set; otherwise `~/Documents`).

Shipped seeds: `Forth/Resources/{Library,AutoLoad,Docs,Config}`.
