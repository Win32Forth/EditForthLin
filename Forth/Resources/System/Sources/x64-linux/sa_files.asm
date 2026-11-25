; Generated from Forth/kernel/arm64/sa_files.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
extern file_op_hook
extern sa_win_file_op
section .text
global _file_op_call
section .bwstr align=1
nm_SA_FILES:
    ; DCB "(SA-FILES)", 0
    db "(SA-FILES)", 0
hl_SA_FILES:
    ; DCB "(SA-FILES) ( -- ) stand-alone file runtime block", 0
    db "(SA-FILES) ( -- ) stand-alone file runtime block", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_SA_FILES:
    ; DCQ     nm_SA_FILES, hl_SA_FILES
    dq nm_SA_FILES, hl_SA_FILES
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     SA_FILES, SA_FILES_END
    dq SA_FILES, SA_FILES_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_SA_FILES
    dq row_SA_FILES
section .text
section .bwstr align=1
nm_XFILE_OP_CALL:
    ; DCB "(FILE-OP-CALL)", 0
    db "(FILE-OP-CALL)", 0
hl_XFILE_OP_CALL:
    ; DCB "(FILE-OP-CALL) ( -- ) file op multiplex", 0
    db "(FILE-OP-CALL) ( -- ) file op multiplex", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFILE_OP_CALL:
    ; DCQ     nm_XFILE_OP_CALL, hl_XFILE_OP_CALL
    dq nm_XFILE_OP_CALL, hl_XFILE_OP_CALL
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     XFILE_OP_CALL, XFILE_OP_CALL_END
    dq XFILE_OP_CALL, XFILE_OP_CALL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFILE_OP_CALL
    dq row_XFILE_OP_CALL
section .text
SA_FILES:
XFILE_OP_CALL:
_file_op_call:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [r15+232], rax
    ; adr     x9, sa_files_hook_ptr
    lea rax, [rel sa_files_hook_ptr]
    mov qword [r15+72], rax
    ; ldr     x9, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+72], rax
    ; cbnz    x9, _sfc_have
    mov rax, qword [r15+72]
    cmp rax, 0
    jne _sfc_have
    ; lea x9, file_op_hook
    lea rax, [rel file_op_hook]
    mov qword [r15+72], rax
_sfc_have:
    ; ldr     x9, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+72], rax
    ; cbz     x9, _sfc_win
    mov rax, qword [r15+72]
    cmp rax, 0
    je _sfc_win
    ; b       _sfc_call
    jmp _sfc_call
_sfc_win:
    ; adr     x9, sa_win_file_op_ptr
    lea rax, [rel sa_win_file_op_ptr]
    mov qword [r15+72], rax
    ; ldr     x9, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+72], rax
    ; cbz     x9, _sfc_none
    mov rax, qword [r15+72]
    cmp rax, 0
    je _sfc_none
_sfc_call:
    ; sub     sp, sp, #64
    mov rax, rsp
    sub rax, 0x40
    mov rsp, rax
    ; add     x6, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov qword [r15+48], rax
    ; add     x7, sp, #24
    mov rax, rsp
    add rax, 0x18
    mov qword [r15+56], rax
    ; add     x8, sp, #32
    mov rax, rsp
    add rax, 0x20
    mov qword [r15+64], rax
    ; str     xzr, [x6]
    mov r10, qword [r15+48]
    mov qword [r10], 0
    ; str     xzr, [x7]
    mov r10, qword [r15+56]
    mov qword [r10], 0
    ; str     xzr, [x8]
    mov r10, qword [r15+64]
    mov qword [r10], 0
    ; str     x8, [sp]
    lea r10, [rsp]
    mov rax, qword [r15+64]
    mov qword [r10], rax
    ; blr     x9
    push rbx
    mov rbx, rsp
    and rsp, -16
    sub rsp, 32
    mov rdi, qword [r15+0]
    mov rsi, qword [r15+8]
    mov rdx, qword [r15+16]
    mov rcx, qword [r15+24]
    mov r8, qword [r15+32]
    mov r9, qword [r15+40]
    mov rax, qword [r15+48]
    mov qword [rsp], rax
    mov rax, qword [r15+56]
    mov qword [rsp+8], rax
    mov rax, qword [rbx+8]
    mov qword [rsp+16], rax
    mov r11, qword [r15+72]
    call r11
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x6, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; ldr     x7, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+56], rax
    ; ldr     x8, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov qword [r15+64], rax
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_sfc_none:
    ; mov     x0, #-1
    mov rax, -1
    mov qword [r15+0], rax
    ; mov     x6, #0
    mov rax, 0
    mov qword [r15+48], rax
    ; mov     x7, #0
    mov rax, 0
    mov qword [r15+56], rax
    ; mov     x8, #0
    mov rax, 0
    mov qword [r15+64], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
XFILE_OP_CALL_END:
    ; ALIGN 8
align 8
sa_win_file_op_ptr:
    ; DCQ     sa_win_file_op
    dq sa_win_file_op
sa_files_hook_ptr:
    ; DCQ     0
    dq 0
sa_files_zero_cell:
    ; DCQ     0
    dq 0
sa_files_pool_pad0:
    ; DCQ     0
    dq 0
sa_files_pool_pad1:
    ; DCQ     0
    dq 0
SA_FILES_END:
