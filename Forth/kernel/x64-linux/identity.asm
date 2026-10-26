; Version and build time for the linux-x64 kernel image.
; NASM source, not produced by the ARM64 translator.

bits 64
default rel

section .rodata

global kernel_version
global kernel_built
global kernel_console

kernel_version: db "2.5.6.2", 0
align 8
kernel_built: db "Oct 26, 2026 5:33 PM", 0
align 8
kernel_console: db "EditForthLin x64", 0
align 8
