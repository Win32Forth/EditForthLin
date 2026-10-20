; Generated from Forth/kernel/arm64/emit.asm. Do not edit.
bits 64
default rel
extern arm_x0
extern arm_x1
extern arm_x2
extern arm_x3
extern arm_x4
extern arm_x5
extern arm_x6
extern arm_x7
extern arm_x8
extern arm_x9
extern arm_x10
extern arm_x11
extern arm_x12
extern arm_x13
extern arm_x14
extern arm_x15
extern arm_x16
extern arm_x17
extern arm_x18
extern arm_x19
extern arm_x20
extern arm_x21
extern arm_x22
extern arm_x23
extern arm_x24
extern arm_x25
extern arm_x26
extern arm_x27
extern arm_x28
extern arm_x29
extern arm_x30
extern arm_n
extern arm_z
extern arm_c
extern arm_v
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
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; str     x0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x1, debug_field_count
    lea rax, [rel debug_field_count]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, emit_char_noted
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je emit_char_noted
    ; lea x2, debug_field_len
    lea rax, [rel debug_field_len]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
emit_char_noted:
    ; lea x1, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, emit_char_hook
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je emit_char_hook
    ; ldr     w0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov eax, dword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _debug_note_byte
    lea rax, [rel xret_1]
    mov qword [rel arm_x30], rax
    jmp _debug_note_byte
    xret_1:
    ; ldr     x0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
emit_char_hook:
    ; lea x16, emit_fn
    lea rax, [rel emit_fn]
    mov qword [rel arm_x16], rax
    ; ldr     x16, [x16]
    mov r10, qword [rel arm_x16]
    mov rax, qword [r10]
    mov qword [rel arm_x16], rax
    ; cbz     x16, emit_char_skip
    mov rax, qword [rel arm_x16]
    cmp rax, 0
    je emit_char_skip
    ; blr     x16
    push rbx
    mov rbx, rsp
    and rsp, -16
    sub rsp, 32
    mov rdi, qword [rel arm_x0]
    mov rsi, qword [rel arm_x1]
    mov rdx, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    mov r8, qword [rel arm_x4]
    mov r9, qword [rel arm_x5]
    mov rax, qword [rel arm_x6]
    mov qword [rsp], rax
    mov rax, qword [rel arm_x7]
    mov qword [rsp+8], rax
    mov rax, qword [rbx+8]
    mov qword [rsp+16], rax
    mov r11, qword [rel arm_x16]
    call r11
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
emit_char_skip:
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
    ; ret
    jmp qword [rel arm_x30]
global emit_str
emit_str:
    ; sub     sp, sp, #80
    mov rax, rsp
    sub rax, 0x50
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
emit_str_loop:
    ; cbz     x20, emit_str_done
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    je emit_str_done
    ; ldrb    w0, [x19], #1
    mov r10, qword [rel arm_x19]
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; bl      emit_char
    lea rax, [rel xret_2]
    mov qword [rel arm_x30], rax
    jmp emit_char
    xret_2:
    ; sub     x20, x20, #1
    mov rax, qword [rel arm_x20]
    sub rax, 1
    mov qword [rel arm_x20], rax
    ; b       emit_str_loop
    jmp emit_str_loop
emit_str_done:
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #80
    mov rax, rsp
    add rax, 0x50
    mov rsp, rax
    ; ret
    jmp qword [rel arm_x30]
global emit_cstr
emit_cstr:
    ; sub     sp, sp, #80
    mov rax, rsp
    sub rax, 0x50
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
emit_cstr_loop:
    ; ldrb    w0, [x19], #1
    mov r10, qword [rel arm_x19]
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; cbz     w0, emit_cstr_done
    mov eax, dword [rel arm_x0]
    cmp rax, 0
    je emit_cstr_done
    ; bl      emit_char
    lea rax, [rel xret_3]
    mov qword [rel arm_x30], rax
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
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #80
    mov rax, rsp
    add rax, 0x50
    mov rsp, rax
    ; ret
    jmp qword [rel arm_x30]
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
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
    ; tst     x19, x19
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x19]
    test rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.pl    emit_i64_mag
    cmp byte [rel arm_n], 0
    je emit_i64_mag
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; lsl     x0, x0, #63
    mov rax, qword [rel arm_x0]
    shl rax, 63
    mov qword [rel arm_x0], rax
    ; cmp     x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    emit_i64_neg
    cmp byte [rel arm_z], 0
    je emit_i64_neg
    ; lea x0, msg_min
    lea rax, [rel msg_min]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_4]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_4:
    ; b       emit_i64_done
    jmp emit_i64_done
