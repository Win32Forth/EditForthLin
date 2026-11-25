; Generated from Forth/kernel/arm64/sa_print.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
extern base_var
extern emit_fn
extern sa_win_putchar
section .text
global _sa_putchar
global _sa_print_signed
global _sa_print_unsigned
global _print_string_svc
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [r15+232], rax
    ; adr     x1, sa_print_emit_hook_ptr
    lea rax, [rel sa_print_emit_hook_ptr]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, _spc_have
    mov rax, qword [r15+8]
    cmp rax, 0
    jne _spc_have
    ; lea x1, emit_fn
    lea rax, [rel emit_fn]
    mov qword [r15+8], rax
_spc_have:
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, _spc_win
    mov rax, qword [r15+8]
    cmp rax, 0
    je _spc_win
    ; blr     x1
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
    mov r11, qword [r15+8]
    call r11
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; b       _spc_done
    jmp _spc_done
_spc_win:
    ; adr     x1, sa_win_putchar_ptr
    lea rax, [rel sa_win_putchar_ptr]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, _spc_done
    mov rax, qword [r15+8]
    cmp rax, 0
    je _spc_done
    ; blr     x1
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
    mov r11, qword [r15+8]
    call r11
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
_spc_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_sa_write:
    ; stp     x29, x30, [sp, #-32]!
    add rsp, -32
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
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
    ; adr     x2, sa_print_emit_buf_ptr
    lea rax, [rel sa_print_emit_buf_ptr]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbz     x2, _swr_bytes
    mov rax, qword [r15+16]
    cmp rax, 0
    je _swr_bytes
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbz     x2, _swr_bytes
    mov rax, qword [r15+16]
    cmp rax, 0
    je _swr_bytes
    ; mov     x0, x19
    mov rax, qword [r15+152]
    mov qword [r15+0], rax
    ; mov     x1, x20
    mov rax, qword [r15+160]
    mov qword [r15+8], rax
    ; blr     x2
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
    mov r11, qword [r15+16]
    call r11
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; b       _swr_done
    jmp _swr_done
_swr_bytes:
    ; cbz     x20, _swr_done
    mov rax, qword [r15+160]
    cmp rax, 0
    je _swr_done
_swr_loop:
    ; ldrb    w0, [x19], #1
    mov r10, qword [r15+152]
    movzx eax, byte [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+152]
    add rax, 1
    mov qword [r15+152], rax
    ; bl      _sa_putchar
    lea rax, [rel xret_1]
    mov qword [r15+240], rax
    jmp _sa_putchar
    xret_1:
    ; sub     x20, x20, #1
    mov rax, qword [r15+160]
    sub rax, 1
    mov qword [r15+160], rax
    ; cbnz    x20, _swr_loop
    mov rax, qword [r15+160]
    cmp rax, 0
    jne _swr_loop
_swr_done:
    ; ldp     x19, x20, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    ; ldp     x29, x30, [sp], #32
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x20
    ; ret
    jmp qword [r15+240]
_load_base:
    ; adr     x6, sa_print_base_ptr
    lea rax, [rel sa_print_base_ptr]
    mov qword [r15+48], rax
    ; ldr     x6, [x6]
    mov r10, qword [r15+48]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; cbnz    x6, _lb_have
    mov rax, qword [r15+48]
    cmp rax, 0
    jne _lb_have
    ; lea x6, base_var
    lea rax, [rel base_var]
    mov qword [r15+48], rax
_lb_have:
    ; ldr     x6, [x6]
    mov r10, qword [r15+48]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; cmp     x6, #2
    mov rax, qword [r15+48]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _lb_def
    cmp byte [r15+250], 0
    je _lb_def
    ; cmp     x6, #36
    mov rax, qword [r15+48]
    cmp rax, 0x24
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _lb_def
    cmp byte [r15+250], 0
    je xsk_2
    cmp byte [r15+249], 0
    je _lb_def
    xsk_2:
    ; ret
    jmp qword [r15+240]
_lb_def:
    ; mov     x6, #10
    mov rax, 0xa
    mov qword [r15+48], rax
    ; ret
    jmp qword [r15+240]
_load_base_end:
_digit_char:
    ; cmp     w8, #9
    mov eax, dword [r15+64]
    cmp eax, 9
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _dc_alpha
    cmp byte [r15+250], 0
    je xsk_3
    cmp byte [r15+249], 0
    je _dc_alpha
    xsk_3:
    ; add     w8, w8, #48
    mov eax, dword [r15+64]
    add eax, 0x30
    mov qword [r15+64], rax
    ; ret
    jmp qword [r15+240]
_dc_alpha:
    ; add     w8, w8, #55
    mov eax, dword [r15+64]
    add eax, 0x37
    mov qword [r15+64], rax
    ; ret
    jmp qword [r15+240]
_digit_char_end:
_i64_to_str:
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
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; mov     x2, x1
    mov rax, qword [r15+8]
    mov qword [r15+16], rax
    ; add     x3, x1, #64
    mov rax, qword [r15+8]
    add rax, 0x40
    mov qword [r15+24], rax
    ; mov     x4, x0
    mov rax, qword [r15+0]
    mov qword [r15+32], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [r15+40], rax
    ; bl      _load_base
    lea rax, [rel xret_4]
    mov qword [r15+240], rax
    jmp _load_base
    xret_4:
    ; mov     x19, x6
    mov rax, qword [r15+48]
    mov qword [r15+152], rax
    ; cmp     x4, #0
    mov rax, qword [r15+32]
    cmp rax, 0
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.pl    _i2s_pos
    cmp byte [r15+248], 0
    je _i2s_pos
    ; mov     w6, #'-'
    mov eax, 0x2d
    mov qword [r15+48], rax
    ; strb    w6, [x2], #1
    mov r10, qword [r15+16]
    mov eax, dword [r15+48]
    mov byte [r10], al
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; neg     x4, x4
    mov rax, qword [r15+32]
    neg rax
    mov qword [r15+32], rax
_i2s_pos:
    ; cbnz    x4, _i2s_div
    mov rax, qword [r15+32]
    cmp rax, 0
    jne _i2s_div
    ; mov     w6, #'0'
    mov eax, 0x30
    mov qword [r15+48], rax
    ; strb    w6, [x2], #1
    mov r10, qword [r15+16]
    mov eax, dword [r15+48]
    mov byte [r10], al
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; strb    wzr, [x2]
    mov r10, qword [r15+16]
    mov byte [r10], 0
    ; ldp     x19, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_i2s_div:
    ; udiv    x7, x4, x19
    mov rax, qword [r15+32]
    mov rcx, qword [r15+152]
    cmp rcx, 0
    je xdiv0_6
    xor rdx, rdx
    div rcx
    jmp xdiv_5
    xdiv0_6:
    xor eax, eax
    xdiv_5:
    mov qword [r15+56], rax
    ; msub    x8, x7, x19, x4
    mov rax, qword [r15+56]
    mov rcx, qword [r15+152]
    imul rax, rcx
    mov rcx, qword [r15+32]
    sub rcx, rax
    mov rax, rcx
    mov qword [r15+64], rax
    ; bl      _digit_char
    lea rax, [rel xret_7]
    mov qword [r15+240], rax
    jmp _digit_char
    xret_7:
    ; strb    w8, [x3, #-1]!
    mov rax, qword [r15+24]
    add rax, -1
    mov qword [r15+24], rax
    mov r10, qword [r15+24]
    mov eax, dword [r15+64]
    mov byte [r10], al
    ; add     x5, x5, #1
    mov rax, qword [r15+40]
    add rax, 1
    mov qword [r15+40], rax
    ; mov     x4, x7
    mov rax, qword [r15+56]
    mov qword [r15+32], rax
    ; cbnz    x4, _i2s_div
    mov rax, qword [r15+32]
    cmp rax, 0
    jne _i2s_div
_i2s_cpy:
    ; cbz     x5, _i2s_done
    mov rax, qword [r15+40]
    cmp rax, 0
    je _i2s_done
    ; ldrb    w8, [x3], #1
    mov r10, qword [r15+24]
    movzx eax, byte [r10]
    mov qword [r15+64], rax
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; strb    w8, [x2], #1
    mov r10, qword [r15+16]
    mov eax, dword [r15+64]
    mov byte [r10], al
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; sub     x5, x5, #1
    mov rax, qword [r15+40]
    sub rax, 1
    mov qword [r15+40], rax
    ; b       _i2s_cpy
    jmp _i2s_cpy
_i2s_done:
    ; strb    wzr, [x2]
    mov r10, qword [r15+16]
    mov byte [r10], 0
    ; ldp     x19, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_i64_to_str_end:
_u64_to_str:
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
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; mov     x2, x1
    mov rax, qword [r15+8]
    mov qword [r15+16], rax
    ; add     x3, x1, #64
    mov rax, qword [r15+8]
    add rax, 0x40
    mov qword [r15+24], rax
    ; mov     x4, x0
    mov rax, qword [r15+0]
    mov qword [r15+32], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [r15+40], rax
    ; bl      _load_base
    lea rax, [rel xret_8]
    mov qword [r15+240], rax
    jmp _load_base
    xret_8:
    ; mov     x19, x6
    mov rax, qword [r15+48]
    mov qword [r15+152], rax
    ; cbnz    x4, _u2s_div
    mov rax, qword [r15+32]
    cmp rax, 0
    jne _u2s_div
    ; mov     w6, #'0'
    mov eax, 0x30
    mov qword [r15+48], rax
    ; strb    w6, [x2], #1
    mov r10, qword [r15+16]
    mov eax, dword [r15+48]
    mov byte [r10], al
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; strb    wzr, [x2]
    mov r10, qword [r15+16]
    mov byte [r10], 0
    ; ldp     x19, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_u2s_div:
    ; udiv    x7, x4, x19
    mov rax, qword [r15+32]
    mov rcx, qword [r15+152]
    cmp rcx, 0
    je xdiv0_10
    xor rdx, rdx
    div rcx
    jmp xdiv_9
    xdiv0_10:
    xor eax, eax
    xdiv_9:
    mov qword [r15+56], rax
    ; msub    x8, x7, x19, x4
    mov rax, qword [r15+56]
    mov rcx, qword [r15+152]
    imul rax, rcx
    mov rcx, qword [r15+32]
    sub rcx, rax
    mov rax, rcx
    mov qword [r15+64], rax
    ; bl      _digit_char
    lea rax, [rel xret_11]
    mov qword [r15+240], rax
    jmp _digit_char
    xret_11:
    ; strb    w8, [x3, #-1]!
    mov rax, qword [r15+24]
    add rax, -1
    mov qword [r15+24], rax
    mov r10, qword [r15+24]
    mov eax, dword [r15+64]
    mov byte [r10], al
    ; add     x5, x5, #1
    mov rax, qword [r15+40]
    add rax, 1
    mov qword [r15+40], rax
    ; mov     x4, x7
    mov rax, qword [r15+56]
    mov qword [r15+32], rax
    ; cbnz    x4, _u2s_div
    mov rax, qword [r15+32]
    cmp rax, 0
    jne _u2s_div
_u2s_cpy:
    ; cbz     x5, _u2s_done
    mov rax, qword [r15+40]
    cmp rax, 0
    je _u2s_done
    ; ldrb    w8, [x3], #1
    mov r10, qword [r15+24]
    movzx eax, byte [r10]
    mov qword [r15+64], rax
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; strb    w8, [x2], #1
    mov r10, qword [r15+16]
    mov eax, dword [r15+64]
    mov byte [r10], al
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; sub     x5, x5, #1
    mov rax, qword [r15+40]
    sub rax, 1
    mov qword [r15+40], rax
    ; b       _u2s_cpy
    jmp _u2s_cpy
_u2s_done:
    ; strb    wzr, [x2]
    mov r10, qword [r15+16]
    mov byte [r10], 0
    ; ldp     x19, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_u64_to_str_end:
_print_string_svc:
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
    ; mov     x1, x0
    mov rax, qword [r15+0]
    mov qword [r15+8], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [r15+16], rax
_pss_len:
    ; ldrb    w3, [x1, x2]
    mov r10, qword [r15+8]
    mov rax, qword [r15+16]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    ; cbz     w3, _pss_go
    mov eax, dword [r15+24]
    cmp rax, 0
    je _pss_go
    ; add     x2, x2, #1
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; b       _pss_len
    jmp _pss_len
_pss_go:
    ; mov     x0, x1
    mov rax, qword [r15+8]
    mov qword [r15+0], rax
    ; mov     x1, x2
    mov rax, qword [r15+16]
    mov qword [r15+8], rax
    ; bl      _sa_write
    lea rax, [rel xret_12]
    mov qword [r15+240], rax
    jmp _sa_write
    xret_12:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_print_string_svc_end:
_sa_print_signed:
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
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; lsl     x1, x1, #63
    mov rax, qword [r15+8]
    shl rax, 63
    mov qword [r15+8], rax
    ; cmp     x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _sps_norm
    cmp byte [r15+249], 0
    je _sps_norm
    ; adr     x0, sa_min_str
    lea rax, [rel sa_min_str]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_13]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_13:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_sps_norm:
    ; sub     sp, sp, #80
    mov rax, rsp
    sub rax, 0x50
    mov rsp, rax
    ; mov     x1, sp
    mov rax, rsp
    mov qword [r15+8], rax
    ; bl      _i64_to_str
    lea rax, [rel xret_14]
    mov qword [r15+240], rax
    jmp _i64_to_str
    xret_14:
    ; mov     x0, sp
    mov rax, rsp
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_15]
    mov qword [r15+240], rax
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
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_sa_print_signed_end:
_sa_print_unsigned:
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
    ; sub     sp, sp, #80
    mov rax, rsp
    sub rax, 0x50
    mov rsp, rax
    ; mov     x1, sp
    mov rax, rsp
    mov qword [r15+8], rax
    ; bl      _u64_to_str
    lea rax, [rel xret_16]
    mov qword [r15+240], rax
    jmp _u64_to_str
    xret_16:
    ; mov     x0, sp
    mov rax, rsp
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_17]
    mov qword [r15+240], rax
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
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
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
