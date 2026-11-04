# Start a translated x64 64EMIT02 image. Public domain.
# System V: rdi = dsp, rsi = return stack, rdx = colon CFA,
#           rcx = exit xt, r8 = register file.
# The image addresses arm_xN through that file and uses the real RSP.
# RSP is 8 mod 16 on entry to the image, so its CALL into a host
# function arrives 0 mod 16.

    .section .note.GNU-stack,"",@progbits
    .text
    .globl run_itc_x64
    .type run_itc_x64, @function
run_itc_x64:
    push %rbx
    push %rbp
    push %r12
    push %r13
    push %r14
    push %r15
    movq %rdi, 176(%r8)
    movq %rsi, 184(%r8)
    movq %rdx, 168(%r8)
    movq $0, 160(%r8)
    movq $0, 224(%r8)
    movq 184(%r8), %rax
    subq $8, %rax
    movq %rax, 184(%r8)
    leaq .Lback(%rip), %r11
    movq %r11, (%rax)
    movq 184(%r8), %rax
    subq $8, %rax
    movq %rax, 184(%r8)
    movq %rcx, (%rax)
    leaq 8(%rdx), %rax
    movq %rax, 152(%r8)
    movq (%rax), %r11
    addq $8, %rax
    movq %rax, 152(%r8)
    movq %r11, 168(%r8)
    movq (%r11), %rax
    jmpq *%rax
.Lback:
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    pop %rbp
    pop %rbx
    ret
    .size run_itc_x64, .-run_itc_x64
