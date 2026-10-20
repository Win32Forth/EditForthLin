; Generated from Forth/kernel/arm64/sa_print.asm. Do not edit.
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
extern base_var
extern emit_fn
extern sa_win_putchar
section .text
global _sa_putchar
global _sa_print_signed
global _sa_print_unsigned
section .bwstr align=1
nm_SA_PRINT:
    ; DCB "(SA-PRINT)", 0
    db "(SA-PRINT)", 0
hl_SA_PRINT:
    ; DCB "(SA-PRINT) ( -- ) stand-alone print runtime block", 0
    db "(SA-PRINT) ( -- ) stand-alone print runtime block", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_SA_PRINT:
    ; DCQ     nm_SA_PRINT, hl_SA_PRINT
    dq nm_SA_PRINT, hl_SA_PRINT
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     SA_PRINT, SA_PRINT_END
    dq SA_PRINT, SA_PRINT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_SA_PRINT
    dq row_SA_PRINT
section .text
section .bwstr align=1
nm__load_base:
    ; DCB "(LOAD-BASE)", 0
    db "(LOAD-BASE)", 0
hl__load_base:
    ; DCB "(LOAD-BASE) ( -- ) x6 = BASE clamped 2..36", 0
    db "(LOAD-BASE) ( -- ) x6 = BASE clamped 2..36", 0
section .bootword align=8
    ; ALIGN 8
align 8
row__load_base:
    ; DCQ     nm__load_base, hl__load_base
    dq nm__load_base, hl__load_base
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     _load_base, _load_base_end
    dq _load_base, _load_base_end
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row__load_base
    dq row__load_base
section .text
section .bwstr align=1
nm__digit_char:
    ; DCB "(DIGIT-CHAR)", 0
    db "(DIGIT-CHAR)", 0
hl__digit_char:
    ; DCB "(DIGIT-CHAR) ( -- ) digit 0..35 to ASCII in w8", 0
    db "(DIGIT-CHAR) ( -- ) digit 0..35 to ASCII in w8", 0
section .bootword align=8
    ; ALIGN 8
align 8
row__digit_char:
    ; DCQ     nm__digit_char, hl__digit_char
    dq nm__digit_char, hl__digit_char
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     _digit_char, _digit_char_end
    dq _digit_char, _digit_char_end
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row__digit_char
    dq row__digit_char
section .text
section .bwstr align=1
nm__i64_to_str:
    ; DCB "(I64>STR)", 0
    db "(I64>STR)", 0
hl__i64_to_str:
    ; DCB "(I64>STR) ( -- ) signed number to ASCII in a buffer", 0
    db "(I64>STR) ( -- ) signed number to ASCII in a buffer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row__i64_to_str:
    ; DCQ     nm__i64_to_str, hl__i64_to_str
    dq nm__i64_to_str, hl__i64_to_str
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     _i64_to_str, _i64_to_str_end
    dq _i64_to_str, _i64_to_str_end
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row__i64_to_str
    dq row__i64_to_str
section .text
section .bwstr align=1
nm__u64_to_str:
    ; DCB "(U64>STR)", 0
    db "(U64>STR)", 0
hl__u64_to_str:
    ; DCB "(U64>STR) ( -- ) unsigned number to ASCII in a buffer", 0
    db "(U64>STR) ( -- ) unsigned number to ASCII in a buffer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row__u64_to_str:
    ; DCQ     nm__u64_to_str, hl__u64_to_str
    dq nm__u64_to_str, hl__u64_to_str
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     _u64_to_str, _u64_to_str_end
    dq _u64_to_str, _u64_to_str_end
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row__u64_to_str
    dq row__u64_to_str
section .text
section .bwstr align=1
nm__print_string_svc:
    ; DCB "(PRINT-STRING)", 0
    db "(PRINT-STRING)", 0
hl__print_string_svc:
    ; DCB "(PRINT-STRING) ( -- ) print a NUL-terminated string", 0
    db "(PRINT-STRING) ( -- ) print a NUL-terminated string", 0
