; Generated from Forth/kernel/arm64/prims_k1.asm. Do not edit.
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
extern DOCOL
extern _compile_cell
extern _cursor_commit
extern _cursor_load
extern _find_word
extern _header_build
extern _next_word
extern _nfa_reveal_cfa
extern _print_signed
extern _print_wid_name
extern _putchar
extern _quit_exit
extern _take_line
extern _take_pending_help
extern _throw_unwind_to_sp
extern base_var
extern blk_var
extern cfa_0branch
extern cfa_branch
extern cfa_cstr
extern cfa_does
extern cfa_lit
extern cfa_slit
extern current_var
extern data_stack
extern debug_break_asap
extern emit_cstr
extern emit_str
extern eval_resume_sp
extern here_ptr
extern last_cfa
extern latest_var
extern line_mode
extern next_debug
extern pad_buffer
extern pending_help_addr
extern pending_help_len
extern search_order
extern search_order_n
extern source_base
extern source_cur
extern source_end
extern state_var
extern throw_handler
extern to_in
extern user_dict_area
extern user_dict_size_cell
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
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    je XQDUP_END
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
XQDUP_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x22, #8]
    mov r10, qword [rel arm_x22]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; str     x0, [x22, #8]
    mov r10, qword [rel arm_x22]
    add r10, 8
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; str     x20, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
XROT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x22, #8]
    mov r10, qword [rel arm_x22]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; str     x20, [x22, #8]
    mov r10, qword [rel arm_x22]
    add r10, 8
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; str     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XNROT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cbz     x1, XROLL_END
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je XROLL_END
    ; sub     x2, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x2], rax
    ; lsl     x2, x2, #3
    mov rax, qword [rel arm_x2]
    shl rax, 3
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x22, x2]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; mov     x4, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x4], rax
_roll_shift:
    ; cbz     x4, _roll_put
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _roll_put
    ; sub     x5, x4, #8
    mov rax, qword [rel arm_x4]
    sub rax, 8
    mov qword [rel arm_x5], rax
    ; ldr     x6, [x22, x5]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x5]
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; str     x6, [x22, x4]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x4]
    add r10, rax
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; mov     x4, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x4], rax
    ; b       _roll_shift
    jmp _roll_shift
_roll_put:
    ; str     x0, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x20, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x20], rax
XROLL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XNIP_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XTOR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
XRTO_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x23]
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
XRFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    add rax, 1
    mov qword [rel arm_x20], rax
XONEPLUS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; and     x20, x20, x0
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x0]
    and rax, rcx
    mov qword [rel arm_x20], rax
XAND_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; orr     x20, x20, x0
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x0]
    or rax, rcx
    mov qword [rel arm_x20], rax
XORR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    not rax
    mov qword [rel arm_x20], rax
XINVERT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; lsr     x20, x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    shr rax, cl
    mov qword [rel arm_x20], rax
XRSHIFT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cmp     x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, eq
    xor eax, eax
    cmp byte [rel arm_z], 0
    je xsk_1
    mov rax, -1
    xsk_1:
    mov qword [rel arm_x20], rax
XEQUAL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cmp     x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, lt
    xor eax, eax
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_2
    mov rax, -1
    xsk_2:
    mov qword [rel arm_x20], rax
XLESS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cmp     x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, gt
    xor eax, eax
    cmp byte [rel arm_z], 0
    jne xsk_3
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne xsk_3
    mov rax, -1
    xsk_3:
    mov qword [rel arm_x20], rax
XGREATER_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, eq
    xor eax, eax
    cmp byte [rel arm_z], 0
    je xsk_4
    mov rax, -1
    xsk_4:
    mov qword [rel arm_x20], rax
XZEQUAL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x20]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
XFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; str     x0, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XSTORE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x20]
    movzx eax, byte [r10]
    mov qword [rel arm_x20], rax
XCFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; strb    w0, [x20]
    mov r10, qword [rel arm_x20]
    mov eax, dword [rel arm_x0]
    mov byte [r10], al
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XCSTORE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XBL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; bl      _putchar
    lea rax, [rel xret_5]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_5:
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
XEMIT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cbz     x1, XTYPE_END
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je XTYPE_END
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
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; bl      emit_str
    lea rax, [rel xret_6]
    mov qword [rel arm_x30], rax
    jmp emit_str
    xret_6:
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
XTYPE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; movz    x2, #0xFFFF
    mov rax, 0xffff
    mov qword [rel arm_x2], rax
    ; movk    x2, #0x10, lsl #16
    mov rax, qword [rel arm_x2]
    mov rcx, 0xffffffff0000ffff
    and rax, rcx
    mov rcx, 0x100000
    or rax, rcx
    mov qword [rel arm_x2], rax
    ; cmp     x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csel    x1, x2, x1, hi
    cmp byte [rel arm_c], 0
    je xsk_9
    cmp byte [rel arm_z], 0
    je xsk_7
    xsk_9:
    mov rax, qword [rel arm_x1]
    jmp xsk_8
    xsk_7:
    mov rax, qword [rel arm_x2]
    xsk_8:
    mov qword [rel arm_x1], rax
    ; lea x0, xchar_emit_buf
    lea rax, [rel xchar_emit_buf]
    mov qword [rel arm_x0], rax
    ; mov     x3, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x3], rax
    ; cmp     x1, #0x7F
    mov rax, qword [rel arm_x1]
    cmp rax, 0x7f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _xe_1
    cmp byte [rel arm_c], 0
    je _xe_1
    cmp byte [rel arm_z], 0
    jne _xe_1
    ; cmp     x1, #0x7FF
    mov rax, qword [rel arm_x1]
    cmp rax, 0x7ff
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _xe_2
    cmp byte [rel arm_c], 0
    je _xe_2
    cmp byte [rel arm_z], 0
    jne _xe_2
    ; movz    x4, #0xFFFF
    mov rax, 0xffff
    mov qword [rel arm_x4], rax
    ; cmp     x1, x4
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _xe_3
    cmp byte [rel arm_c], 0
    je _xe_3
    cmp byte [rel arm_z], 0
    jne _xe_3
    ; lsr     x4, x1, #18
    mov rax, qword [rel arm_x1]
    shr rax, 18
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0xF0
    mov eax, dword [rel arm_x4]
    or eax, 0xf0
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; lsr     x4, x1, #12
    mov rax, qword [rel arm_x1]
    shr rax, 12
    mov qword [rel arm_x4], rax
    ; and     w4, w4, #0x3F
    mov eax, dword [rel arm_x4]
    and eax, 0x3f
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [rel arm_x4]
    or eax, 0x80
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; lsr     x4, x1, #6
    mov rax, qword [rel arm_x1]
    shr rax, 6
    mov qword [rel arm_x4], rax
    ; and     w4, w4, #0x3F
    mov eax, dword [rel arm_x4]
    and eax, 0x3f
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [rel arm_x4]
    or eax, 0x80
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w4, w1, #0x3F
    mov eax, dword [rel arm_x1]
    and eax, 0x3f
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [rel arm_x4]
    or eax, 0x80
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _xe_9
    jmp _xe_9
_xe_3:
    ; lsr     x4, x1, #12
    mov rax, qword [rel arm_x1]
    shr rax, 12
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0xE0
    mov eax, dword [rel arm_x4]
    or eax, 0xe0
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; lsr     x4, x1, #6
    mov rax, qword [rel arm_x1]
    shr rax, 6
    mov qword [rel arm_x4], rax
    ; and     w4, w4, #0x3F
    mov eax, dword [rel arm_x4]
    and eax, 0x3f
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [rel arm_x4]
    or eax, 0x80
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w4, w1, #0x3F
    mov eax, dword [rel arm_x1]
    and eax, 0x3f
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [rel arm_x4]
    or eax, 0x80
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _xe_9
    jmp _xe_9
_xe_2:
    ; lsr     x4, x1, #6
    mov rax, qword [rel arm_x1]
    shr rax, 6
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0xC0
    mov eax, dword [rel arm_x4]
    or eax, 0xc0
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w4, w1, #0x3F
    mov eax, dword [rel arm_x1]
    and eax, 0x3f
    mov qword [rel arm_x4], rax
    ; orr     w4, w4, #0x80
    mov eax, dword [rel arm_x4]
    or eax, 0x80
    mov qword [rel arm_x4], rax
    ; strb    w4, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _xe_9
    jmp _xe_9
_xe_1:
    ; strb    w1, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x1]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