emit_i64_neg:
    ; mov     x0, #'-'
    mov rax, 0x2d
    mov qword [rel arm_x0], rax
    ; bl      emit_char
    lea rax, [rel xret_5]
    mov qword [rel arm_x30], rax
    jmp emit_char
    xret_5:
    ; neg     x19, x19
    mov rax, qword [rel arm_x19]
    neg rax
    mov qword [rel arm_x19], rax
emit_i64_mag:
    ; lea x20, numbuf
    lea rax, [rel numbuf]
    mov qword [rel arm_x20], rax
    ; add     x20, x20, #32
    mov rax, qword [rel arm_x20]
    add rax, 0x20
    mov qword [rel arm_x20], rax
    ; mov     x21, #10
    mov rax, 0xa
    mov qword [rel arm_x21], rax
emit_i64_digit:
    ; udiv    x2, x19, x21
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x21]
    cmp rcx, 0
    je xdiv0_7
    xor rdx, rdx
    div rcx
    jmp xdiv_6
    xdiv0_7:
    xor eax, eax
    xdiv_6:
    mov qword [rel arm_x2], rax
    ; msub    x3, x2, x21, x19
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x21]
    imul rax, rcx
    mov rcx, qword [rel arm_x19]
    sub rcx, rax
    mov rax, rcx
    mov qword [rel arm_x3], rax
    ; add     w3, w3, #'0'
    mov eax, dword [rel arm_x3]
    add eax, 0x30
    mov qword [rel arm_x3], rax
    ; sub     x20, x20, #1
    mov rax, qword [rel arm_x20]
    sub rax, 1
    mov qword [rel arm_x20], rax
    ; strb    w3, [x20]
    mov r10, qword [rel arm_x20]
    mov eax, dword [rel arm_x3]
    mov byte [r10], al
    ; mov     x19, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x19], rax
    ; cbnz    x19, emit_i64_digit
    mov rax, qword [rel arm_x19]
    cmp rax, 0
    jne emit_i64_digit
    ; lea x1, numbuf
    lea rax, [rel numbuf]
    mov qword [rel arm_x1], rax
    ; add     x1, x1, #32
    mov rax, qword [rel arm_x1]
    add rax, 0x20
    mov qword [rel arm_x1], rax
    ; sub     x1, x1, x20
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      emit_str
    lea rax, [rel xret_8]
    mov qword [rel arm_x30], rax
    jmp emit_str
    xret_8:
emit_i64_done:
    ; ldp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #96
    mov rax, rsp
    add rax, 0x60
    mov rsp, rax
    ; ret
    jmp qword [rel arm_x30]
global _print_unsigned
_print_unsigned:
    ; sub     sp, sp, #96
    mov rax, rsp
    sub rax, 0x60
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
    ; lea x20, numbuf
    lea rax, [rel numbuf]
    mov qword [rel arm_x20], rax
    ; add     x20, x20, #32
    mov rax, qword [rel arm_x20]
    add rax, 0x20
    mov qword [rel arm_x20], rax
    ; mov     x21, #10
    mov rax, 0xa
    mov qword [rel arm_x21], rax
emit_u64_digit:
    ; udiv    x2, x19, x21
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x21]
    cmp rcx, 0
    je xdiv0_10
    xor rdx, rdx
    div rcx
    jmp xdiv_9
    xdiv0_10:
    xor eax, eax
    xdiv_9:
    mov qword [rel arm_x2], rax
    ; msub    x3, x2, x21, x19
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x21]
    imul rax, rcx
    mov rcx, qword [rel arm_x19]
    sub rcx, rax
    mov rax, rcx
    mov qword [rel arm_x3], rax
    ; add     w3, w3, #'0'
    mov eax, dword [rel arm_x3]
    add eax, 0x30
    mov qword [rel arm_x3], rax
    ; sub     x20, x20, #1
    mov rax, qword [rel arm_x20]
    sub rax, 1
    mov qword [rel arm_x20], rax
    ; strb    w3, [x20]
    mov r10, qword [rel arm_x20]
    mov eax, dword [rel arm_x3]
    mov byte [r10], al
    ; mov     x19, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x19], rax
    ; cbnz    x19, emit_u64_digit
    mov rax, qword [rel arm_x19]
    cmp rax, 0
    jne emit_u64_digit
    ; lea x1, numbuf
    lea rax, [rel numbuf]
    mov qword [rel arm_x1], rax
    ; add     x1, x1, #32
    mov rax, qword [rel arm_x1]
    add rax, 0x20
    mov qword [rel arm_x1], rax
    ; sub     x1, x1, x20
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      emit_str
    lea rax, [rel xret_11]
    mov qword [rel arm_x30], rax
    jmp emit_str
    xret_11:
    ; ldp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #96
    mov rax, rsp
    add rax, 0x60
    mov rsp, rax
    ; ret
    jmp qword [rel arm_x30]
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
