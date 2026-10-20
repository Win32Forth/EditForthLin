; Generated from Forth/kernel/arm64/prims.asm. Do not edit.
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
extern _interpret_loop
extern _local_frame_try_exit
extern _print_signed
extern _print_unsigned
extern _putchar
extern _quit_exit
extern _sa_print_signed
extern _sa_putchar
extern debug_break_asap
extern debug_floor
extern dstack
extern emit_cstr
extern next_debug
extern return_stack
extern throw_handler
section .text
global DOCOL
global XRESTART
global DOEXIT
global XLit
global XDUP
global XDROP
global XSWAP
global XOVER
global XPLUS
global XMINUS
global XSTAR
global XSLASH
global XMOD
global XDOT
global XDOTS
global XRSDOT
global XCR
global XBYE
section .bwstr align=1
nm_XNEXT:
    ; DCB "(NEXT)", 0
    db "(NEXT)", 0
hl_XNEXT:
    ; DCB "(NEXT) ITC dispatch", 0
    db "(NEXT) ITC dispatch", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNEXT:
    ; DCQ     nm_XNEXT, hl_XNEXT
    dq nm_XNEXT, hl_XNEXT
    ; DCQ     0
    dq 0
    ; DCQ     XNEXT, XNEXT_END
    dq XNEXT, XNEXT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNEXT
    dq row_XNEXT
section .text
XNEXT:
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
XNEXT_END:
section .bwstr align=1
nm_DOCOL:
    ; DCB "(DOCOL)", 0
    db "(DOCOL)", 0
hl_DOCOL:
    ; DCB "(DOCOL) colon runtime", 0
    db "(DOCOL) colon runtime", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_DOCOL:
    ; DCQ     nm_DOCOL, hl_DOCOL
    dq nm_DOCOL, hl_DOCOL
    ; DCQ     0
    dq 0
    ; DCQ     DOCOL, DOCOL_END
    dq DOCOL, DOCOL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_DOCOL
    dq row_DOCOL
section .text
DOCOL:
    ; str     x19, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
    ; add     x19, x21, #16
    mov rax, qword [rel arm_x21]
    add rax, 0x10
    mov qword [rel arm_x19], rax
    ; ldr     x0, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, DOCOL_END
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne DOCOL_END
    ; b       _quit_exit
    jmp _quit_exit
DOCOL_END:
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
nm_DOEXIT:
    ; DCB "EXIT", 0
    db "EXIT", 0
hl_DOEXIT:
    ; DCB "EXIT ( -- ) return from colon definition", 0
    db "EXIT ( -- ) return from colon definition", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_DOEXIT:
    ; DCQ     nm_DOEXIT, hl_DOEXIT
    dq nm_DOEXIT, hl_DOEXIT
    ; DCQ     0
    dq 0
    ; DCQ     DOEXIT, DOEXIT_END
    dq DOEXIT, DOEXIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_DOEXIT
    dq row_DOEXIT
section .text
DOEXIT:
    ; bl      _local_frame_try_exit
    lea rax, [rel xret_1]
    mov qword [rel arm_x30], rax
    jmp _local_frame_try_exit
    xret_1:
    ; ldr     x19, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
DOEXIT_END:
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
nm_XLit:
    ; DCB "LIT", 0
    db "LIT", 0
hl_XLit:
    ; DCB "LIT ( -- n ) internal: literal value", 0
    db "LIT ( -- n ) internal: literal value", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLit:
    ; DCQ     nm_XLit, hl_XLit
    dq nm_XLit, hl_XLit
    ; DCQ     0
    dq 0
    ; DCQ     XLit, XLit_END
    dq XLit, XLit_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLit
    dq row_XLit
section .text
XLit:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
XLit_END:
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
nm_XDUP:
    ; DCB "DUP", 0
    db "DUP", 0
hl_XDUP:
    ; DCB "DUP ( n -- n n ) duplicate top", 0
    db "DUP ( n -- n n ) duplicate top", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDUP:
    ; DCQ     nm_XDUP, hl_XDUP
    dq nm_XDUP, hl_XDUP
    ; DCQ     0
    dq 0
    ; DCQ     XDUP, XDUP_END
    dq XDUP, XDUP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDUP
    dq row_XDUP
section .text
XDUP:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
XDUP_END:
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
nm_XDROP:
    ; DCB "DROP", 0
    db "DROP", 0