_xe_9:
    ; sub     x1, x0, x3
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x3]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; mov     x0, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x0], rax
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
    ; bl      emit_str
    lea rax, [rel xret_10]
    mov qword [rel arm_x30], rax
    jmp emit_str
    xret_10:
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
XXCHAR_EMIT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XDP_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XHERE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; lea x1, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; add     x3, x2, x0
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x3], rax
    ; lea x4, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [rel arm_x4], rax
    ; cmp     x3, x4
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _allot_fail
    cmp byte [rel arm_c], 0
    je _allot_fail
    ; lea x5, user_dict_size_cell
    lea rax, [rel user_dict_size_cell]
    mov qword [rel arm_x5], rax
    ; ldr     x5, [x5]
    mov r10, qword [rel arm_x5]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; add     x5, x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    add rax, rcx
    mov qword [rel arm_x5], rax
    ; cmp     x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _allot_fail
    cmp byte [rel arm_c], 0
    je xsk_11
    cmp byte [rel arm_z], 0
    je _allot_fail
    xsk_11:
    ; str     x3, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; b       XALLOT_END
    jmp XALLOT_END
_allot_fail:
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
    ; lea x0, msg_allot
    lea rax, [rel msg_allot]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_12]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_12:
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
    ; b       _quit_exit
    jmp _quit_exit
XALLOT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
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
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; bl      _compile_cell
    lea rax, [rel xret_13]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_13:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _imm_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _imm_done
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [rel arm_x2], rax
    ; lsl     x2, x2, #63
    mov rax, qword [rel arm_x2]
    shl rax, 63
    mov qword [rel arm_x2], rax
    ; orr     x1, x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    or rax, rcx
    mov qword [rel arm_x1], rax
    ; str     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
_imm_done:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
_setdoc_skip:
    ; cbz     x1, _setdoc_store
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _setdoc_store
    ; ldrb    w2, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    ; cmp     w2, #32
    mov eax, dword [rel arm_x2]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _setdoc_adv
    cmp byte [rel arm_z], 0
    jne _setdoc_adv
    ; cmp     w2, #9
    mov eax, dword [rel arm_x2]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _setdoc_store
    cmp byte [rel arm_z], 0
    je _setdoc_store
_setdoc_adv:
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; b       _setdoc_skip
    jmp _setdoc_skip
_setdoc_store:
    ; lea x2, pending_help_addr
    lea rax, [rel pending_help_addr]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, pending_help_len
    lea rax, [rel pending_help_len]
    mov qword [rel arm_x2], rax
    ; str     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    ; bl      _next_word
    lea rax, [rel xret_14]
    mov qword [rel arm_x30], rax
    jmp _next_word
    xret_14:
    ; cbz     x1, _create_fail
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _create_fail
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _take_pending_help
    lea rax, [rel xret_15]
    mov qword [rel arm_x30], rax
    jmp _take_pending_help
    xret_15:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; lea x4, DOVAR
    lea rax, [rel DOVAR]
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _header_build
    lea rax, [rel xret_16]
    mov qword [rel arm_x30], rax
    jmp _header_build
    xret_16:
    ; lea x1, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0], #8
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    mov rax, qword [rel arm_x0]
    add rax, 8
    mov qword [rel arm_x0], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_create_fail:
    ; lea x0, msg_huh_k1
    lea rax, [rel msg_huh_k1]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_17]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_17:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XBASE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; bl      _wordlist_register
    lea rax, [rel xret_18]
    mov qword [rel arm_x30], rax
    jmp _wordlist_register
    xret_18:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_wordlist_register:
    ; lea x1, wordlist_reg_n
    lea rax, [rel wordlist_reg_n]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; lea x3, wordlist_reg
    lea rax, [rel wordlist_reg]
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
_wreg_scan:
    ; cmp     x4, x2
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _wreg_add
    cmp byte [rel arm_c], 0
    jne _wreg_add
    ; ldr     x5, [x3, x4, lsl #3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x4]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; cmp     x5, x0
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _wreg_done
    cmp byte [rel arm_z], 0
    jne _wreg_done
    ; add     x4, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x4], rax
    ; b       _wreg_scan
    jmp _wreg_scan
_wreg_add:
    ; cmp     x2, #32
    mov rax, qword [rel arm_x2]
    cmp rax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _wreg_done
    cmp byte [rel arm_c], 0
    jne _wreg_done
    ; str     x0, [x3, x2, lsl #3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x2]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
_wreg_done:
    ; ret
    jmp qword [rel arm_x30]
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
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x2], rax
    ; mov     x3, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x3], rax
_get_ord_loop:
    ; cbz     x3, _get_ord_n
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je _get_ord_n
    ; sub     x3, x3, #1
    mov rax, qword [rel arm_x3]
    sub rax, 1
    mov qword [rel arm_x3], rax
    ; ldr     x4, [x2, x3, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x4
    mov rax, qword [rel arm_x4]
    mov qword [rel arm_x20], rax
    ; b       _get_ord_loop
    jmp _get_ord_loop
_get_ord_n:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cmn     x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.eq    XONLY
    cmp byte [rel arm_z], 0
    jne XONLY
    ; cmp     x1, #0
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lt    _set_ord_bad
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne _set_ord_bad
    ; cmp     x1, #8
    mov rax, qword [rel arm_x1]
    cmp rax, 8
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _set_ord_bad
    cmp byte [rel arm_c], 0
    je xsk_19
    cmp byte [rel arm_z], 0
    je _set_ord_bad
    xsk_19:
    ; lea x0, search_order_n
    lea rax, [rel search_order_n]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x2, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
_set_ord_loop:
    ; cmp     x3, x1
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _set_ord_bad
    cmp byte [rel arm_c], 0
    jne _set_ord_bad
    ; str     x20, [x2, x3, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _set_ord_loop
    jmp _set_ord_loop
_set_ord_bad:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x1, #8
    mov rax, qword [rel arm_x1]
    cmp rax, 8
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _push_ord_drop
    cmp byte [rel arm_c], 0
    jne _push_ord_drop
    ; lea x2, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x2], rax
    ; mov     x3, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x3], rax
_push_ord_shift:
    ; cbz     x3, _push_ord_store
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je _push_ord_store
    ; sub     x3, x3, #1
    mov rax, qword [rel arm_x3]
    sub rax, 1
    mov qword [rel arm_x3], rax
    ; ldr     x4, [x2, x3, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; add     x5, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x5], rax
    ; str     x4, [x2, x5, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x5]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x4]
    mov qword [r10], rax
    ; b       _push_ord_shift
    jmp _push_ord_shift
_push_ord_store:
    ; str     x20, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
_push_ord_drop:
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _def_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _def_done
    ; lea x1, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, current_var
    lea rax, [rel current_var]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
_def_done:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; lea x1, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; lea x1, search_order_n
    lea rax, [rel search_order_n]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; lea x1, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x1, search_order_n
    lea rax, [rel search_order_n]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbnz    x2, _forth_done
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    jne _forth_done
    ; mov     x2, #1
    mov rax, 1
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
_forth_done:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    mov qword [rel arm_x0], rax
    ; str     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
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
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; add     x1, x1, #7
    mov rax, qword [rel arm_x1]
    add rax, 7
    mov qword [rel arm_x1], rax
    ; bic     x1, x1, #7
    mov rax, qword [rel arm_x1]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [rel arm_x1], rax
    ; add     x3, x1, #128
    mov rax, qword [rel arm_x1]
    add rax, 0x80
    mov qword [rel arm_x3], rax
    ; lea x4, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [rel arm_x4], rax
    ; cmp     x3, x4
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _allot_fail
    cmp byte [rel arm_c], 0
    je _allot_fail
    ; lea x5, user_dict_size_cell
    lea rax, [rel user_dict_size_cell]
    mov qword [rel arm_x5], rax
    ; ldr     x5, [x5]
    mov r10, qword [rel arm_x5]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; add     x5, x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    add rax, rcx
    mov qword [rel arm_x5], rax
    ; cmp     x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _allot_fail
    cmp byte [rel arm_c], 0
    je xsk_20
    cmp byte [rel arm_z], 0
    je _allot_fail
    xsk_20:
    ; mov     x2, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x2], rax
    ; mov     x5, #16
    mov rax, 0x10
    mov qword [rel arm_x5], rax
_wl_zero:
    ; str     xzr, [x1], #8
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    mov rax, qword [rel arm_x1]
    add rax, 8
    mov qword [rel arm_x1], rax
    ; subs    x5, x5, #1
    mov rax, qword [rel arm_x5]
    sub rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x5], rax
    ; b.ne    _wl_zero
    cmp byte [rel arm_z], 0
    je _wl_zero
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
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
    ; bl      _wordlist_register
    lea rax, [rel xret_21]
    mov qword [rel arm_x30], rax
    jmp _wordlist_register
    xret_21:
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
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XPREVIOUS:
    ; DCB "PREVIOUS", 0
    db "PREVIOUS", 0
