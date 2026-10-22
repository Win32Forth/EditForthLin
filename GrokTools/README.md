# GrokTools

Tools that ship with EditForthLin so a clone can rebuild the x64 kernel.

## arm64_to_nasm_sysv.py (Linux Mint path)

Reads `Forth/kernel/arm64` and writes NASM into `Forth/kernel/x64-linux/asm`.
Those generated files are part of this repository. ARM64 armasm stays the
kernel text. Host calls use the **System V AMD64** ABI (`rdi`, `rsi`, `rdx`,
`rcx`, `r8`, `r9`, then stack). Entry points `kernel_init`, `kernel_eval`,
and the `kernel_set_*` hooks take System V arguments into the virtual
register file.

Hand-written (not produced here):

- `Forth/kernel/x64-linux/identity.asm`
- `Forth/kernel/x64-linux/vmregs.asm`
- `Forth/kernel/x64-linux/find_host.asm`

```bash
python3 GrokTools/arm64_to_nasm_sysv.py
```

Set `EDITFORTHLIN` if the tree is not the parent of `GrokTools`.

## arm64_to_gas_linux.py (Linux arm64 path)

Reads `Forth/kernel/arm64` and writes GNU assembler into
`Forth/kernel/arm64-linux/asm`. Instructions stay ARM64. Host calls use the
Linux AArch64 ABI (`x0`–`x7`), which matches the Windows ARM64 kernel.
`identity.s` is hand-written.

```bash
python3 GrokTools/arm64_to_gas_linux.py
./build-arm64.sh
```

## arm64_to_ml64.py (Windows reference)

Copied from EditForthWin. Emits **ml64** with the **Windows** x64 ABI into
`Forth/kernel/x64/asm`. Kept as the translation reference; not used by
`build-x64.sh` on Linux.