hl_XDROP:
    ; DCB "DROP ( n -- ) discard top", 0
    db "DROP ( n -- ) discard top", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDROP:
    ; DCQ     nm_XDROP, hl_XDROP
    dq nm_XDROP, hl_XDROP
    ; DCQ     0
    dq 0
    ; DCQ     XDROP, XDROP_END
    dq XDROP, XDROP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDROP
    dq row_XDROP
section .text
XDROP:
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XDROP_END:
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
nm_XSWAP:
    ; DCB "SWAP", 0
    db "SWAP", 0
hl_XSWAP:
    ; DCB "SWAP ( a b -- b a ) swap top two", 0
    db "SWAP ( a b -- b a ) swap top two", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSWAP:
    ; DCQ     nm_XSWAP, hl_XSWAP
    dq nm_XSWAP, hl_XSWAP
    ; DCQ     0
    dq 0
    ; DCQ     XSWAP, XSWAP_END
    dq XSWAP, XSWAP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSWAP
    dq row_XSWAP
section .text
XSWAP:
    ; ldr     x0, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XSWAP_END:
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
nm_XOVER:
    ; DCB "OVER", 0
    db "OVER", 0
hl_XOVER:
    ; DCB "OVER ( a b -- a b a ) copy second", 0
    db "OVER ( a b -- a b a ) copy second", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XOVER:
    ; DCQ     nm_XOVER, hl_XOVER
    dq nm_XOVER, hl_XOVER
    ; DCQ     0
    dq 0
    ; DCQ     XOVER, XOVER_END
    dq XOVER, XOVER_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XOVER
    dq row_XOVER
section .text
XOVER:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x22, #8]
    mov r10, qword [rel arm_x22]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
XOVER_END:
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
nm_XPLUS:
    ; DCB "+", 0
    db "+", 0
hl_XPLUS:
    ; DCB "+ ( n1 n2 -- n ) addition", 0
    db "+ ( n1 n2 -- n ) addition", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPLUS:
    ; DCQ     nm_XPLUS, hl_XPLUS
    dq nm_XPLUS, hl_XPLUS
    ; DCQ     0
    dq 0
    ; DCQ     XPLUS, XPLUS_END
    dq XPLUS, XPLUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPLUS
    dq row_XPLUS
section .text
XPLUS:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; add     x20, x20, x0
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x20], rax
XPLUS_END:
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
nm_XMINUS:
    ; DCB "-", 0
    db "-", 0
hl_XMINUS:
    ; DCB "- ( n1 n2 -- n ) subtraction", 0
    db "- ( n1 n2 -- n ) subtraction", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMINUS:
    ; DCQ     nm_XMINUS, hl_XMINUS
    dq nm_XMINUS, hl_XMINUS
    ; DCQ     0
    dq 0
    ; DCQ     XMINUS, XMINUS_END
    dq XMINUS, XMINUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMINUS
    dq row_XMINUS
section .text
XMINUS:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; sub     x20, x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    sub rax, rcx
    mov qword [rel arm_x20], rax
XMINUS_END:
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
nm_XSTAR:
    ; DCB "*", 0
    db "*", 0
hl_XSTAR:
    ; DCB "* ( n1 n2 -- n ) multiplication", 0
    db "* ( n1 n2 -- n ) multiplication", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSTAR:
    ; DCQ     nm_XSTAR, hl_XSTAR
    dq nm_XSTAR, hl_XSTAR
    ; DCQ     0
    dq 0
    ; DCQ     XSTAR, XSTAR_END
    dq XSTAR, XSTAR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSTAR
    dq row_XSTAR
section .text
XSTAR:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mul     x20, x20, x0
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x0]
    imul rax, rcx
    mov qword [rel arm_x20], rax
XSTAR_END:
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
nm_XSLASH:
    ; DCB "/", 0
    db "/", 0
hl_XSLASH:
    ; DCB "/ ( n1 n2 -- quot ) division (quotient)", 0
    db "/ ( n1 n2 -- quot ) division (quotient)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSLASH:
    ; DCQ     nm_XSLASH, hl_XSLASH
    dq nm_XSLASH, hl_XSLASH
    ; DCQ     0
    dq 0
    ; DCQ     XSLASH, XSLASH_END
    dq XSLASH, XSLASH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSLASH
    dq row_XSLASH