hl_XPREVIOUS:
    ; DCB "PREVIOUS ( -- ) drop first search-order entry", 0
    db "PREVIOUS ( -- ) drop first search-order entry", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPREVIOUS:
    ; DCQ     nm_XPREVIOUS, hl_XPREVIOUS
    dq nm_XPREVIOUS, hl_XPREVIOUS
    ; DCQ     0
    dq 0
    ; DCQ     XPREVIOUS, 0
    dq XPREVIOUS, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPREVIOUS
    dq row_XPREVIOUS
section .text
XPREVIOUS:
    ; lea x0, search_order_n
    lea rax, [rel search_order_n]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x1, #1
    mov rax, qword [rel arm_x1]
    cmp rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _prev_done
    cmp byte [rel arm_c], 0
    je _prev_done
    cmp byte [rel arm_z], 0
    jne _prev_done
    ; lea x2, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
_prev_shift:
    ; add     x4, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x4], rax
    ; cmp     x4, x1
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _prev_store
    cmp byte [rel arm_c], 0
    jne _prev_store
    ; ldr     x5, [x2, x4, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x4]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; str     x5, [x2, x3, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _prev_shift
    jmp _prev_shift
_prev_store:
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
_prev_done:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XORDER:
    ; DCB "ORDER", 0
    db "ORDER", 0
hl_XORDER:
    ; DCB "ORDER ( -- ) print search order and CURRENT", 0
    db "ORDER ( -- ) print search order and CURRENT", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XORDER:
    ; DCQ     nm_XORDER, hl_XORDER
    dq nm_XORDER, hl_XORDER
    ; DCQ     0
    dq 0
    ; DCQ     XORDER, 0
    dq XORDER, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XORDER
    dq row_XORDER
section .text
XORDER:
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
    ; stp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; lea x0, str_search_order
    lea rax, [rel str_search_order]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_22]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_22:
    ; lea x0, search_order_n
    lea rax, [rel search_order_n]
    mov qword [rel arm_x0], rax
    ; ldr     x19, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    ; lea x20, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x20], rax
    ; mov     x21, #0
    mov rax, 0
    mov qword [rel arm_x21], rax
_ord_loop:
    ; cmp     x21, x19
    mov rax, qword [rel arm_x21]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _ord_nl
    cmp byte [rel arm_c], 0
    jne _ord_nl
    ; ldr     x0, [x20, x21, lsl #3]
    mov r10, qword [rel arm_x20]
    mov rax, qword [rel arm_x21]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_wid_name
    lea rax, [rel xret_23]
    mov qword [rel arm_x30], rax
    jmp _print_wid_name
    xret_23:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_24]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_24:
    ; add     x21, x21, #1
    mov rax, qword [rel arm_x21]
    add rax, 1
    mov qword [rel arm_x21], rax
    ; b       _ord_loop
    jmp _ord_loop
_ord_nl:
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_25]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_25:
    ; lea x0, str_comp_wl
    lea rax, [rel str_comp_wl]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_26]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_26:
    ; lea x0, current_var
    lea rax, [rel current_var]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_wid_name
    lea rax, [rel xret_27]
    mov qword [rel arm_x30], rax
    jmp _print_wid_name
    xret_27:
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_28]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_28:
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
    ; add     sp, sp, #80
    mov rax, rsp
    add rax, 0x50
    mov rsp, rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XCELL:
    ; DCB "CELL", 0
    db "CELL", 0
hl_XCELL:
    ; DCB "CELL ( -- n ) address unit size in bytes", 0
    db "CELL ( -- n ) address unit size in bytes", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCELL:
    ; DCQ     nm_XCELL, hl_XCELL
    dq nm_XCELL, hl_XCELL
    ; DCQ     0
    dq 0
    ; DCQ     XCELL, XCELL_END
    dq XCELL, XCELL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCELL
    dq row_XCELL
section .text
XCELL:
    ; mov     x0, #8
    mov rax, 8
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XCELL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XCELLS:
    ; DCB "CELLS", 0
    db "CELLS", 0
hl_XCELLS:
    ; DCB "CELLS ( n -- n ) cells to address units", 0
    db "CELLS ( n -- n ) cells to address units", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCELLS:
    ; DCQ     nm_XCELLS, hl_XCELLS
    dq nm_XCELLS, hl_XCELLS
    ; DCQ     0
    dq 0
    ; DCQ     XCELLS, XCELLS_END
    dq XCELLS, XCELLS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCELLS
    dq row_XCELLS
section .text
XCELLS:
    ; lsl     x20, x20, #3
    mov rax, qword [rel arm_x20]
    shl rax, 3
    mov qword [rel arm_x20], rax
XCELLS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XDEPTH:
    ; DCB "DEPTH", 0
    db "DEPTH", 0
hl_XDEPTH:
    ; DCB "DEPTH ( -- +n ) data stack depth in cells", 0
    db "DEPTH ( -- +n ) data stack depth in cells", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDEPTH:
    ; DCQ     nm_XDEPTH, hl_XDEPTH
    dq nm_XDEPTH, hl_XDEPTH
    ; DCQ     0
    dq 0
    ; DCQ     XDEPTH, XDEPTH_END
    dq XDEPTH, XDEPTH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDEPTH
    dq row_XDEPTH
section .text
XDEPTH:
    ; lea x1, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x1], rax
    ; add     x0, x1, #1, lsl #12
    mov rax, qword [rel arm_x1]
    add rax, 0x1000
    mov qword [rel arm_x0], rax
    ; cmp     x22, x0
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _depth_fix
    cmp byte [rel arm_c], 0
    je xsk_29
    cmp byte [rel arm_z], 0
    je _depth_fix
    xsk_29:
    ; cmp     x22, x1
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _depth_fix
    cmp byte [rel arm_c], 0
    je _depth_fix
    ; b       _depth_n
    jmp _depth_n
_depth_fix:
    ; mov     x22, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x22], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
_depth_n:
    ; sub     x0, x0, x22
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x22]
    sub rax, rcx
    mov qword [rel arm_x0], rax
    ; lsr     x0, x0, #3
    mov rax, qword [rel arm_x0]
    shr rax, 3
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XDEPTH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XCLEARSTACK:
    ; DCB "CLEARSTACK", 0
    db "CLEARSTACK", 0
hl_XCLEARSTACK:
    ; DCB "CLEARSTACK ( -- ) empty the data stack", 0
    db "CLEARSTACK ( -- ) empty the data stack", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCLEARSTACK:
    ; DCQ     nm_XCLEARSTACK, hl_XCLEARSTACK
    dq nm_XCLEARSTACK, hl_XCLEARSTACK
    ; DCQ     0
    dq 0
    ; DCQ     XCLEARSTACK, XCLEARSTACK_END
    dq XCLEARSTACK, XCLEARSTACK_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCLEARSTACK
    dq row_XCLEARSTACK
section .text
XCLEARSTACK:
    ; lea x22, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x22], rax
    ; add     x22, x22, #1, lsl #12
    mov rax, qword [rel arm_x22]
    add rax, 0x1000
    mov qword [rel arm_x22], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XCLEARSTACK_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XSP0:
    ; DCB "SP0", 0
    db "SP0", 0
hl_XSP0:
    ; DCB "SP0 ( -- addr ) empty data-stack pointer", 0
    db "SP0 ( -- addr ) empty data-stack pointer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSP0:
    ; DCQ     nm_XSP0, hl_XSP0
    dq nm_XSP0, hl_XSP0
    ; DCQ     0
    dq 0
    ; DCQ     XSP0, XSP0_END
    dq XSP0, XSP0_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSP0
    dq row_XSP0
section .text
XSP0:
    ; lea x1, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x1], rax
    ; add     x0, x1, #1, lsl #12
    mov rax, qword [rel arm_x1]
    add rax, 0x1000
    mov qword [rel arm_x0], rax
    ; cmp     x22, x0
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _sp0_fix
    cmp byte [rel arm_c], 0
    je xsk_30
    cmp byte [rel arm_z], 0
    je _sp0_fix
    xsk_30:
    ; cmp     x22, x1
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _sp0_fix
    cmp byte [rel arm_c], 0
    je _sp0_fix
    ; b       _sp0_push
    jmp _sp0_push
_sp0_fix:
    ; mov     x22, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x22], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
_sp0_push:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XSP0_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XSPFETCH:
    ; DCB "SP@", 0
    db "SP@", 0
