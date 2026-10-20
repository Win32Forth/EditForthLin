#!/usr/bin/env bash
# Build EditForthLin x64 companion + Qt editor on Linux Mint.
# Status: scaffold — exits until the System V kernel and linux host link.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

echo "EditForthLin build-x64 (scaffold)"
echo "  repo: $ROOT"
echo

if [[ ! -f Forth/host/linux/companion_linux.c ]]; then
  echo "error: Forth/host/linux stubs missing" >&2
  exit 1
fi

# --- Forth companion (not ready) ------------------------------------------------
# Planned steps:
#   1. python3 GrokTools/arm64_to_nasm_sysv.py   # or successor translator
#   2. nasm -f elf64 … → Forth/build/x64/*.o
#   3. cc -o Forth/build/x64/forthx64 Forth/host/linux/*.c … *.o -lm -ldl
#
# Windows reference: build-x64.bat (ml64 + Win ABI + *_win.c).

if [[ ! -x Forth/build/x64/forthx64 ]]; then
  cat <<'EOF' >&2
Forth companion is not built yet.

Missing pieces (see PORT.md):
  - System V x64 translator from Forth/kernel/arm64
  - Linked Forth/host/linux/* host
  - ELF output Forth/build/x64/forthx64

The Qt editor half can still be configured once Qt 6 is installed:
  cmake -S Edit -B Edit/build/x64 -DCMAKE_BUILD_TYPE=Release -DEDITFORTH_ARCH=x64
  cmake --build Edit/build/x64 -j"$(nproc)"

Install packages with: ./scripts/mint-deps.sh
EOF
  exit 2
fi

# --- Qt editor ------------------------------------------------------------------
BUILD_DIR=Edit/build/x64
cmake -S Edit -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release -DEDITFORTH_ARCH=x64
cmake --build "$BUILD_DIR" -j"$(nproc)"
echo "Built: $BUILD_DIR/editforthlinx64"
