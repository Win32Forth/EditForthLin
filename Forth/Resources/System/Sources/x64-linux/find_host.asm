; C-callable wrapper for the translated _find_word (System V AMD64).
; Public domain.
;
; This thread's x0..x30 and NZCV live in the TLS file from arm_load_base.
; r15 holds that base while translated code runs. Save the file, pass
; rdi/rsi in, return through arm_x30, restore the file, and return the
; CFA in rax. save_arm is process-global, the same limit as the Windows
; wrapper: one host_find_word at a time.

bits 64
default rel

extern arm_load_base
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
    push r15
    mov rbx, rdi
    mov r12, rsi
    call arm_load_base
    mov r15, rax
    lea rsi, [r15]
    lea rdi, [rel save_arm]
    mov rcx, 31
    rep movsq
    mov al, [r15+248]
    mov [rel save_n], al
    mov al, [r15+249]
    mov [rel save_z], al
    mov al, [r15+250]
    mov [rel save_c], al
    mov al, [r15+251]
    mov [rel save_v], al
    mov qword [r15], rbx
    mov qword [r15+8], r12
    lea rax, [rel host_find_back]
    mov qword [r15+240], rax
    jmp _find_word

host_find_back:
    mov rbx, qword [r15]
    lea rsi, [rel save_arm]
    lea rdi, [r15]
    mov rcx, 31
    rep movsq
    mov al, [rel save_n]
    mov [r15+248], al
    mov al, [rel save_z]
    mov [r15+249], al
    mov al, [rel save_c]
    mov [r15+250], al
    mov al, [rel save_v]
    mov [r15+251], al
    mov rax, rbx
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    ret