hl_XSPFETCH:
    ; DCB "SP@ ( -- addr ) current data-stack pointer under TOS", 0
    db "SP@ ( -- addr ) current data-stack pointer under TOS", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSPFETCH:
    ; DCQ     nm_XSPFETCH, hl_XSPFETCH
    dq nm_XSPFETCH, hl_XSPFETCH
    ; DCQ     0
    dq 0
    ; DCQ     XSPFETCH, XSPFETCH_END
    dq XSPFETCH, XSPFETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSPFETCH
    dq row_XSPFETCH
section .text
XSPFETCH:
    ; mov     x0, x22
    mov rax, qword [rel arm_x22]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XSPFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XSPSTORE:
    ; DCB "SP!", 0
    db "SP!", 0
hl_XSPSTORE:
    ; DCB "SP! ( addr -- ) set the data-stack pointer", 0
    db "SP! ( addr -- ) set the data-stack pointer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSPSTORE:
    ; DCQ     nm_XSPSTORE, hl_XSPSTORE
    dq nm_XSPSTORE, hl_XSPSTORE
    ; DCQ     0
    dq 0
    ; DCQ     XSPSTORE, XSPSTORE_END
    dq XSPSTORE, XSPSTORE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSPSTORE
    dq row_XSPSTORE
section .text
XSPSTORE:
    ; mov     x22, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x22], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XSPSTORE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XDICT_THREADS:
    ; DCB "DICT-THREADS", 0
    db "DICT-THREADS", 0
hl_XDICT_THREADS:
    ; DCB "DICT-THREADS ( -- n ) hash threads per wordlist", 0
    db "DICT-THREADS ( -- n ) hash threads per wordlist", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDICT_THREADS:
    ; DCQ     nm_XDICT_THREADS, hl_XDICT_THREADS
    dq nm_XDICT_THREADS, hl_XDICT_THREADS
    ; DCQ     0
    dq 0
    ; DCQ     XDICT_THREADS, 0
    dq XDICT_THREADS, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDICT_THREADS
    dq row_XDICT_THREADS
section .text
XDICT_THREADS:
    ; mov     x0, #16
    mov rax, 0x10
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XBRACKET_TICK:
    ; DCB "[']", 0
    db "[']", 0
hl_XBRACKET_TICK:
    ; DCB "['] ( -- xt ) compile xt of next name", 0
    db "['] ( -- xt ) compile xt of next name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBRACKET_TICK:
    ; DCQ     nm_XBRACKET_TICK, hl_XBRACKET_TICK
    dq nm_XBRACKET_TICK, hl_XBRACKET_TICK
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XBRACKET_TICK, 0
    dq XBRACKET_TICK, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBRACKET_TICK
    dq row_XBRACKET_TICK
section .text
XBRACKET_TICK:
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
    ; bl      _next_word
    lea rax, [rel xret_31]
    mov qword [rel arm_x30], rax
    jmp _next_word
    xret_31:
    ; cbz     x1, _btick_fail
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _btick_fail
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _find_word
    lea rax, [rel xret_32]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_32:
    ; cbz     x0, _btick_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _btick_fail
    ; str     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x1, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _btick_interp
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _btick_interp
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_33]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_33:
    ; ldr     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_34]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_34:
    ; b       _btick_leave
    jmp _btick_leave
_btick_interp:
    ; ldr     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
_btick_leave:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_btick_fail:
    ; lea x0, msg_huh_k1
    lea rax, [rel msg_huh_k1]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_35]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_35:
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
    ; b       _quit_exit
    jmp _quit_exit
section .bwstr align=1
nm_XLIT_ADDR:
    ; DCB "LIT-ADDR", 0
    db "LIT-ADDR", 0
hl_XLIT_ADDR:
    ; DCB "LIT-ADDR ( -- xt ) xt of LIT", 0
    db "LIT-ADDR ( -- xt ) xt of LIT", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLIT_ADDR:
    ; DCQ     nm_XLIT_ADDR, hl_XLIT_ADDR
    dq nm_XLIT_ADDR, hl_XLIT_ADDR
    ; DCQ     0
    dq 0
    ; DCQ     XLIT_ADDR, 0
    dq XLIT_ADDR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLIT_ADDR
    dq row_XLIT_ADDR
section .text
XLIT_ADDR:
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_X0BRANCH_ADDR:
    ; DCB "0BRANCH-ADDR", 0
    db "0BRANCH-ADDR", 0
hl_X0BRANCH_ADDR:
    ; DCB "0BRANCH-ADDR ( -- xt ) xt of 0BRANCH", 0
    db "0BRANCH-ADDR ( -- xt ) xt of 0BRANCH", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_X0BRANCH_ADDR:
    ; DCQ     nm_X0BRANCH_ADDR, hl_X0BRANCH_ADDR
    dq nm_X0BRANCH_ADDR, hl_X0BRANCH_ADDR
    ; DCQ     0
    dq 0
    ; DCQ     X0BRANCH_ADDR, 0
    dq X0BRANCH_ADDR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_X0BRANCH_ADDR
    dq row_X0BRANCH_ADDR
section .text
X0BRANCH_ADDR:
    ; lea x0, cfa_0branch
    lea rax, [rel cfa_0branch]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XBRANCH_ADDR:
    ; DCB "BRANCH-ADDR", 0
    db "BRANCH-ADDR", 0
hl_XBRANCH_ADDR:
    ; DCB "BRANCH-ADDR ( -- xt ) xt of BRANCH", 0
    db "BRANCH-ADDR ( -- xt ) xt of BRANCH", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBRANCH_ADDR:
    ; DCQ     nm_XBRANCH_ADDR, hl_XBRANCH_ADDR
    dq nm_XBRANCH_ADDR, hl_XBRANCH_ADDR
    ; DCQ     0
    dq 0
    ; DCQ     XBRANCH_ADDR, 0
    dq XBRANCH_ADDR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBRANCH_ADDR
    dq row_XBRANCH_ADDR
section .text
XBRANCH_ADDR:
    ; lea x0, cfa_branch
    lea rax, [rel cfa_branch]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XDOCOL_ADDR:
    ; DCB "DOCOL-ADDR", 0
    db "DOCOL-ADDR", 0
hl_XDOCOL_ADDR:
    ; DCB "DOCOL-ADDR ( -- addr ) address of DOCOL code", 0
    db "DOCOL-ADDR ( -- addr ) address of DOCOL code", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOCOL_ADDR:
    ; DCQ     nm_XDOCOL_ADDR, hl_XDOCOL_ADDR
    dq nm_XDOCOL_ADDR, hl_XDOCOL_ADDR
    ; DCQ     0
    dq 0
    ; DCQ     XDOCOL_ADDR, 0
    dq XDOCOL_ADDR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOCOL_ADDR
    dq row_XDOCOL_ADDR
section .text
XDOCOL_ADDR:
    ; lea x0, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XDOCON_ADDR:
    ; DCB "DOCON-ADDR", 0
    db "DOCON-ADDR", 0
hl_XDOCON_ADDR:
    ; DCB "DOCON-ADDR ( -- addr ) address of DOCON code", 0
    db "DOCON-ADDR ( -- addr ) address of DOCON code", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOCON_ADDR:
    ; DCQ     nm_XDOCON_ADDR, hl_XDOCON_ADDR
    dq nm_XDOCON_ADDR, hl_XDOCON_ADDR
    ; DCQ     0
    dq 0
    ; DCQ     XDOCON_ADDR, 0
    dq XDOCON_ADDR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOCON_ADDR
    dq row_XDOCON_ADDR
section .text
XDOCON_ADDR:
    ; lea x0, DOCON
    lea rax, [rel DOCON]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XBranch:
    ; DCB "BRANCH", 0
    db "BRANCH", 0
hl_XBranch:
    ; DCB "BRANCH ( -- ) unconditional branch", 0
    db "BRANCH ( -- ) unconditional branch", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBranch:
    ; DCQ     nm_XBranch, hl_XBranch
    dq nm_XBranch, hl_XBranch
    ; DCQ     0
    dq 0
    ; DCQ     XBranch, XBranch_END
    dq XBranch, XBranch_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBranch
    dq row_XBranch
section .text
XBranch:
    ; ldr     x0, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; add     x19, x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x19], rax
XBranch_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_X0Branch:
    ; DCB "0BRANCH", 0
    db "0BRANCH", 0
hl_X0Branch:
    ; DCB "0BRANCH ( flag -- ) branch if zero", 0
    db "0BRANCH ( flag -- ) branch if zero", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_X0Branch:
    ; DCQ     nm_X0Branch, hl_X0Branch
    dq nm_X0Branch, hl_X0Branch
    ; DCQ     0
    dq 0
    ; DCQ     X0Branch, X0Branch_END
    dq X0Branch, X0Branch_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_X0Branch
    dq row_X0Branch