section .bootword align=8
    ; ALIGN 8
align 8
row__print_string_svc:
    ; DCQ     nm__print_string_svc, hl__print_string_svc
    dq nm__print_string_svc, hl__print_string_svc
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     _print_string_svc, _print_string_svc_end
    dq _print_string_svc, _print_string_svc_end
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row__print_string_svc
    dq row__print_string_svc
section .text
section .bwstr align=1
nm__sa_print_signed:
    ; DCB "(.)", 0
    db "(.)", 0
hl__sa_print_signed:
    ; DCB "(.) ( n -- ) print a signed number", 0
    db "(.) ( n -- ) print a signed number", 0
section .bootword align=8
    ; ALIGN 8
align 8
row__sa_print_signed:
    ; DCQ     nm__sa_print_signed, hl__sa_print_signed
    dq nm__sa_print_signed, hl__sa_print_signed
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     _sa_print_signed, _sa_print_signed_end
    dq _sa_print_signed, _sa_print_signed_end
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row__sa_print_signed
    dq row__sa_print_signed
section .text
section .bwstr align=1
nm__sa_print_unsigned:
    ; DCB "(U.)", 0
    db "(U.)", 0
hl__sa_print_unsigned:
    ; DCB "(U.) ( u -- ) print an unsigned number", 0
    db "(U.) ( u -- ) print an unsigned number", 0
section .bootword align=8
    ; ALIGN 8
align 8
row__sa_print_unsigned:
    ; DCQ     nm__sa_print_unsigned, hl__sa_print_unsigned
    dq nm__sa_print_unsigned, hl__sa_print_unsigned
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     _sa_print_unsigned, _sa_print_unsigned_end
    dq _sa_print_unsigned, _sa_print_unsigned_end
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row__sa_print_unsigned
    dq row__sa_print_unsigned
section .text
SA_PRINT:
_sa_putchar:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [rel arm_x29], rax
    ; adr     x1, sa_print_emit_hook_ptr
    lea rax, [rel sa_print_emit_hook_ptr]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, _spc_have
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne _spc_have
    ; lea x1, emit_fn
    lea rax, [rel emit_fn]
    mov qword [rel arm_x1], rax
_spc_have:
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _spc_win
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _spc_win
    ; blr     x1
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
    mov r11, qword [rel arm_x1]
    call r11
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; b       _spc_done
    jmp _spc_done
_spc_win:
    ; adr     x1, sa_win_putchar_ptr
    lea rax, [rel sa_win_putchar_ptr]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _spc_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _spc_done
    ; blr     x1
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
    mov r11, qword [rel arm_x1]
    call r11
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
_spc_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_sa_write:
    ; stp     x29, x30, [sp, #-32]!
    add rsp, -32
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
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
    ; adr     x2, sa_print_emit_buf_ptr
    lea rax, [rel sa_print_emit_buf_ptr]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, _swr_bytes
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _swr_bytes
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, _swr_bytes
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _swr_bytes
    ; mov     x0, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x0], rax
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; blr     x2
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
    mov r11, qword [rel arm_x2]
    call r11
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; b       _swr_done
    jmp _swr_done
_swr_bytes:
    ; cbz     x20, _swr_done
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    je _swr_done
_swr_loop:
    ; ldrb    w0, [x19], #1
    mov r10, qword [rel arm_x19]
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; bl      _sa_putchar
    lea rax, [rel xret_1]
    mov qword [rel arm_x30], rax
    jmp _sa_putchar
    xret_1:
    ; sub     x20, x20, #1
    mov rax, qword [rel arm_x20]
    sub rax, 1
    mov qword [rel arm_x20], rax
    ; cbnz    x20, _swr_loop
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    jne _swr_loop
_swr_done:
    ; ldp     x19, x20, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    ; ldp     x29, x30, [sp], #32
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x20
    ; ret
    jmp qword [rel arm_x30]
