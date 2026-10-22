#!/usr/bin/env bash
# Build EditForthLin arm64 companion + Qt editor.
# Native AArch64. The ARM64 armasm kernel is translated to GNU as, then
# linked with Forth/host/linux. x64 builds stay on ./build-x64.sh.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

echo "EditForthLin build-arm64"
echo "  repo: $ROOT"
echo

PYTHON="${PYTHON:-python3}"
CC="${CC:-cc}"
OBJDIR="Forth/build/arm64-linux"
OUTBIN="Forth/build/arm64/fortharm64"
ASMDIR="Forth/kernel/arm64-linux/asm"
HOSTDIR="Forth/host/linux"
INCDIR="Forth/include"

arch="$(uname -m)"
if [[ "$arch" != "aarch64" && "$arch" != "arm64" ]]; then
  echo "error: build-arm64.sh needs aarch64 (this host is $arch). Use ./build-x64.sh on x86_64." >&2
  exit 1
fi

# --- 1. Translate ARM64 armasm → GNU as ---------------------------------------
"$PYTHON" GrokTools/arm64_to_gas_linux.py

# --- 2. Assemble ELF objects --------------------------------------------------
mkdir -p "$OBJDIR" "$(dirname "$OUTBIN")"
ASM_FILES=(
  state emit boot_begin prims prims_k1 prims_k2 prims_k3
  sa_print sa_files sa_float prims_dbg dict entry cold boot_end
)
for name in "${ASM_FILES[@]}"; do
  "$CC" -c -o "$OBJDIR/$name.o" "$ASMDIR/$name.s"
done
"$CC" -c -o "$OBJDIR/identity.o" Forth/kernel/arm64-linux/identity.s
echo "Assembled $(ls "$OBJDIR"/*.o | wc -l | tr -d ' ') objects in $OBJDIR"

# --- 3. Compile Linux host ----------------------------------------------------
HOST_SRCS=(
  "$HOSTDIR/main_linux.c"
  "$HOSTDIR/console_linux.c"
  "$HOSTDIR/companion_linux.c"
  "$HOSTDIR/float_linux.c"
  "$HOSTDIR/exec_linux.c"
  "$HOSTDIR/facility_linux.c"
  "$HOSTDIR/debug_linux.c"
  "$HOSTDIR/gfx_linux.c"
  "$HOSTDIR/bigint.c"
)

if ! grep -q 'int companion_run' "$HOSTDIR/companion_linux.c"; then
  echo "error: companion_linux.c missing companion_run" >&2
  exit 1
fi

HOST_OBJS=()
for src in "${HOST_SRCS[@]}"; do
  base="$(basename "$src" .c)"
  obj="$OBJDIR/host_$base.o"
  "$CC" -std=c11 -Wall -Wextra -Wno-unused-parameter -O2 -c -I"$INCDIR" -o "$obj" "$src"
  HOST_OBJS+=("$obj")
done

ASM_OBJS=()
for name in "${ASM_FILES[@]}" identity; do
  ASM_OBJS+=("$OBJDIR/$name.o")
done

"$CC" -o "$OUTBIN" "${HOST_OBJS[@]}" "${ASM_OBJS[@]}" -lm -ldl -lpthread
echo "Linked: $OUTBIN"

mkdir -p Forth/Resources/Library/Sources/arm64
cp -f Forth/kernel/arm64/*.asm Forth/kernel/arm64/*.inc Forth/Resources/Library/Sources/arm64/

# --- 4. Qt editor -------------------------------------------------------------
if [[ "${EDITFORTHLIN_SKIP_EDITOR:-0}" == "1" ]]; then
  echo "Skipping Qt editor (EDITFORTHLIN_SKIP_EDITOR=1)"
  exit 0
fi

BUILD_DIR=Edit/build/arm64
cmake -S Edit -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release -DEDITFORTH_ARCH=arm64
cmake --build "$BUILD_DIR" -j"$(nproc 2>/dev/null || echo 2)"
echo "Built: $BUILD_DIR/editforthlinarm64"