section .text
X0Branch:
    ; lea x1, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x1], rax
    ; add     x1, x1, #1, lsl #12
    mov rax, qword [rel arm_x1]
    add rax, 0x1000
    mov qword [rel arm_x1], rax
    ; cbz     x20, _0br_true
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    je _0br_true
    ; cmp     x22, x1
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _0br_empty_skip
    cmp byte [rel arm_c], 0
    jne _0br_empty_skip
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; b       _0br_skip
    jmp _0br_skip
_0br_empty_skip:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
    ; mov     x22, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x22], rax
_0br_skip:
    ; add     x19, x19, #8
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_0br_true:
    ; cmp     x22, x1
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _0br_empty_take
    cmp byte [rel arm_c], 0
    jne _0br_empty_take
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; b       _0br_take
    jmp _0br_take
_0br_empty_take:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
    ; mov     x22, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x22], rax
_0br_take:
    ; ldr     x0, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; add     x19, x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x19], rax
X0Branch_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_DOVAR:
    ; DCB "(DOVAR)", 0
    db "(DOVAR)", 0
hl_DOVAR:
    ; DCB "(DOVAR) CREATE/VARIABLE runtime", 0
    db "(DOVAR) CREATE/VARIABLE runtime", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_DOVAR:
    ; DCQ     nm_DOVAR, hl_DOVAR
    dq nm_DOVAR, hl_DOVAR
    ; DCQ     0
    dq 0
    ; DCQ     DOVAR, DOVAR_END
    dq DOVAR, DOVAR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_DOVAR
    dq row_DOVAR
section .text
DOVAR:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; add     x20, x21, #16
    mov rax, qword [rel arm_x21]
    add rax, 0x10
    mov qword [rel arm_x20], rax
DOVAR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_DOCON:
    ; DCB "(DOCON)", 0
    db "(DOCON)", 0
hl_DOCON:
    ; DCB "(DOCON) CONSTANT runtime", 0
    db "(DOCON) CONSTANT runtime", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_DOCON:
    ; DCQ     nm_DOCON, hl_DOCON
    dq nm_DOCON, hl_DOCON
    ; DCQ     0
    dq 0
    ; DCQ     DOCON, DOCON_END
    dq DOCON, DOCON_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_DOCON
    dq row_DOCON
section .text
DOCON:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x21, #16]
    mov r10, qword [rel arm_x21]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
DOCON_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_DODOES:
    ; DCB "(DODOES)", 0
    db "(DODOES)", 0
hl_DODOES:
    ; DCB "(DODOES) DOES> runtime", 0
    db "(DODOES) DOES> runtime", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_DODOES:
    ; DCQ     nm_DODOES, hl_DODOES
    dq nm_DODOES, hl_DODOES
    ; DCQ     0
    dq 0
    ; DCQ     DODOES, DODOES_END
    dq DODOES, DODOES_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_DODOES
    dq row_DODOES
section .text
DODOES:
    ; str     x19, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
    ; ldr     x19, [x21, #8]
    mov r10, qword [rel arm_x21]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    ; add     x0, x21, #16
    mov rax, qword [rel arm_x21]
    add rax, 0x10
    mov qword [rel arm_x0], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
DODOES_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XDO_RT:
    ; DCB "(DO)", 0
    db "(DO)", 0
hl_XDO_RT:
    ; DCB "(DO) ( limit start -- ) runtime for DO", 0
    db "(DO) ( limit start -- ) runtime for DO", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDO_RT:
    ; DCQ     nm_XDO_RT, hl_XDO_RT
    dq nm_XDO_RT, hl_XDO_RT
    ; DCQ     0
    dq 0
    ; DCQ     XDO_RT, XDO_RT_END
    dq XDO_RT, XDO_RT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDO_RT
    dq row_XDO_RT
section .text
XDO_RT:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; str     x0, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; str     x20, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XDO_RT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XQDO_RT:
    ; DCB "(?DO)", 0
    db "(?DO)", 0
hl_XQDO_RT:
    ; DCB "(?DO) ( limit start -- ) runtime for ?DO", 0
    db "(?DO) ( limit start -- ) runtime for ?DO", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XQDO_RT:
    ; DCQ     nm_XQDO_RT, hl_XQDO_RT
    dq nm_XQDO_RT, hl_XQDO_RT
    ; DCQ     0
    dq 0
    ; DCQ     XQDO_RT, XQDO_RT_END
    dq XQDO_RT, XQDO_RT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XQDO_RT
    dq row_XQDO_RT
section .text
XQDO_RT:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cmp     x20, x0
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _qdo_skip
    cmp byte [rel arm_z], 0
    jne _qdo_skip
    ; str     x0, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; str     x20, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; add     x19, x19, #8
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_qdo_skip:
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x0, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; add     x19, x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x19], rax
XQDO_RT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XLOOP_RT:
    ; DCB "(LOOP)", 0
    db "(LOOP)", 0
hl_XLOOP_RT:
    ; DCB "(LOOP) ( -- ) runtime for LOOP", 0
    db "(LOOP) ( -- ) runtime for LOOP", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOOP_RT:
    ; DCQ     nm_XLOOP_RT, hl_XLOOP_RT
    dq nm_XLOOP_RT, hl_XLOOP_RT
    ; DCQ     0
    dq 0
    ; DCQ     XLOOP_RT, XLOOP_RT_END
    dq XLOOP_RT, XLOOP_RT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOOP_RT
    dq row_XLOOP_RT
section .text
XLOOP_RT:
    ; ldr     x0, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x1, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ge    _loop_done
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _loop_done
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _loop_done
    cmp byte [rel arm_z], 0
    jne _loop_done
    ; str     x1, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; str     x0, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldr     x2, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; add     x19, x19, x2
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x19], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_loop_done:
    ; add     x19, x19, #8
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
XLOOP_RT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XPLUSLOOP_RT:
    ; DCB "(+LOOP)", 0
    db "(+LOOP)", 0
hl_XPLUSLOOP_RT:
    ; DCB "(+LOOP) ( n -- ) runtime for +LOOP", 0
    db "(+LOOP) ( n -- ) runtime for +LOOP", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPLUSLOOP_RT:
    ; DCQ     nm_XPLUSLOOP_RT, hl_XPLUSLOOP_RT
    dq nm_XPLUSLOOP_RT, hl_XPLUSLOOP_RT
    ; DCQ     0
    dq 0
    ; DCQ     XPLUSLOOP_RT, XPLUSLOOP_RT_END
    dq XPLUSLOOP_RT, XPLUSLOOP_RT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPLUSLOOP_RT
    dq row_XPLUSLOOP_RT
section .text
XPLUSLOOP_RT:
    ; ldr     x0, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x1, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; sub     x3, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x3], rax
    ; add     x4, x3, x2
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x4], rax
    ; eor     x5, x3, x4
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x4]
    xor rax, rcx
    mov qword [rel arm_x5], rax
    ; eor     x6, x3, x2
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x2]
    xor rax, rcx
    mov qword [rel arm_x6], rax
    ; ands    x5, x5, x6
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x6]
    and rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    mov qword [rel arm_x5], rax
    ; b.mi    _pl_done
    cmp byte [rel arm_n], 0
    jne _pl_done
    ; add     x0, x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; str     x1, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; str     x0, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldr     x2, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; add     x19, x19, x2
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x19], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_pl_done:
    ; add     x19, x19, #8
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
XPLUSLOOP_RT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XDOES_RT:
    ; DCB "(DOES>)", 0
    db "(DOES>)", 0
hl_XDOES_RT:
    ; DCB "(DOES>) ( -- ) patch latest CREATE word and return", 0
    db "(DOES>) ( -- ) patch latest CREATE word and return", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOES_RT:
    ; DCQ     nm_XDOES_RT, hl_XDOES_RT
    dq nm_XDOES_RT, hl_XDOES_RT
    ; DCQ     0
    dq 0
    ; DCQ     XDOES_RT, XDOES_RT_END
    dq XDOES_RT, XDOES_RT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOES_RT
    dq row_XDOES_RT
section .text
XDOES_RT:
    ; lea x0, last_cfa
    lea rax, [rel last_cfa]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _xdoes_ret
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _xdoes_ret
    ; lea x1, DODOES
    lea rax, [rel DODOES]
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; str     x19, [x0, #8]
    mov r10, qword [rel arm_x0]
    add r10, 8
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
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
    ; bl      _nfa_reveal_cfa
    lea rax, [rel xret_36]
    mov qword [rel arm_x30], rax
    jmp _nfa_reveal_cfa
    xret_36:
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
_xdoes_ret:
    ; ldr     x19, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
XDOES_RT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XDOES:
    ; DCB "DOES>", 0
    db "DOES>", 0
hl_XDOES:
    ; DCB "DOES> ( -- ) modify last CREATE'd word (immediate)", 0
    db "DOES> ( -- ) modify last CREATE'd word (immediate)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOES:
    ; DCQ     nm_XDOES, hl_XDOES
    dq nm_XDOES, hl_XDOES
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XDOES, 0
    dq XDOES, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOES
    dq row_XDOES
section .text
XDOES:
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
    ; lea x0, cfa_does
    lea rax, [rel cfa_does]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_37]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_37:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XTHROW:
    ; DCB "THROW", 0
    db "THROW", 0
