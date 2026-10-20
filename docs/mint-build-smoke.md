# Mint build and smoke checklist (0.1.0)

Run these on a **Linux Mint x64** machine (or VM) with this tree cloned.

Expected binary: `Forth/build/x64/forthx64`  
Expected banner fragment: `0.1.0-x64` / `EditForthLin x64`

## 0. Get the tree

```bash
git clone https://github.com/Win32Forth/EditForthLin.git
cd EditForthLin
git checkout v0.1.0   # or main
```

## 1. Dependencies

```bash
./scripts/mint-deps.sh
```

Confirm: `nasm -v`, `cmake --version`, `pkg-config --modversion Qt6Widgets` (or Qt6 Core).

## 2. Build

```bash
./build-x64.sh
```

Expect:

- Translate + `nasm -f elf64` for kernel objects under `Forth/build/x64-linux/`
- Compile `Forth/host/linux/*.c`
- Link `Forth/build/x64/forthx64`
- Build Qt editor `Edit/build/x64/editforthlinx64`

Skip the editor if you only want the agent:

```bash
EDITFORTHLIN_SKIP_EDITOR=1 ./build-x64.sh
```

## 3. Agent smoke

```bash
Forth/build/x64/forthx64 --agent -e '2 3 + .'
```

Expect a cold-load / banner, printed `5`, and a clean exit (or return to a prompt if `-e` leaves the REPL — either is fine for a first smoke).

Also try:

```bash
Forth/build/x64/forthx64 --agent
# at the prompt:
2 3 + .
BYE
```

Confirm user tree seeding under `~/Documents/EditForthLin` (`Library`, `AutoLoad`, …).

## 4. Companion smoke (optional for 0.1.0)

```bash
# terminal A
Forth/build/x64/forthx64 --companion EditForthLin-smoke

# terminal B — or start the editor, which uses QLocalSocket on /tmp/EditForthLin-smoke
ls -l /tmp/EditForthLin-smoke
```

Then launch the editor and open a Forth pane:

```bash
Edit/build/x64/editforthlinx64
```

Expect length-prefixed JSON frames (version / cwd / prompt) once `ForthPipe_linux` is finished. Until that editor path is complete, companion bind/accept alone is a useful host check.

## 5. Record results

Note pass/fail for:

| Check | Result |
| --- | --- |
| `mint-deps.sh` | |
| `build-x64.sh` links `forthx64` | |
| `--agent -e '2 3 + .'` | |
| Banner shows `0.1.0-x64` | |
| `~/Documents/EditForthLin` seeded | |
| Editor starts (if built) | |
| Companion socket accepted | |

Open a GitHub issue or comment on the `v0.1.0` release with the table if anything fails.
