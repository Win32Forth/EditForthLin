; Generated from Forth/kernel/arm64/prims_k1.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
extern DOCOL
extern _compile_cell
extern _core_console_only
extern _cursor_commit
extern _cursor_load
extern _find_word
extern _header_build
extern _here_reserve
extern _next_word
extern _nfa_reveal_cfa
extern _print_signed
extern _print_string_svc
extern _print_wid_name
extern _putchar
extern _quit_exit
extern _take_line
extern _take_pending_help
extern _task_dp_bounds
extern _task_require_dict
extern _task_stop_or_abandon
extern _throw_unwind_to_sp
extern base_var
extern cfa_0branch
extern cfa_branch
extern cfa_cstr
extern cfa_does
extern cfa_lit
extern cfa_slit
extern current_var
extern debug_break_asap
extern emit_cstr
extern emit_str
extern last_cfa
extern latest_var
extern next_debug
extern pad_buffer
extern pending_help_addr
extern pending_help_len
extern search_order
extern search_order_n
extern state_var
extern str_allot_over
extern str_allot_under
extern str_dict_full
extern throw_handler
extern up_var
extern word_scratch
extern wordlist_reg
extern wordlist_reg_n
extern xchar_emit_buf
section .text
global DOVAR
global DOCON
global DODOES
global XTHROW
global XBranch
global X0Branch
global XTYPE
global msg_allot
section .bwstr align=1
nm_XQDUP:
    ; DCB "?DUP", 0
    db "?DUP", 0
hl_XQDUP:
    ; DCB "?DUP ( n -- n n | 0 ) dup if non-zero", 0
    db "?DUP ( n -- n n | 0 ) dup if non-zero", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XQDUP:
    ; DCQ     nm_XQDUP, hl_XQDUP
    dq nm_XQDUP, hl_XQDUP
    ; DCQ     0
    dq 0
    ; DCQ     XQDUP, XQDUP_END
    dq XQDUP, XQDUP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XQDUP
    dq row_XQDUP
section .text
XQDUP:
    ; cbz     x20, XQDUP_END
    mov rax, qword [r15+160]
    cmp rax, 0
    je XQDUP_END
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
XQDUP_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XROT:
    ; DCB "ROT", 0
    db "ROT", 0
hl_XROT:
    ; DCB "ROT ( a b c -- b c a ) rotate top three", 0
    db "ROT ( a b c -- b c a ) rotate top three", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XROT:
    ; DCQ     nm_XROT, hl_XROT
    dq nm_XROT, hl_XROT
    ; DCQ     0
    dq 0
    ; DCQ     XROT, XROT_END
    dq XROT, XROT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XROT
    dq row_XROT
