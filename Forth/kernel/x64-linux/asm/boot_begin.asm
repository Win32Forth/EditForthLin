; Generated from Forth/kernel/arm64/boot_begin.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
section .bootptr align=8
global bootptr_start
bootptr_start:
