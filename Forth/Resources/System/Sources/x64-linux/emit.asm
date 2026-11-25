; Generated from Forth/kernel/arm64/emit.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
extern _debug_note_byte
extern debug_armed
extern debug_field_count
extern debug_field_len
extern emit_fn
extern numbuf
section .text
global emit_char
global _putchar
global emit_str
global emit_cstr
global emit_i64
global _print_signed
global _print_unsigned
global msg_under
global msg_full
global msg_div0
global msg_huh
_putchar:
global emit_char
emit_char:
    ; sub     sp, sp, #64
    mov rax, rsp
    sub rax, 0x40
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; str     x0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; lea x1, debug_field_count
    lea rax, [rel debug_field_count]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, emit_char_noted
    mov rax, qword [r15+8]
    cmp rax, 0
    je emit_char_noted
    ; lea x2, debug_field_len
    lea rax, [rel debug_field_len]
    mov qword [r15+16], rax
    ; ldr     x3, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; add     x3, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; str     x3, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r15+24]
    mov qword [r10], rax
emit_char_noted:
    ; lea x1, debug_armed
    lea rax, [rel debug_armed]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, emit_char_hook
    mov rax, qword [r15+8]
    cmp rax, 0
    je emit_char_hook
    ; ldr     w0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov eax, dword [r10]
    mov qword [r15+0], rax
    ; bl      _debug_note_byte
    lea rax, [rel xret_1]
    mov qword [r15+240], rax
    jmp _debug_note_byte
    xret_1:
    ; ldr     x0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+0], rax
emit_char_hook:
    ; lea x16, emit_fn
    lea rax, [rel emit_fn]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
    ; cbz     x16, emit_char_skip
    mov rax, qword [r15+128]
    cmp rax, 0
    je emit_char_skip
    ; blr     x16
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
    mov r11, qword [r15+128]
    call r11
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
emit_char_skip:
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
    ; ret
    jmp qword [r15+240]
global emit_str
emit_str:
    ; sub     sp, sp, #80
    mov rax, rsp
    sub rax, 0x50
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
    ; mov     x20, x1
    mov rax, qword [r15+8]
    mov qword [r15+160], rax
emit_str_loop:
    ; cbz     x20, emit_str_done
    mov rax, qword [r15+160]
    cmp rax, 0
    je emit_str_done
    ; ldrb    w0, [x19], #1
    mov r10, qword [r15+152]
    movzx eax, byte [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+152]
    add rax, 1
    mov qword [r15+152], rax
    ; bl      emit_char
    lea rax, [rel xret_2]
    mov qword [r15+240], rax
    jmp emit_char
    xret_2:
    ; sub     x20, x20, #1
    mov rax, qword [r15+160]
    sub rax, 1
    mov qword [r15+160], rax
    ; b       emit_str_loop
    jmp emit_str_loop
emit_str_done:
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #80
    mov rax, rsp
    add rax, 0x50
    mov rsp, rax
    ; ret
    jmp qword [r15+240]
global emit_cstr
emit_cstr:
    ; sub     sp, sp, #80
    mov rax, rsp
    sub rax, 0x50
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
emit_cstr_loop:
    ; ldrb    w0, [x19], #1
    mov r10, qword [r15+152]
    movzx eax, byte [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+152]
    add rax, 1
    mov qword [r15+152], rax
    ; cbz     w0, emit_cstr_done
    mov eax, dword [r15+0]
    cmp rax, 0
    je emit_cstr_done
    ; bl      emit_char
    lea rax, [rel xret_3]
    mov qword [r15+240], rax
    jmp emit_char
    xret_3:
    ; b       emit_cstr_loop
    jmp emit_cstr_loop
emit_cstr_done:
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #80
    mov rax, rsp
    add rax, 0x50
    mov rsp, rax
    ; ret
    jmp qword [r15+240]
_print_signed:
global emit_i64
emit_i64:
    ; sub     sp, sp, #96
    mov rax, rsp
    sub rax, 0x60
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r15+168]
    mov qword [r10+0], rax
    mov rax, qword [r15+176]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
    ; tst     x19, x19
    mov rax, qword [r15+152]
    mov rcx, qword [r15+152]
    test rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.pl    emit_i64_mag
    cmp byte [r15+248], 0
    je emit_i64_mag
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; lsl     x0, x0, #63
    mov rax, qword [r15+0]
    shl rax, 63
    mov qword [r15+0], rax
    ; cmp     x19, x0
    mov rax, qword [r15+152]
    mov rcx, qword [r15+0]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    emit_i64_neg
    cmp byte [r15+249], 0
    je emit_i64_neg
    ; lea x0, msg_min
    lea rax, [rel msg_min]
    mov qword [r15+0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_4]
    mov qword [r15+240], rax
    jmp emit_cstr
    xret_4:
    ; b       emit_i64_done
    jmp emit_i64_done
emit_i64_neg:
    ; mov     x0, #'-'
    mov rax, 0x2d
    mov qword [r15+0], rax
    ; bl      emit_char
    lea rax, [rel xret_5]
    mov qword [r15+240], rax
    jmp emit_char
    xret_5:
    ; neg     x19, x19
    mov rax, qword [r15+152]
    neg rax
    mov qword [r15+152], rax