section .text
XROT:
    ; ldr     x0, [x22]
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x1, [x22, #8]
    mov r10, qword [r15+176]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; str     x0, [x22, #8]
    mov r10, qword [r15+176]
    add r10, 8
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; str     x20, [x22]
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [r15+8]
    mov qword [r15+160], rax
XROT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XNROT:
    ; DCB "-ROT", 0
    db "-ROT", 0
hl_XNROT:
    ; DCB "-ROT ( a b c -- c a b ) reverse-rotate top three", 0
    db "-ROT ( a b c -- c a b ) reverse-rotate top three", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNROT:
    ; DCQ     nm_XNROT, hl_XNROT
    dq nm_XNROT, hl_XNROT
    ; DCQ     0
    dq 0
    ; DCQ     XNROT, XNROT_END
    dq XNROT, XNROT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNROT
    dq row_XNROT
section .text
XNROT:
    ; ldr     x0, [x22]
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x1, [x22, #8]
    mov r10, qword [r15+176]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; str     x20, [x22, #8]
    mov r10, qword [r15+176]
    add r10, 8
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; str     x1, [x22]
    mov r10, qword [r15+176]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
XNROT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
global XROLL
section .bwstr align=1
nm_XROLL:
    ; DCB "ROLL", 0
    db "ROLL", 0
hl_XROLL:
    ; DCB "ROLL ( xu ... x0 u -- xu ) move the uth cell to TOS", 0
    db "ROLL ( xu ... x0 u -- xu ) move the uth cell to TOS", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XROLL:
    ; DCQ     nm_XROLL, hl_XROLL
    dq nm_XROLL, hl_XROLL
    ; DCQ     0
    dq 0
    ; DCQ     XROLL, XROLL_END
    dq XROLL, XROLL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XROLL
    dq row_XROLL
section .text
XROLL:
    ; mov     x1, x20
    mov rax, qword [r15+160]
    mov qword [r15+8], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cbz     x1, XROLL_END
    mov rax, qword [r15+8]
    cmp rax, 0
    je XROLL_END
    ; sub     x2, x1, #1
    mov rax, qword [r15+8]
    sub rax, 1
    mov qword [r15+16], rax
    ; lsl     x2, x2, #3
    mov rax, qword [r15+16]
    shl rax, 3
    mov qword [r15+16], rax
    ; ldr     x3, [x22, x2]
    mov r10, qword [r15+176]
    mov rax, qword [r15+16]
    add r10, rax
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; mov     x4, x2
    mov rax, qword [r15+16]
    mov qword [r15+32], rax
_roll_shift:
    ; cbz     x4, _roll_put
    mov rax, qword [r15+32]
    cmp rax, 0
    je _roll_put
    ; sub     x5, x4, #8
    mov rax, qword [r15+32]
    sub rax, 8
    mov qword [r15+40], rax
    ; ldr     x6, [x22, x5]
    mov r10, qword [r15+176]
    mov rax, qword [r15+40]
    add r10, rax
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; str     x6, [x22, x4]
    mov r10, qword [r15+176]
    mov rax, qword [r15+32]
    add r10, rax
    mov rax, qword [r15+48]
    mov qword [r10], rax
    ; mov     x4, x5
    mov rax, qword [r15+40]
    mov qword [r15+32], rax
    ; b       _roll_shift
    jmp _roll_shift
_roll_put:
    ; str     x0, [x22]
    mov r10, qword [r15+176]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x20, x3
    mov rax, qword [r15+24]
    mov qword [r15+160], rax
XROLL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XNIP:
    ; DCB "NIP", 0
    db "NIP", 0
hl_XNIP:
    ; DCB "NIP ( x1 x2 -- x2 ) drop the cell under TOS", 0
    db "NIP ( x1 x2 -- x2 ) drop the cell under TOS", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNIP:
    ; DCQ     nm_XNIP, hl_XNIP
    dq nm_XNIP, hl_XNIP
    ; DCQ     0
    dq 0
    ; DCQ     XNIP, XNIP_END
    dq XNIP, XNIP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNIP
    dq row_XNIP
section .text
XNIP:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
XNIP_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XTOR:
    ; DCB ">R", 0
    db ">R", 0
hl_XTOR:
    ; DCB ">R ( n -- ) ( R: -- n ) to return stack", 0
    db ">R ( n -- ) ( R: -- n ) to return stack", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTOR:
    ; DCQ     nm_XTOR, hl_XTOR
    dq nm_XTOR, hl_XTOR
    ; DCQ     0
    dq 0
    ; DCQ     XTOR, XTOR_END
    dq XTOR, XTOR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTOR
    dq row_XTOR
section .text
XTOR:
    ; str     x20, [x23, #-8]!
    mov rax, qword [r15+184]
    add rax, -8
    mov qword [r15+184], rax
    mov r10, qword [r15+184]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
XTOR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XRTO:
    ; DCB "R>", 0
    db "R>", 0
hl_XRTO:
    ; DCB "R> ( -- n ) ( R: n -- ) from return stack", 0
    db "R> ( -- n ) ( R: n -- ) from return stack", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRTO:
    ; DCQ     nm_XRTO, hl_XRTO
    dq nm_XRTO, hl_XRTO
    ; DCQ     0
    dq 0
    ; DCQ     XRTO, XRTO_END
    dq XRTO, XRTO_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRTO
    dq row_XRTO
section .text
XRTO:
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; ldr     x20, [x23], #8
    mov r10, qword [r15+184]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+184]
    add rax, 8
    mov qword [r15+184], rax
XRTO_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XRFETCH:
    ; DCB "R@", 0
    db "R@", 0
hl_XRFETCH:
    ; DCB "R@ ( -- n ) ( R: n -- n ) copy top of return stack", 0
    db "R@ ( -- n ) ( R: n -- n ) copy top of return stack", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRFETCH:
    ; DCQ     nm_XRFETCH, hl_XRFETCH
    dq nm_XRFETCH, hl_XRFETCH
    ; DCQ     0
    dq 0
    ; DCQ     XRFETCH, XRFETCH_END
    dq XRFETCH, XRFETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRFETCH
    dq row_XRFETCH
section .text
XRFETCH:
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; ldr     x20, [x23]
    mov r10, qword [r15+184]
    mov rax, qword [r10]
    mov qword [r15+160], rax
XRFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XONEPLUS:
    ; DCB "1+", 0
    db "1+", 0
hl_XONEPLUS:
    ; DCB "1+ ( n -- n+1 ) increment", 0
    db "1+ ( n -- n+1 ) increment", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XONEPLUS:
    ; DCQ     nm_XONEPLUS, hl_XONEPLUS
    dq nm_XONEPLUS, hl_XONEPLUS
    ; DCQ     0
    dq 0
    ; DCQ     XONEPLUS, XONEPLUS_END
    dq XONEPLUS, XONEPLUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XONEPLUS
    dq row_XONEPLUS
section .text
XONEPLUS:
    ; add     x20, x20, #1
    mov rax, qword [r15+160]
    add rax, 1
    mov qword [r15+160], rax
XONEPLUS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XAND:
    ; DCB "AND", 0
    db "AND", 0
hl_XAND:
    ; DCB "AND ( n1 n2 -- n ) bitwise and", 0
    db "AND ( n1 n2 -- n ) bitwise and", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAND:
    ; DCQ     nm_XAND, hl_XAND
    dq nm_XAND, hl_XAND
    ; DCQ     0
    dq 0
    ; DCQ     XAND, XAND_END
    dq XAND, XAND_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAND
    dq row_XAND
section .text
XAND:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; and     x20, x20, x0
    mov rax, qword [r15+160]
    mov rcx, qword [r15+0]
    and rax, rcx
    mov qword [r15+160], rax
XAND_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XORR:
    ; DCB "OR", 0
    db "OR", 0
hl_XORR:
    ; DCB "OR ( n1 n2 -- n ) bitwise or", 0
    db "OR ( n1 n2 -- n ) bitwise or", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XORR:
    ; DCQ     nm_XORR, hl_XORR
    dq nm_XORR, hl_XORR
    ; DCQ     0
    dq 0
    ; DCQ     XORR, XORR_END
    dq XORR, XORR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XORR
    dq row_XORR
section .text
XORR:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; orr     x20, x20, x0
    mov rax, qword [r15+160]
    mov rcx, qword [r15+0]
    or rax, rcx
    mov qword [r15+160], rax
XORR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XINVERT:
    ; DCB "INVERT", 0
    db "INVERT", 0
hl_XINVERT:
    ; DCB "INVERT ( n -- ~n ) bitwise invert", 0
    db "INVERT ( n -- ~n ) bitwise invert", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XINVERT:
    ; DCQ     nm_XINVERT, hl_XINVERT
    dq nm_XINVERT, hl_XINVERT
    ; DCQ     0
    dq 0
    ; DCQ     XINVERT, XINVERT_END
    dq XINVERT, XINVERT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XINVERT
    dq row_XINVERT
section .text
XINVERT:
    ; mvn     x20, x20
    mov rax, qword [r15+160]
    not rax
    mov qword [r15+160], rax
XINVERT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XRSHIFT:
    ; DCB "RSHIFT", 0
    db "RSHIFT", 0
hl_XRSHIFT:
    ; DCB "RSHIFT ( n bits -- n ) logical right shift", 0
    db "RSHIFT ( n bits -- n ) logical right shift", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRSHIFT:
    ; DCQ     nm_XRSHIFT, hl_XRSHIFT
    dq nm_XRSHIFT, hl_XRSHIFT
    ; DCQ     0
    dq 0
    ; DCQ     XRSHIFT, XRSHIFT_END
    dq XRSHIFT, XRSHIFT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRSHIFT
    dq row_XRSHIFT
section .text
XRSHIFT:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; lsr     x20, x0, x20
    mov rax, qword [r15+0]
    mov rcx, qword [r15+160]
    shr rax, cl
    mov qword [r15+160], rax
XRSHIFT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XEQUAL:
    ; DCB "=", 0
    db "=", 0
hl_XEQUAL:
    ; DCB "= ( n1 n2 -- flag ) equal", 0
    db "= ( n1 n2 -- flag ) equal", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XEQUAL:
    ; DCQ     nm_XEQUAL, hl_XEQUAL
    dq nm_XEQUAL, hl_XEQUAL
    ; DCQ     0
    dq 0
    ; DCQ     XEQUAL, XEQUAL_END
    dq XEQUAL, XEQUAL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XEQUAL
    dq row_XEQUAL
section .text
XEQUAL:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cmp     x0, x20
    mov rax, qword [r15+0]
    mov rcx, qword [r15+160]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; csetm   x20, eq
    xor eax, eax
    cmp byte [r15+249], 0
    je xsk_1
    mov rax, -1
    xsk_1:
    mov qword [r15+160], rax
XEQUAL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XLESS:
    ; DCB "<", 0
    db "<", 0
hl_XLESS:
    ; DCB "< ( n1 n2 -- flag ) less than", 0
    db "< ( n1 n2 -- flag ) less than", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLESS:
    ; DCQ     nm_XLESS, hl_XLESS
    dq nm_XLESS, hl_XLESS
    ; DCQ     0
    dq 0
    ; DCQ     XLESS, XLESS_END
    dq XLESS, XLESS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLESS
    dq row_XLESS
section .text
XLESS:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cmp     x0, x20
    mov rax, qword [r15+0]
    mov rcx, qword [r15+160]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; csetm   x20, lt
    xor eax, eax
    mov r11b, byte [r15+248]
    cmp r11b, byte [r15+251]
    je xsk_2
    mov rax, -1
    xsk_2:
    mov qword [r15+160], rax
XLESS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XGREATER:
    ; DCB ">", 0
    db ">", 0
hl_XGREATER:
    ; DCB "> ( n1 n2 -- flag ) greater than", 0
    db "> ( n1 n2 -- flag ) greater than", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XGREATER:
    ; DCQ     nm_XGREATER, hl_XGREATER
    dq nm_XGREATER, hl_XGREATER
    ; DCQ     0
    dq 0
    ; DCQ     XGREATER, XGREATER_END
    dq XGREATER, XGREATER_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XGREATER
    dq row_XGREATER
section .text
XGREATER:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cmp     x0, x20
    mov rax, qword [r15+0]
    mov rcx, qword [r15+160]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; csetm   x20, gt
    xor eax, eax
    cmp byte [r15+249], 0
    jne xsk_3
    mov r11b, byte [r15+248]
    cmp r11b, byte [r15+251]
    jne xsk_3
    mov rax, -1
    xsk_3:
    mov qword [r15+160], rax
XGREATER_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XZEQUAL:
    ; DCB "0=", 0
    db "0=", 0
hl_XZEQUAL:
    ; DCB "0= ( n -- flag ) zero?", 0
    db "0= ( n -- flag ) zero?", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XZEQUAL:
    ; DCQ     nm_XZEQUAL, hl_XZEQUAL
    dq nm_XZEQUAL, hl_XZEQUAL
    ; DCQ     0
    dq 0
    ; DCQ     XZEQUAL, XZEQUAL_END
    dq XZEQUAL, XZEQUAL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XZEQUAL
    dq row_XZEQUAL
section .text
XZEQUAL:
    ; cmp     x20, #0
    mov rax, qword [r15+160]
    cmp rax, 0
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; csetm   x20, eq
    xor eax, eax
    cmp byte [r15+249], 0
    je xsk_4
    mov rax, -1
    xsk_4:
    mov qword [r15+160], rax
XZEQUAL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XFETCH:
    ; DCB "@", 0
    db "@", 0
hl_XFETCH:
    ; DCB "@ ( addr -- n ) fetch cell", 0
    db "@ ( addr -- n ) fetch cell", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFETCH:
    ; DCQ     nm_XFETCH, hl_XFETCH
    dq nm_XFETCH, hl_XFETCH
    ; DCQ     0
    dq 0
    ; DCQ     XFETCH, XFETCH_END
    dq XFETCH, XFETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFETCH
    dq row_XFETCH
section .text
XFETCH:
    ; ldr     x20, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r10]
    mov qword [r15+160], rax
XFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XSTORE:
    ; DCB "!", 0
    db "!", 0
hl_XSTORE:
    ; DCB "! ( n addr -- ) store cell", 0
    db "! ( n addr -- ) store cell", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSTORE:
    ; DCQ     nm_XSTORE, hl_XSTORE
    dq nm_XSTORE, hl_XSTORE
    ; DCQ     0
    dq 0
    ; DCQ     XSTORE, XSTORE_END
    dq XSTORE, XSTORE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSTORE
    dq row_XSTORE
section .text
XSTORE:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; str     x0, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
XSTORE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XCFETCH:
    ; DCB "C@", 0
    db "C@", 0
hl_XCFETCH:
    ; DCB "C@ ( addr -- byte ) fetch byte", 0
    db "C@ ( addr -- byte ) fetch byte", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCFETCH:
    ; DCQ     nm_XCFETCH, hl_XCFETCH
    dq nm_XCFETCH, hl_XCFETCH
    ; DCQ     0
    dq 0
    ; DCQ     XCFETCH, XCFETCH_END
    dq XCFETCH, XCFETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCFETCH
    dq row_XCFETCH
section .text
XCFETCH:
    ; ldrb    w20, [x20]
    mov r10, qword [r15+160]
    movzx eax, byte [r10]
    mov qword [r15+160], rax
XCFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XCSTORE:
    ; DCB "C!", 0
    db "C!", 0
hl_XCSTORE:
    ; DCB "C! ( byte addr -- ) store byte", 0
    db "C! ( byte addr -- ) store byte", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCSTORE:
    ; DCQ     nm_XCSTORE, hl_XCSTORE
    dq nm_XCSTORE, hl_XCSTORE
    ; DCQ     0
    dq 0
    ; DCQ     XCSTORE, XCSTORE_END
    dq XCSTORE, XCSTORE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCSTORE
    dq row_XCSTORE
section .text
XCSTORE:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; strb    w0, [x20]
    mov r10, qword [r15+160]
    mov eax, dword [r15+0]
    mov byte [r10], al
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
XCSTORE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XBL:
    ; DCB "BL", 0
    db "BL", 0
hl_XBL:
    ; DCB "BL ( -- c ) ASCII blank", 0
    db "BL ( -- c ) ASCII blank", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBL:
    ; DCQ     nm_XBL, hl_XBL
    dq nm_XBL, hl_XBL
    ; DCQ     0
    dq 0
    ; DCQ     XBL, XBL_END
    dq XBL, XBL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBL
    dq row_XBL
section .text
XBL:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [r15+0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
XBL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XEMIT:
    ; DCB "EMIT", 0
    db "EMIT", 0
hl_XEMIT:
    ; DCB "EMIT ( c -- ) emit one character", 0
    db "EMIT ( c -- ) emit one character", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XEMIT:
    ; DCQ     nm_XEMIT, hl_XEMIT
    dq nm_XEMIT, hl_XEMIT
    ; DCQ     0
    dq 0
    ; DCQ     XEMIT, XEMIT_END
    dq XEMIT, XEMIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XEMIT
    dq row_XEMIT
section .text
XEMIT:
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
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
    ; bl      _putchar
    lea rax, [rel xret_5]
    mov qword [r15+240], rax
    jmp _putchar
    xret_5:
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
XEMIT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XTYPE:
    ; DCB "TYPE", 0
    db "TYPE", 0
hl_XTYPE:
    ; DCB "TYPE ( addr len -- ) type string", 0
    db "TYPE ( addr len -- ) type string", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTYPE:
    ; DCQ     nm_XTYPE, hl_XTYPE
    dq nm_XTYPE, hl_XTYPE
    ; DCQ     0
    dq 0
    ; DCQ     XTYPE, XTYPE_END
    dq XTYPE, XTYPE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTYPE
    dq row_XTYPE
section .text
XTYPE:
    ; mov     x1, x20
    mov rax, qword [r15+160]
    mov qword [r15+8], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cbz     x1, XTYPE_END
    mov rax, qword [r15+8]
    cmp rax, 0
    je XTYPE_END
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
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+0]
    mov qword [r10+0], rax
    mov rax, qword [r15+8]
    mov qword [r10+8], rax
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+0], rax
    mov qword [r15+8], rcx
    ; bl      emit_str
    lea rax, [rel xret_6]
    mov qword [r15+240], rax
    jmp emit_str
    xret_6:
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
XTYPE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XXCHAR_EMIT:
    ; DCB "XEMIT", 0
    db "XEMIT", 0
hl_XXCHAR_EMIT:
    ; DCB "XEMIT ( xchar -- ) emit UTF-8 xchar to console", 0
    db "XEMIT ( xchar -- ) emit UTF-8 xchar to console", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XXCHAR_EMIT:
    ; DCQ     nm_XXCHAR_EMIT, hl_XXCHAR_EMIT
    dq nm_XXCHAR_EMIT, hl_XXCHAR_EMIT
    ; DCQ     0
    dq 0
    ; DCQ     XXCHAR_EMIT, XXCHAR_EMIT_END
    dq XXCHAR_EMIT, XXCHAR_EMIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XXCHAR_EMIT
    dq row_XXCHAR_EMIT
section .text
XXCHAR_EMIT:
    ; mov     x1, x20
    mov rax, qword [r15+160]
    mov qword [r15+8], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; movz    x2, #0xFFFF
    mov rax, 0xffff
    mov qword [r15+16], rax
    ; movk    x2, #0x10, lsl #16
    mov rax, qword [r15+16]
    mov rcx, 0xffffffff0000ffff
    and rax, rcx
    mov rcx, 0x100000
    or rax, rcx
    mov qword [r15+16], rax
    ; cmp     x1, x2
    mov rax, qword [r15+8]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; csel    x1, x2, x1, hi
    cmp byte [r15+250], 0
    je xsk_9
    cmp byte [r15+249], 0
    je xsk_7
    xsk_9:
    mov rax, qword [r15+8]
    jmp xsk_8
    xsk_7:
    mov rax, qword [r15+16]
    xsk_8:
    mov qword [r15+8], rax
    ; lea x0, xchar_emit_buf
    lea rax, [rel xchar_emit_buf]
    mov qword [r15+0], rax
    ; mov     x3, x0
    mov rax, qword [r15+0]
    mov qword [r15+24], rax
    ; cmp     x1, #0x7F
    mov rax, qword [r15+8]
    cmp rax, 0x7f
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _xe_1
    cmp byte [r15+250], 0
    je _xe_1
    cmp byte [r15+249], 0
    jne _xe_1
    ; cmp     x1, #0x7FF
    mov rax, qword [r15+8]
    cmp rax, 0x7ff
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _xe_2
    cmp byte [r15+250], 0
    je _xe_2
    cmp byte [r15+249], 0
    jne _xe_2
    ; movz    x4, #0xFFFF
    mov rax, 0xffff
    mov qword [r15+32], rax
    ; cmp     x1, x4
    mov rax, qword [r15+8]
    mov rcx, qword [r15+32]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _xe_3
    cmp byte [r15+250], 0
    je _xe_3
    cmp byte [r15+249], 0
    jne _xe_3
    ; lsr     x4, x1, #18
    mov rax, qword [r15+8]
    shr rax, 18
    mov qword [r15+32], rax
    ; orr     w4, w4, #0xF0
    mov eax, dword [r15+32]
    or eax, 0xf0
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; lsr     x4, x1, #12
    mov rax, qword [r15+8]
    shr rax, 12
    mov qword [r15+32], rax
    ; and     w4, w4, #0x3F
    mov eax, dword [r15+32]
    and eax, 0x3f
    mov qword [r15+32], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [r15+32]
    or eax, 0x80
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; lsr     x4, x1, #6
    mov rax, qword [r15+8]
    shr rax, 6
    mov qword [r15+32], rax
    ; and     w4, w4, #0x3F
    mov eax, dword [r15+32]
    and eax, 0x3f
    mov qword [r15+32], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [r15+32]
    or eax, 0x80
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; and     w4, w1, #0x3F
    mov eax, dword [r15+8]
    and eax, 0x3f
    mov qword [r15+32], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [r15+32]
    or eax, 0x80
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; b       _xe_9
    jmp _xe_9
_xe_3:
    ; lsr     x4, x1, #12
    mov rax, qword [r15+8]
    shr rax, 12
    mov qword [r15+32], rax
    ; orr     w4, w4, #0xE0
    mov eax, dword [r15+32]
    or eax, 0xe0
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; lsr     x4, x1, #6
    mov rax, qword [r15+8]
    shr rax, 6
    mov qword [r15+32], rax
    ; and     w4, w4, #0x3F
    mov eax, dword [r15+32]
    and eax, 0x3f
    mov qword [r15+32], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [r15+32]
    or eax, 0x80
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; and     w4, w1, #0x3F
    mov eax, dword [r15+8]
    and eax, 0x3f
    mov qword [r15+32], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [r15+32]
    or eax, 0x80
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; b       _xe_9
    jmp _xe_9
_xe_2:
    ; lsr     x4, x1, #6
    mov rax, qword [r15+8]
    shr rax, 6
    mov qword [r15+32], rax
    ; orr     w4, w4, #0xC0
    mov eax, dword [r15+32]
    or eax, 0xc0
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; and     w4, w1, #0x3F
    mov eax, dword [r15+8]
    and eax, 0x3f
    mov qword [r15+32], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [r15+32]
    or eax, 0x80
    mov qword [r15+32], rax
    ; strb    w4, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+32]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; b       _xe_9
    jmp _xe_9
_xe_1:
    ; strb    w1, [x0], #1
    mov r10, qword [r15+0]
    mov eax, dword [r15+8]
    mov byte [r10], al
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
_xe_9:
    ; sub     x1, x0, x3
    mov rax, qword [r15+0]
    mov rcx, qword [r15+24]
    sub rax, rcx
    mov qword [r15+8], rax
    ; mov     x0, x3
    mov rax, qword [r15+24]
    mov qword [r15+0], rax
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
    ; bl      emit_str
    lea rax, [rel xret_10]
    mov qword [r15+240], rax
    jmp emit_str
    xret_10:
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
XXCHAR_EMIT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XDP:
    ; DCB "DP", 0
    db "DP", 0
hl_XDP:
    ; DCB "DP ( -- addr ) dictionary pointer variable", 0
    db "DP ( -- addr ) dictionary pointer variable", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDP:
    ; DCQ     nm_XDP, hl_XDP
    dq nm_XDP, hl_XDP
    ; DCQ     0
    dq 0
    ; DCQ     XDP, XDP_END
    dq XDP, XDP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDP
    dq row_XDP
section .text
XDP:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _task_dp_bounds
    lea rax, [rel xret_11]
    mov qword [r15+240], rax
    jmp _task_dp_bounds
    xret_11:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
XDP_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XHERE:
    ; DCB "HERE", 0
    db "HERE", 0
hl_XHERE:
    ; DCB "HERE ( -- addr ) current dictionary pointer", 0
    db "HERE ( -- addr ) current dictionary pointer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XHERE:
    ; DCQ     nm_XHERE, hl_XHERE
    dq nm_XHERE, hl_XHERE
    ; DCQ     0
    dq 0
    ; DCQ     XHERE, XHERE_END
    dq XHERE, XHERE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XHERE
    dq row_XHERE
section .text
XHERE:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _task_dp_bounds
    lea rax, [rel xret_12]
    mov qword [r15+240], rax
    jmp _task_dp_bounds
    xret_12:
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
XHERE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XALLOT:
    ; DCB "ALLOT", 0
    db "ALLOT", 0
hl_XALLOT:
    ; DCB "ALLOT ( n -- ) allocate n bytes in dictionary", 0
    db "ALLOT ( n -- ) allocate n bytes in dictionary", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XALLOT:
    ; DCQ     nm_XALLOT, hl_XALLOT
    dq nm_XALLOT, hl_XALLOT
    ; DCQ     0
    dq 0
    ; DCQ     XALLOT, XALLOT_END
    dq XALLOT, XALLOT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XALLOT
    dq row_XALLOT
section .text
XALLOT:
    ; bl      _core_console_only
    lea rax, [rel xret_13]
    mov qword [r15+240], rax
    jmp _core_console_only
    xret_13:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _task_require_dict
    lea rax, [rel xret_14]
    mov qword [r15+240], rax
    jmp _task_require_dict
    xret_14:
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; str     x0, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; bl      _task_dp_bounds
    lea rax, [rel xret_15]
    mov qword [r15+240], rax
    jmp _task_dp_bounds
    xret_15:
    ; ldr     x6, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    add rsp, 0x10
    ; ldr     x3, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; add     x4, x3, x6
    mov rax, qword [r15+24]
    mov rcx, qword [r15+48]
    add rax, rcx
    mov qword [r15+32], rax
    ; cmp     x4, x2
    mov rax, qword [r15+32]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _allot_under
    cmp byte [r15+250], 0
    je _allot_under
    ; cmp     x4, x1
    mov rax, qword [r15+32]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _allot_over
    cmp byte [r15+250], 0
    je xsk_16
    cmp byte [r15+249], 0
    je _allot_over
    xsk_16:
    ; str     x4, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+32]
    mov qword [r10], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