section .text
XSLASH:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; sdiv    x20, x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    cmp rcx, 0
    je xdiv0_3
    cmp rcx, -1
    jne xdivov_4
    mov r8, 8000000000000000h
    cmp rax, r8
    je xdiv_2
    xdivov_4:
    cqo
    idiv rcx
    jmp xdiv_2
    xdiv0_3:
    xor eax, eax
    xdiv_2:
    mov qword [rel arm_x20], rax
XSLASH_END:
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
nm_XMOD:
    ; DCB "MOD", 0
    db "MOD", 0
hl_XMOD:
    ; DCB "MOD ( n1 n2 -- rem ) modulo", 0
    db "MOD ( n1 n2 -- rem ) modulo", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMOD:
    ; DCQ     nm_XMOD, hl_XMOD
    dq nm_XMOD, hl_XMOD
    ; DCQ     0
    dq 0
    ; DCQ     XMOD, XMOD_END
    dq XMOD, XMOD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMOD
    dq row_XMOD
section .text
XMOD:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; sdiv    x1, x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    cmp rcx, 0
    je xdiv0_6
    cmp rcx, -1
    jne xdivov_7
    mov r8, 8000000000000000h
    cmp rax, r8
    je xdiv_5
    xdivov_7:
    cqo
    idiv rcx
    jmp xdiv_5
    xdiv0_6:
    xor eax, eax
    xdiv_5:
    mov qword [rel arm_x1], rax
    ; msub    x20, x1, x20, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    imul rax, rcx
    mov rcx, qword [rel arm_x0]
    sub rcx, rax
    mov rax, rcx
    mov qword [rel arm_x20], rax
XMOD_END:
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
nm_XCR:
    ; DCB "CR", 0
    db "CR", 0
hl_XCR:
    ; DCB "CR ( -- ) carriage return / newline", 0
    db "CR ( -- ) carriage return / newline", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCR:
    ; DCQ     nm_XCR, hl_XCR
    dq nm_XCR, hl_XCR
    ; DCQ     0
    dq 0
    ; DCQ     XCR, XCR_END
    dq XCR, XCR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCR
    dq row_XCR
section .text
XCR:
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
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_8]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_8:
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
XCR_END:
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
nm_XDOT:
    ; DCB ".", 0
    db ".", 0
hl_XDOT:
    ; DCB ". ( n -- ) print number (with space)", 0
    db ". ( n -- ) print number (with space)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOT:
    ; DCQ     nm_XDOT, hl_XDOT
    dq nm_XDOT, hl_XDOT
    ; DCQ     0
    dq 0
    ; DCQ     XDOT, XDOT_END
    dq XDOT, XDOT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOT
    dq row_XDOT
section .text
XDOT:
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
    ; bl      _sa_print_signed
    lea rax, [rel xret_9]
    mov qword [rel arm_x30], rax
    jmp _sa_print_signed
    xret_9:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _sa_putchar
    lea rax, [rel xret_10]
    mov qword [rel arm_x30], rax
    jmp _sa_putchar
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
XDOT_END:
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
nm_XDOTS:
    ; DCB ".S", 0
    db ".S", 0
hl_XDOTS:
    ; DCB ".S ( -- ) print data stack contents", 0
    db ".S ( -- ) print data stack contents", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOTS:
    ; DCQ     nm_XDOTS, hl_XDOTS
    dq nm_XDOTS, hl_XDOTS
    ; DCQ     0
    dq 0
    ; DCQ     XDOTS, 0
    dq XDOTS, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOTS
    dq row_XDOTS
section .text
XDOTS:
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
    ; bl      _print_dots
    lea rax, [rel xret_11]
    mov qword [rel arm_x30], rax
    jmp _print_dots
    xret_11:
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
nm_XRSDOT:
    ; DCB "R.S", 0
    db "R.S", 0
hl_XRSDOT:
    ; DCB "R.S ( -- ) print return stack contents", 0
    db "R.S ( -- ) print return stack contents", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRSDOT:
    ; DCQ     nm_XRSDOT, hl_XRSDOT
    dq nm_XRSDOT, hl_XRSDOT
    ; DCQ     0
    dq 0
    ; DCQ     XRSDOT, 0
    dq XRSDOT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRSDOT
    dq row_XRSDOT
