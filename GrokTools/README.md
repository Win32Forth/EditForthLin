# GrokTools

Tools that ship with EditForthLin so a clone can rebuild the x64 kernel.

## arm64_to_ml64.py (Windows reference)

Copied from EditForthWin. Reads `Forth/kernel/arm64` and writes **ml64** into
`Forth/kernel/x64/asm` using the **Windows x64 ABI**. Useful as the translation
reference. It is not the Mint build path.

## Planned: System V / NASM translator

Linux Mint x64 needs a sibling translator (working name
`arm64_to_nasm_sysv.py`) that:

- Reads the same `Forth/kernel/arm64` sources
- Emits NASM (or GAS) for **System V AMD64** host calls
- Writes into something like `Forth/kernel/x64-linux/asm/` (exact path TBD)

Hand-written pieces will mirror Windows: `identity`, `vmregs`, and
`find_host` for the register-file VM.

Until that script exists, `./build-x64.sh` stops before assembling the kernel.
See `PORT.md`.

## Environment

`EDITFORTHLIN` may override the default tree path once the Linux translator
lands (same idea as `EDITFORTHWIN` for the Windows script).
