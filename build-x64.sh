#!/usr/bin/env bash
# Build EditForthLin x64 companion + Qt editor on Linux Mint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

echo "EditForthLin build-x64"
echo "  repo: $ROOT"
echo

PYTHON="${PYTHON:-python3}"
NASM="${NASM:-nasm}"
OBJDIR="Forth/build/x64-linux"
ASMDIR="Forth/kernel/x64-linux/asm"

# --- 1. Translate ARM64 → NASM System V ---------------------------------------
"$PYTHON" GrokTools/arm64_to_nasm_sysv.py

# --- 2. Assemble ELF64 objects ------------------------------------------------
if ! command -v "$NASM" >/dev/null 2>&1; then
  echo "error: nasm not found (install with ./scripts/mint-deps.sh or brew install nasm)" >&2
  exit 1
fi

mkdir -p "$OBJDIR"
ASM_FILES=(
  state emit boot_begin prims prims_k1 prims_k2 prims_k3
  sa_print sa_files sa_float prims_dbg dict entry cold boot_end
)
for name in "${ASM_FILES[@]}"; do
  "$NASM" -f elf64 -o "$OBJDIR/$name.o" "$ASMDIR/$name.asm"
done
"$NASM" -f elf64 -o "$OBJDIR/vmregs.o" Forth/kernel/x64-linux/vmregs.asm
"$NASM" -f elf64 -o "$OBJDIR/identity.o" Forth/kernel/x64-linux/identity.asm
"$NASM" -f elf64 -o "$OBJDIR/find_host.o" Forth/kernel/x64-linux/find_host.asm
echo "Assembled $(ls "$OBJDIR"/*.o | wc -l | tr -d ' ') objects in $OBJDIR"

# --- 3. Link Forth companion (needs Linux host) -------------------------------
if [[ ! -f Forth/host/linux/companion_linux.c ]]; then
  echo "error: Forth/host/linux stubs missing" >&2
  exit 1
fi

# Detect a real (non-stub) companion by looking for companion_run.
if ! grep -q 'companion_run' Forth/host/linux/companion_linux.c 2>/dev/null; then
  cat <<'EOF' >&2
Kernel objects are ready. Forth companion link is not ready yet.

Missing: real Forth/host/linux/* (companion_linux, main_linux, …).
See PORT.md and docs/linux-host.md.

Qt editor (once Qt 6 is installed):
  cmake -S Edit -B Edit/build/x64 -DCMAKE_BUILD_TYPE=Release -DEDITFORTH_ARCH=x64
  cmake --build Edit/build/x64 -j"$(nproc 2>/dev/null || sysctl -n hw.ncpu)"
EOF
  exit 2
fi

# Planned link line (placeholder once host lands):
# cc -o Forth/build/x64/forthx64 \
#   Forth/host/linux/*.c "$OBJDIR"/*.o -lm -ldl -lpthread

# --- 4. Qt editor -------------------------------------------------------------
BUILD_DIR=Edit/build/x64
cmake -S Edit -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release -DEDITFORTH_ARCH=x64
cmake --build "$BUILD_DIR" -j"$(nproc 2>/dev/null || sysctl -n hw.ncpu)"
echo "Built: $BUILD_DIR/editforthlinx64"