section .text
XRSDOT:
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
    ; bl      _print_rstack
    lea rax, [rel xret_12]
    mov qword [rel arm_x30], rax
    jmp _print_rstack
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
nm_XBYE:
    ; DCB "BYE", 0
    db "BYE", 0
hl_XBYE:
    ; DCB "BYE ( -- ) exit Forth to the host", 0
    db "BYE ( -- ) exit Forth to the host", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBYE:
    ; DCQ     nm_XBYE, hl_XBYE
    dq nm_XBYE, hl_XBYE
    ; DCQ     0
    dq 0
    ; DCQ     XBYE, XBYE_END
    dq XBYE, XBYE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBYE
    dq row_XBYE
section .text
XBYE:
    ; b       _quit_exit
    jmp _quit_exit
XBYE_END:
XRESTART:
    ; b       _interpret_loop
    jmp _interpret_loop
global _print_dots
_print_dots:
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
    ; stp     x25, x26, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x25]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x26]
    mov qword [r10+8], rax
    ; lea x0, msg_open
    lea rax, [rel msg_open]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_13]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_13:
    ; lea x25, dstack
    lea rax, [rel dstack]
    mov qword [rel arm_x25], rax
    ; add     x25, x25, #1, lsl #12
    mov rax, qword [rel arm_x25]
    add rax, 0x1000
    mov qword [rel arm_x25], rax
    ; sub     x26, x25, x22
    mov rax, qword [rel arm_x25]
    mov rcx, qword [rel arm_x22]
    sub rax, rcx
    mov qword [rel arm_x26], rax
    ; lsr     x26, x26, #3
    mov rax, qword [rel arm_x26]
    shr rax, 3
    mov qword [rel arm_x26], rax
    ; add     x0, x26, #1
    mov rax, qword [rel arm_x26]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; bl      _print_signed
    lea rax, [rel xret_14]
    mov qword [rel arm_x30], rax
    jmp _print_signed
    xret_14:
    ; lea x0, msg_mid
    lea rax, [rel msg_mid]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_15]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_15:
    ; sub     x25, x25, #8
    mov rax, qword [rel arm_x25]
    sub rax, 8
    mov qword [rel arm_x25], rax
_print_dots_loop:
    ; cmp     x25, x22
    mov rax, qword [rel arm_x25]
    mov rcx, qword [rel arm_x22]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _print_dots_tos
    cmp byte [rel arm_c], 0
    je _print_dots_tos
    ; ldr     x0, [x25]
    mov r10, qword [rel arm_x25]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_signed
    lea rax, [rel xret_16]
    mov qword [rel arm_x30], rax
    jmp _print_signed
    xret_16:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_17]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_17:
    ; sub     x25, x25, #8
    mov rax, qword [rel arm_x25]
    sub rax, 8
    mov qword [rel arm_x25], rax
    ; b       _print_dots_loop
    jmp _print_dots_loop
_print_dots_tos:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      _print_signed
    lea rax, [rel xret_18]
    mov qword [rel arm_x30], rax
    jmp _print_signed
    xret_18:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_19]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_19:
    ; ldp     x25, x26, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x25], rax
    mov qword [rel arm_x26], rcx
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
global _print_rstack
_print_rstack:
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
    ; stp     x25, x26, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x25]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x26]
    mov qword [r10+8], rax
    ; lea x25, return_stack
    lea rax, [rel return_stack]
    mov qword [rel arm_x25], rax
    ; add     x25, x25, #1, lsl #12
    mov rax, qword [rel arm_x25]
    add rax, 0x1000
    mov qword [rel arm_x25], rax
    ; lea x0, debug_floor
    lea rax, [rel debug_floor]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _pr_floor_keep
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _pr_floor_keep
    ; cmp     x0, x25
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x25]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _pr_floor_keep
    cmp byte [rel arm_c], 0
    je xsk_20
    cmp byte [rel arm_z], 0
    je _pr_floor_keep
    xsk_20:
    ; cmp     x0, x23
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x23]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _pr_floor_keep
    cmp byte [rel arm_c], 0
    je _pr_floor_keep
    cmp byte [rel arm_z], 0
    jne _pr_floor_keep
    ; mov     x25, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x25], rax