_allot_under:
    ; lea x0, str_allot_under
    lea rax, [rel str_allot_under]
    mov qword [r15+0], rax
    ; b       _allot_fail
    jmp _allot_fail
_allot_over:
    ; lea x0, str_allot_over
    lea rax, [rel str_allot_over]
    mov qword [r15+0], rax
_allot_fail:
    ; bl      _print_string_svc
    lea rax, [rel xret_17]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_17:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; b       _task_stop_or_abandon
    jmp _task_stop_or_abandon
XALLOT_END:
section .bwstr align=1
nm_XCOMMA:
    ; DCB 0x2C, 0
    db 0x2c, 0
hl_XCOMMA:
    ; DCB 0x2C, "( n -- ) compile a cell", 0
    db 0x2c, "( n -- ) compile a cell", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCOMMA:
    ; DCQ     nm_XCOMMA, hl_XCOMMA
    dq nm_XCOMMA, hl_XCOMMA
    ; DCQ     0
    dq 0
    ; DCQ     XCOMMA, 0
    dq XCOMMA, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCOMMA
    dq row_XCOMMA
section .text
XCOMMA:
    ; bl      _core_console_only
    lea rax, [rel xret_18]
    mov qword [r15+240], rax
    jmp _core_console_only
    xret_18:
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; bl      _compile_cell
    lea rax, [rel xret_19]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_19:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XIMMEDIATE:
    ; DCB "IMMEDIATE", 0
    db "IMMEDIATE", 0
