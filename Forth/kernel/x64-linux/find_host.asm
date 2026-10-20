; C-callable wrapper for the translated _find_word (System V AMD64).
; Public domain.
;
; Same role as Forth/kernel/x64/find_host.asm on Windows: save the virtual
; register file, pass rdi/rsi into arm_x0/arm_x1, return through a local
; arm_x30, restore the file, and return the CFA in rax.

bits 64
default rel

extern arm_x0
extern arm_x1
extern arm_x30
extern arm_n
extern arm_z
extern arm_c
extern arm_v
extern _find_word

section .data

save_arm: times 31 dq 0
save_n:   db 0
save_z:   db 0
save_c:   db 0
save_v:   db 0

section .text

global host_find_word
host_find_word:
    push rbx
    push r12
    push r13
    push r14
    ; System V args
    mov rbx, rdi
    mov r12, rsi
    ; save arm_x0..arm_x30
    lea rsi, [rel arm_x0]
    lea rdi, [rel save_arm]
    mov rcx, 31
    rep movsq
    mov al, [rel arm_n]
    mov [rel save_n], al
    mov al, [rel arm_z]
    mov [rel save_z], al
    mov al, [rel arm_c]
    mov [rel save_c], al
    mov al, [rel arm_v]
    mov [rel save_v], al
    mov [rel arm_x0], rbx
    mov [rel arm_x1], r12
    lea rax, [rel host_find_back]
    mov [rel arm_x30], rax
    jmp _find_word

host_find_back:
    mov rbx, [rel arm_x0]
    lea rsi, [rel save_arm]
    lea rdi, [rel arm_x0]
    mov rcx, 31
    rep movsq
    mov al, [rel save_n]
    mov [rel arm_n], al
    mov al, [rel save_z]
    mov [rel arm_z], al
    mov al, [rel save_c]
    mov [rel arm_c], al
    mov al, [rel save_v]
    mov [rel arm_v], al
    mov rax, rbx
    pop r14
    pop r13
    pop r12
    pop rbx
    ret