emit_i64_mag:
    ; lea x20, numbuf
    lea rax, [rel numbuf]
    mov qword [r15+160], rax
    ; add     x20, x20, #32
    mov rax, qword [r15+160]
    add rax, 0x20
    mov qword [r15+160], rax
    ; mov     x21, #10
    mov rax, 0xa
    mov qword [r15+168], rax
emit_i64_digit:
    ; udiv    x2, x19, x21
    mov rax, qword [r15+152]
    mov rcx, qword [r15+168]
    cmp rcx, 0
    je xdiv0_7
    xor rdx, rdx
    div rcx
    jmp xdiv_6
    xdiv0_7:
    xor eax, eax
    xdiv_6:
    mov qword [r15+16], rax
    ; msub    x3, x2, x21, x19
    mov rax, qword [r15+16]
    mov rcx, qword [r15+168]
    imul rax, rcx
    mov rcx, qword [r15+152]
    sub rcx, rax
    mov rax, rcx
    mov qword [r15+24], rax
    ; add     w3, w3, #'0'
    mov eax, dword [r15+24]
    add eax, 0x30
    mov qword [r15+24], rax
    ; sub     x20, x20, #1
    mov rax, qword [r15+160]
    sub rax, 1
    mov qword [r15+160], rax
    ; strb    w3, [x20]
    mov r10, qword [r15+160]
    mov eax, dword [r15+24]
    mov byte [r10], al
    ; mov     x19, x2
    mov rax, qword [r15+16]
    mov qword [r15+152], rax
    ; cbnz    x19, emit_i64_digit
    mov rax, qword [r15+152]
    cmp rax, 0
    jne emit_i64_digit
    ; lea x1, numbuf
    lea rax, [rel numbuf]
    mov qword [r15+8], rax
    ; add     x1, x1, #32
    mov rax, qword [r15+8]
    add rax, 0x20
    mov qword [r15+8], rax
    ; sub     x1, x1, x20
    mov rax, qword [r15+8]
    mov rcx, qword [r15+160]
    sub rax, rcx
    mov qword [r15+8], rax
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; bl      emit_str
    lea rax, [rel xret_8]
    mov qword [r15+240], rax
    jmp emit_str
    xret_8:
emit_i64_done:
    ; ldp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+168], rax
    mov qword [r15+176], rcx
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #96
    mov rax, rsp
    add rax, 0x60
    mov rsp, rax
    ; ret
    jmp qword [r15+240]
global _print_unsigned
_print_unsigned:
    ; sub     sp, sp, #96
    mov rax, rsp
    sub rax, 0x60
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r15+168]
    mov qword [r10+0], rax
    mov rax, qword [r15+176]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
    ; lea x20, numbuf
    lea rax, [rel numbuf]
    mov qword [r15+160], rax
    ; add     x20, x20, #32
    mov rax, qword [r15+160]
    add rax, 0x20
    mov qword [r15+160], rax
    ; mov     x21, #10
    mov rax, 0xa
    mov qword [r15+168], rax
emit_u64_digit:
    ; udiv    x2, x19, x21
    mov rax, qword [r15+152]
    mov rcx, qword [r15+168]
    cmp rcx, 0
    je xdiv0_10
    xor rdx, rdx
    div rcx
    jmp xdiv_9
    xdiv0_10:
    xor eax, eax
    xdiv_9:
    mov qword [r15+16], rax
    ; msub    x3, x2, x21, x19
    mov rax, qword [r15+16]
    mov rcx, qword [r15+168]
    imul rax, rcx
    mov rcx, qword [r15+152]
    sub rcx, rax
    mov rax, rcx
    mov qword [r15+24], rax
    ; add     w3, w3, #'0'
    mov eax, dword [r15+24]
    add eax, 0x30
    mov qword [r15+24], rax
    ; sub     x20, x20, #1
    mov rax, qword [r15+160]
    sub rax, 1
    mov qword [r15+160], rax
    ; strb    w3, [x20]
    mov r10, qword [r15+160]
    mov eax, dword [r15+24]
    mov byte [r10], al
    ; mov     x19, x2
    mov rax, qword [r15+16]
    mov qword [r15+152], rax
    ; cbnz    x19, emit_u64_digit
    mov rax, qword [r15+152]
    cmp rax, 0
    jne emit_u64_digit
    ; lea x1, numbuf
    lea rax, [rel numbuf]
    mov qword [r15+8], rax
    ; add     x1, x1, #32
    mov rax, qword [r15+8]
    add rax, 0x20
    mov qword [r15+8], rax
    ; sub     x1, x1, x20
    mov rax, qword [r15+8]
    mov rcx, qword [r15+160]
    sub rax, rcx
    mov qword [r15+8], rax
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; bl      emit_str
    lea rax, [rel xret_11]
    mov qword [r15+240], rax
    jmp emit_str
    xret_11:
    ; ldp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+168], rax
    mov qword [r15+176], rcx
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #96
    mov rax, rsp
    add rax, 0x60
    mov rsp, rax
    ; ret
    jmp qword [r15+240]
section .rodata
msg_under:
    ; DCB     " stack empty", 10, 0
    db " stack empty", 0xa, 0
msg_full:
    ; DCB     " stack full", 10, 0
    db " stack full", 0xa, 0
msg_div0:
    ; DCB     " divide by zero", 10, 0
    db " divide by zero", 0xa, 0
msg_huh:
    ; DCB     " ?", 10, 0
    db " ?", 0xa, 0
msg_min:
    ; DCB     "-9223372036854775808", 0
    db "-9223372036854775808", 0