_pr_floor_keep:
    ; cmp     x23, x25
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x25]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pr_empty
    cmp byte [rel arm_c], 0
    jne _pr_empty
    ; sub     x26, x25, x23
    mov rax, qword [rel arm_x25]
    mov rcx, qword [rel arm_x23]
    sub rax, rcx
    mov qword [rel arm_x26], rax
    ; lsr     x26, x26, #3
    mov rax, qword [rel arm_x26]
    shr rax, 3
    mov qword [rel arm_x26], rax
    ; str     x26, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x26]
    mov qword [r10], rax
    ; lea x0, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x0, [sp, #72]
    lea r10, [rsp]
    add r10, 0x48
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x25, #0
    mov rax, 0
    mov qword [rel arm_x25], rax
    ; mov     x26, #0
    mov rax, 0
    mov qword [rel arm_x26], rax
_pr_count:
    ; ldr     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cmp     x25, x0
    mov rax, qword [rel arm_x25]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pr_counted
    cmp byte [rel arm_c], 0
    jne _pr_counted
    ; ldr     x1, [sp, #72]
    lea r10, [rsp]
    add r10, 0x48
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _pr_count_one
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _pr_count_one
    ; add     x2, x23, x25, lsl #3
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x25]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x2], rax
    ; cmp     x2, x1
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pr_count_one
    cmp byte [rel arm_z], 0
    je _pr_count_one
    ; add     x25, x25, #6
    mov rax, qword [rel arm_x25]
    add rax, 6
    mov qword [rel arm_x25], rax
    ; b       _pr_count
    jmp _pr_count
_pr_count_one:
    ; add     x26, x26, #1
    mov rax, qword [rel arm_x26]
    add rax, 1
    mov qword [rel arm_x26], rax
    ; add     x25, x25, #1
    mov rax, qword [rel arm_x25]
    add rax, 1
    mov qword [rel arm_x25], rax
    ; b       _pr_count
    jmp _pr_count
_pr_counted:
    ; cbz     x26, _pr_empty
    mov rax, qword [rel arm_x26]
    cmp rax, 0
    je _pr_empty
    ; str     x26, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [rel arm_x26]
    mov qword [r10], rax
    ; lea x0, msg_open
    lea rax, [rel msg_open]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_21]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_21:
    ; ldr     x0, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_22]
    mov qword [rel arm_x30], rax
    jmp _print_unsigned
    xret_22:
    ; lea x0, msg_mid
    lea rax, [rel msg_mid]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_23]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_23:
    ; mov     x25, #0
    mov rax, 0
    mov qword [rel arm_x25], rax
_pr_show:
    ; ldr     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cmp     x25, x0
    mov rax, qword [rel arm_x25]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pr_done
    cmp byte [rel arm_c], 0
    jne _pr_done
    ; ldr     x1, [sp, #72]
    lea r10, [rsp]
    add r10, 0x48
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _pr_show_one
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _pr_show_one
    ; add     x2, x23, x25, lsl #3
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x25]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x2], rax
    ; cmp     x2, x1
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pr_show_one
    cmp byte [rel arm_z], 0
    je _pr_show_one
    ; add     x25, x25, #6
    mov rax, qword [rel arm_x25]
    add rax, 6
    mov qword [rel arm_x25], rax
    ; b       _pr_show
    jmp _pr_show
_pr_show_one:
    ; ldr     x0, [x23, x25, lsl #3]
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x25]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_24]
    mov qword [rel arm_x30], rax
    jmp _print_unsigned
    xret_24:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_25]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_25:
    ; add     x25, x25, #1
    mov rax, qword [rel arm_x25]
    add rax, 1
    mov qword [rel arm_x25], rax
    ; b       _pr_show
    jmp _pr_show
_pr_empty:
    ; lea x0, msg_open
    lea rax, [rel msg_open]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_26]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_26:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_27]
    mov qword [rel arm_x30], rax
    jmp _print_unsigned
    xret_27:
    ; lea x0, msg_mid
    lea rax, [rel msg_mid]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_28]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_28:
_pr_done:
    ; ldp     x25, x26, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x25], rax
    mov qword [rel arm_x26], rcx
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
next_debug_gate:
    ; lea x16, next_debug
    lea rax, [rel next_debug]
    mov qword [rel arm_x16], rax
    ; br      x16
    mov rax, qword [rel arm_x16]
    jmp rax
section .rodata
msg_open:
    ; DCB     "( ", 0
    db "( ", 0
msg_mid:
    ; DCB     " ) ", 0
    db " ) ", 0
