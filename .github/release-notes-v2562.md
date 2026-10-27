# EditForthLin 2.5.6.2

Source release for Linux x64 and native arm64. The arm64 installer is attached as `editforthlin_2.5.6.2_arm64.deb`. There is no amd64 `.deb` in this release yet, and no AppImage.

This tag is commit `c155c99e826139e7e3b49faeb9dd31992364fc1d`.

## Install the arm64 package

This package is for Ubuntu 24.04 and Linux Mint 22 on aarch64. It uses the system Qt 6. It depends on `libqt6widgets6t64`, `libqt6gui6t64`, `libqt6core6t64`, `libqt6network6t64`, `libgl1`, and `libxkbcommon0`.

```bash
sudo apt install ./editforthlin_2.5.6.2_arm64.deb
```

That puts the editor and `fortharm64` in `/opt/editforthlin`, adds a menu entry, and links `/usr/bin/editforthlin`. The first run creates `~/Documents/EditForthLin`. The menu icon is the generic `text-editor` icon. This package was built on Ubuntu 24.04.5.

## Build

```bash
git clone https://github.com/Win32Forth/EditForthLin.git
cd EditForthLin
git checkout v2.5.6.2
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

Packages and the rest of the steps are in `INSTALLER.md` at this tag. The first run creates `~/Documents/EditForthLin`.

## What changed

Bare `CHDIR` opens a directory dialog, starting in the current directory. Choosing a folder changes to it. Cancel leaves the directory as it is. `CHDIR` with a path still changes directory and does not open a dialog.

The x64 kernel and editor were rebuilt on Linux Mint. The companion socket was checked for a chosen folder, a cancel, and `CHDIR "/tmp"`. arm64 uses the same sources and was not rebuilt on that host. Hayes and ANS-VALIDATE were not run.

Kernel banner:

```
=== EditForthLin 2.5.6.2 === Oct 26, 2026 5:33 PM ===
```

Still open: the in-process GRAPHICS host, Ask Forth key storage on Linux, Hayes / ANS-VALIDATE on x64, an amd64 `.deb`, and an AppImage.