_load_base:
    ; adr     x6, sa_print_base_ptr
    lea rax, [rel sa_print_base_ptr]
    mov qword [rel arm_x6], rax
    ; ldr     x6, [x6]
    mov r10, qword [rel arm_x6]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; cbnz    x6, _lb_have
    mov rax, qword [rel arm_x6]
    cmp rax, 0
    jne _lb_have
    ; lea x6, base_var
    lea rax, [rel base_var]
    mov qword [rel arm_x6], rax
_lb_have:
    ; ldr     x6, [x6]
    mov r10, qword [rel arm_x6]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; cmp     x6, #2
    mov rax, qword [rel arm_x6]
    cmp rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _lb_def
    cmp byte [rel arm_c], 0
    je _lb_def
    ; cmp     x6, #36
    mov rax, qword [rel arm_x6]
    cmp rax, 0x24
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _lb_def
    cmp byte [rel arm_c], 0
    je xsk_2
    cmp byte [rel arm_z], 0
    je _lb_def
    xsk_2:
    ; ret
    jmp qword [rel arm_x30]
_lb_def:
    ; mov     x6, #10
    mov rax, 0xa
    mov qword [rel arm_x6], rax
    ; ret
    jmp qword [rel arm_x30]
_load_base_end:
_digit_char:
    ; cmp     w8, #9
    mov eax, dword [rel arm_x8]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _dc_alpha
    cmp byte [rel arm_c], 0
    je xsk_3
    cmp byte [rel arm_z], 0
    je _dc_alpha
    xsk_3:
    ; add     w8, w8, #48
    mov eax, dword [rel arm_x8]
    add eax, 0x30
    mov qword [rel arm_x8], rax
    ; ret
    jmp qword [rel arm_x30]
_dc_alpha:
    ; add     w8, w8, #55
    mov eax, dword [rel arm_x8]
    add eax, 0x37
    mov qword [rel arm_x8], rax
    ; ret
    jmp qword [rel arm_x30]
_digit_char_end:
_i64_to_str:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [rel arm_x29], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; mov     x2, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x2], rax
    ; add     x3, x1, #64
    mov rax, qword [rel arm_x1]
    add rax, 0x40
    mov qword [rel arm_x3], rax
    ; mov     x4, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _load_base
    lea rax, [rel xret_4]
    mov qword [rel arm_x30], rax
    jmp _load_base
    xret_4:
    ; mov     x19, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x19], rax
    ; cmp     x4, #0
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.pl    _i2s_pos
    cmp byte [rel arm_n], 0
    je _i2s_pos
    ; mov     w6, #'-'
    mov eax, 0x2d
    mov qword [rel arm_x6], rax
    ; strb    w6, [x2], #1
    mov r10, qword [rel arm_x2]
    mov eax, dword [rel arm_x6]
    mov byte [r10], al
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; neg     x4, x4
    mov rax, qword [rel arm_x4]
    neg rax
    mov qword [rel arm_x4], rax
