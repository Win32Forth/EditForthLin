; Version and build time for the linux-x64 kernel image.
; NASM source, not produced by the ARM64 translator.

bits 64
default rel

section .rodata

global kernel_version
global kernel_built
global kernel_console

kernel_version: db "0.1.6-x64", 0
align 8
kernel_built: db "Oct 21, 2026 9:23 PM", 0
align 8
kernel_console: db "EditForthLin x64", 0
align 8
