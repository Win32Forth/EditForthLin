#!/usr/bin/env bash
# Build EditForthLin x64 companion + Qt editor.
# Full link of forthx64 requires a Linux ELF toolchain (Mint). On macOS this
# translates, assembles ELF objects, and compile-checks the host C sources.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

echo "EditForthLin build-x64"
echo "  repo: $ROOT"
echo

PYTHON="${PYTHON:-python3}"
NASM="${NASM:-nasm}"
CC="${CC:-cc}"
OBJDIR="Forth/build/x64-linux"
OUTBIN="Forth/build/x64/forthx64"
ASMDIR="Forth/kernel/x64-linux/asm"
HOSTDIR="Forth/host/linux"
INCDIR="Forth/include"

# --- 1. Translate ARM64 → NASM System V ---------------------------------------
"$PYTHON" GrokTools/arm64_to_nasm_sysv.py

# --- 2. Assemble ELF64 objects ------------------------------------------------
if ! command -v "$NASM" >/dev/null 2>&1; then
  echo "error: nasm not found (install with ./scripts/mint-deps.sh or brew install nasm)" >&2
  exit 1
fi

mkdir -p "$OBJDIR" "$(dirname "$OUTBIN")"
ASM_FILES=(
  state emit boot_begin prims prims_k1 prims_k2 prims_k3
  sa_print sa_files sa_float prims_dbg dict entry cold boot_end
)
for name in "${ASM_FILES[@]}"; do
  src="$ASMDIR/$name.asm"
  if compgen -G "$ASMDIR/$name.asm.part*" >/dev/null; then
    src="$OBJDIR/$name.asm"
    cat "$ASMDIR/$name.asm" "$ASMDIR/$name.asm.part"* > "$src"
  fi
  "$NASM" -f elf64 -o "$OBJDIR/$name.o" "$src"
done
"$NASM" -f elf64 -o "$OBJDIR/vmregs.o" Forth/kernel/x64-linux/vmregs.asm
"$NASM" -f elf64 -o "$OBJDIR/identity.o" Forth/kernel/x64-linux/identity.asm
"$NASM" -f elf64 -o "$OBJDIR/find_host.o" Forth/kernel/x64-linux/find_host.asm
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
  "$HOSTDIR/hyper_linux.c"
  "$HOSTDIR/bigint.c"
)

if ! grep -q 'int companion_run' "$HOSTDIR/companion_linux.c"; then
  echo "error: companion_linux.c missing companion_run" >&2
  exit 1
fi

uname_s="$(uname -s)"
if [[ "$uname_s" != "Linux" ]]; then
  echo "Host compile-check on $uname_s (ELF link needs Linux):"
  for src in "${HOST_SRCS[@]}"; do
    obj="/tmp/editforthlin-$(basename "$src" .c).o"
    "$CC" -std=c11 -Wall -Wextra -Wno-unused-parameter -c -I"$INCDIR" -o "$obj" "$src"
    echo "  ok $(basename "$src")"
  done
  cat <<EOF

Kernel objects and host C are ready.
Link forthx64 on Linux Mint:

  ./build-x64.sh

Or copy this tree to Mint and run the same script there.
EOF
  exit 0
fi

HOST_OBJS=()
for src in "${HOST_SRCS[@]}"; do
  base="$(basename "$src" .c)"
  obj="$OBJDIR/host_$base.o"
  "$CC" -std=c11 -Wall -Wextra -Wno-unused-parameter -O2 -c -I"$INCDIR" -o "$obj" "$src"
  HOST_OBJS+=("$obj")
done

ASM_OBJS=()
for name in "${ASM_FILES[@]}" vmregs identity find_host; do
  ASM_OBJS+=("$OBJDIR/$name.o")
done

"$CC" -o "$OUTBIN" "${HOST_OBJS[@]}" "${ASM_OBJS[@]}" -lm -ldl -lpthread
echo "Linked: $OUTBIN"

# Copy kernel sources into Resources for VIEW (like Windows build-x64.bat)
mkdir -p Forth/Resources/Library/Sources/x64-linux
cp -f "$ASMDIR"/*.asm Forth/Resources/Library/Sources/x64-linux/ 2>/dev/null || true
cp -f Forth/kernel/x64-linux/identity.asm Forth/kernel/x64-linux/vmregs.asm \
      Forth/kernel/x64-linux/find_host.asm Forth/Resources/Library/Sources/x64-linux/ 2>/dev/null || true

# --- 4. Qt editor -------------------------------------------------------------
if [[ "${EDITFORTHLIN_SKIP_EDITOR:-0}" == "1" ]]; then
  echo "Skipping Qt editor (EDITFORTHLIN_SKIP_EDITOR=1)"
  exit 0
fi

BUILD_DIR=Edit/build/x64
cmake -S Edit -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release -DEDITFORTH_ARCH=x64
cmake --build "$BUILD_DIR" -j"$(nproc 2>/dev/null || echo 2)"
echo "Built: $BUILD_DIR/editforthlinx64"
