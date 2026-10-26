// Version and build time for the linux-arm64 kernel image.
// Hand-written GAS. Not produced by arm64_to_gas_linux.py.

.section .rodata, "a", %progbits
.balign 8

.global kernel_version
.global kernel_built
.global kernel_console

kernel_version:
    .ascii "2.5.6.2"
    .byte 0
    .balign 8
kernel_built:
    .ascii "Oct 26, 2026 5:33 PM"
    .byte 0
    .balign 8
kernel_console:
    .ascii "EditForthLin arm64"
    .byte 0
    .balign 8

.section .note.GNU-stack, "", %progbits