hl_XTHROW:
    ; DCB "THROW ( n -- ) raise exception n (0 is a no-op)", 0
    db "THROW ( n -- ) raise exception n (0 is a no-op)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTHROW:
    ; DCQ     nm_XTHROW, hl_XTHROW
    dq nm_XTHROW, hl_XTHROW
    ; DCQ     0
    dq 0
    ; DCQ     XTHROW, 0
    dq XTHROW, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTHROW
    dq row_XTHROW
section .text
XTHROW:
    ; cbz     x20, _throw_zero
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    je _throw_zero
    ; lea x7, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x7], rax
    ; ldr     x1, [x7]
    mov r10, qword [rel arm_x7]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _throw_uncaught
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _throw_uncaught
    ; mov     x5, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x5], rax
    ; mov     x23, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x23], rax
    ; ldr     x19, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x6, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; mov     x4, x22
    mov rax, qword [rel arm_x22]
    mov qword [rel arm_x4], rax
    ; ldr     x22, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x22], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x8, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x8], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; cmp     x4, x22
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x22]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _throw_tos_snap
    cmp byte [rel arm_c], 0
    jne _throw_tos_snap
    ; ldr     x8, [x22, #-8]
    mov r10, qword [rel arm_x22]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x8], rax
_throw_tos_snap:
    ; mov     x20, x8
    mov rax, qword [rel arm_x8]
    mov qword [rel arm_x20], rax
    ; ldr     x0, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; str     x0, [x7]
    mov r10, qword [rel arm_x7]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldr     x0, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; lea x3, eval_resume_sp
    lea rax, [rel eval_resume_sp]
    mov qword [rel arm_x3], rax
    ; str     x0, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
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
    ; stp     x5, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x5]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x19, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; mov     x0, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x0], rax
    ; bl      _throw_unwind_to_sp
    lea rax, [rel xret_38]
    mov qword [rel arm_x30], rax
    jmp _throw_unwind_to_sp
    xret_38:
    ; ldp     x19, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x22], rcx
    ; ldp     x5, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x5], rax
    mov qword [rel arm_x20], rcx
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
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
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x20], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_throw_uncaught:
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
    ; str     x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, msg_throw
    lea rax, [rel msg_throw]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_39]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_39:
    ; ldr     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_signed
    lea rax, [rel xret_40]
    mov qword [rel arm_x30], rax
    jmp _print_signed
    xret_40:
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_41]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_41:
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
    ; b       _quit_exit
    jmp _quit_exit
_throw_zero:
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XPARSE:
    ; DCB "PARSE", 0
    db "PARSE", 0
hl_XPARSE:
    ; DCB "PARSE ( char -- c-addr u ) parse through delimiter", 0
    db "PARSE ( char -- c-addr u ) parse through delimiter", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPARSE:
    ; DCQ     nm_XPARSE, hl_XPARSE
    dq nm_XPARSE, hl_XPARSE
    ; DCQ     0
    dq 0
    ; DCQ     XPARSE, XPARSE_END
    dq XPARSE, XPARSE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPARSE
    dq row_XPARSE
section .text
XPARSE:
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
    ; mov     w7, w20
    mov eax, dword [rel arm_x20]
    mov qword [rel arm_x7], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; bl      _cursor_load
    lea rax, [rel xret_42]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_42:
    ; mov     x9, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x9], rax
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x6, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; mov     x3, x9
    mov rax, qword [rel arm_x9]
    mov qword [rel arm_x3], rax
_parse_scan:
    ; cmp     x3, x6
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x6]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _parse_eos
    cmp byte [rel arm_c], 0
    jne _parse_eos
    ; ldrb    w4, [x3]
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _parse_eos
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _parse_eos
    ; cmp     w4, w7
    mov eax, dword [rel arm_x4]
    mov ecx, dword [rel arm_x7]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _parse_found
    cmp byte [rel arm_z], 0
    jne _parse_found
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _parse_scan
    jmp _parse_scan
_parse_found:
    ; sub     x5, x3, x9
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _parse_commit
    jmp _parse_commit
_parse_eos:
    ; sub     x5, x3, x9
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
_parse_commit:
    ; mov     x0, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_43]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_43:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x9
    mov rax, qword [rel arm_x9]
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x20], rax
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
XPARSE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XWORD:
    ; DCB "WORD", 0
    db "WORD", 0
hl_XWORD:
    ; DCB "WORD ( char -- addr ) counted string in transient buffer", 0
    db "WORD ( char -- addr ) counted string in transient buffer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XWORD:
    ; DCQ     nm_XWORD, hl_XWORD
    dq nm_XWORD, hl_XWORD
    ; DCQ     0
    dq 0
    ; DCQ     XWORD, XWORD_END
    dq XWORD, XWORD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XWORD
    dq row_XWORD
section .text
XWORD:
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
    ; mov     w7, w20
    mov eax, dword [rel arm_x20]
    mov qword [rel arm_x7], rax
    ; bl      _cursor_load
    lea rax, [rel xret_44]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_44:
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x9, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
_word_skip:
    ; cmp     x0, x9
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _word_empty
    cmp byte [rel arm_c], 0
    jne _word_empty
    ; ldrb    w4, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _word_empty
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _word_empty
    ; cmp     w7, #32
    mov eax, dword [rel arm_x7]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _word_skip_exact
    cmp byte [rel arm_z], 0
    je _word_skip_exact
    ; cmp     w4, #32
    mov eax, dword [rel arm_x4]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_adv
    cmp byte [rel arm_z], 0
    jne _word_adv
    ; cmp     w4, #9
    mov eax, dword [rel arm_x4]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_adv
    cmp byte [rel arm_z], 0
    jne _word_adv
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_adv
    cmp byte [rel arm_z], 0
    jne _word_adv
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_adv
    cmp byte [rel arm_z], 0
    jne _word_adv
    ; b       _word_start
    jmp _word_start
_word_skip_exact:
    ; cmp     w4, w7
    mov eax, dword [rel arm_x4]
    mov ecx, dword [rel arm_x7]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _word_start
    cmp byte [rel arm_z], 0
    je _word_start
_word_adv:
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _word_skip
    jmp _word_skip
_word_start:
    ; mov     x3, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x3], rax
_word_scan:
    ; cmp     x0, x9
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _word_end
    cmp byte [rel arm_c], 0
    jne _word_end
    ; ldrb    w4, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _word_end
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _word_end
    ; cmp     w7, #32
    mov eax, dword [rel arm_x7]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _word_scan_exact
    cmp byte [rel arm_z], 0
    je _word_scan_exact
    ; cmp     w4, #32
    mov eax, dword [rel arm_x4]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_end
    cmp byte [rel arm_z], 0
    jne _word_end
    ; cmp     w4, #9
    mov eax, dword [rel arm_x4]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_end
    cmp byte [rel arm_z], 0
    jne _word_end
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_end
    cmp byte [rel arm_z], 0
    jne _word_end
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_end
    cmp byte [rel arm_z], 0
    jne _word_end
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _word_scan
    jmp _word_scan
_word_scan_exact:
    ; cmp     w4, w7
    mov eax, dword [rel arm_x4]
    mov ecx, dword [rel arm_x7]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _word_end
    cmp byte [rel arm_z], 0
    jne _word_end
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _word_scan
    jmp _word_scan
_word_end:
    ; sub     x5, x0, x3
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x3]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; cmp     x0, x9
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _word_store
    cmp byte [rel arm_c], 0
    jne _word_store
    ; ldrb    w4, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _word_store
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _word_store
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; cmp     w7, #32
    mov eax, dword [rel arm_x7]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _word_store
    cmp byte [rel arm_z], 0
    je _word_store
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _word_store
    cmp byte [rel arm_z], 0
    je _word_store
    ; cmp     x0, x9
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _word_store
    cmp byte [rel arm_c], 0
    jne _word_store
    ; ldrb    w4, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _word_store
    cmp byte [rel arm_z], 0
    je _word_store
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
_word_store:
    ; cmp     x5, #63
    mov rax, qword [rel arm_x5]
    cmp rax, 0x3f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _word_len_ok
    cmp byte [rel arm_c], 0
    je _word_len_ok
    cmp byte [rel arm_z], 0
    jne _word_len_ok
    ; mov     x5, #63
    mov rax, 0x3f
    mov qword [rel arm_x5], rax
