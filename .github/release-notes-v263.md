# EditForthLin 2.6.3

Linux port of EditForthWin 2.6.3. The installers are attached as `editforthlin_2.6.3_amd64.deb` and `editforthlin_2.6.3_arm64.deb`. There is no AppImage.

This tag is commit `@SHA@`.

## Install the amd64 package

This package is for Ubuntu 24.04 and Linux Mint 22 on x86_64. It was built on Linux Mint 22.3. It uses the system Qt 6. `sudo apt install` downloads the libraries in `Depends`: `libc6`, `libgcc-s1`, `libstdc++6`, `libqt6core6t64`, `libqt6gui6t64`, `libqt6network6t64`, `libqt6widgets6t64`, `qt6-qpa-plugins`, `libgl1`, and `libxkbcommon0`. `dpkg -i` does not download those libraries. The package does not include cmake, nasm, or the other build tools.

```bash
sudo apt install ./editforthlin_2.6.3_amd64.deb
```

That puts the editor and `forthx64` in `/opt/editforthlin`, adds a menu entry, and links `/usr/bin/editforthlin`. The first run creates `~/Documents/EditForthLin`. The menu icon is the generic `text-editor` icon.

## Install the arm64 package

This package is for Ubuntu 24.04 and Linux Mint 22 on aarch64. It was built on Ubuntu 24.04.5 LTS. It uses the same kind of `Depends`, and `sudo apt install` downloads them.

```bash
sudo apt install ./editforthlin_2.6.3_arm64.deb
```

That puts the editor and `fortharm64` in `/opt/editforthlin`, adds a menu entry, and links `/usr/bin/editforthlin`. The first run creates `~/Documents/EditForthLin`.

## Build

```bash
git clone https://github.com/Win32Forth/EditForthLin.git
cd EditForthLin
git checkout v2.6.3
bash scripts/mint-deps.sh
```

On Linux x86_64:

```bash
bash build-x64.sh
./Edit/build/x64/editforthlinx64
Forth/build/x64/forthx64 --agent -e '2 3 + .'
```

On Linux aarch64:

```bash
bash build-arm64.sh
./Edit/build/arm64/editforthlinarm64
Forth/build/arm64/fortharm64 --agent -e '2 3 + .'
```

Packages and the rest of the steps are in `INSTALLER.md` at this tag.

## What changed

`.S` prints the real stack depth. An empty stack is `( 0 )`. Assembler, AutoLoad, Debugger, Emitter, Hyper, Reference, Sources, and Testing live in `System`. Library keeps the samples, including Forth1968CM.

The debug bar has Restart. RUN uses a real selection. With nothing selected, RUN uses the last definition in the file just included. A debug highlight uses the file span when the buffer is clean. `PAUSE` is a boot word. The companion sends each finished line as it is produced, and Return while Forth is running is delivered to `KEY`.

The x64 kernel and editor were built on Linux Mint 22.3. `forthx64 --agent -e '2 3 + .'` printed `5` and exited 0. The arm64 kernel and editor were rebuilt on Ubuntu 24.04.5. Hayes and ANS-VALIDATE were not run for this 2.6.3 build.

Kernel banner:

```
=== EditForthLin 2.6.3 === Nov 3, 2026 12:03 PM ===
```

Still open: the in-process GRAPHICS host, Ask Forth key storage on Linux, Hayes / ANS-VALIDATE on this 2.6.3 build, and an AppImage.