hl_XIMMEDIATE:
    ; DCB "IMMEDIATE ( -- ) mark latest word as immediate", 0
    db "IMMEDIATE ( -- ) mark latest word as immediate", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XIMMEDIATE:
    ; DCQ     nm_XIMMEDIATE, hl_XIMMEDIATE
    dq nm_XIMMEDIATE, hl_XIMMEDIATE
    ; DCQ     0
    dq 0
    ; DCQ     XIMMEDIATE, 0
    dq XIMMEDIATE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XIMMEDIATE
    dq row_XIMMEDIATE
section .text
XIMMEDIATE:
    ; lea x0, last_cfa
    lea rax, [rel last_cfa]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _imm_done
    mov rax, qword [r15+0]
    cmp rax, 0
    je _imm_done
    ; ldr     x1, [x0, #-8]
    mov r10, qword [r15+0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [r15+16], rax
    ; lsl     x2, x2, #63
    mov rax, qword [r15+16]
    shl rax, 63
    mov qword [r15+16], rax
    ; orr     x1, x1, x2
    mov rax, qword [r15+8]
    mov rcx, qword [r15+16]
    or rax, rcx
    mov qword [r15+8], rax
    ; str     x1, [x0, #-8]
    mov r10, qword [r15+0]
    add r10, -8
    mov rax, qword [r15+8]
    mov qword [r10], rax
_imm_done:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XSETDOC:
    ; DCB "SETDOC", 0
    db "SETDOC", 0
hl_XSETDOC:
    ; DCB "SETDOC ( c-addr u -- ) pending help for next defining word", 0
    db "SETDOC ( c-addr u -- ) pending help for next defining word", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSETDOC:
    ; DCQ     nm_XSETDOC, hl_XSETDOC
    dq nm_XSETDOC, hl_XSETDOC
    ; DCQ     0
    dq 0
    ; DCQ     XSETDOC, 0
    dq XSETDOC, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSETDOC
    dq row_XSETDOC
section .text
XSETDOC:
    ; mov     x1, x20
    mov rax, qword [r15+160]
    mov qword [r15+8], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
_setdoc_skip:
    ; cbz     x1, _setdoc_store
    mov rax, qword [r15+8]
    cmp rax, 0
    je _setdoc_store
    ; ldrb    w2, [x0]
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; cmp     w2, #32
    mov eax, dword [r15+16]
    cmp eax, 0x20
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _setdoc_adv
    cmp byte [r15+249], 0
    jne _setdoc_adv
    ; cmp     w2, #9
    mov eax, dword [r15+16]
    cmp eax, 9
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _setdoc_store
    cmp byte [r15+249], 0
    je _setdoc_store
_setdoc_adv:
    ; add     x0, x0, #1
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; sub     x1, x1, #1
    mov rax, qword [r15+8]
    sub rax, 1
    mov qword [r15+8], rax
    ; b       _setdoc_skip
    jmp _setdoc_skip
_setdoc_store:
    ; lea x2, pending_help_addr
    lea rax, [rel pending_help_addr]
    mov qword [r15+16], rax
    ; str     x0, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; lea x2, pending_help_len
    lea rax, [rel pending_help_len]
    mov qword [r15+16], rax
    ; str     x1, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XCREATE:
    ; DCB "CREATE", 0
    db "CREATE", 0
hl_XCREATE:
    ; DCB "CREATE ( 'name' -- ) create a word that pushes its data field", 0
    db "CREATE ( 'name' -- ) create a word that pushes its data field", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCREATE:
    ; DCQ     nm_XCREATE, hl_XCREATE
    dq nm_XCREATE, hl_XCREATE
    ; DCQ     0
    dq 0
    ; DCQ     XCREATE, 0
    dq XCREATE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCREATE
    dq row_XCREATE
section .text
XCREATE:
    ; bl      _core_console_only
    lea rax, [rel xret_20]
    mov qword [r15+240], rax
    jmp _core_console_only
    xret_20:
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
    ; bl      _next_word
    lea rax, [rel xret_21]
    mov qword [r15+240], rax
    jmp _next_word
    xret_21:
    ; cbz     x1, _create_fail
    mov rax, qword [r15+8]
    cmp rax, 0
    je _create_fail
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+0]
    mov qword [r10+0], rax
    mov rax, qword [r15+8]
    mov qword [r10+8], rax
    ; bl      _take_pending_help
    lea rax, [rel xret_22]
    mov qword [r15+240], rax
    jmp _take_pending_help
    xret_22:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+0], rax
    mov qword [r15+8], rcx
    ; lea x4, DOVAR
    lea rax, [rel DOVAR]
    mov qword [r15+32], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [r15+40], rax
    ; bl      _header_build
    lea rax, [rel xret_23]
    mov qword [r15+240], rax
    jmp _header_build
    xret_23:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_24]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_24:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