_word_len_ok:
    ; bl      _cursor_commit
    lea rax, [rel xret_45]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_45:
    ; lea x6, word_scratch
    lea rax, [rel word_scratch]
    mov qword [rel arm_x6], rax
    ; strb    w5, [x6]
    mov r10, qword [rel arm_x6]
    mov eax, dword [rel arm_x5]
    mov byte [r10], al
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
_word_copy:
    ; cmp     x1, x5
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ge    _word_done
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _word_done
    ; ldrb    w4, [x3, x1]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x1]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; add     x8, x6, #1
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x8], rax
    ; strb    w4, [x8, x1]
    mov r10, qword [rel arm_x8]
    mov rax, qword [rel arm_x1]
    add r10, rax
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _word_copy
    jmp _word_copy
_word_done:
    ; mov     x20, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x20], rax
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_word_empty:
    ; bl      _cursor_commit
    lea rax, [rel xret_46]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_46:
    ; lea x6, word_scratch
    lea rax, [rel word_scratch]
    mov qword [rel arm_x6], rax
    ; strb    wzr, [x6]
    mov r10, qword [rel arm_x6]
    mov byte [r10], 0
    ; mov     x20, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x20], rax
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
XWORD_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XDOTPAREN:
    ; DCB ".(", 0
    db ".(", 0
hl_XDOTPAREN:
    ; DCB ".( ( -- ) print text until ) (immediate)", 0
    db ".( ( -- ) print text until ) (immediate)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOTPAREN:
    ; DCQ     nm_XDOTPAREN, hl_XDOTPAREN
    dq nm_XDOTPAREN, hl_XDOTPAREN
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XDOTPAREN, 0
    dq XDOTPAREN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOTPAREN
    dq row_XDOTPAREN
section .text
XDOTPAREN:
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
    ; mov     w7, #41
    mov eax, 0x29
    mov qword [rel arm_x7], rax
    ; bl      _cursor_load
    lea rax, [rel xret_47]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_47:
    ; mov     x9, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x9], rax
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x6, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; mov     x3, x9
    mov rax, qword [rel arm_x9]
    mov qword [rel arm_x3], rax
_dotp_scan:
    ; cmp     x3, x6
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x6]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _dotp_eos
    cmp byte [rel arm_c], 0
    jne _dotp_eos
    ; ldrb    w4, [x3]
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _dotp_eos
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _dotp_eos
    ; cmp     w4, w7
    mov eax, dword [rel arm_x4]
    mov ecx, dword [rel arm_x7]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _dotp_found
    cmp byte [rel arm_z], 0
    jne _dotp_found
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _dotp_scan
    jmp _dotp_scan
_dotp_found:
    ; sub     x5, x3, x9
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _dotp_go
    jmp _dotp_go
_dotp_eos:
    ; sub     x5, x3, x9
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
_dotp_go:
    ; mov     x0, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_48]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_48:
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
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x9
    mov rax, qword [rel arm_x9]
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x20], rax
    ; b       XTYPE
    jmp XTYPE
section .bwstr align=1
nm_XBACKSLASH:
    ; DCB 0x5C, 0
    db 0x5c, 0
hl_XBACKSLASH:
    ; DCB 0x5C, "( -- ) comment to end of line (immediate)", 0
    db 0x5c, "( -- ) comment to end of line (immediate)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBACKSLASH:
    ; DCQ     nm_XBACKSLASH, hl_XBACKSLASH
    dq nm_XBACKSLASH, hl_XBACKSLASH
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XBACKSLASH, 0
    dq XBACKSLASH, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBACKSLASH
    dq row_XBACKSLASH
section .text
XBACKSLASH:
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, _bs_block
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _bs_block
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
    ; bl      _cursor_load
    lea rax, [rel xret_49]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_49:
    ; mov     x10, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x10], rax
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x9, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
_bs_loop:
    ; cmp     x10, x9
    mov rax, qword [rel arm_x10]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _bs_done
    cmp byte [rel arm_c], 0
    jne _bs_done
    ; ldrb    w4, [x10]
    mov r10, qword [rel arm_x10]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _bs_done
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _bs_done
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _bs_done
    cmp byte [rel arm_z], 0
    jne _bs_done
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _bs_done
    cmp byte [rel arm_z], 0
    jne _bs_done
    ; add     x10, x10, #1
    mov rax, qword [rel arm_x10]
    add rax, 1
    mov qword [rel arm_x10], rax
    ; b       _bs_loop
    jmp _bs_loop
_bs_done:
    ; mov     x0, x10
    mov rax, qword [rel arm_x10]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_50]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_50:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_bs_block:
    ; lea x0, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; lea x2, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; sub     x2, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    sub rax, rcx
    mov qword [rel arm_x2], rax
    ; lsr     x5, x1, #6
    mov rax, qword [rel arm_x1]
    shr rax, 6
    mov qword [rel arm_x5], rax
    ; add     x5, x5, #1
    mov rax, qword [rel arm_x5]
    add rax, 1
    mov qword [rel arm_x5], rax
    ; lsl     x5, x5, #6
    mov rax, qword [rel arm_x5]
    shl rax, 6
    mov qword [rel arm_x5], rax
    ; cmp     x5, x2
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _bs_blk_ok
    cmp byte [rel arm_c], 0
    je _bs_blk_ok
    cmp byte [rel arm_z], 0
    jne _bs_blk_ok
    ; mov     x5, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x5], rax
_bs_blk_ok:
    ; str     x5, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; add     x3, x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    add rax, rcx
    mov qword [rel arm_x3], rax
    ; lea x0, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XPAREN:
    ; DCB "(", 0
    db "(", 0
hl_XPAREN:
    ; DCB "( -- ) comment until ) (immediate)", 0
    db "( -- ) comment until ) (immediate)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPAREN:
    ; DCQ     nm_XPAREN, hl_XPAREN
    dq nm_XPAREN, hl_XPAREN
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XPAREN, 0
    dq XPAREN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPAREN
    dq row_XPAREN
section .text
XPAREN:
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
    ; bl      _cursor_load
    lea rax, [rel xret_51]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_51:
    ; mov     x10, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x10], rax
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x9, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
_par_loop:
    ; cmp     x10, x9
    mov rax, qword [rel arm_x10]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _par_eol
    cmp byte [rel arm_c], 0
    jne _par_eol
    ; ldrb    w4, [x10]
    mov r10, qword [rel arm_x10]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _par_eol
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _par_eol
    ; cmp     w4, #41
    mov eax, dword [rel arm_x4]
    cmp eax, 0x29
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _par_found
    cmp byte [rel arm_z], 0
    jne _par_found
    ; add     x10, x10, #1
    mov rax, qword [rel arm_x10]
    add rax, 1
    mov qword [rel arm_x10], rax
    ; b       _par_loop
    jmp _par_loop
_par_found:
    ; add     x10, x10, #1
    mov rax, qword [rel arm_x10]
    add rax, 1
    mov qword [rel arm_x10], rax
    ; b       _par_store
    jmp _par_store
_par_eol:
    ; lea x0, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _par_store
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _par_store
    ; bl      _take_line
    lea rax, [rel xret_52]
    mov qword [rel arm_x30], rax
    jmp _take_line
    xret_52:
    ; cbz     x0, _par_eof
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _par_eof
    ; bl      _cursor_load
    lea rax, [rel xret_53]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_53:
    ; mov     x10, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x10], rax
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x9, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
    ; b       _par_loop
    jmp _par_loop
_par_eof:
    ; bl      _cursor_load
    lea rax, [rel xret_54]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_54:
    ; mov     x10, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x10], rax
_par_store:
    ; mov     x0, x10
    mov rax, qword [rel arm_x10]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_55]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_55:
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XSLIT:
    ; DCB "(S", 0x22, ")", 0
    db "(S", 0x22, ")", 0
hl_XSLIT:
    ; DCB "(S", 0x22, ")", "( -- c-addr u ) runtime for a compiled quote string", 0
    db "(S", 0x22, ")", "( -- c-addr u ) runtime for a compiled quote string", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSLIT:
    ; DCQ     nm_XSLIT, hl_XSLIT
    dq nm_XSLIT, hl_XSLIT
    ; DCQ     0
    dq 0
    ; DCQ     XSLIT, XSLIT_END
    dq XSLIT, XSLIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSLIT
    dq row_XSLIT
section .text
XSLIT:
    ; ldr     x0, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; add     x19, x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x19], rax
    ; add     x19, x19, #7
    mov rax, qword [rel arm_x19]
    add rax, 7
    mov qword [rel arm_x19], rax
    ; bic     x19, x19, #7
    mov rax, qword [rel arm_x19]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [rel arm_x19], rax
