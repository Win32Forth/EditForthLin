# Linux Mint setup (EditForthLin)

Target: **Linux Mint** (Ubuntu/Debian package names). Other Debian-ish distros
should work with the same packages.

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

If Qt is in a custom prefix (aQt offline installer):

```bash
cmake -S Edit -B Edit/build/x64 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH="$HOME/Qt/6.x.y/gcc_64"
```

## Build order (once the host/kernel exist)

1. Translate / assemble linux-x64 Forth kernel → `Forth/build/x64/forthx64`
2. Build editor → `Edit/build/x64/editforthlin`
3. Run editor; it starts `forthx64 --companion <socket-name>`

Until those land, `./build-x64.sh` exits with a clear “not ready” message.

## Documents tree

Runtime user data: `~/Documents/EditForthLin`  
(`XDG_DOCUMENTS_DIR` when set; otherwise `~/Documents`).

Shipped seeds: `Forth/Resources/{Library,AutoLoad,Docs,Config}`.