_i2s_pos:
    ; cbnz    x4, _i2s_div
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    jne _i2s_div
    ; mov     w6, #'0'
    mov eax, 0x30
    mov qword [rel arm_x6], rax
    ; strb    w6, [x2], #1
    mov r10, qword [rel arm_x2]
    mov eax, dword [rel arm_x6]
    mov byte [r10], al
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; strb    wzr, [x2]
    mov r10, qword [rel arm_x2]
    mov byte [r10], 0
    ; ldp     x19, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_i2s_div:
    ; udiv    x7, x4, x19
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x19]
    cmp rcx, 0
    je xdiv0_6
    xor rdx, rdx
    div rcx
    jmp xdiv_5
    xdiv0_6:
    xor eax, eax
    xdiv_5:
    mov qword [rel arm_x7], rax
    ; msub    x8, x7, x19, x4
    mov rax, qword [rel arm_x7]
    mov rcx, qword [rel arm_x19]
    imul rax, rcx
    mov rcx, qword [rel arm_x4]
    sub rcx, rax
    mov rax, rcx
    mov qword [rel arm_x8], rax
    ; bl      _digit_char
    lea rax, [rel xret_7]
    mov qword [rel arm_x30], rax
    jmp _digit_char
    xret_7:
    ; strb    w8, [x3, #-1]!
    mov rax, qword [rel arm_x3]
    add rax, -1
    mov qword [rel arm_x3], rax
    mov r10, qword [rel arm_x3]
    mov eax, dword [rel arm_x8]
    mov byte [r10], al
    ; add     x5, x5, #1
    mov rax, qword [rel arm_x5]
    add rax, 1
    mov qword [rel arm_x5], rax
    ; mov     x4, x7
    mov rax, qword [rel arm_x7]
    mov qword [rel arm_x4], rax
    ; cbnz    x4, _i2s_div
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    jne _i2s_div
_i2s_cpy:
    ; cbz     x5, _i2s_done
    mov rax, qword [rel arm_x5]
    cmp rax, 0
    je _i2s_done
    ; ldrb    w8, [x3], #1
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x8], rax
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; strb    w8, [x2], #1
    mov r10, qword [rel arm_x2]
    mov eax, dword [rel arm_x8]
    mov byte [r10], al
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; sub     x5, x5, #1
    mov rax, qword [rel arm_x5]
    sub rax, 1
    mov qword [rel arm_x5], rax
    ; b       _i2s_cpy
    jmp _i2s_cpy
_i2s_done:
    ; strb    wzr, [x2]
    mov r10, qword [rel arm_x2]
    mov byte [r10], 0
    ; ldp     x19, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_i64_to_str_end:
_u64_to_str:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [rel arm_x29], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; mov     x2, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x2], rax
    ; add     x3, x1, #64
    mov rax, qword [rel arm_x1]
    add rax, 0x40
    mov qword [rel arm_x3], rax
    ; mov     x4, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _load_base
    lea rax, [rel xret_8]
    mov qword [rel arm_x30], rax
    jmp _load_base
    xret_8:
    ; mov     x19, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x19], rax
    ; cbnz    x4, _u2s_div
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    jne _u2s_div
    ; mov     w6, #'0'
    mov eax, 0x30
    mov qword [rel arm_x6], rax
    ; strb    w6, [x2], #1
    mov r10, qword [rel arm_x2]
    mov eax, dword [rel arm_x6]
    mov byte [r10], al
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; strb    wzr, [x2]
    mov r10, qword [rel arm_x2]
    mov byte [r10], 0
    ; ldp     x19, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_u2s_div:
    ; udiv    x7, x4, x19
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x19]
    cmp rcx, 0
    je xdiv0_10
    xor rdx, rdx
    div rcx
    jmp xdiv_9
    xdiv0_10:
    xor eax, eax
    xdiv_9:
    mov qword [rel arm_x7], rax
    ; msub    x8, x7, x19, x4
    mov rax, qword [rel arm_x7]
    mov rcx, qword [rel arm_x19]
    imul rax, rcx
    mov rcx, qword [rel arm_x4]
    sub rcx, rax
    mov rax, rcx
    mov qword [rel arm_x8], rax
    ; bl      _digit_char
    lea rax, [rel xret_11]
    mov qword [rel arm_x30], rax
    jmp _digit_char
    xret_11:
    ; strb    w8, [x3, #-1]!
    mov rax, qword [rel arm_x3]
    add rax, -1
    mov qword [rel arm_x3], rax
    mov r10, qword [rel arm_x3]
    mov eax, dword [rel arm_x8]
    mov byte [r10], al
    ; add     x5, x5, #1
    mov rax, qword [rel arm_x5]
    add rax, 1
    mov qword [rel arm_x5], rax
    ; mov     x4, x7
    mov rax, qword [rel arm_x7]
    mov qword [rel arm_x4], rax
    ; cbnz    x4, _u2s_div
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    jne _u2s_div
_u2s_cpy:
    ; cbz     x5, _u2s_done
    mov rax, qword [rel arm_x5]
    cmp rax, 0
    je _u2s_done
    ; ldrb    w8, [x3], #1
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x8], rax
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; strb    w8, [x2], #1
    mov r10, qword [rel arm_x2]
    mov eax, dword [rel arm_x8]
    mov byte [r10], al
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; sub     x5, x5, #1
    mov rax, qword [rel arm_x5]
    sub rax, 1
    mov qword [rel arm_x5], rax
    ; b       _u2s_cpy
    jmp _u2s_cpy