_create_fail:
    ; lea x0, msg_huh_k1
    lea rax, [rel msg_huh_k1]
    mov qword [r15+0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_25]
    mov qword [r15+240], rax
    jmp emit_cstr
    xret_25:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XSTATE:
    ; DCB "STATE", 0
    db "STATE", 0
hl_XSTATE:
    ; DCB "STATE ( -- addr ) compilation state variable", 0
    db "STATE ( -- addr ) compilation state variable", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSTATE:
    ; DCQ     nm_XSTATE, hl_XSTATE
    dq nm_XSTATE, hl_XSTATE
    ; DCQ     0
    dq 0
    ; DCQ     XSTATE, 0
    dq XSTATE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSTATE
    dq row_XSTATE
section .text
XSTATE:
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [r15+0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XBASE:
    ; DCB "BASE", 0
    db "BASE", 0
hl_XBASE:
    ; DCB "BASE ( -- addr ) current numeric base variable", 0
    db "BASE ( -- addr ) current numeric base variable", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBASE:
    ; DCQ     nm_XBASE, hl_XBASE
    dq nm_XBASE, hl_XBASE
    ; DCQ     0
    dq 0
    ; DCQ     XBASE, XBASE_END
    dq XBASE, XBASE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBASE
    dq row_XBASE
section .text
XBASE:
    ; lea x0, base_var
    lea rax, [rel base_var]
    mov qword [r15+0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
XBASE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XLAST:
    ; DCB "LAST", 0
    db "LAST", 0
hl_XLAST:
    ; DCB "LAST ( -- xt ) CFA of most recently defined word", 0
    db "LAST ( -- xt ) CFA of most recently defined word", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLAST:
    ; DCQ     nm_XLAST, hl_XLAST
    dq nm_XLAST, hl_XLAST
    ; DCQ     0
    dq 0
    ; DCQ     XLAST, 0
    dq XLAST, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLAST
    dq row_XLAST
section .text
XLAST:
    ; lea x0, last_cfa
    lea rax, [rel last_cfa]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XREGWID:
    ; DCB "(REGISTER-WID)", 0
    db "(REGISTER-WID)", 0
hl_XREGWID:
    ; DCB "(REGISTER-WID) ( wid -- ) register a wordlist", 0
    db "(REGISTER-WID) ( wid -- ) register a wordlist", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XREGWID:
    ; DCQ     nm_XREGWID, hl_XREGWID
    dq nm_XREGWID, hl_XREGWID
    ; DCQ     0
    dq 0
    ; DCQ     XREGWID, 0
    dq XREGWID, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XREGWID
    dq row_XREGWID
section .text
XREGWID:
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
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
    ; bl      _wordlist_register
    lea rax, [rel xret_26]
    mov qword [r15+240], rax
    jmp _wordlist_register
    xret_26:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
_wordlist_register:
    ; lea x1, wordlist_reg_n
    lea rax, [rel wordlist_reg_n]
    mov qword [r15+8], rax
    ; ldr     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; lea x3, wordlist_reg
    lea rax, [rel wordlist_reg]
    mov qword [r15+24], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [r15+32], rax
_wreg_scan:
    ; cmp     x4, x2
    mov rax, qword [r15+32]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _wreg_add
    cmp byte [r15+250], 0
    jne _wreg_add
    ; ldr     x5, [x3, x4, lsl #3]
    mov r10, qword [r15+24]
    mov rax, qword [r15+32]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; cmp     x5, x0
    mov rax, qword [r15+40]
    mov rcx, qword [r15+0]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _wreg_done
    cmp byte [r15+249], 0
    jne _wreg_done
    ; add     x4, x4, #1
    mov rax, qword [r15+32]
    add rax, 1
    mov qword [r15+32], rax
    ; b       _wreg_scan
    jmp _wreg_scan
_wreg_add:
    ; cmp     x2, #128
    mov rax, qword [r15+16]
    cmp rax, 0x80
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _wreg_done
    cmp byte [r15+250], 0
    jne _wreg_done
    ; str     x0, [x3, x2, lsl #3]
    mov r10, qword [r15+24]
    mov rax, qword [r15+16]
    shl rax, 3
    add r10, rax
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; add     x2, x2, #1
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; str     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+16]
    mov qword [r10], rax
_wreg_done:
    ; ret
    jmp qword [r15+240]
section .bwstr align=1
nm_XGET_ORDER:
    ; DCB "GET-ORDER", 0
    db "GET-ORDER", 0
hl_XGET_ORDER:
    ; DCB "GET-ORDER ( -- widn ... wid1 n ) copy search order", 0
    db "GET-ORDER ( -- widn ... wid1 n ) copy search order", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XGET_ORDER:
    ; DCQ     nm_XGET_ORDER, hl_XGET_ORDER
    dq nm_XGET_ORDER, hl_XGET_ORDER
    ; DCQ     0
    dq 0
    ; DCQ     XGET_ORDER, 0
    dq XGET_ORDER, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XGET_ORDER
    dq row_XGET_ORDER
section .text
XGET_ORDER:
    ; lea x0, search_order_n
    lea rax, [rel search_order_n]
    mov qword [r15+0], rax
    ; ldr     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; lea x2, search_order
    lea rax, [rel search_order]
    mov qword [r15+16], rax
    ; mov     x3, x1
    mov rax, qword [r15+8]
    mov qword [r15+24], rax
_get_ord_loop:
    ; cbz     x3, _get_ord_n
    mov rax, qword [r15+24]
    cmp rax, 0
    je _get_ord_n
    ; sub     x3, x3, #1
    mov rax, qword [r15+24]
    sub rax, 1
    mov qword [r15+24], rax
    ; ldr     x4, [x2, x3, lsl #3]
    mov r10, qword [r15+16]
    mov rax, qword [r15+24]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [r15+32], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x4
    mov rax, qword [r15+32]
    mov qword [r15+160], rax
    ; b       _get_ord_loop
    jmp _get_ord_loop
_get_ord_n:
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [r15+8]
    mov qword [r15+160], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XSET_ORDER:
    ; DCB "SET-ORDER", 0
    db "SET-ORDER", 0
hl_XSET_ORDER:
    ; DCB "SET-ORDER ( widn ... wid1 n -- ) replace search order", 0
    db "SET-ORDER ( widn ... wid1 n -- ) replace search order", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSET_ORDER:
    ; DCQ     nm_XSET_ORDER, hl_XSET_ORDER
    dq nm_XSET_ORDER, hl_XSET_ORDER
    ; DCQ     0
    dq 0
    ; DCQ     XSET_ORDER, 0
    dq XSET_ORDER, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSET_ORDER
    dq row_XSET_ORDER
section .text
XSET_ORDER:
    ; mov     x1, x20
    mov rax, qword [r15+160]
    mov qword [r15+8], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cmn     x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.eq    XONLY
    cmp byte [r15+249], 0
    jne XONLY
    ; cmp     x1, #0
    mov rax, qword [r15+8]
    cmp rax, 0
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lt    _set_ord_bad
    mov r11b, byte [r15+248]
    cmp r11b, byte [r15+251]
    jne _set_ord_bad
    ; cmp     x1, #8
    mov rax, qword [r15+8]
    cmp rax, 8
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _set_ord_bad
    cmp byte [r15+250], 0
    je xsk_27
    cmp byte [r15+249], 0
    je _set_ord_bad
    xsk_27:
    ; lea x0, search_order_n
    lea rax, [rel search_order_n]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x2, search_order
    lea rax, [rel search_order]
    mov qword [r15+16], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [r15+24], rax
_set_ord_loop:
    ; cmp     x3, x1
    mov rax, qword [r15+24]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _set_ord_bad
    cmp byte [r15+250], 0
    jne _set_ord_bad
    ; str     x20, [x2, x3, lsl #3]
    mov r10, qword [r15+16]
    mov rax, qword [r15+24]
    shl rax, 3
    add r10, rax
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; add     x3, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; b       _set_ord_loop
    jmp _set_ord_loop
_set_ord_bad:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XPUSH_ORDER:
    ; DCB "PUSH-ORDER", 0
    db "PUSH-ORDER", 0
hl_XPUSH_ORDER:
    ; DCB "PUSH-ORDER ( wid -- ) prepend wid to search order", 0
    db "PUSH-ORDER ( wid -- ) prepend wid to search order", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPUSH_ORDER:
    ; DCQ     nm_XPUSH_ORDER, hl_XPUSH_ORDER
    dq nm_XPUSH_ORDER, hl_XPUSH_ORDER
    ; DCQ     0
    dq 0
    ; DCQ     XPUSH_ORDER, 0
    dq XPUSH_ORDER, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPUSH_ORDER
    dq row_XPUSH_ORDER
section .text
XPUSH_ORDER:
    ; lea x0, search_order_n
    lea rax, [rel search_order_n]
    mov qword [r15+0], rax
    ; ldr     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cmp     x1, #8
    mov rax, qword [r15+8]
    cmp rax, 8
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _push_ord_drop
    cmp byte [r15+250], 0
    jne _push_ord_drop
    ; lea x2, search_order
    lea rax, [rel search_order]
    mov qword [r15+16], rax
    ; mov     x3, x1
    mov rax, qword [r15+8]
    mov qword [r15+24], rax
_push_ord_shift:
    ; cbz     x3, _push_ord_store
    mov rax, qword [r15+24]
    cmp rax, 0
    je _push_ord_store
    ; sub     x3, x3, #1
    mov rax, qword [r15+24]
    sub rax, 1
    mov qword [r15+24], rax
    ; ldr     x4, [x2, x3, lsl #3]
    mov r10, qword [r15+16]
    mov rax, qword [r15+24]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [r15+32], rax
    ; add     x5, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+40], rax
    ; str     x4, [x2, x5, lsl #3]
    mov r10, qword [r15+16]
    mov rax, qword [r15+40]
    shl rax, 3
    add r10, rax
    mov rax, qword [r15+32]
    mov qword [r10], rax
    ; b       _push_ord_shift
    jmp _push_ord_shift
_push_ord_store:
    ; str     x20, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; add     x1, x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
_push_ord_drop:
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XDEFINITIONS:
    ; DCB "DEFINITIONS", 0
    db "DEFINITIONS", 0
hl_XDEFINITIONS:
    ; DCB "DEFINITIONS ( -- ) CURRENT = first in search order", 0
    db "DEFINITIONS ( -- ) CURRENT = first in search order", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDEFINITIONS:
    ; DCQ     nm_XDEFINITIONS, hl_XDEFINITIONS
    dq nm_XDEFINITIONS, hl_XDEFINITIONS
    ; DCQ     0
    dq 0
    ; DCQ     XDEFINITIONS, 0
    dq XDEFINITIONS, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDEFINITIONS
    dq row_XDEFINITIONS
section .text
XDEFINITIONS:
    ; lea x0, search_order_n
    lea rax, [rel search_order_n]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _def_done
    mov rax, qword [r15+0]
    cmp rax, 0
    je _def_done
    ; lea x1, search_order
    lea rax, [rel search_order]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; lea x0, current_var
    lea rax, [rel current_var]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
_def_done:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XONLY:
    ; DCB "ONLY", 0
    db "ONLY", 0
hl_XONLY:
    ; DCB "ONLY ( -- ) search order = FORTH only", 0
    db "ONLY ( -- ) search order = FORTH only", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XONLY:
    ; DCQ     nm_XONLY, hl_XONLY
    dq nm_XONLY, hl_XONLY
    ; DCQ     0
    dq 0
    ; DCQ     XONLY, 0
    dq XONLY, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XONLY
    dq row_XONLY
section .text
XONLY:
    ; lea x0, latest_var
    lea rax, [rel latest_var]
    mov qword [r15+0], rax
    ; lea x1, search_order
    lea rax, [rel search_order]
    mov qword [r15+8], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; lea x1, search_order_n
    lea rax, [rel search_order_n]
    mov qword [r15+8], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XFORTH:
    ; DCB "FORTH", 0
    db "FORTH", 0
hl_XFORTH:
    ; DCB "FORTH ( -- ) set first search-order entry to FORTH", 0
    db "FORTH ( -- ) set first search-order entry to FORTH", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFORTH:
    ; DCQ     nm_XFORTH, hl_XFORTH
    dq nm_XFORTH, hl_XFORTH
    ; DCQ     0
    dq 0
    ; DCQ     XFORTH, 0
    dq XFORTH, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFORTH
    dq row_XFORTH
section .text
XFORTH:
    ; lea x0, latest_var
    lea rax, [rel latest_var]
    mov qword [r15+0], rax
    ; lea x1, search_order
    lea rax, [rel search_order]
    mov qword [r15+8], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; lea x1, search_order_n
    lea rax, [rel search_order_n]
    mov qword [r15+8], rax
    ; ldr     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbnz    x2, _forth_done
    mov rax, qword [r15+16]
    cmp rax, 0
    jne _forth_done
    ; mov     x2, #1
    mov rax, 1
    mov qword [r15+16], rax
    ; str     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+16]
    mov qword [r10], rax
_forth_done:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XCURRENT:
    ; DCB "CURRENT", 0
    db "CURRENT", 0
hl_XCURRENT:
    ; DCB "CURRENT ( -- addr ) compilation wordlist variable", 0
    db "CURRENT ( -- addr ) compilation wordlist variable", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCURRENT:
    ; DCQ     nm_XCURRENT, hl_XCURRENT
    dq nm_XCURRENT, hl_XCURRENT
    ; DCQ     0
    dq 0
    ; DCQ     XCURRENT, 0
    dq XCURRENT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCURRENT
    dq row_XCURRENT
section .text
XCURRENT:
    ; lea x0, current_var
    lea rax, [rel current_var]
    mov qword [r15+0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XGET_CURRENT:
    ; DCB "GET-CURRENT", 0
    db "GET-CURRENT", 0
hl_XGET_CURRENT:
    ; DCB "GET-CURRENT ( -- wid ) wid of the compilation wordlist", 0
    db "GET-CURRENT ( -- wid ) wid of the compilation wordlist", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XGET_CURRENT:
    ; DCQ     nm_XGET_CURRENT, hl_XGET_CURRENT
    dq nm_XGET_CURRENT, hl_XGET_CURRENT
    ; DCQ     0
    dq 0
    ; DCQ     XGET_CURRENT, 0
    dq XGET_CURRENT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XGET_CURRENT
    dq row_XGET_CURRENT
section .text
XGET_CURRENT:
    ; lea x0, current_var
    lea rax, [rel current_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XSET_CURRENT:
    ; DCB "SET-CURRENT", 0
    db "SET-CURRENT", 0
hl_XSET_CURRENT:
    ; DCB "SET-CURRENT ( wid -- ) set the compilation wordlist", 0
    db "SET-CURRENT ( wid -- ) set the compilation wordlist", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSET_CURRENT:
    ; DCQ     nm_XSET_CURRENT, hl_XSET_CURRENT
    dq nm_XSET_CURRENT, hl_XSET_CURRENT
    ; DCQ     0
    dq 0
    ; DCQ     XSET_CURRENT, 0
    dq XSET_CURRENT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSET_CURRENT
    dq row_XSET_CURRENT
section .text
XSET_CURRENT:
    ; lea x0, current_var
    lea rax, [rel current_var]
    mov qword [r15+0], rax
    ; str     x20, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [r15+224]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [r15+8]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; ldr     x1, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; br      x1
    mov rax, qword [r15+8]
    jmp rax
section .bwstr align=1
nm_XWORDLIST:
    ; DCB "WORDLIST", 0
    db "WORDLIST", 0
hl_XWORDLIST:
    ; DCB "WORDLIST ( -- wid ) create empty word list", 0
    db "WORDLIST ( -- wid ) create empty word list", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XWORDLIST:
    ; DCQ     nm_XWORDLIST, hl_XWORDLIST
    dq nm_XWORDLIST, hl_XWORDLIST
    ; DCQ     0
    dq 0
    ; DCQ     XWORDLIST, 0
    dq XWORDLIST, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XWORDLIST
    dq row_XWORDLIST
section .text
XWORDLIST:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _task_require_dict
    lea rax, [rel xret_28]
    mov qword [r15+240], rax
    jmp _task_require_dict
    xret_28:
    ; bl      _task_dp_bounds
    lea rax, [rel xret_29]
    mov qword [r15+240], rax