XSLIT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XSQUOTE:
    ; DCB "S", 0x22, 0
    db "S", 0x22, 0
hl_XSQUOTE:
    ; DCB "S", 0x22, "( -- c-addr u ) quote-delimited string (immediate)", 0
    db "S", 0x22, "( -- c-addr u ) quote-delimited string (immediate)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSQUOTE:
    ; DCQ     nm_XSQUOTE, hl_XSQUOTE
    dq nm_XSQUOTE, hl_XSQUOTE
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XSQUOTE, 0
    dq XSQUOTE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSQUOTE
    dq row_XSQUOTE
section .text
XSQUOTE:
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
    ; bl      _cursor_load
    lea rax, [rel xret_56]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_56:
    ; mov     x1, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x1], rax
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x6, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; mov     x9, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x9], rax
_sq_scan:
    ; cmp     x1, x6
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x6]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _sq_eos
    cmp byte [rel arm_c], 0
    jne _sq_eos
    ; ldrb    w3, [x1]
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; cbz     w3, _sq_eos
    mov eax, dword [rel arm_x3]
    cmp rax, 0
    je _sq_eos
    ; cmp     w3, #34
    mov eax, dword [rel arm_x3]
    cmp eax, 0x22
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _sq_found
    cmp byte [rel arm_z], 0
    jne _sq_found
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _sq_scan
    jmp _sq_scan
_sq_found:
    ; sub     x5, x1, x9
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _sq_commit
    jmp _sq_commit
_sq_eos:
    ; sub     x5, x1, x9
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
_sq_commit:
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_57]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_57:
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, _sq_comp
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _sq_comp
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x9
    mov rax, qword [rel arm_x9]
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x20], rax
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_sq_comp:
    ; stp     x9, x5, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x9]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x5]
    mov qword [r10+8], rax
    ; lea x0, cfa_slit
    lea rax, [rel cfa_slit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_58]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_58:
    ; ldr     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_59]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_59:
    ; ldr     x5, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; ldr     x9, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
_sq_cpy:
    ; cmp     x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ge    _sq_align
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _sq_align
    ; ldrb    w4, [x9, x3]
    mov r10, qword [rel arm_x9]
    mov rax, qword [rel arm_x3]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; strb    w4, [x1, x3]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x3]
    add r10, rax
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _sq_cpy
    jmp _sq_cpy
_sq_align:
    ; add     x1, x1, x5
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x5]
    add rax, rcx
    mov qword [rel arm_x1], rax
    ; add     x1, x1, #7
    mov rax, qword [rel arm_x1]
    add rax, 7
    mov qword [rel arm_x1], rax
    ; bic     x1, x1, #7
    mov rax, qword [rel arm_x1]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XCSTR:
    ; DCB "(C", 0x22, ")", 0
    db "(C", 0x22, ")", 0
hl_XCSTR:
    ; DCB "(C", 0x22, ")", "( -- c-addr ) runtime for a compiled counted string", 0
    db "(C", 0x22, ")", "( -- c-addr ) runtime for a compiled counted string", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCSTR:
    ; DCQ     nm_XCSTR, hl_XCSTR
    dq nm_XCSTR, hl_XCSTR
    ; DCQ     0
    dq 0
    ; DCQ     XCSTR, XCSTR_END
    dq XCSTR, XCSTR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCSTR
    dq row_XCSTR
section .text
XCSTR:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x20], rax
    ; ldrb    w0, [x19]
    mov r10, qword [rel arm_x19]
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    ; add     x19, x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x19], rax
    ; add     x19, x19, #1
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; add     x19, x19, #7
    mov rax, qword [rel arm_x19]
    add rax, 7
    mov qword [rel arm_x19], rax
    ; bic     x19, x19, #7
    mov rax, qword [rel arm_x19]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [rel arm_x19], rax
XCSTR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
section .bwstr align=1
nm_XCQUOTE:
    ; DCB "C", 0x22, 0
    db "C", 0x22, 0
hl_XCQUOTE:
    ; DCB "C", 0x22, "( -- c-addr ) compile a quote-delimited counted string", 0
    db "C", 0x22, "( -- c-addr ) compile a quote-delimited counted string", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCQUOTE:
    ; DCQ     nm_XCQUOTE, hl_XCQUOTE
    dq nm_XCQUOTE, hl_XCQUOTE
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XCQUOTE, 0
    dq XCQUOTE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCQUOTE
    dq row_XCQUOTE
section .text
XCQUOTE:
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
    ; bl      _cursor_load
    lea rax, [rel xret_60]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_60:
    ; mov     x1, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x1], rax
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x6, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; mov     x9, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x9], rax
_cq_scan:
    ; cmp     x1, x6
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x6]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _cq_eos
    cmp byte [rel arm_c], 0
    jne _cq_eos
    ; ldrb    w3, [x1]
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; cbz     w3, _cq_eos
    mov eax, dword [rel arm_x3]
    cmp rax, 0
    je _cq_eos
    ; cmp     w3, #34
    mov eax, dword [rel arm_x3]
    cmp eax, 0x22
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _cq_found
    cmp byte [rel arm_z], 0
    jne _cq_found
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _cq_scan
    jmp _cq_scan
_cq_found:
    ; sub     x5, x1, x9
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _cq_commit
    jmp _cq_commit
_cq_eos:
    ; sub     x5, x1, x9
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
_cq_commit:
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_61]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_61:
    ; cmp     x5, #255
    mov rax, qword [rel arm_x5]
    cmp rax, 0xff
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _cq_lenok
    cmp byte [rel arm_c], 0
    je _cq_lenok
    cmp byte [rel arm_z], 0
    jne _cq_lenok
    ; mov     x5, #255
    mov rax, 0xff
    mov qword [rel arm_x5], rax
_cq_lenok:
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, _cq_comp
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _cq_comp
    ; lea x0, pad_buffer
    lea rax, [rel pad_buffer]
    mov qword [rel arm_x0], rax
    ; strb    w5, [x0]
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x5]
    mov byte [r10], al
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
_cq_ipad:
    ; cmp     x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ge    _cq_idone
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _cq_idone
    ; ldrb    w4, [x9, x3]
    mov r10, qword [rel arm_x9]
    mov rax, qword [rel arm_x3]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; add     x6, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; strb    w4, [x6, x3]
    mov r10, qword [rel arm_x6]
    mov rax, qword [rel arm_x3]
    add r10, rax
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _cq_ipad
    jmp _cq_ipad
_cq_idone:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_cq_comp:
    ; stp     x9, x5, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x9]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x5]
    mov qword [r10+8], rax
    ; lea x0, cfa_cstr
    lea rax, [rel cfa_cstr]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_62]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_62:
    ; ldr     x5, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; ldr     x9, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; strb    w5, [x1], #1
    mov r10, qword [rel arm_x1]
    mov eax, dword [rel arm_x5]
    mov byte [r10], al
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
_cq_cpy:
    ; cmp     x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ge    _cq_align
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _cq_align
    ; ldrb    w4, [x9, x3]
    mov r10, qword [rel arm_x9]
    mov rax, qword [rel arm_x3]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; strb    w4, [x1, x3]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x3]
    add r10, rax
    mov eax, dword [rel arm_x4]
    mov byte [r10], al
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _cq_cpy
    jmp _cq_cpy
_cq_align:
    ; add     x1, x1, x5
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x5]
    add rax, rcx
    mov qword [rel arm_x1], rax
    ; add     x1, x1, #7
    mov rax, qword [rel arm_x1]
    add rax, 7
    mov qword [rel arm_x1], rax
    ; bic     x1, x1, #7
    mov rax, qword [rel arm_x1]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
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
    ; cbnz    x28, next_debug_gate
    mov rax, qword [rel arm_x28]
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, next_debug_gate
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
next_debug_gate:
    ; lea x16, next_debug
    lea rax, [rel next_debug]
    mov qword [rel arm_x16], rax
    ; br      x16
    mov rax, qword [rel arm_x16]
    jmp rax
section .rodata
msg_allot:
    ; DCB     "ALLOT: dictionary full (need more USER-DICT space)", 10, 0
    db "ALLOT: dictionary full (need more USER-DICT space)", 0xa, 0
msg_throw:
    ; DCB     " throw ", 0
    db " throw ", 0
msg_huh_k1:
    ; DCB     " ?", 10, 0
    db " ?", 0xa, 0
str_search_order:
    ; DCB "Search order: ", 0
    db "Search order: ", 0
str_comp_wl:
    ; DCB     "Compilation wordlist: ", 0
    db "Compilation wordlist: ", 0