_u2s_done:
    ; strb    wzr, [x2]
    mov r10, qword [rel arm_x2]
    mov byte [r10], 0
    ; ldp     x19, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_u64_to_str_end:
_print_string_svc:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [rel arm_x29], rax
    ; mov     x1, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x1], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
_pss_len:
    ; ldrb    w3, [x1, x2]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; cbz     w3, _pss_go
    mov eax, dword [rel arm_x3]
    cmp rax, 0
    je _pss_go
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _pss_len
    jmp _pss_len
_pss_go:
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
    ; mov     x1, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x1], rax
    ; bl      _sa_write
    lea rax, [rel xret_12]
    mov qword [rel arm_x30], rax
    jmp _sa_write
    xret_12:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_print_string_svc_end:
_sa_print_signed:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [rel arm_x29], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lsl     x1, x1, #63
    mov rax, qword [rel arm_x1]
    shl rax, 63
    mov qword [rel arm_x1], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _sps_norm
    cmp byte [rel arm_z], 0
    je _sps_norm
    ; adr     x0, sa_min_str
    lea rax, [rel sa_min_str]
    mov qword [rel arm_x0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_13]
    mov qword [rel arm_x30], rax
    jmp _print_string_svc
    xret_13:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_sps_norm:
    ; sub     sp, sp, #80
    mov rax, rsp
    sub rax, 0x50
    mov rsp, rax
    ; mov     x1, sp
    mov rax, rsp
    mov qword [rel arm_x1], rax
    ; bl      _i64_to_str
    lea rax, [rel xret_14]
    mov qword [rel arm_x30], rax
    jmp _i64_to_str
    xret_14:
    ; mov     x0, sp
    mov rax, rsp
    mov qword [rel arm_x0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_15]
    mov qword [rel arm_x30], rax
    jmp _print_string_svc
    xret_15:
    ; add     sp, sp, #80
    mov rax, rsp
    add rax, 0x50
    mov rsp, rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_sa_print_signed_end:
_sa_print_unsigned:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [rel arm_x29], rax
    ; sub     sp, sp, #80
    mov rax, rsp
    sub rax, 0x50
    mov rsp, rax
    ; mov     x1, sp
    mov rax, rsp
    mov qword [rel arm_x1], rax
    ; bl      _u64_to_str
    lea rax, [rel xret_16]
    mov qword [rel arm_x30], rax
    jmp _u64_to_str
    xret_16:
    ; mov     x0, sp
    mov rax, rsp
    mov qword [rel arm_x0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_17]
    mov qword [rel arm_x30], rax
    jmp _print_string_svc
    xret_17:
    ; add     sp, sp, #80
    mov rax, rsp
    add rax, 0x50
    mov rsp, rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_sa_print_unsigned_end:
    ; ALIGN 8
align 8
sa_min_str:
    ; DCB     "-9223372036854775808", 0
    db "-9223372036854775808", 0
    ; ALIGN 8
align 8
sa_win_putchar_ptr:
    ; DCQ     sa_win_putchar
    dq sa_win_putchar
sa_print_base_ptr:
    ; DCQ     0
    dq 0
sa_print_emit_hook_ptr:
    ; DCQ     0
    dq 0
sa_print_emit_buf_ptr:
    ; DCQ     0
    dq 0
sa_print_zero_cell:
    ; DCQ     0
    dq 0
SA_PRINT_END:
