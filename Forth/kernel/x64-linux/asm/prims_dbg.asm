; Generated from Forth/kernel/arm64/prims_dbg.asm. Do not edit.
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
extern DODOES
extern XCATCH
extern XCATCH_OK
extern XEXECUTE
extern XTHROW
extern _print_signed
extern _print_unsigned
extern _putchar
extern catch_ok_cell
extern cfa_0branch
extern cfa_branch
extern cfa_lit
extern cfa_loop
extern cfa_plusloop
extern data_stack
extern here_ptr
extern host_debug_get_span
extern host_debug_paint
extern host_debug_set_span
extern key_fn
extern latest_var
extern line_mode
extern line_origin
extern return_stack
extern source_base
extern source_id
extern throw_handler
extern to_in
extern tw_continue_cell
extern tw_continue_cfa
extern user_dict_area
extern wordlist_reg
extern wordlist_reg_n
section .text
global next_debug
global debug_break_asap
global debug_armed
global debug_busy
global debug_bp_go
global debug_bp_xts
global debug_bp_en
global debug_cfa
global debug_xt
global debug_name
global view_file_n
global view_paths
global view_src_id
global view_id_sp
global include_name_pending
global include_name_len
global _view_line_now
global _view_push_src_id
global _view_pop_src_id
global _view_set_src_from_pending
global debug_runto_ip
global debug_runto_off
global debug_runto_status
global debug_floor
global debug_field_count
global debug_field_len
global _debug_note_byte
global _getchar
next_debug_gate:
next_debug:
    ; lea x1, debug_busy
    lea rax, [rel debug_busy]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbnz    x2, nd_exec
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    jne nd_exec
    ; lea x2, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbz     x3, nd_floor
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je nd_floor
    ; ldr     x21, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    ; mov     x3, #1
    mov rax, 1
    mov qword [rel arm_x3], rax
    ; mov     x28, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x28], rax
    ; lea x4, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x4], rax
    ; ldr     x5, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; str     x3, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; cbnz    x5, nd_asap_floor
    mov rax, qword [rel arm_x5]
    cmp rax, 0
    jne nd_asap_floor
    ; lea x4, debug_need_intro
    lea rax, [rel debug_need_intro]
    mov qword [rel arm_x4], rax
    ; str     x3, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
nd_asap_floor:
    ; lea x4, debug_floor
    lea rax, [rel debug_floor]
    mov qword [rel arm_x4], rax
    ; str     xzr, [x4]
    mov r10, qword [rel arm_x4]
    mov qword [r10], 0
    ; lea x4, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x4], rax
    ; str     xzr, [x4]
    mov r10, qword [rel arm_x4]
    mov qword [r10], 0
    ; lea x4, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x4], rax
    ; str     xzr, [x4]
    mov r10, qword [rel arm_x4]
    mov qword [r10], 0
    ; lea x4, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x4], rax
    ; str     xzr, [x4]
    mov r10, qword [rel arm_x4]
    mov qword [r10], 0
    ; lea x4, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x4], rax
    ; str     xzr, [x4]
    mov r10, qword [rel arm_x4]
    mov qword [r10], 0
    ; lea x4, debug_break_min_cfa
    lea rax, [rel debug_break_min_cfa]
    mov qword [rel arm_x4], rax
    ; ldr     x4, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; cbz     x4, nd_asap_hit
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je nd_asap_hit
    ; mov     x0, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x0], rax
    ; mov     x1, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x1], rax
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_resolve_enclosing
    lea rax, [rel xret_1]
    mov qword [rel arm_x30], rax
    jmp _debug_resolve_enclosing
    xret_1:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; cbz     x0, nd_exec
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je nd_exec
    ; lea x4, debug_break_min_cfa
    lea rax, [rel debug_break_min_cfa]
    mov qword [rel arm_x4], rax
    ; ldr     x4, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; cmp     x0, x4
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    nd_exec
    cmp byte [rel arm_c], 0
    je nd_exec
nd_asap_hit:
    ; lea x2, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; add     x3, x23, #8
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x3], rax
    ; lea x4, debug_floor
    lea rax, [rel debug_floor]
    mov qword [rel arm_x4], rax
    ; str     x3, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; b       nd_force
    jmp nd_force
nd_floor:
    ; lea x2, debug_floor
    lea rax, [rel debug_floor]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, nd_out
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je nd_out
    ; cmp     x23, x2
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    nd_out
    cmp byte [rel arm_c], 0
    je nd_out
    ; b.eq    nd_exec
    cmp byte [rel arm_z], 0
    jne nd_exec
    ; mov     x28, #0
    mov rax, 0
    mov qword [rel arm_x28], rax
    ; lea x3, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
    ; lea x3, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
    ; lea x3, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
    ; lea x3, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; b       nd_exec
    jmp nd_exec
nd_out:
    ; lea x2, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, nd_over
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je nd_over
    ; cmp     x23, x2
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    nd_exec
    cmp byte [rel arm_c], 0
    je nd_exec
    cmp byte [rel arm_z], 0
    jne nd_exec
nd_over:
    ; lea x2, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, nd_peek
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je nd_peek
    ; cmp     x23, x2
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    nd_exec
    cmp byte [rel arm_c], 0
    je nd_exec
nd_peek:
    ; ldr     x21, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    ; lea x2, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbz     x3, nd_bp
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je nd_bp
    ; cmp     x19, x3
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    nd_runto_miss
    cmp byte [rel arm_z], 0
    je nd_runto_miss
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; b       nd_force
    jmp nd_force
nd_runto_miss:
    ; lea x2, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbz     x3, nd_exec
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je nd_exec
    ; b       nd_scan
    jmp nd_scan
nd_bp:
    ; lea x2, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbz     x3, nd_force
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je nd_force
nd_scan:
    ; lea x3, debug_bp_xts
    lea rax, [rel debug_bp_xts]
    mov qword [rel arm_x3], rax
    ; lea x6, debug_bp_en
    lea rax, [rel debug_bp_en]
    mov qword [rel arm_x6], rax
    ; mov     x4, #8
    mov rax, 8
    mov qword [rel arm_x4], rax
nd_scan_loop:
    ; ldr     x5, [x3], #8
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x3]
    add rax, 8
    mov qword [rel arm_x3], rax
    ; ldr     x7, [x6], #8
    mov r10, qword [rel arm_x6]
    mov rax, qword [r10]
    mov qword [rel arm_x7], rax
    mov rax, qword [rel arm_x6]
    add rax, 8
    mov qword [rel arm_x6], rax
    ; cbz     x5, nd_scan_next
    mov rax, qword [rel arm_x5]
    cmp rax, 0
    je nd_scan_next
    ; cbz     x7, nd_scan_next
    mov rax, qword [rel arm_x7]
    cmp rax, 0
    je nd_scan_next
    ; cmp     x5, x21
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x21]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    nd_scan_hit
    cmp byte [rel arm_z], 0
    jne nd_scan_hit
nd_scan_next:
    ; subs    x4, x4, #1
    mov rax, qword [rel arm_x4]
    sub rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x4], rax
    ; b.ne    nd_scan_loop
    cmp byte [rel arm_z], 0
    je nd_scan_loop
    ; b       nd_exec
    jmp nd_exec
nd_scan_hit:
    ; lea x2, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x3, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
nd_force:
    ; ldr     x2, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; lea x3, XCATCH_OK
    lea rax, [rel XCATCH_OK]
    mov qword [rel arm_x3], rax
    ; cmp     x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    nd_exec
    cmp byte [rel arm_z], 0
    jne nd_exec
    ; lea x3, XDBGOFF
    lea rax, [rel XDBGOFF]
    mov qword [rel arm_x3], rax
    ; cmp     x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    nd_exec
    cmp byte [rel arm_z], 0
    jne nd_exec
    ; lea x2, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x1, debug_busy
    lea rax, [rel debug_busy]
    mov qword [rel arm_x1], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_pause
    lea rax, [rel xret_2]
    mov qword [rel arm_x30], rax
    jmp _debug_pause
    xret_2:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; lea x1, debug_busy
    lea rax, [rel debug_busy]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_abort
    lea rax, [rel debug_abort]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, nd_exec
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je nd_exec
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x20], rax
    ; b       XTHROW
    jmp XTHROW
nd_exec:
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
nm_XDBGSHOWXT:
    ; DCB "DBG-SHOW-XT", 0
    db "DBG-SHOW-XT", 0
hl_XDBGSHOWXT:
    ; DCB "DBG-SHOW-XT ( -- addr ) xt of the view sync word or 0", 0
    db "DBG-SHOW-XT ( -- addr ) xt of the view sync word or 0", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGSHOWXT:
    ; DCQ     nm_XDBGSHOWXT, hl_XDBGSHOWXT
    dq nm_XDBGSHOWXT, hl_XDBGSHOWXT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGSHOWXT, 0
    dq XDBGSHOWXT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGSHOWXT
    dq row_XDBGSHOWXT
section .text
XDBGSHOWXT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_show_xt
    lea rax, [rel debug_show_xt]
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
nm_XDBGSYNCOK:
    ; DCB "DBG-SYNC-OK", 0
    db "DBG-SYNC-OK", 0
hl_XDBGSYNCOK:
    ; DCB "DBG-SYNC-OK ( -- addr ) set 1 after a debug VIEW", 0
    db "DBG-SYNC-OK ( -- addr ) set 1 after a debug VIEW", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGSYNCOK:
    ; DCQ     nm_XDBGSYNCOK, hl_XDBGSYNCOK
    dq nm_XDBGSYNCOK, hl_XDBGSYNCOK
    ; DCQ     0
    dq 0
    ; DCQ     XDBGSYNCOK, 0
    dq XDBGSYNCOK, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGSYNCOK
    dq row_XDBGSYNCOK
section .text
XDBGSYNCOK:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_sync_ok
    lea rax, [rel debug_sync_ok]
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
nm_XDBGHLXT:
    ; DCB "DBG-HL-XT", 0
    db "DBG-HL-XT", 0
hl_XDBGHLXT:
    ; DCB "DBG-HL-XT ( -- addr ) xt of the highlight word or 0", 0
    db "DBG-HL-XT ( -- addr ) xt of the highlight word or 0", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGHLXT:
    ; DCQ     nm_XDBGHLXT, hl_XDBGHLXT
    dq nm_XDBGHLXT, hl_XDBGHLXT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGHLXT, 0
    dq XDBGHLXT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGHLXT
    dq row_XDBGHLXT
section .text
XDBGHLXT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_hl_xt
    lea rax, [rel debug_hl_xt]
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
nm_XDBGWHEELXT:
    ; DCB "DBG-WHEEL-XT", 0
    db "DBG-WHEEL-XT", 0
hl_XDBGWHEELXT:
    ; DCB "DBG-WHEEL-XT ( -- addr ) xt of the wheel word or 0", 0
    db "DBG-WHEEL-XT ( -- addr ) xt of the wheel word or 0", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGWHEELXT:
    ; DCQ     nm_XDBGWHEELXT, hl_XDBGWHEELXT
    dq nm_XDBGWHEELXT, hl_XDBGWHEELXT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGWHEELXT, 0
    dq XDBGWHEELXT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGWHEELXT
    dq row_XDBGWHEELXT
section .text
XDBGWHEELXT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_wheel_xt
    lea rax, [rel debug_wheel_xt]
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
nm_XDBGPAUSEXT:
    ; DCB "DBG-PAUSE-XT", 0
    db "DBG-PAUSE-XT", 0
hl_XDBGPAUSEXT:
    ; DCB "DBG-PAUSE-XT ( -- addr ) Forth pause xt or 0", 0
    db "DBG-PAUSE-XT ( -- addr ) Forth pause xt or 0", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGPAUSEXT:
    ; DCQ     nm_XDBGPAUSEXT, hl_XDBGPAUSEXT
    dq nm_XDBGPAUSEXT, hl_XDBGPAUSEXT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGPAUSEXT, 0
    dq XDBGPAUSEXT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGPAUSEXT
    dq row_XDBGPAUSEXT
section .text
XDBGPAUSEXT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_pause_xt
    lea rax, [rel debug_pause_xt]
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
nm_XDBGKEYXT:
    ; DCB "DBG-KEY-XT", 0
    db "DBG-KEY-XT", 0
hl_XDBGKEYXT:
    ; DCB "DBG-KEY-XT ( -- addr ) Forth key mode xt or 0", 0
    db "DBG-KEY-XT ( -- addr ) Forth key mode xt or 0", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGKEYXT:
    ; DCQ     nm_XDBGKEYXT, hl_XDBGKEYXT
    dq nm_XDBGKEYXT, hl_XDBGKEYXT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGKEYXT, 0
    dq XDBGKEYXT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGKEYXT
    dq row_XDBGKEYXT
section .text
XDBGKEYXT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_key_xt
    lea rax, [rel debug_key_xt]
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
nm_XDBGINLINE:
    ; DCB "DBG-INLINE", 0
    db "DBG-INLINE", 0
hl_XDBGINLINE:
    ; DCB "DBG-INLINE ( -- x ) cell after the paused IP", 0
    db "DBG-INLINE ( -- x ) cell after the paused IP", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGINLINE:
    ; DCQ     nm_XDBGINLINE, hl_XDBGINLINE
    dq nm_XDBGINLINE, hl_XDBGINLINE
    ; DCQ     0
    dq 0
    ; DCQ     XDBGINLINE, 0
    dq XDBGINLINE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGINLINE
    dq row_XDBGINLINE
section .text
XDBGINLINE:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_inline
    lea rax, [rel debug_inline]
    mov qword [rel arm_x20], rax
    ; ldr     x20, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [r10]
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
nm_XDBGTOSAT:
    ; DCB "DBG-TOS@", 0
    db "DBG-TOS@", 0
hl_XDBGTOSAT:
    ; DCB "DBG-TOS@ ( -- x ) data TOS at the last pause or 0", 0
    db "DBG-TOS@ ( -- x ) data TOS at the last pause or 0", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGTOSAT:
    ; DCQ     nm_XDBGTOSAT, hl_XDBGTOSAT
    dq nm_XDBGTOSAT, hl_XDBGTOSAT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGTOSAT, 0
    dq XDBGTOSAT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGTOSAT
    dq row_XDBGTOSAT
section .text
XDBGTOSAT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, debug_scnt
    lea rax, [rel debug_scnt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, dbg_tos_empty
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je dbg_tos_empty
    ; lea x1, debug_sbuf
    lea rax, [rel debug_sbuf]
    mov qword [rel arm_x1], rax
    ; sub     x0, x0, #1
    mov rax, qword [rel arm_x0]
    sub rax, 1
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x1, x0, lsl #3]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
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
dbg_tos_empty:
    ; mov     x20, #0
    mov rax, 0
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
nm_XDBGXTAT:
    ; DCB "DBG-XT@", 0
    db "DBG-XT@", 0
hl_XDBGXTAT:
    ; DCB "DBG-XT@ ( -- xt ) upcoming xt at the last pause", 0
    db "DBG-XT@ ( -- xt ) upcoming xt at the last pause", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGXTAT:
    ; DCQ     nm_XDBGXTAT, hl_XDBGXTAT
    dq nm_XDBGXTAT, hl_XDBGXTAT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGXTAT, 0
    dq XDBGXTAT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGXTAT
    dq row_XDBGXTAT
section .text
XDBGXTAT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x20], rax
    ; ldr     x20, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [r10]
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
nm_XDBGIPAT:
    ; DCB "DBG-IP@", 0
    db "DBG-IP@", 0
hl_XDBGIPAT:
    ; DCB "DBG-IP@ ( -- ip ) paused IP", 0
    db "DBG-IP@ ( -- ip ) paused IP", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGIPAT:
    ; DCQ     nm_XDBGIPAT, hl_XDBGIPAT
    dq nm_XDBGIPAT, hl_XDBGIPAT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGIPAT, 0
    dq XDBGIPAT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGIPAT
    dq row_XDBGIPAT
section .text
XDBGIPAT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_ip
    lea rax, [rel debug_ip]
    mov qword [rel arm_x20], rax
    ; ldr     x20, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [r10]
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
nm_XDBGCFAAT:
    ; DCB "DBG-CFA@", 0
    db "DBG-CFA@", 0
hl_XDBGCFAAT:
    ; DCB "DBG-CFA@ ( -- cfa|0 ) enclosing colon at the last pause", 0
    db "DBG-CFA@ ( -- cfa|0 ) enclosing colon at the last pause", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGCFAAT:
    ; DCQ     nm_XDBGCFAAT, hl_XDBGCFAAT
    dq nm_XDBGCFAAT, hl_XDBGCFAAT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGCFAAT, 0
    dq XDBGCFAAT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGCFAAT
    dq row_XDBGCFAAT
section .text
XDBGCFAAT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_cfa
    lea rax, [rel debug_cfa]
    mov qword [rel arm_x20], rax
    ; ldr     x20, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [r10]
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
nm_XDBGBODYN:
    ; DCB "DBG-BODY#", 0
    db "DBG-BODY#", 0
hl_XDBGBODYN:
    ; DCB "DBG-BODY# ( -- u ) body cell index of the paused IP", 0
    db "DBG-BODY# ( -- u ) body cell index of the paused IP", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGBODYN:
    ; DCQ     nm_XDBGBODYN, hl_XDBGBODYN
    dq nm_XDBGBODYN, hl_XDBGBODYN
    ; DCQ     0
    dq 0
    ; DCQ     XDBGBODYN, 0
    dq XDBGBODYN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGBODYN
    dq row_XDBGBODYN
section .text
XDBGBODYN:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_body_cells
    lea rax, [rel debug_body_cells]
    mov qword [rel arm_x20], rax
    ; ldr     x20, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [r10]
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
nm_XDBGNEEDINTRO:
    ; DCB "DBG-NEED-INTRO", 0
    db "DBG-NEED-INTRO", 0
hl_XDBGNEEDINTRO:
    ; DCB "DBG-NEED-INTRO ( -- addr )", 0
    db "DBG-NEED-INTRO ( -- addr )", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGNEEDINTRO:
    ; DCQ     nm_XDBGNEEDINTRO, hl_XDBGNEEDINTRO
    dq nm_XDBGNEEDINTRO, hl_XDBGNEEDINTRO
    ; DCQ     0
    dq 0
    ; DCQ     XDBGNEEDINTRO, 0
    dq XDBGNEEDINTRO, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGNEEDINTRO
    dq row_XDBGNEEDINTRO
section .text
XDBGNEEDINTRO:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_need_intro
    lea rax, [rel debug_need_intro]
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
nm_XDBGNEEDSTACKS:
    ; DCB "DBG-NEED-STACKS", 0
    db "DBG-NEED-STACKS", 0
hl_XDBGNEEDSTACKS:
    ; DCB "DBG-NEED-STACKS ( -- addr )", 0
    db "DBG-NEED-STACKS ( -- addr )", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGNEEDSTACKS:
    ; DCQ     nm_XDBGNEEDSTACKS, hl_XDBGNEEDSTACKS
    dq nm_XDBGNEEDSTACKS, hl_XDBGNEEDSTACKS
    ; DCQ     0
    dq 0
    ; DCQ     XDBGNEEDSTACKS, 0
    dq XDBGNEEDSTACKS, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGNEEDSTACKS
    dq row_XDBGNEEDSTACKS
section .text
XDBGNEEDSTACKS:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_need_stacks
    lea rax, [rel debug_need_stacks]
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
nm_XDBGHELPSHOWN:
    ; DCB "DBG-HELP-SHOWN", 0
    db "DBG-HELP-SHOWN", 0
hl_XDBGHELPSHOWN:
    ; DCB "DBG-HELP-SHOWN ( -- addr )", 0
    db "DBG-HELP-SHOWN ( -- addr )", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGHELPSHOWN:
    ; DCQ     nm_XDBGHELPSHOWN, hl_XDBGHELPSHOWN
    dq nm_XDBGHELPSHOWN, hl_XDBGHELPSHOWN
    ; DCQ     0
    dq 0
    ; DCQ     XDBGHELPSHOWN, 0
    dq XDBGHELPSHOWN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGHELPSHOWN
    dq row_XDBGHELPSHOWN
section .text
XDBGHELPSHOWN:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_help_shown
    lea rax, [rel debug_help_shown]
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
nm_XDBGSKIPNL:
    ; DCB "DBG-SKIP-NL", 0
    db "DBG-SKIP-NL", 0
hl_XDBGSKIPNL:
    ; DCB "DBG-SKIP-NL ( -- addr )", 0
    db "DBG-SKIP-NL ( -- addr )", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGSKIPNL:
    ; DCQ     nm_XDBGSKIPNL, hl_XDBGSKIPNL
    dq nm_XDBGSKIPNL, hl_XDBGSKIPNL
    ; DCQ     0
    dq 0
    ; DCQ     XDBGSKIPNL, 0
    dq XDBGSKIPNL, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGSKIPNL
    dq row_XDBGSKIPNL
section .text
XDBGSKIPNL:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_skip_nl
    lea rax, [rel debug_skip_nl]
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
nm_XDBGMIDLINE:
    ; DCB "DBG-MIDLINE", 0
    db "DBG-MIDLINE", 0
hl_XDBGMIDLINE:
    ; DCB "DBG-MIDLINE ( -- addr )", 0
    db "DBG-MIDLINE ( -- addr )", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGMIDLINE:
    ; DCQ     nm_XDBGMIDLINE, hl_XDBGMIDLINE
    dq nm_XDBGMIDLINE, hl_XDBGMIDLINE
    ; DCQ     0
    dq 0
    ; DCQ     XDBGMIDLINE, 0
    dq XDBGMIDLINE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGMIDLINE
    dq row_XDBGMIDLINE
section .text
XDBGMIDLINE:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_midline
    lea rax, [rel debug_midline]
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
nm_XDBGLINECOL:
    ; DCB "DBG-LINE-COL", 0
    db "DBG-LINE-COL", 0
hl_XDBGLINECOL:
    ; DCB "DBG-LINE-COL ( -- addr )", 0
    db "DBG-LINE-COL ( -- addr )", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGLINECOL:
    ; DCQ     nm_XDBGLINECOL, hl_XDBGLINECOL
    dq nm_XDBGLINECOL, hl_XDBGLINECOL
    ; DCQ     0
    dq 0
    ; DCQ     XDBGLINECOL, 0
    dq XDBGLINECOL, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGLINECOL
    dq row_XDBGLINECOL
section .text
XDBGLINECOL:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_line_col
    lea rax, [rel debug_line_col]
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
nm_XDBGDOTSR:
    ; DCB "DBG-.SR", 0
    db "DBG-.SR", 0
hl_XDBGDOTSR:
    ; DCB "DBG-.SR ( -- ) pad to the stack column and print S and R", 0
    db "DBG-.SR ( -- ) pad to the stack column and print S and R", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGDOTSR:
    ; DCQ     nm_XDBGDOTSR, hl_XDBGDOTSR
    dq nm_XDBGDOTSR, hl_XDBGDOTSR
    ; DCQ     0
    dq 0
    ; DCQ     XDBGDOTSR, 0
    dq XDBGDOTSR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGDOTSR
    dq row_XDBGDOTSR
section .text
XDBGDOTSR:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; lea x0, debug_busy
    lea rax, [rel debug_busy]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, dbg_sr_live
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je dbg_sr_live
    ; lea x0, debug_pause_rsp
    lea rax, [rel debug_pause_rsp]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, dbg_sr_live
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je dbg_sr_live
    ; mov     x23, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x23], rax
dbg_sr_live:
    ; bl      _debug_pad_to_stack_col
    lea rax, [rel xret_3]
    mov qword [rel arm_x30], rax
    jmp _debug_pad_to_stack_col
    xret_3:
    ; bl      _debug_print_SR
    lea rax, [rel xret_4]
    mov qword [rel arm_x30], rax
    jmp _debug_print_SR
    xret_4:
    ; ldp     x23, x24, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
    add rsp, 0x10
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGCURON:
    ; DCB "DBG-CURSOR-ON", 0
    db "DBG-CURSOR-ON", 0
hl_XDBGCURON:
    ; DCB "DBG-CURSOR-ON ( -- )", 0
    db "DBG-CURSOR-ON ( -- )", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGCURON:
    ; DCQ     nm_XDBGCURON, hl_XDBGCURON
    dq nm_XDBGCURON, hl_XDBGCURON
    ; DCQ     0
    dq 0
    ; DCQ     XDBGCURON, 0
    dq XDBGCURON, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGCURON
    dq row_XDBGCURON
section .text
XDBGCURON:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_on
    lea rax, [rel xret_5]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_on
    xret_5:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGCUROFF:
    ; DCB "DBG-CURSOR-OFF", 0
    db "DBG-CURSOR-OFF", 0
hl_XDBGCUROFF:
    ; DCB "DBG-CURSOR-OFF ( -- )", 0
    db "DBG-CURSOR-OFF ( -- )", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGCUROFF:
    ; DCQ     nm_XDBGCUROFF, hl_XDBGCUROFF
    dq nm_XDBGCUROFF, hl_XDBGCUROFF
    ; DCQ     0
    dq 0
    ; DCQ     XDBGCUROFF, 0
    dq XDBGCUROFF, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGCUROFF
    dq row_XDBGCUROFF
section .text
XDBGCUROFF:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_6]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_6:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGPRINTINL:
    ; DCB "DBG-PRINT-INLINE", 0
    db "DBG-PRINT-INLINE", 0
hl_XDBGPRINTINL:
    ; DCB "DBG-PRINT-INLINE ( -- ) LIT or branch suffix after the name", 0
    db "DBG-PRINT-INLINE ( -- ) LIT or branch suffix after the name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGPRINTINL:
    ; DCQ     nm_XDBGPRINTINL, hl_XDBGPRINTINL
    dq nm_XDBGPRINTINL, hl_XDBGPRINTINL
    ; DCQ     0
    dq 0
    ; DCQ     XDBGPRINTINL, 0
    dq XDBGPRINTINL, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGPRINTINL
    dq row_XDBGPRINTINL
section .text
XDBGPRINTINL:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_print_inline_suffix
    lea rax, [rel xret_7]
    mov qword [rel arm_x30], rax
    jmp _debug_print_inline_suffix
    xret_7:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGPRINTNAME:
    ; DCB "DBG-PRINT-NAME", 0
    db "DBG-PRINT-NAME", 0
hl_XDBGPRINTNAME:
    ; DCB "DBG-PRINT-NAME ( -- ) print the paused xt name", 0
    db "DBG-PRINT-NAME ( -- ) print the paused xt name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGPRINTNAME:
    ; DCQ     nm_XDBGPRINTNAME, hl_XDBGPRINTNAME
    dq nm_XDBGPRINTNAME, hl_XDBGPRINTNAME
    ; DCQ     0
    dq 0
    ; DCQ     XDBGPRINTNAME, 0
    dq XDBGPRINTNAME, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGPRINTNAME
    dq row_XDBGPRINTNAME
section .text
XDBGPRINTNAME:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_xt_name
    lea rax, [rel xret_8]
    mov qword [rel arm_x30], rax
    jmp _print_xt_name
    xret_8:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGINTOABLE:
    ; DCB "DBG-XT-INTOABLE?", 0
    db "DBG-XT-INTOABLE?", 0
hl_XDBGINTOABLE:
    ; DCB "DBG-XT-INTOABLE? ( -- flag ) true when the paused xt can nest", 0
    db "DBG-XT-INTOABLE? ( -- flag ) true when the paused xt can nest", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGINTOABLE:
    ; DCQ     nm_XDBGINTOABLE, hl_XDBGINTOABLE
    dq nm_XDBGINTOABLE, hl_XDBGINTOABLE
    ; DCQ     0
    dq 0
    ; DCQ     XDBGINTOABLE, 0
    dq XDBGINTOABLE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGINTOABLE
    dq row_XDBGINTOABLE
section .text
XDBGINTOABLE:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _debug_xt_intoable
    lea rax, [rel xret_9]
    mov qword [rel arm_x30], rax
    jmp _debug_xt_intoable
    xret_9:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGHOSTPAINT:
    ; DCB "DBG-HOST-PAINT", 0
    db "DBG-HOST-PAINT", 0
hl_XDBGHOSTPAINT:
    ; DCB "DBG-HOST-PAINT ( -- ) refresh the editor debug pane", 0
    db "DBG-HOST-PAINT ( -- ) refresh the editor debug pane", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGHOSTPAINT:
    ; DCQ     nm_XDBGHOSTPAINT, hl_XDBGHOSTPAINT
    dq nm_XDBGHOSTPAINT, hl_XDBGHOSTPAINT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGHOSTPAINT, 0
    dq XDBGHOSTPAINT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGHOSTPAINT
    dq row_XDBGHOSTPAINT
section .text
XDBGHOSTPAINT:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGHOSTSPAN:
    ; DCB "DBG-HOST-SPAN", 0
    db "DBG-HOST-SPAN", 0
hl_XDBGHOSTSPAN:
    ; DCB "DBG-HOST-SPAN ( off len -- ) pending editor highlight span", 0
    db "DBG-HOST-SPAN ( off len -- ) pending editor highlight span", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGHOSTSPAN:
    ; DCQ     nm_XDBGHOSTSPAN, hl_XDBGHOSTSPAN
    dq nm_XDBGHOSTSPAN, hl_XDBGHOSTSPAN
    ; DCQ     0
    dq 0
    ; DCQ     XDBGHOSTSPAN, 0
    dq XDBGHOSTSPAN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGHOSTSPAN
    dq row_XDBGHOSTSPAN
section .text
XDBGHOSTSPAN:
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
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_debug_set_span
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
    call host_debug_set_span
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGHOSTSPANAT:
    ; DCB "DBG-HOST-SPAN@", 0
    db "DBG-HOST-SPAN@", 0
hl_XDBGHOSTSPANAT:
    ; DCB "DBG-HOST-SPAN@ ( -- off len ) peek the pending highlight span", 0
    db "DBG-HOST-SPAN@ ( -- off len ) peek the pending highlight span", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGHOSTSPANAT:
    ; DCQ     nm_XDBGHOSTSPANAT, hl_XDBGHOSTSPANAT
    dq nm_XDBGHOSTSPANAT, hl_XDBGHOSTSPANAT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGHOSTSPANAT, 0
    dq XDBGHOSTSPANAT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGHOSTSPANAT
    dq row_XDBGHOSTSPANAT
section .text
XDBGHOSTSPANAT:
    ; sub     sp, sp, #32
    mov rax, rsp
    sub rax, 0x20
    mov rsp, rax
    ; stp     x29, x30, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; mov     x0, sp
    mov rax, rsp
    mov qword [rel arm_x0], rax
    ; add     x1, sp, #8
    mov rax, rsp
    add rax, 8
    mov qword [rel arm_x1], rax
    ; str     xzr, [sp]
    lea r10, [rsp]
    mov qword [r10], 0
    ; str     xzr, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov qword [r10], 0
    ; bl      host_debug_get_span
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
    call host_debug_get_span
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x1, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; ldp     x29, x30, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #32
    mov rax, rsp
    add rax, 0x20
    mov rsp, rax
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
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
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
nm_XDBGVIEWUPD:
    ; DCB "DBG-VIEW-UPDATE", 0
    db "DBG-VIEW-UPDATE", 0
hl_XDBGVIEWUPD:
    ; DCB "DBG-VIEW-UPDATE ( -- ) sync VIEW highlight and paint", 0
    db "DBG-VIEW-UPDATE ( -- ) sync VIEW highlight and paint", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGVIEWUPD:
    ; DCQ     nm_XDBGVIEWUPD, hl_XDBGVIEWUPD
    dq nm_XDBGVIEWUPD, hl_XDBGVIEWUPD
    ; DCQ     0
    dq 0
    ; DCQ     XDBGVIEWUPD, 0
    dq XDBGVIEWUPD, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGVIEWUPD
    dq row_XDBGVIEWUPD
section .text
XDBGVIEWUPD:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; bl      _debug_sync_view
    lea rax, [rel xret_10]
    mov qword [rel arm_x30], rax
    jmp _debug_sync_view
    xret_10:
    ; bl      _debug_highlight
    lea rax, [rel xret_11]
    mov qword [rel arm_x30], rax
    jmp _debug_highlight
    xret_11:
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x23, x24, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
    add rsp, 0x10
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
nm_XDBGWHEELDO:
    ; DCB "DBG-WHEEL-DO", 0
    db "DBG-WHEEL-DO", 0
hl_XDBGWHEELDO:
    ; DCB "DBG-WHEEL-DO ( u -- ) wheel or resize while paused", 0
    db "DBG-WHEEL-DO ( u -- ) wheel or resize while paused", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGWHEELDO:
    ; DCQ     nm_XDBGWHEELDO, hl_XDBGWHEELDO
    dq nm_XDBGWHEELDO, hl_XDBGWHEELDO
    ; DCQ     0
    dq 0
    ; DCQ     XDBGWHEELDO, 0
    dq XDBGWHEELDO, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGWHEELDO
    dq row_XDBGWHEELDO
section .text
XDBGWHEELDO:
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
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; bl      _debug_wheel
    lea rax, [rel xret_12]
    mov qword [rel arm_x30], rax
    jmp _debug_wheel
    xret_12:
    ; ldp     x23, x24, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
    add rsp, 0x10
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
nm_XDBGSTEPOVER:
    ; DCB "DBG-STEP-OVER", 0
    db "DBG-STEP-OVER", 0
hl_XDBGSTEPOVER:
    ; DCB "DBG-STEP-OVER ( -- ) step over a colon word", 0
    db "DBG-STEP-OVER ( -- ) step over a colon word", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGSTEPOVER:
    ; DCQ     nm_XDBGSTEPOVER, hl_XDBGSTEPOVER
    dq nm_XDBGSTEPOVER, hl_XDBGSTEPOVER
    ; DCQ     0
    dq 0
    ; DCQ     XDBGSTEPOVER, 0
    dq XDBGSTEPOVER, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGSTEPOVER
    dq row_XDBGSTEPOVER
section .text
XDBGSTEPOVER:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_13]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_13:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, dbg_over_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je dbg_over_done
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; lea x2, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x2], rax
    ; cmp     x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    dbg_over_done
    cmp byte [rel arm_z], 0
    je dbg_over_done
    ; lea x0, debug_pause_rsp
    lea rax, [rel debug_pause_rsp]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
dbg_over_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGSTEPINTO:
    ; DCB "DBG-STEP-INTO", 0
    db "DBG-STEP-INTO", 0
hl_XDBGSTEPINTO:
    ; DCB "DBG-STEP-INTO ( -- ) step into the next xt", 0
    db "DBG-STEP-INTO ( -- ) step into the next xt", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGSTEPINTO:
    ; DCQ     nm_XDBGSTEPINTO, hl_XDBGSTEPINTO
    dq nm_XDBGSTEPINTO, hl_XDBGSTEPINTO
    ; DCQ     0
    dq 0
    ; DCQ     XDBGSTEPINTO, 0
    dq XDBGSTEPINTO, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGSTEPINTO
    dq row_XDBGSTEPINTO
section .text
XDBGSTEPINTO:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_14]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_14:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGSTEPOUT:
    ; DCB "DBG-STEP-OUT", 0
    db "DBG-STEP-OUT", 0
hl_XDBGSTEPOUT:
    ; DCB "DBG-STEP-OUT ( -- ) run until this colon returns", 0
    db "DBG-STEP-OUT ( -- ) run until this colon returns", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGSTEPOUT:
    ; DCQ     nm_XDBGSTEPOUT, hl_XDBGSTEPOUT
    dq nm_XDBGSTEPOUT, hl_XDBGSTEPOUT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGSTEPOUT, 0
    dq XDBGSTEPOUT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGSTEPOUT
    dq row_XDBGSTEPOUT
section .text
XDBGSTEPOUT:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_15]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_15:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x1], rax
    ; lea x0, debug_pause_rsp
    lea rax, [rel debug_pause_rsp]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGGO:
    ; DCB "DBG-GO", 0
    db "DBG-GO", 0
hl_XDBGGO:
    ; DCB "DBG-GO ( -- ) disarm unless a breakpoint or run-to is armed", 0
    db "DBG-GO ( -- ) disarm unless a breakpoint or run-to is armed", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGGO:
    ; DCQ     nm_XDBGGO, hl_XDBGGO
    dq nm_XDBGGO, hl_XDBGGO
    ; DCQ     0
    dq 0
    ; DCQ     XDBGGO, 0
    dq XDBGGO, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGGO
    dq row_XDBGGO
section .text
XDBGGO:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_16]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_16:
    ; bl      _debug_clear_step
    lea rax, [rel xret_17]
    mov qword [rel arm_x30], rax
    jmp _debug_clear_step
    xret_17:
    ; lea x1, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, dbg_go_keep
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne dbg_go_keep
    ; lea x1, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, dbg_go_keep
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne dbg_go_keep
    ; mov     x28, #0
    mov rax, 0
    mov qword [rel arm_x28], rax
    ; lea x1, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
dbg_go_keep:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XDBGABORT:
    ; DCB "DBG-ABORT-SESSION", 0
    db "DBG-ABORT-SESSION", 0
hl_XDBGABORT:
    ; DCB "DBG-ABORT-SESSION ( -- ) disarm and THROW -1", 0
    db "DBG-ABORT-SESSION ( -- ) disarm and THROW -1", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGABORT:
    ; DCQ     nm_XDBGABORT, hl_XDBGABORT
    dq nm_XDBGABORT, hl_XDBGABORT
    ; DCQ     0
    dq 0
    ; DCQ     XDBGABORT, 0
    dq XDBGABORT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGABORT
    dq row_XDBGABORT
section .text
XDBGABORT:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_18]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_18:
    ; bl      _debug_clear_step
    lea rax, [rel xret_19]
    mov qword [rel arm_x30], rax
    jmp _debug_clear_step
    xret_19:
    ; lea x0, str_dbg_abort
    lea rax, [rel str_dbg_abort]
    mov qword [rel arm_x0], rax
    ; bl      _emit_z
    lea rax, [rel xret_20]
    mov qword [rel arm_x30], rax
    jmp _emit_z
    xret_20:
    ; bl      _debug_disarm
    lea rax, [rel xret_21]
    mov qword [rel arm_x30], rax
    jmp _debug_disarm
    xret_21:
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XTDBGARM:
    ; DCB "TDBG-ARM-KEYS", 0
    db "TDBG-ARM-KEYS", 0
hl_XTDBGARM:
    ; DCB "TDBG-ARM-KEYS ( -- ) arm the host debug-key steal", 0
    db "TDBG-ARM-KEYS ( -- ) arm the host debug-key steal", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTDBGARM:
    ; DCQ     nm_XTDBGARM, hl_XTDBGARM
    dq nm_XTDBGARM, hl_XTDBGARM
    ; DCQ     0
    dq 0
    ; DCQ     XTDBGARM, 0
    dq XTDBGARM, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTDBGARM
    dq row_XTDBGARM
section .text
XTDBGARM:
    ; lea x0, tdebug_armed
    lea rax, [rel tdebug_armed]
    mov qword [rel arm_x0], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
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
nm_XTDBGDISARM:
    ; DCB "TDBG-DISARM-KEYS", 0
    db "TDBG-DISARM-KEYS", 0
hl_XTDBGDISARM:
    ; DCB "TDBG-DISARM-KEYS ( -- ) disarm the host debug-key steal", 0
    db "TDBG-DISARM-KEYS ( -- ) disarm the host debug-key steal", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTDBGDISARM:
    ; DCQ     nm_XTDBGDISARM, hl_XTDBGDISARM
    dq nm_XTDBGDISARM, hl_XTDBGDISARM
    ; DCQ     0
    dq 0
    ; DCQ     XTDBGDISARM, 0
    dq XTDBGDISARM, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTDBGDISARM
    dq row_XTDBGDISARM
section .text
XTDBGDISARM:
    ; lea x0, tdebug_armed
    lea rax, [rel tdebug_armed]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
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
nm_XDBGBREAKMIN:
    ; DCB "DBG-BREAK-MIN!", 0
    db "DBG-BREAK-MIN!", 0
hl_XDBGBREAKMIN:
    ; DCB "DBG-BREAK-MIN! ( addr -- ) low water for Break ASAP", 0
    db "DBG-BREAK-MIN! ( addr -- ) low water for Break ASAP", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGBREAKMIN:
    ; DCQ     nm_XDBGBREAKMIN, hl_XDBGBREAKMIN
    dq nm_XDBGBREAKMIN, hl_XDBGBREAKMIN
    ; DCQ     0
    dq 0
    ; DCQ     XDBGBREAKMIN, 0
    dq XDBGBREAKMIN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGBREAKMIN
    dq row_XDBGBREAKMIN
section .text
XDBGBREAKMIN:
    ; lea x0, debug_break_min_cfa
    lea rax, [rel debug_break_min_cfa]
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
nm_XDBGON:
    ; DCB "DBG-ON", 0
    db "DBG-ON", 0
hl_XDBGON:
    ; DCB "DBG-ON ( -- ) arm the NEXT stepper", 0
    db "DBG-ON ( -- ) arm the NEXT stepper", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGON:
    ; DCQ     nm_XDBGON, hl_XDBGON
    dq nm_XDBGON, hl_XDBGON
    ; DCQ     0
    dq 0
    ; DCQ     XDBGON, 0
    dq XDBGON, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGON
    dq row_XDBGON
section .text
XDBGON:
    ; lea x0, debug_floor
    lea rax, [rel debug_floor]
    mov qword [rel arm_x0], rax
    ; str     x23, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x23]
    mov qword [r10], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; mov     x28, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x28], rax
    ; lea x0, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_runto_off
    lea rax, [rel debug_runto_off]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_runto_status
    lea rax, [rel debug_runto_status]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_abort
    lea rax, [rel debug_abort]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_view_cfa
    lea rax, [rel debug_view_cfa]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_skip_nl
    lea rax, [rel debug_skip_nl]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, debug_midline
    lea rax, [rel debug_midline]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_help_shown
    lea rax, [rel debug_help_shown]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_cursor_on
    lea rax, [rel debug_cursor_on]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_need_intro
    lea rax, [rel debug_need_intro]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, debug_line_col
    lea rax, [rel debug_line_col]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_stack_anchor
    lea rax, [rel debug_stack_anchor]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_ip
    lea rax, [rel debug_ip]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_cfa
    lea rax, [rel debug_cfa]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_body_cells
    lea rax, [rel debug_body_cells]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_call_depth
    lea rax, [rel debug_call_depth]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
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
nm_XDBGOFF:
    ; DCB "DBG-OFF", 0
    db "DBG-OFF", 0
hl_XDBGOFF:
    ; DCB "DBG-OFF ( -- ) disarm the NEXT stepper", 0
    db "DBG-OFF ( -- ) disarm the NEXT stepper", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDBGOFF:
    ; DCQ     nm_XDBGOFF, hl_XDBGOFF
    dq nm_XDBGOFF, hl_XDBGOFF
    ; DCQ     0
    dq 0
    ; DCQ     XDBGOFF, 0
    dq XDBGOFF, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDBGOFF
    dq row_XDBGOFF
section .text
XDBGOFF:
    ; mov     x28, #0
    mov rax, 0
    mov qword [rel arm_x28], rax
    ; lea x0, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_call_depth
    lea rax, [rel debug_call_depth]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_midline
    lea rax, [rel debug_midline]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_help_shown
    lea rax, [rel debug_help_shown]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_cursor_on
    lea rax, [rel debug_cursor_on]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_need_intro
    lea rax, [rel debug_need_intro]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_line_col
    lea rax, [rel debug_line_col]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_stack_anchor
    lea rax, [rel debug_stack_anchor]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_ip
    lea rax, [rel debug_ip]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_cfa
    lea rax, [rel debug_cfa]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_body_cells
    lea rax, [rel debug_body_cells]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_floor
    lea rax, [rel debug_floor]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_runto_off
    lea rax, [rel debug_runto_off]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_runto_status
    lea rax, [rel debug_runto_status]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_abort
    lea rax, [rel debug_abort]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_view_cfa
    lea rax, [rel debug_view_cfa]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; lea x0, str_dbg_done
    lea rax, [rel str_dbg_done]
    mov qword [rel arm_x0], rax
    ; bl      _emit_z
    lea rax, [rel xret_22]
    mov qword [rel arm_x30], rax
    jmp _emit_z
    xret_22:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
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
nm_XBREAK_TABLE:
    ; DCB "BREAK-TABLE", 0
    db "BREAK-TABLE", 0
hl_XBREAK_TABLE:
    ; DCB "BREAK-TABLE ( -- addr ) 8 breakpoint xt slots", 0
    db "BREAK-TABLE ( -- addr ) 8 breakpoint xt slots", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBREAK_TABLE:
    ; DCQ     nm_XBREAK_TABLE, hl_XBREAK_TABLE
    dq nm_XBREAK_TABLE, hl_XBREAK_TABLE
    ; DCQ     0
    dq 0
    ; DCQ     XBREAK_TABLE, 0
    dq XBREAK_TABLE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBREAK_TABLE
    dq row_XBREAK_TABLE
section .text
XBREAK_TABLE:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_bp_xts
    lea rax, [rel debug_bp_xts]
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
nm_XBREAK_ENABLES:
    ; DCB "BREAK-ENABLES", 0
    db "BREAK-ENABLES", 0
hl_XBREAK_ENABLES:
    ; DCB "BREAK-ENABLES ( -- addr ) 8 breakpoint enable flags", 0
    db "BREAK-ENABLES ( -- addr ) 8 breakpoint enable flags", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBREAK_ENABLES:
    ; DCQ     nm_XBREAK_ENABLES, hl_XBREAK_ENABLES
    dq nm_XBREAK_ENABLES, hl_XBREAK_ENABLES
    ; DCQ     0
    dq 0
    ; DCQ     XBREAK_ENABLES, 0
    dq XBREAK_ENABLES, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBREAK_ENABLES
    dq row_XBREAK_ENABLES
section .text
XBREAK_ENABLES:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_bp_en
    lea rax, [rel debug_bp_en]
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
nm_XBPGO:
    ; DCB "(BP-GO)", 0
    db "(BP-GO)", 0
hl_XBPGO:
    ; DCB "(BP-GO) ( -- ) run until an enabled breakpoint xt", 0
    db "(BP-GO) ( -- ) run until an enabled breakpoint xt", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBPGO:
    ; DCQ     nm_XBPGO, hl_XBPGO
    dq nm_XBPGO, hl_XBPGO
    ; DCQ     0
    dq 0
    ; DCQ     XBPGO, 0
    dq XBPGO, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBPGO
    dq row_XBPGO
section .text
XBPGO:
    ; lea x0, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x0], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
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
nm_XRUNTOIP:
    ; DCB "(RUNTO-IP)", 0
    db "(RUNTO-IP)", 0
hl_XRUNTOIP:
    ; DCB "(RUNTO-IP) ( addr -- ) arm run-to at a threaded cell", 0
    db "(RUNTO-IP) ( addr -- ) arm run-to at a threaded cell", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRUNTOIP:
    ; DCQ     nm_XRUNTOIP, hl_XRUNTOIP
    dq nm_XRUNTOIP, hl_XRUNTOIP
    ; DCQ     0
    dq 0
    ; DCQ     XRUNTOIP, 0
    dq XRUNTOIP, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRUNTOIP
    dq row_XRUNTOIP
section .text
XRUNTOIP:
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
    ; lea x1, debug_runto_ip
    lea rax, [rel debug_runto_ip]
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
nm_XRUNTOOFFAT:
    ; DCB "RUNTO-OFF@", 0
    db "RUNTO-OFF@", 0
hl_XRUNTOOFFAT:
    ; DCB "RUNTO-OFF@ ( -- off ) pending file offset for run-to", 0
    db "RUNTO-OFF@ ( -- off ) pending file offset for run-to", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRUNTOOFFAT:
    ; DCQ     nm_XRUNTOOFFAT, hl_XRUNTOOFFAT
    dq nm_XRUNTOOFFAT, hl_XRUNTOOFFAT
    ; DCQ     0
    dq 0
    ; DCQ     XRUNTOOFFAT, 0
    dq XRUNTOOFFAT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRUNTOOFFAT
    dq row_XRUNTOOFFAT
section .text
XRUNTOOFFAT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, debug_runto_off
    lea rax, [rel debug_runto_off]
    mov qword [rel arm_x20], rax
    ; ldr     x20, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [r10]
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
nm_XRUNTOSTAT:
    ; DCB "RUNTO-STATUS!", 0
    db "RUNTO-STATUS!", 0
hl_XRUNTOSTAT:
    ; DCB "RUNTO-STATUS! ( n -- ) store the host run-to status", 0
    db "RUNTO-STATUS! ( n -- ) store the host run-to status", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRUNTOSTAT:
    ; DCQ     nm_XRUNTOSTAT, hl_XRUNTOSTAT
    dq nm_XRUNTOSTAT, hl_XRUNTOSTAT
    ; DCQ     0
    dq 0
    ; DCQ     XRUNTOSTAT, 0
    dq XRUNTOSTAT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRUNTOSTAT
    dq row_XRUNTOSTAT
section .text
XRUNTOSTAT:
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
    ; lea x1, debug_runto_status
    lea rax, [rel debug_runto_status]
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
nm_XVIEW_PATH:
    ; DCB "VIEW-PATH", 0
    db "VIEW-PATH", 0
hl_XVIEW_PATH:
    ; DCB "VIEW-PATH ( id -- c-addr u | 0 0 ) path for a VIEW file id", 0
    db "VIEW-PATH ( id -- c-addr u | 0 0 ) path for a VIEW file id", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XVIEW_PATH:
    ; DCQ     nm_XVIEW_PATH, hl_XVIEW_PATH
    dq nm_XVIEW_PATH, hl_XVIEW_PATH
    ; DCQ     0
    dq 0
    ; DCQ     XVIEW_PATH, 0
    dq XVIEW_PATH, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XVIEW_PATH
    dq row_XVIEW_PATH
section .text
XVIEW_PATH:
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; cbz     x1, view_path_none
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je view_path_none
    ; lea x0, view_file_n
    lea rax, [rel view_file_n]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cmp     x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    view_path_none
    cmp byte [rel arm_c], 0
    je xsk_23
    cmp byte [rel arm_z], 0
    je view_path_none
    xsk_23:
    ; sub     x2, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x2], rax
    ; mov     x3, #VIEW_PATH_MAX
    mov rax, 0x100
    mov qword [rel arm_x3], rax
    ; mul     x2, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    imul rax, rcx
    mov qword [rel arm_x2], rax
    ; lea x0, view_paths
    lea rax, [rel view_paths]
    mov qword [rel arm_x0], rax
    ; add     x0, x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; ldrb    w2, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    ; add     x3, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; str     x3, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
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
view_path_none:
    ; str     xzr, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov qword [r10], 0
    ; mov     x20, #0
    mov rax, 0
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
nm_XVIEW_REG:
    ; DCB "VIEW-REG", 0
    db "VIEW-REG", 0
hl_XVIEW_REG:
    ; DCB "VIEW-REG ( c-addr u -- id ) register a source path for VIEW", 0
    db "VIEW-REG ( c-addr u -- id ) register a source path for VIEW", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XVIEW_REG:
    ; DCQ     nm_XVIEW_REG, hl_XVIEW_REG
    dq nm_XVIEW_REG, hl_XVIEW_REG
    ; DCQ     0
    dq 0
    ; DCQ     XVIEW_REG, 0
    dq XVIEW_REG, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XVIEW_REG
    dq row_XVIEW_REG
section .text
XVIEW_REG:
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
    ; cmp     x1, #0
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.le    view_reg_fail
    cmp byte [rel arm_z], 0
    jne view_reg_fail
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne view_reg_fail
    ; cmp     x1, #255
    mov rax, qword [rel arm_x1]
    cmp rax, 0xff
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    view_reg_fail
    cmp byte [rel arm_c], 0
    je xsk_24
    cmp byte [rel arm_z], 0
    je view_reg_fail
    xsk_24:
    ; cbz     x0, view_reg_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je view_reg_fail
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; bl      _view_register_path
    lea rax, [rel xret_25]
    mov qword [rel arm_x30], rax
    jmp _view_register_path
    xret_25:
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
view_reg_fail:
    ; mov     x20, #0
    mov rax, 0
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
nm_XVIEW_STAMP:
    ; DCB "VIEW-STAMP", 0
    db "VIEW-STAMP", 0
hl_XVIEW_STAMP:
    ; DCB "VIEW-STAMP ( xt file-id line -- ) set the source VIEW in the header", 0
    db "VIEW-STAMP ( xt file-id line -- ) set the source VIEW in the header", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XVIEW_STAMP:
    ; DCQ     nm_XVIEW_STAMP, hl_XVIEW_STAMP
    dq nm_XVIEW_STAMP, hl_XVIEW_STAMP
    ; DCQ     0
    dq 0
    ; DCQ     XVIEW_STAMP, 0
    dq XVIEW_STAMP, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XVIEW_STAMP
    dq row_XVIEW_STAMP
section .text
XVIEW_STAMP:
    ; mov     x3, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x3], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
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
    ; cbz     x1, view_stamp_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je view_stamp_done
    ; ldr     x0, [x1, #-8]
    mov r10, qword [rel arm_x1]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; mov     x4, #0xFFFF
    mov rax, 0xffff
    mov qword [rel arm_x4], rax
    ; lsl     x4, x4, #32
    mov rax, qword [rel arm_x4]
    shl rax, 32
    mov qword [rel arm_x4], rax
    ; bic     x0, x0, x4
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x4]
    not rcx
    and rax, rcx
    mov qword [rel arm_x0], rax
    ; mov     x4, #VIEW_FILE_MASK
    mov rax, 0x1fff
    mov qword [rel arm_x4], rax
    ; lsl     x4, x4, #48
    mov rax, qword [rel arm_x4]
    shl rax, 48
    mov qword [rel arm_x4], rax
    ; bic     x0, x0, x4
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x4]
    not rcx
    and rax, rcx
    mov qword [rel arm_x0], rax
    ; and     x3, x3, #0xFFFF
    mov rax, qword [rel arm_x3]
    and rax, 0xffff
    mov qword [rel arm_x3], rax
    ; lsl     x3, x3, #32
    mov rax, qword [rel arm_x3]
    shl rax, 32
    mov qword [rel arm_x3], rax
    ; orr     x0, x0, x3
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x3]
    or rax, rcx
    mov qword [rel arm_x0], rax
    ; mov     x4, #VIEW_FILE_MASK
    mov rax, 0x1fff
    mov qword [rel arm_x4], rax
    ; and     x2, x2, x4
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x4]
    and rax, rcx
    mov qword [rel arm_x2], rax
    ; lsl     x2, x2, #48
    mov rax, qword [rel arm_x2]
    shl rax, 48
    mov qword [rel arm_x2], rax
    ; orr     x0, x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    or rax, rcx
    mov qword [rel arm_x0], rax
    ; str     x0, [x1, #-8]
    mov r10, qword [rel arm_x1]
    add r10, -8
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
view_stamp_done:
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
_debug_pause:
    ; stp     x29, x30, [sp, #-64]!
    add rsp, -64
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
    ; stp     x21, x22, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; lea x0, debug_pause_rsp
    lea rax, [rel debug_pause_rsp]
    mov qword [rel arm_x0], rax
    ; str     x23, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x23]
    mov qword [r10], rax
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x0], rax
    ; str     x21, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x21]
    mov qword [r10], rax
    ; ldr     x0, [x19, #8]
    mov r10, qword [rel arm_x19]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; lea x1, debug_inline
    lea rax, [rel debug_inline]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x0, debug_ip
    lea rax, [rel debug_ip]
    mov qword [rel arm_x0], rax
    ; str     x19, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
    ; mov     x0, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x0], rax
    ; mov     x1, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x1], rax
    ; bl      _debug_resolve_enclosing
    lea rax, [rel xret_26]
    mov qword [rel arm_x30], rax
    jmp _debug_resolve_enclosing
    xret_26:
    ; lea x2, debug_cfa
    lea rax, [rel debug_cfa]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lsr     x1, x1, #3
    mov rax, qword [rel arm_x1]
    shr rax, 3
    mov qword [rel arm_x1], rax
    ; lea x2, debug_body_cells
    lea rax, [rel debug_body_cells]
    mov qword [rel arm_x2], rax
    ; str     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, tw_continue_cell
    lea rax, [rel tw_continue_cell]
    mov qword [rel arm_x0], rax
    ; cmp     x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_leave
    cmp byte [rel arm_z], 0
    jne pause_leave
    ; lea x0, debug_pause_xt
    lea rax, [rel debug_pause_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, pause_asm
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je pause_asm
    ; bl      _debug_capture
    lea rax, [rel xret_27]
    mov qword [rel arm_x30], rax
    jmp _debug_capture
    xret_27:
    ; lea x0, debug_pause_xt
    lea rax, [rel debug_pause_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _debug_call_xt
    lea rax, [rel xret_28]
    mov qword [rel arm_x30], rax
    jmp _debug_call_xt
    xret_28:
    ; b       pause_leave
    jmp pause_leave
pause_asm:
    ; lea x0, debug_need_intro
    lea rax, [rel debug_need_intro]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, pause_after
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je pause_after
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; bl      _debug_end_line
    lea rax, [rel xret_29]
    mov qword [rel arm_x30], rax
    jmp _debug_end_line
    xret_29:
    ; lea x0, str_dbg_keys
    lea rax, [rel str_dbg_keys]
    mov qword [rel arm_x0], rax
    ; bl      _emit_z
    lea rax, [rel xret_30]
    mov qword [rel arm_x30], rax
    jmp _emit_z
    xret_30:
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_31]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_31:
    ; bl      _debug_pad_to_stack_col
    lea rax, [rel xret_32]
    mov qword [rel arm_x30], rax
    jmp _debug_pad_to_stack_col
    xret_32:
    ; bl      _debug_print_SR
    lea rax, [rel xret_33]
    mov qword [rel arm_x30], rax
    jmp _debug_print_SR
    xret_33:
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_34]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_34:
    ; b       pause_word
    jmp pause_word
pause_after:
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, pause_word
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je pause_word
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_help_shown
    lea rax, [rel debug_help_shown]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, pause_pad_sr
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je pause_pad_sr
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_35]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_35:
pause_pad_sr:
    ; bl      _debug_pad_to_stack_col
    lea rax, [rel xret_36]
    mov qword [rel arm_x30], rax
    jmp _debug_pad_to_stack_col
    xret_36:
    ; bl      _debug_print_SR
    lea rax, [rel xret_37]
    mov qword [rel arm_x30], rax
    jmp _debug_print_SR
    xret_37:
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_38]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_38:
pause_word:
    ; lea x0, debug_line_col
    lea rax, [rel debug_line_col]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; mov     x0, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x0], rax
    ; bl      _debug_xt_intoable
    lea rax, [rel xret_39]
    mov qword [rel arm_x30], rax
    jmp _debug_xt_intoable
    xret_39:
    ; cbz     x0, pause_chevrons
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je pause_chevrons
    ; mov     x0, #'I'
    mov rax, 0x49
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_40]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_40:
pause_chevrons:
    ; mov     x0, #62
    mov rax, 0x3e
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_41]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_41:
    ; mov     x0, #62
    mov rax, 0x3e
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_42]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_42:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_43]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_43:
    ; mov     x0, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x0], rax
    ; bl      _print_xt_name
    lea rax, [rel xret_44]
    mov qword [rel arm_x30], rax
    jmp _print_xt_name
    xret_44:
    ; bl      _debug_print_inline_suffix
    lea rax, [rel xret_45]
    mov qword [rel arm_x30], rax
    jmp _debug_print_inline_suffix
    xret_45:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_46]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_46:
    ; bl      _debug_cursor_on
    lea rax, [rel xret_47]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_on
    xret_47:
    ; bl      _debug_capture
    lea rax, [rel xret_48]
    mov qword [rel arm_x30], rax
    jmp _debug_capture
    xret_48:
    ; bl      _debug_sync_view
    lea rax, [rel xret_49]
    mov qword [rel arm_x30], rax
    jmp _debug_sync_view
    xret_49:
    ; bl      _debug_highlight
    lea rax, [rel xret_50]
    mov qword [rel arm_x30], rax
    jmp _debug_highlight
    xret_50:
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
pause_key:
    ; bl      _getchar
    lea rax, [rel xret_51]
    mov qword [rel arm_x30], rax
    jmp _getchar
    xret_51:
    ; tbnz    x0, #63, pause_key_abort
    mov rax, qword [rel arm_x0]
    bt rax, 63
    jc pause_key_abort
    ; lea x2, debug_key_xt
    lea rax, [rel debug_key_xt]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, pause_asm_key
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je pause_asm_key
    ; lea x1, debug_key_raw
    lea rax, [rel debug_key_raw]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; bl      _debug_ds_isolate
    lea rax, [rel xret_52]
    mov qword [rel arm_x30], rax
    jmp _debug_ds_isolate
    xret_52:
    ; lea x1, debug_key_raw
    lea rax, [rel debug_key_raw]
    mov qword [rel arm_x1], rax
    ; ldr     x20, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; lea x0, debug_key_xt
    lea rax, [rel debug_key_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _debug_call_xt
    lea rax, [rel xret_53]
    mov qword [rel arm_x30], rax
    jmp _debug_call_xt
    xret_53:
    ; lea x1, debug_call_tos
    lea rax, [rel debug_call_tos]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, debug_key_mode
    lea rax, [rel debug_key_mode]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; bl      _debug_ds_restore
    lea rax, [rel xret_54]
    mov qword [rel arm_x30], rax
    jmp _debug_ds_restore
    xret_54:
    ; lea x0, debug_key_mode
    lea rax, [rel debug_key_mode]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, pause_key
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je pause_key
    ; cmp     x0, #1
    mov rax, qword [rel arm_x0]
    cmp rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_over
    cmp byte [rel arm_z], 0
    jne pause_over
    ; cmp     x0, #2
    mov rax, qword [rel arm_x0]
    cmp rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_into
    cmp byte [rel arm_z], 0
    jne pause_into
    ; cmp     x0, #3
    mov rax, qword [rel arm_x0]
    cmp rax, 3
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_out
    cmp byte [rel arm_z], 0
    jne pause_out
    ; cmp     x0, #4
    mov rax, qword [rel arm_x0]
    cmp rax, 4
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_go
    cmp byte [rel arm_z], 0
    jne pause_go
    ; cmp     x0, #5
    mov rax, qword [rel arm_x0]
    cmp rax, 5
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_key_abort
    cmp byte [rel arm_z], 0
    jne pause_key_abort
    ; cmp     x0, #6
    mov rax, qword [rel arm_x0]
    cmp rax, 6
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_wheel_key
    cmp byte [rel arm_z], 0
    jne pause_wheel_key
    ; cmp     x0, #7
    mov rax, qword [rel arm_x0]
    cmp rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_help
    cmp byte [rel arm_z], 0
    jne pause_help
    ; lea x0, debug_key_raw
    lea rax, [rel debug_key_raw]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
pause_asm_key:
    ; lsr     x1, x0, #24
    mov rax, qword [rel arm_x0]
    shr rax, 24
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFF
    mov rax, qword [rel arm_x1]
    and rax, 0xff
    mov qword [rel arm_x1], rax
    ; cmp     x1, #2
    mov rax, qword [rel arm_x1]
    cmp rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    pause_not_fkey
    cmp byte [rel arm_z], 0
    je pause_not_fkey
    ; mov     x2, #0xFFFFFF
    mov rax, 0xffffff
    mov qword [rel arm_x2], rax
    ; and     x0, x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    and rax, rcx
    mov qword [rel arm_x0], rax
    ; cmp     x0, #16
    mov rax, qword [rel arm_x0]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_over
    cmp byte [rel arm_z], 0
    jne pause_over
    ; cmp     x0, #17
    mov rax, qword [rel arm_x0]
    cmp rax, 0x11
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_into
    cmp byte [rel arm_z], 0
    jne pause_into
    ; cmp     x0, #18
    mov rax, qword [rel arm_x0]
    cmp rax, 0x12
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_out
    cmp byte [rel arm_z], 0
    jne pause_out
    ; b       pause_key
    jmp pause_key
pause_not_fkey:
    ; cmp     x1, #1
    mov rax, qword [rel arm_x1]
    cmp rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    pause_plain
    cmp byte [rel arm_z], 0
    je pause_plain
    ; mov     x2, #0x1FFFFF
    mov rax, 0x1fffff
    mov qword [rel arm_x2], rax
    ; and     x0, x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    and rax, rcx
    mov qword [rel arm_x0], rax
pause_plain:
    ; lea x1, debug_skip_nl
    lea rax, [rel debug_skip_nl]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, pause_take
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je pause_take
    ; cmp     w0, #10
    mov eax, dword [rel arm_x0]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_key
    cmp byte [rel arm_z], 0
    jne pause_key
    ; cmp     w0, #13
    mov eax, dword [rel arm_x0]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_key
    cmp byte [rel arm_z], 0
    jne pause_key
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
pause_take:
    ; cmp     w0, #'h'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x68
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_help
    cmp byte [rel arm_z], 0
    jne pause_help
    ; cmp     w0, #'H'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x48
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_help
    cmp byte [rel arm_z], 0
    jne pause_help
    ; cmp     w0, #134
    mov eax, dword [rel arm_x0]
    cmp eax, 0x86
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_go
    cmp byte [rel arm_z], 0
    jne pause_go
    ; cmp     w0, #'g'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x67
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_go
    cmp byte [rel arm_z], 0
    jne pause_go
    ; cmp     w0, #'G'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x47
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_go
    cmp byte [rel arm_z], 0
    jne pause_go
    ; cmp     w0, #27
    mov eax, dword [rel arm_x0]
    cmp eax, 0x1b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_key_abort
    cmp byte [rel arm_z], 0
    jne pause_key_abort
    ; cmp     w0, #'q'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x71
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_key_abort
    cmp byte [rel arm_z], 0
    jne pause_key_abort
    ; cmp     w0, #'Q'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x51
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_key_abort
    cmp byte [rel arm_z], 0
    jne pause_key_abort
    ; cmp     w0, #32
    mov eax, dword [rel arm_x0]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_over
    cmp byte [rel arm_z], 0
    jne pause_over
    ; cmp     w0, #13
    mov eax, dword [rel arm_x0]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_over
    cmp byte [rel arm_z], 0
    jne pause_over
    ; cmp     w0, #'o'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x6f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_over
    cmp byte [rel arm_z], 0
    jne pause_over
    ; cmp     w0, #'O'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x4f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_over
    cmp byte [rel arm_z], 0
    jne pause_over
    ; cmp     w0, #'i'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x69
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_into
    cmp byte [rel arm_z], 0
    jne pause_into
    ; cmp     w0, #'I'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x49
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_into
    cmp byte [rel arm_z], 0
    jne pause_into
    ; cmp     w0, #'u'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x75
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_out
    cmp byte [rel arm_z], 0
    jne pause_out
    ; cmp     w0, #'U'
    mov eax, dword [rel arm_x0]
    cmp eax, 0x55
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_out
    cmp byte [rel arm_z], 0
    jne pause_out
    ; cmp     w0, #3
    mov eax, dword [rel arm_x0]
    cmp eax, 3
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_wheel_raw
    cmp byte [rel arm_z], 0
    jne pause_wheel_raw
    ; cmp     w0, #7
    mov eax, dword [rel arm_x0]
    cmp eax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pause_wheel_raw
    cmp byte [rel arm_z], 0
    jne pause_wheel_raw
    ; cbz     w0, pause_wheel_raw
    mov eax, dword [rel arm_x0]
    cmp rax, 0
    je pause_wheel_raw
    ; b       pause_key
    jmp pause_key
pause_help:
    ; lea x1, debug_help_shown
    lea rax, [rel debug_help_shown]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, pause_key
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne pause_key
    ; bl      _debug_cursor_off
    lea rax, [rel xret_55]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_55:
    ; lea x0, str_dbg_keys
    lea rax, [rel str_dbg_keys]
    mov qword [rel arm_x0], rax
    ; bl      _emit_z
    lea rax, [rel xret_56]
    mov qword [rel arm_x30], rax
    jmp _emit_z
    xret_56:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_help_shown
    lea rax, [rel debug_help_shown]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; bl      _debug_cursor_on
    lea rax, [rel xret_57]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_on
    xret_57:
    ; b       pause_key
    jmp pause_key
pause_wheel_key:
    ; lea x0, debug_key_raw
    lea rax, [rel debug_key_raw]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
pause_wheel_raw:
    ; bl      _debug_wheel
    lea rax, [rel xret_58]
    mov qword [rel arm_x30], rax
    jmp _debug_wheel
    xret_58:
    ; b       pause_key
    jmp pause_key
pause_over:
    ; bl      _debug_cursor_off
    lea rax, [rel xret_59]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_59:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, pause_leave
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je pause_leave
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; lea x2, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x2], rax
    ; cmp     x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    pause_leave
    cmp byte [rel arm_z], 0
    je pause_leave
    ; str     x23, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x23]
    mov qword [r10], rax
    ; b       pause_leave
    jmp pause_leave
pause_into:
    ; bl      _debug_cursor_off
    lea rax, [rel xret_60]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_60:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; b       pause_leave
    jmp pause_leave
pause_out:
    ; bl      _debug_cursor_off
    lea rax, [rel xret_61]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_61:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x1], rax
    ; str     x23, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x23]
    mov qword [r10], rax
    ; b       pause_leave
    jmp pause_leave
pause_key_abort:
    ; bl      _debug_cursor_off
    lea rax, [rel xret_62]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_62:
    ; bl      _debug_clear_step
    lea rax, [rel xret_63]
    mov qword [rel arm_x30], rax
    jmp _debug_clear_step
    xret_63:
    ; lea x0, str_dbg_abort
    lea rax, [rel str_dbg_abort]
    mov qword [rel arm_x0], rax
    ; bl      _emit_z
    lea rax, [rel xret_64]
    mov qword [rel arm_x30], rax
    jmp _emit_z
    xret_64:
    ; bl      _debug_disarm
    lea rax, [rel xret_65]
    mov qword [rel arm_x30], rax
    jmp _debug_disarm
    xret_65:
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; b       pause_leave
    jmp pause_leave
pause_go:
    ; bl      _debug_cursor_off
    lea rax, [rel xret_66]
    mov qword [rel arm_x30], rax
    jmp _debug_cursor_off
    xret_66:
    ; bl      _debug_clear_step
    lea rax, [rel xret_67]
    mov qword [rel arm_x30], rax
    jmp _debug_clear_step
    xret_67:
    ; lea x1, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, pause_leave
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne pause_leave
    ; lea x1, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, pause_leave
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne pause_leave
    ; mov     x28, #0
    mov rax, 0
    mov qword [rel arm_x28], rax
    ; lea x1, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
pause_leave:
    ; lea x0, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x0], rax
    ; ldr     x28, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x28], rax
    ; ldp     x19, x20, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    ; ldp     x21, x22, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    ; ldp     x23, x24, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
    ; ldp     x29, x30, [sp], #64
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x40
    ; ret
    jmp qword [rel arm_x30]
_debug_disarm:
    ; mov     x2, #-1
    mov rax, -1
    mov qword [rel arm_x2], rax
    ; lea x1, debug_abort
    lea rax, [rel debug_abort]
    mov qword [rel arm_x1], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; mov     x28, #0
    mov rax, 0
    mov qword [rel arm_x28], rax
    ; lea x1, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_runto_off
    lea rax, [rel debug_runto_off]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_runto_status
    lea rax, [rel debug_runto_status]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; ret
    jmp qword [rel arm_x30]
_debug_clear_step:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, debug_need_intro
    lea rax, [rel debug_need_intro]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; bl      _debug_end_line
    lea rax, [rel xret_68]
    mov qword [rel arm_x30], rax
    jmp _debug_end_line
    xret_68:
    ; lea x0, debug_help_shown
    lea rax, [rel debug_help_shown]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x1, debug_midline
    lea rax, [rel debug_midline]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_debug_end_line:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x1, debug_midline
    lea rax, [rel debug_midline]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, end_line_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je end_line_done
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_69]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_69:
end_line_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_emit_z:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
emit_z_loop:
    ; ldrb    w0, [x19], #1
    mov r10, qword [rel arm_x19]
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; cbz     w0, emit_z_done
    mov eax, dword [rel arm_x0]
    cmp rax, 0
    je emit_z_done
    ; bl      _putchar
    lea rax, [rel xret_70]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_70:
    ; b       emit_z_loop
    jmp emit_z_loop
emit_z_done:
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
_debug_call_xt:
    ; cbz     x0, call_xt_ret
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je call_xt_ret
    ; lea x2, debug_call_depth
    lea rax, [rel debug_call_depth]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cmp     x3, #DEBUG_CALL_MAX
    mov rax, qword [rel arm_x3]
    cmp rax, 4
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    call_xt_ret
    cmp byte [rel arm_c], 0
    jne call_xt_ret
    ; lea x1, debug_vmsave_stack
    lea rax, [rel debug_vmsave_stack]
    mov qword [rel arm_x1], rax
    ; mov     x4, #DEBUG_VMSAVE_SIZE
    mov rax, 0x48
    mov qword [rel arm_x4], rax
    ; mul     x4, x3, x4
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x4]
    imul rax, rcx
    mov qword [rel arm_x4], rax
    ; add     x1, x1, x4
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x1], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; stp     x19, x20, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [x1, #16]
    mov r10, qword [rel arm_x1]
    add r10, 0x10
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; stp     x23, x24, [x1, #32]
    mov r10, qword [rel arm_x1]
    add r10, 0x20
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; stp     x29, x30, [x1, #48]
    mov r10, qword [rel arm_x1]
    add r10, 0x30
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; str     x28, [x1, #64]
    mov r10, qword [rel arm_x1]
    add r10, 0x40
    mov rax, qword [rel arm_x28]
    mov qword [r10], rax
    ; sub     x4, x3, #1
    mov rax, qword [rel arm_x3]
    sub rax, 1
    mov qword [rel arm_x4], rax
    ; mov     x5, #4096
    mov rax, 0x1000
    mov qword [rel arm_x5], rax
    ; lea x23, debug_nest_rstack
    lea rax, [rel debug_nest_rstack]
    mov qword [rel arm_x23], rax
    ; mul     x4, x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    imul rax, rcx
    mov qword [rel arm_x4], rax
    ; add     x23, x23, x4
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x23], rax
    ; add     x23, x23, x5
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x5]
    add rax, rcx
    mov qword [rel arm_x23], rax
    ; mov     x28, #0
    mov rax, 0
    mov qword [rel arm_x28], rax
    ; lea x19, debug_ret_ipcell
    lea rax, [rel debug_ret_ipcell]
    mov qword [rel arm_x19], rax
    ; mov     x21, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x21], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
call_xt_ret:
    ; ret
    jmp qword [rel arm_x30]
    ; ALIGN 4
align 4
XDBG_CALL_DONE:
    ; lea x1, debug_call_tos
    lea rax, [rel debug_call_tos]
    mov qword [rel arm_x1], rax
    ; str     x20, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x2, debug_call_depth
    lea rax, [rel debug_call_depth]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbz     x3, call_done_ret
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je call_done_ret
    ; sub     x3, x3, #1
    mov rax, qword [rel arm_x3]
    sub rax, 1
    mov qword [rel arm_x3], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x1, debug_vmsave_stack
    lea rax, [rel debug_vmsave_stack]
    mov qword [rel arm_x1], rax
    ; mov     x4, #DEBUG_VMSAVE_SIZE
    mov rax, 0x48
    mov qword [rel arm_x4], rax
    ; mul     x4, x3, x4
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x4]
    imul rax, rcx
    mov qword [rel arm_x4], rax
    ; add     x1, x1, x4
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x1], rax
    ; ldp     x19, x20, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    ; ldp     x21, x22, [x1, #16]
    mov r10, qword [rel arm_x1]
    add r10, 0x10
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    ; ldp     x23, x24, [x1, #32]
    mov r10, qword [rel arm_x1]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
    ; ldp     x29, x30, [x1, #48]
    mov r10, qword [rel arm_x1]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; ldr     x28, [x1, #64]
    mov r10, qword [rel arm_x1]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x28], rax
call_done_ret:
    ; ret
    jmp qword [rel arm_x30]
_debug_ds_isolate:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x21, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x21]
    mov qword [r10+8], rax
    ; lea x19, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x19], rax
    ; add     x19, x19, #1, lsl #12
    mov rax, qword [rel arm_x19]
    add rax, 0x1000
    mov qword [rel arm_x19], rax
    ; lea x0, debug_dsave_tos
    lea rax, [rel debug_dsave_tos]
    mov qword [rel arm_x0], rax
    ; str     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, debug_dsave_dsp
    lea rax, [rel debug_dsave_dsp]
    mov qword [rel arm_x0], rax
    ; str     x22, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x22]
    mov qword [r10], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; cmp     x22, x19
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    ds_iso_store
    cmp byte [rel arm_c], 0
    jne ds_iso_store
    ; sub     x1, x19, x22
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x22]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; lsr     x1, x1, #3
    mov rax, qword [rel arm_x1]
    shr rax, 3
    mov qword [rel arm_x1], rax
    ; cmp     x1, #DBG_DSAVE_MAX
    mov rax, qword [rel arm_x1]
    cmp rax, 0x40
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    ds_iso_copy
    cmp byte [rel arm_c], 0
    je ds_iso_copy
    cmp byte [rel arm_z], 0
    jne ds_iso_copy
    ; mov     x1, #DBG_DSAVE_MAX
    mov rax, 0x40
    mov qword [rel arm_x1], rax
ds_iso_copy:
    ; lea x0, debug_dsave_buf
    lea rax, [rel debug_dsave_buf]
    mov qword [rel arm_x0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
ds_iso_loop:
    ; cmp     x2, x1
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    ds_iso_store
    cmp byte [rel arm_c], 0
    jne ds_iso_store
    ; ldr     x3, [x22, x2, lsl #3]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x0, x2, lsl #3]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x2]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       ds_iso_loop
    jmp ds_iso_loop
ds_iso_store:
    ; lea x0, debug_dsave_n
    lea rax, [rel debug_dsave_n]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x22, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x22], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
    ; ldp     x19, x21, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x21], rcx
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
_debug_ds_restore:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x21, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x21]
    mov qword [r10+8], rax
    ; lea x0, debug_dsave_n
    lea rax, [rel debug_dsave_n]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, debug_dsave_dsp
    lea rax, [rel debug_dsave_dsp]
    mov qword [rel arm_x0], rax
    ; ldr     x22, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x22], rax
    ; lea x0, debug_dsave_tos
    lea rax, [rel debug_dsave_tos]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; cbz     x1, ds_res_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je ds_res_done
    ; lea x0, debug_dsave_buf
    lea rax, [rel debug_dsave_buf]
    mov qword [rel arm_x0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
ds_res_loop:
    ; cmp     x2, x1
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    ds_res_done
    cmp byte [rel arm_c], 0
    jne ds_res_done
    ; ldr     x3, [x0, x2, lsl #3]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x2]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x22, x2, lsl #3]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       ds_res_loop
    jmp ds_res_loop
ds_res_done:
    ; ldp     x19, x21, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x21], rcx
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
_debug_sync_view:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, debug_cfa
    lea rax, [rel debug_cfa]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, sync_have
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne sync_have
    ; mov     x0, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x0], rax
    ; lea x1, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; bl      _debug_resolve_enclosing
    lea rax, [rel xret_71]
    mov qword [rel arm_x30], rax
    jmp _debug_resolve_enclosing
    xret_71:
sync_have:
    ; cbz     x0, sync_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je sync_done
    ; lea x1, debug_view_cfa
    lea rax, [rel debug_view_cfa]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cmp     x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    sync_done
    cmp byte [rel arm_z], 0
    jne sync_done
    ; stp     x0, x1, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; lea x24, debug_view_name
    lea rax, [rel debug_view_name]
    mov qword [rel arm_x24], rax
    ; strb    wzr, [x24]
    mov r10, qword [rel arm_x24]
    mov byte [r10], 0
    ; tst     x0, #7
    mov rax, qword [rel arm_x0]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    sync_drop
    cmp byte [rel arm_z], 0
    je sync_drop
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [rel arm_x1]
    and rax, 0xffff
    mov qword [rel arm_x1], rax
    ; cbz     x1, sync_drop
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je sync_drop
    ; lsr     x4, x1, #12
    mov rax, qword [rel arm_x1]
    shr rax, 12
    mov qword [rel arm_x4], rax
    ; cbnz    x4, sync_drop
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    jne sync_drop
    ; sub     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x0], rax
    ; ldrb    w1, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w1, w1, #NFA_LEN_MASK
    mov eax, dword [rel arm_x1]
    and eax, 0x7f
    mov qword [rel arm_x1], rax
    ; cbz     w1, sync_drop
    mov eax, dword [rel arm_x1]
    cmp rax, 0
    je sync_drop
    ; cmp     w1, #31
    mov eax, dword [rel arm_x1]
    cmp eax, 0x1f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    sync_len_ok
    cmp byte [rel arm_c], 0
    je sync_len_ok
    cmp byte [rel arm_z], 0
    jne sync_len_ok
    ; mov     w1, #31
    mov eax, 0x1f
    mov qword [rel arm_x1], rax
sync_len_ok:
    ; strb    w1, [x24], #1
    mov r10, qword [rel arm_x24]
    mov eax, dword [rel arm_x1]
    mov byte [r10], al
    mov rax, qword [rel arm_x24]
    add rax, 1
    mov qword [rel arm_x24], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
sync_copy:
    ; cmp     x2, x1
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    sync_copied
    cmp byte [rel arm_c], 0
    jne sync_copied
    ; ldrb    w3, [x0, x2]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x2]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; strb    w3, [x24, x2]
    mov r10, qword [rel arm_x24]
    mov rax, qword [rel arm_x2]
    add r10, rax
    mov eax, dword [rel arm_x3]
    mov byte [r10], al
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       sync_copy
    jmp sync_copy
sync_copied:
    ; lea x0, debug_show_xt
    lea rax, [rel debug_show_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, sync_drop
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je sync_drop
    ; lea x1, debug_view_name
    lea rax, [rel debug_view_name]
    mov qword [rel arm_x1], rax
    ; ldrb    w2, [x1], #1
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; cbz     w2, sync_drop
    mov eax, dword [rel arm_x2]
    cmp rax, 0
    je sync_drop
    ; lea x3, debug_sync_ok
    lea rax, [rel debug_sync_ok]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
    ; stp     x1, x2, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x1]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x2]
    mov qword [r10+8], rax
    ; bl      _debug_ds_isolate
    lea rax, [rel xret_72]
    mov qword [rel arm_x30], rax
    jmp _debug_ds_isolate
    xret_72:
    ; ldp     x1, x2, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x1], rax
    mov qword [rel arm_x2], rcx
    add rsp, 0x10
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
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x20], rax
    ; lea x0, debug_show_xt
    lea rax, [rel debug_show_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _debug_call_xt
    lea rax, [rel xret_73]
    mov qword [rel arm_x30], rax
    jmp _debug_call_xt
    xret_73:
    ; bl      _debug_ds_restore
    lea rax, [rel xret_74]
    mov qword [rel arm_x30], rax
    jmp _debug_ds_restore
    xret_74:
    ; lea x3, debug_sync_ok
    lea rax, [rel debug_sync_ok]
    mov qword [rel arm_x3], rax
    ; ldr     x0, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
    ; cbz     x0, sync_drop
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je sync_drop
    ; ldp     x0, x1, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    add rsp, 0x10
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; b       sync_done
    jmp sync_done
sync_drop:
    ; add     sp, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov rsp, rax
sync_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_debug_wheel:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x1, debug_wheel_xt
    lea rax, [rel debug_wheel_xt]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, wheel_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je wheel_done
    ; stp     x0, x1, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _debug_ds_isolate
    lea rax, [rel xret_75]
    mov qword [rel arm_x30], rax
    jmp _debug_ds_isolate
    xret_75:
    ; ldp     x0, x1, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    add rsp, 0x10
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
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
    ; bl      _debug_call_xt
    lea rax, [rel xret_76]
    mov qword [rel arm_x30], rax
    jmp _debug_call_xt
    xret_76:
    ; bl      _debug_ds_restore
    lea rax, [rel xret_77]
    mov qword [rel arm_x30], rax
    jmp _debug_ds_restore
    xret_77:
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
wheel_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_debug_highlight:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, debug_ip
    lea rax, [rel debug_ip]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; lea x1, tw_continue_cell
    lea rax, [rel tw_continue_cell]
    mov qword [rel arm_x1], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    hl_done
    cmp byte [rel arm_z], 0
    jne hl_done
    ; lea x0, debug_hl_xt
    lea rax, [rel debug_hl_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, hl_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je hl_done
    ; lea x1, debug_name
    lea rax, [rel debug_name]
    mov qword [rel arm_x1], rax
    ; ldrb    w2, [x1], #1
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; cbz     w2, hl_done
    mov eax, dword [rel arm_x2]
    cmp rax, 0
    je hl_done
    ; stp     x1, x2, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x1]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x2]
    mov qword [r10+8], rax
    ; bl      _debug_ds_isolate
    lea rax, [rel xret_78]
    mov qword [rel arm_x30], rax
    jmp _debug_ds_isolate
    xret_78:
    ; ldp     x1, x2, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x1], rax
    mov qword [rel arm_x2], rcx
    add rsp, 0x10
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
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x20], rax
    ; lea x0, debug_hl_xt
    lea rax, [rel debug_hl_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _debug_call_xt
    lea rax, [rel xret_79]
    mov qword [rel arm_x30], rax
    jmp _debug_call_xt
    xret_79:
    ; bl      _debug_ds_restore
    lea rax, [rel xret_80]
    mov qword [rel arm_x30], rax
    jmp _debug_ds_restore
    xret_80:
hl_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_debug_capture:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; lea x19, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x19], rax
    ; add     x19, x19, #1, lsl #12
    mov rax, qword [rel arm_x19]
    add rax, 0x1000
    mov qword [rel arm_x19], rax
    ; lea x9, debug_scnt
    lea rax, [rel debug_scnt]
    mov qword [rel arm_x9], rax
    ; cmp     x22, x19
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    cap_s_empty
    cmp byte [rel arm_c], 0
    jne cap_s_empty
    ; sub     x21, x19, x22
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x22]
    sub rax, rcx
    mov qword [rel arm_x21], rax
    ; lsr     x21, x21, #3
    mov rax, qword [rel arm_x21]
    shr rax, 3
    mov qword [rel arm_x21], rax
    ; cmp     x21, #16
    mov rax, qword [rel arm_x21]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    cap_s_n
    cmp byte [rel arm_c], 0
    je cap_s_n
    cmp byte [rel arm_z], 0
    jne cap_s_n
    ; mov     x21, #16
    mov rax, 0x10
    mov qword [rel arm_x21], rax
cap_s_n:
    ; str     x21, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [rel arm_x21]
    mov qword [r10], rax
    ; lea x24, debug_sbuf
    lea rax, [rel debug_sbuf]
    mov qword [rel arm_x24], rax
    ; cbz     x21, cap_r
    mov rax, qword [rel arm_x21]
    cmp rax, 0
    je cap_r
    ; sub     x1, x21, #1
    mov rax, qword [rel arm_x21]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; str     x20, [x24, x1, lsl #3]
    mov r10, qword [rel arm_x24]
    mov rax, qword [rel arm_x1]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; cbz     x1, cap_r
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je cap_r
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
cap_s_loop:
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    cap_r
    cmp byte [rel arm_c], 0
    jne cap_r
    ; sub     x2, x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    sub rax, rcx
    mov qword [rel arm_x2], rax
    ; sub     x2, x2, #1
    mov rax, qword [rel arm_x2]
    sub rax, 1
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x22, x2, lsl #3]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x24, x0, lsl #3]
    mov r10, qword [rel arm_x24]
    mov rax, qword [rel arm_x0]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       cap_s_loop
    jmp cap_s_loop
cap_s_empty:
    ; str     xzr, [x9]
    mov r10, qword [rel arm_x9]
    mov qword [r10], 0
cap_r:
    ; lea x19, return_stack
    lea rax, [rel return_stack]
    mov qword [rel arm_x19], rax
    ; add     x19, x19, #1, lsl #12
    mov rax, qword [rel arm_x19]
    add rax, 0x1000
    mov qword [rel arm_x19], rax
    ; lea x10, debug_floor
    lea rax, [rel debug_floor]
    mov qword [rel arm_x10], rax
    ; ldr     x10, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x10], rax
    ; cbz     x10, cap_r_clip
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    je cap_r_clip
    ; cmp     x10, x19
    mov rax, qword [rel arm_x10]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    cap_r_clip
    cmp byte [rel arm_c], 0
    je xsk_81
    cmp byte [rel arm_z], 0
    je cap_r_clip
    xsk_81:
    ; cmp     x10, x23
    mov rax, qword [rel arm_x10]
    mov rcx, qword [rel arm_x23]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    cap_r_clip
    cmp byte [rel arm_c], 0
    je cap_r_clip
    cmp byte [rel arm_z], 0
    jne cap_r_clip
    ; mov     x19, x10
    mov rax, qword [rel arm_x10]
    mov qword [rel arm_x19], rax
cap_r_clip:
    ; lea x24, debug_rbuf
    lea rax, [rel debug_rbuf]
    mov qword [rel arm_x24], rax
    ; lea x10, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x10], rax
    ; ldr     x10, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x10], rax
    ; cmp     x23, x19
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    cap_r_empty
    cmp byte [rel arm_c], 0
    jne cap_r_empty
    ; sub     x21, x19, x23
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x23]
    sub rax, rcx
    mov qword [rel arm_x21], rax
    ; lsr     x21, x21, #3
    mov rax, qword [rel arm_x21]
    shr rax, 3
    mov qword [rel arm_x21], rax
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
cap_r_loop:
    ; cmp     x0, x21
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x21]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    cap_r_store
    cmp byte [rel arm_c], 0
    jne cap_r_store
    ; add     x2, x23, x0, lsl #3
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x0]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x2], rax
    ; cmp     x2, x10
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x10]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    cap_r_keep
    cmp byte [rel arm_z], 0
    je cap_r_keep
    ; add     x0, x0, #6
    mov rax, qword [rel arm_x0]
    add rax, 6
    mov qword [rel arm_x0], rax
    ; b       cap_r_loop
    jmp cap_r_loop
cap_r_keep:
    ; cmp     x1, #16
    mov rax, qword [rel arm_x1]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    cap_r_store
    cmp byte [rel arm_c], 0
    jne cap_r_store
    ; ldr     x2, [x23, x0, lsl #3]
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x0]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; str     x2, [x24, x1, lsl #3]
    mov r10, qword [rel arm_x24]
    mov rax, qword [rel arm_x1]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       cap_r_loop
    jmp cap_r_loop
cap_r_empty:
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
cap_r_store:
    ; lea x9, debug_rcnt
    lea rax, [rel debug_rcnt]
    mov qword [rel arm_x9], rax
    ; str     x1, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; lea x19, debug_name
    lea rax, [rel debug_name]
    mov qword [rel arm_x19], rax
    ; strb    wzr, [x19]
    mov r10, qword [rel arm_x19]
    mov byte [r10], 0
    ; cbz     x0, cap_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je cap_done
    ; lea x1, tw_continue_cfa
    lea rax, [rel tw_continue_cfa]
    mov qword [rel arm_x1], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    cap_done
    cmp byte [rel arm_z], 0
    jne cap_done
    ; tst     x0, #7
    mov rax, qword [rel arm_x0]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    cap_done
    cmp byte [rel arm_z], 0
    je cap_done
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [rel arm_x1]
    and rax, 0xffff
    mov qword [rel arm_x1], rax
    ; cbz     x1, cap_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je cap_done
    ; lsr     x4, x1, #12
    mov rax, qword [rel arm_x1]
    shr rax, 12
    mov qword [rel arm_x4], rax
    ; cbnz    x4, cap_done
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    jne cap_done
    ; sub     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x0], rax
    ; ldrb    w1, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w1, w1, #NFA_LEN_MASK
    mov eax, dword [rel arm_x1]
    and eax, 0x7f
    mov qword [rel arm_x1], rax
    ; cbz     w1, cap_done
    mov eax, dword [rel arm_x1]
    cmp rax, 0
    je cap_done
    ; cmp     w1, #31
    mov eax, dword [rel arm_x1]
    cmp eax, 0x1f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    cap_name_ok
    cmp byte [rel arm_c], 0
    je cap_name_ok
    cmp byte [rel arm_z], 0
    jne cap_name_ok
    ; mov     w1, #31
    mov eax, 0x1f
    mov qword [rel arm_x1], rax
cap_name_ok:
    ; strb    w1, [x19], #1
    mov r10, qword [rel arm_x19]
    mov eax, dword [rel arm_x1]
    mov byte [r10], al
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
cap_name_loop:
    ; cmp     x2, x1
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    cap_done
    cmp byte [rel arm_c], 0
    jne cap_done
    ; ldrb    w3, [x0, x2]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x2]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; strb    w3, [x19, x2]
    mov r10, qword [rel arm_x19]
    mov rax, qword [rel arm_x2]
    add r10, rax
    mov eax, dword [rel arm_x3]
    mov byte [r10], al
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       cap_name_loop
    jmp cap_name_loop
cap_done:
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
_debug_resolve_enclosing:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
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
    ; lea x0, catch_ok_cell
    lea rax, [rel catch_ok_cell]
    mov qword [rel arm_x0], rax
    ; cmp     x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    res_catch
    cmp byte [rel arm_z], 0
    jne res_catch
    ; lea x0, tw_continue_cell
    lea rax, [rel tw_continue_cell]
    mov qword [rel arm_x0], rax
    ; cmp     x19, x0
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    res_scan
    cmp byte [rel arm_z], 0
    je res_scan
    ; ldr     x0, [x23, #8]
    mov r10, qword [rel arm_x23]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, res_none
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je res_none
    ; tst     x0, #7
    mov rax, qword [rel arm_x0]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    res_none
    cmp byte [rel arm_z], 0
    je res_none
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x2], rax
    ; cmp     x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    res_none
    cmp byte [rel arm_z], 0
    je res_none
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; b       res_out
    jmp res_out
res_catch:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; cbz     x0, res_none
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je res_none
    ; tst     x0, #7
    mov rax, qword [rel arm_x0]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    res_none
    cmp byte [rel arm_z], 0
    je res_none
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x2], rax
    ; cmp     x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    res_none
    cmp byte [rel arm_z], 0
    je res_none
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; b       res_out
    jmp res_out
res_scan:
    ; mov     x0, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x0], rax
    ; bl      _ip_find_colon
    lea rax, [rel xret_82]
    mov qword [rel arm_x30], rax
    jmp _ip_find_colon
    xret_82:
    ; cbnz    x0, res_out
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne res_out
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; cbz     x0, res_none
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je res_none
    ; tst     x0, #7
    mov rax, qword [rel arm_x0]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    res_none
    cmp byte [rel arm_z], 0
    je res_none
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x2], rax
    ; cmp     x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    res_none
    cmp byte [rel arm_z], 0
    je res_none
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; b       res_out
    jmp res_out
res_none:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
res_out:
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
_ip_find_colon:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
    ; mov     x21, #0
    mov rax, 0
    mov qword [rel arm_x21], rax
    ; mov     x22, #0
    mov rax, 0
    mov qword [rel arm_x22], rax
    ; lea x19, wordlist_reg_n
    lea rax, [rel wordlist_reg_n]
    mov qword [rel arm_x19], rax
    ; ldr     x19, [x19]
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    ; lea x23, wordlist_reg
    lea rax, [rel wordlist_reg]
    mov qword [rel arm_x23], rax
    ; mov     x24, #0
    mov rax, 0
    mov qword [rel arm_x24], rax
ip_wid_loop:
    ; cmp     x24, x19
    mov rax, qword [rel arm_x24]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    ip_wid_done
    cmp byte [rel arm_c], 0
    jne ip_wid_done
    ; ldr     x0, [x23, x24, lsl #3]
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x24]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _ip_scan_wid
    lea rax, [rel xret_83]
    mov qword [rel arm_x30], rax
    jmp _ip_scan_wid
    xret_83:
    ; add     x24, x24, #1
    mov rax, qword [rel arm_x24]
    add rax, 1
    mov qword [rel arm_x24], rax
    ; b       ip_wid_loop
    jmp ip_wid_loop
ip_wid_done:
    ; lea x0, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x0], rax
    ; bl      _ip_scan_wid
    lea rax, [rel xret_84]
    mov qword [rel arm_x30], rax
    jmp _ip_scan_wid
    xret_84:
    ; mov     x0, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x0], rax
    ; cbz     x21, ip_no_off
    mov rax, qword [rel arm_x21]
    cmp rax, 0
    je ip_no_off
    ; sub     x1, x20, x22
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x22]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; b       ip_find_out
    jmp ip_find_out
ip_no_off:
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
ip_find_out:
    ; ldp     x23, x24, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
    add rsp, 0x10
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
_ip_scan_wid:
    ; cbz     x0, scan_ret
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je scan_ret
    ; mov     x9, #0
    mov rax, 0
    mov qword [rel arm_x9], rax
scan_thread:
    ; cmp     x9, #DICT_THREADS
    mov rax, qword [rel arm_x9]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    scan_ret
    cmp byte [rel arm_c], 0
    jne scan_ret
    ; ldr     x10, [x0, x9, lsl #3]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x9]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x10], rax
scan_link:
    ; cbz     x10, scan_next_thread
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    je scan_next_thread
    ; tst     x10, #7
    mov rax, qword [rel arm_x10]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    scan_next_thread
    cmp byte [rel arm_z], 0
    je scan_next_thread
    ; ldr     x11, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x11], rax
    ; lea x12, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x12], rax
    ; cmp     x11, x12
    mov rax, qword [rel arm_x11]
    mov rcx, qword [rel arm_x12]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    scan_lfa
    cmp byte [rel arm_z], 0
    je scan_lfa
    ; add     x11, x10, #8
    mov rax, qword [rel arm_x10]
    add rax, 8
    mov qword [rel arm_x11], rax
    ; cmp     x11, x20
    mov rax, qword [rel arm_x11]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    scan_lfa
    cmp byte [rel arm_c], 0
    je xsk_85
    cmp byte [rel arm_z], 0
    je scan_lfa
    xsk_85:
    ; sub     x12, x20, x11
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x11]
    sub rax, rcx
    mov qword [rel arm_x12], rax
    ; lsr     x13, x12, #20
    mov rax, qword [rel arm_x12]
    shr rax, 20
    mov qword [rel arm_x13], rax
    ; cbnz    x13, scan_lfa
    mov rax, qword [rel arm_x13]
    cmp rax, 0
    jne scan_lfa
    ; cbz     x21, scan_take
    mov rax, qword [rel arm_x21]
    cmp rax, 0
    je scan_take
    ; cmp     x11, x22
    mov rax, qword [rel arm_x11]
    mov rcx, qword [rel arm_x22]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    scan_lfa
    cmp byte [rel arm_c], 0
    je scan_lfa
    cmp byte [rel arm_z], 0
    jne scan_lfa
scan_take:
    ; mov     x22, x11
    mov rax, qword [rel arm_x11]
    mov qword [rel arm_x22], rax
    ; mov     x21, x10
    mov rax, qword [rel arm_x10]
    mov qword [rel arm_x21], rax
scan_lfa:
    ; ldr     x10, [x10, #-16]
    mov r10, qword [rel arm_x10]
    add r10, -16
    mov rax, qword [r10]
    mov qword [rel arm_x10], rax
    ; b       scan_link
    jmp scan_link
scan_next_thread:
    ; add     x9, x9, #1
    mov rax, qword [rel arm_x9]
    add rax, 1
    mov qword [rel arm_x9], rax
    ; b       scan_thread
    jmp scan_thread
scan_ret:
    ; ret
    jmp qword [rel arm_x30]
_debug_print_inline_suffix:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x19, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    ; cbz     x19, inl_done
    mov rax, qword [rel arm_x19]
    cmp rax, 0
    je inl_done
    ; lea x0, debug_inline
    lea rax, [rel debug_inline]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; lea x1, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x19, x1
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    inl_branch
    cmp byte [rel arm_z], 0
    je inl_branch
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_86]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_86:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; cbz     x0, inl_number
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je inl_number
    ; tst     x0, #7
    mov rax, qword [rel arm_x0]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    inl_number
    cmp byte [rel arm_z], 0
    je inl_number
    ; lea x1, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [rel arm_x1], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    inl_number
    cmp byte [rel arm_c], 0
    je inl_number
    ; lea x1, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    inl_number
    cmp byte [rel arm_c], 0
    jne inl_number
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [rel arm_x1]
    and rax, 0xffff
    mov qword [rel arm_x1], rax
    ; cbz     x1, inl_number
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je inl_number
    ; lsr     x4, x1, #12
    mov rax, qword [rel arm_x1]
    shr rax, 12
    mov qword [rel arm_x4], rax
    ; cbnz    x4, inl_number
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    jne inl_number
    ; sub     x2, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x2], rax
    ; cbz     x2, inl_number
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je inl_number
    ; lea x3, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [rel arm_x3], rax
    ; cmp     x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    inl_number
    cmp byte [rel arm_c], 0
    je inl_number
    ; ldrb    w2, [x2]
    mov r10, qword [rel arm_x2]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    ; and     w2, w2, #NFA_LEN_MASK
    mov eax, dword [rel arm_x2]
    and eax, 0x7f
    mov qword [rel arm_x2], rax
    ; cbz     w2, inl_number
    mov eax, dword [rel arm_x2]
    cmp rax, 0
    je inl_number
    ; cmp     w2, #64
    mov eax, dword [rel arm_x2]
    cmp eax, 0x40
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    inl_number
    cmp byte [rel arm_c], 0
    jne inl_number
    ; bl      _print_xt_name
    lea rax, [rel xret_87]
    mov qword [rel arm_x30], rax
    jmp _print_xt_name
    xret_87:
    ; b       inl_done
    jmp inl_done
inl_number:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      _print_signed
    lea rax, [rel xret_88]
    mov qword [rel arm_x30], rax
    jmp _print_signed
    xret_88:
    ; b       inl_done
    jmp inl_done
inl_branch:
    ; lea x1, cfa_branch
    lea rax, [rel cfa_branch]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x19, x1
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    inl_cells
    cmp byte [rel arm_z], 0
    jne inl_cells
    ; lea x1, cfa_0branch
    lea rax, [rel cfa_0branch]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x19, x1
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    inl_cells
    cmp byte [rel arm_z], 0
    jne inl_cells
    ; lea x1, cfa_loop
    lea rax, [rel cfa_loop]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x19, x1
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    inl_cells
    cmp byte [rel arm_z], 0
    jne inl_cells
    ; lea x1, cfa_plusloop
    lea rax, [rel cfa_plusloop]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x19, x1
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    inl_done
    cmp byte [rel arm_z], 0
    je inl_done
inl_cells:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_89]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_89:
    ; asr     x20, x20, #3
    mov rax, qword [rel arm_x20]
    sar rax, 3
    mov qword [rel arm_x20], rax
    ; tbnz    x20, #63, inl_neg
    mov rax, qword [rel arm_x20]
    bt rax, 63
    jc inl_neg
    ; mov     x0, #'+'
    mov rax, 0x2b
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_90]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_90:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_91]
    mov qword [rel arm_x30], rax
    jmp _print_unsigned
    xret_91:
    ; b       inl_cells_word
    jmp inl_cells_word
inl_neg:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      _print_signed
    lea rax, [rel xret_92]
    mov qword [rel arm_x30], rax
    jmp _print_signed
    xret_92:
inl_cells_word:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_93]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_93:
    ; mov     x0, #'C'
    mov rax, 0x43
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_94]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_94:
    ; mov     x0, #'E'
    mov rax, 0x45
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_95]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_95:
    ; mov     x0, #'L'
    mov rax, 0x4c
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_96]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_96:
    ; mov     x0, #'L'
    mov rax, 0x4c
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_97]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_97:
    ; mov     x0, #'S'
    mov rax, 0x53
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_98]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_98:
inl_done:
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
_debug_xt_intoable:
    ; cbz     x0, into_no
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je into_no
    ; tst     x0, #7
    mov rax, qword [rel arm_x0]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    into_no
    cmp byte [rel arm_z], 0
    je into_no
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x0], rax
    ; cmp     x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    into_yes
    cmp byte [rel arm_z], 0
    jne into_yes
    ; lea x0, DODOES
    lea rax, [rel DODOES]
    mov qword [rel arm_x0], rax
    ; cmp     x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    into_yes
    cmp byte [rel arm_z], 0
    jne into_yes
    ; lea x0, XEXECUTE
    lea rax, [rel XEXECUTE]
    mov qword [rel arm_x0], rax
    ; cmp     x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    into_yes
    cmp byte [rel arm_z], 0
    jne into_yes
    ; lea x0, XCATCH
    lea rax, [rel XCATCH]
    mov qword [rel arm_x0], rax
    ; cmp     x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    into_yes
    cmp byte [rel arm_z], 0
    jne into_yes
into_no:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
into_yes:
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_print_xt_name:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; cbz     x0, pxn_q
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je pxn_q
    ; lea x1, tw_continue_cfa
    lea rax, [rel tw_continue_cfa]
    mov qword [rel arm_x1], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    pxn_check
    cmp byte [rel arm_z], 0
    je pxn_check
    ; lea x0, str_traverse
    lea rax, [rel str_traverse]
    mov qword [rel arm_x0], rax
    ; bl      _emit_z
    lea rax, [rel xret_99]
    mov qword [rel arm_x30], rax
    jmp _emit_z
    xret_99:
    ; b       pxn_done
    jmp pxn_done
pxn_check:
    ; tst     x0, #7
    mov rax, qword [rel arm_x0]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    pxn_q
    cmp byte [rel arm_z], 0
    je pxn_q
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [rel arm_x1]
    and rax, 0xffff
    mov qword [rel arm_x1], rax
    ; cbz     x1, pxn_q
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je pxn_q
    ; lsr     x4, x1, #12
    mov rax, qword [rel arm_x1]
    shr rax, 12
    mov qword [rel arm_x4], rax
    ; cbnz    x4, pxn_q
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    jne pxn_q
    ; sub     x19, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x19], rax
    ; ldrb    w20, [x19], #1
    mov r10, qword [rel arm_x19]
    movzx eax, byte [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; and     w20, w20, #NFA_LEN_MASK
    mov eax, dword [rel arm_x20]
    and eax, 0x7f
    mov qword [rel arm_x20], rax
    ; cbz     w20, pxn_q
    mov eax, dword [rel arm_x20]
    cmp rax, 0
    je pxn_q
    ; cmp     w20, #64
    mov eax, dword [rel arm_x20]
    cmp eax, 0x40
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    pxn_q
    cmp byte [rel arm_c], 0
    jne pxn_q
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
pxn_scan:
    ; cmp     x1, x20
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    pxn_print
    cmp byte [rel arm_c], 0
    jne pxn_print
    ; ldrb    w0, [x19, x1]
    mov r10, qword [rel arm_x19]
    mov rax, qword [rel arm_x1]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    ; cmp     w0, #32
    mov eax, dword [rel arm_x0]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    pxn_q
    cmp byte [rel arm_c], 0
    je pxn_q
    ; cmp     w0, #126
    mov eax, dword [rel arm_x0]
    cmp eax, 0x7e
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    pxn_q
    cmp byte [rel arm_c], 0
    je xsk_100
    cmp byte [rel arm_z], 0
    je pxn_q
    xsk_100:
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       pxn_scan
    jmp pxn_scan
pxn_print:
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
pxn_out:
    ; cmp     x1, x20
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    pxn_done
    cmp byte [rel arm_c], 0
    jne pxn_done
    ; ldrb    w0, [x19, x1]
    mov r10, qword [rel arm_x19]
    mov rax, qword [rel arm_x1]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    ; stp     x1, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x1]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; bl      _putchar
    lea rax, [rel xret_101]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_101:
    ; ldp     x1, x20, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x1], rax
    mov qword [rel arm_x20], rcx
    add rsp, 0x10
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       pxn_out
    jmp pxn_out
pxn_done:
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
pxn_q:
    ; mov     x0, #63
    mov rax, 0x3f
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_102]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_102:
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
_debug_note_byte:
    ; lea x1, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, note_ret
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je note_ret
    ; lea x2, debug_line_col
    lea rax, [rel debug_line_col]
    mov qword [rel arm_x2], rax
    ; lea x3, debug_midline
    lea rax, [rel debug_midline]
    mov qword [rel arm_x3], rax
    ; cmp     w0, #10
    mov eax, dword [rel arm_x0]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    note_not_nl
    cmp byte [rel arm_z], 0
    je note_not_nl
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
    ; ret
    jmp qword [rel arm_x30]
note_not_nl:
    ; cmp     w0, #8
    mov eax, dword [rel arm_x0]
    cmp eax, 8
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    note_glyph
    cmp byte [rel arm_z], 0
    je note_glyph
    ; ldr     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, note_bs_flag
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je note_bs_flag
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
note_bs_flag:
    ; ldr     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x1, #0
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    note_bs_zero
    cmp byte [rel arm_z], 0
    jne note_bs_zero
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; b       note_bs_store
    jmp note_bs_store
note_bs_zero:
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
note_bs_store:
    ; str     x1, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; ret
    jmp qword [rel arm_x30]
note_glyph:
    ; and     w1, w0, #0xC0
    mov eax, dword [rel arm_x0]
    and eax, 0xc0
    mov qword [rel arm_x1], rax
    ; cmp     w1, #0x80
    mov eax, dword [rel arm_x1]
    cmp eax, 0x80
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    note_ret
    cmp byte [rel arm_z], 0
    jne note_ret
    ; ldr     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
note_ret:
    ; ret
    jmp qword [rel arm_x30]
_debug_pad_to_stack_col:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; lea x0, debug_line_col
    lea rax, [rel debug_line_col]
    mov qword [rel arm_x0], rax
    ; ldr     x19, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    ; cmp     x19, #DEBUG_STACK_COL
    mov rax, qword [rel arm_x19]
    cmp rax, 0x17
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    pad_done
    cmp byte [rel arm_z], 0
    jne pad_done
    ; b.hi    pad_one
    cmp byte [rel arm_c], 0
    je xsk_103
    cmp byte [rel arm_z], 0
    je pad_one
    xsk_103:
    ; mov     x0, #DEBUG_STACK_COL
    mov rax, 0x17
    mov qword [rel arm_x0], rax
    ; sub     x19, x0, x19
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x19]
    sub rax, rcx
    mov qword [rel arm_x19], rax
pad_loop:
    ; cbz     x19, pad_done
    mov rax, qword [rel arm_x19]
    cmp rax, 0
    je pad_done
    ; sub     x19, x19, #1
    mov rax, qword [rel arm_x19]
    sub rax, 1
    mov qword [rel arm_x19], rax
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_104]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_104:
    ; b       pad_loop
    jmp pad_loop
pad_one:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_105]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_105:
pad_done:
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
_debug_cursor_on:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, debug_line_col
    lea rax, [rel debug_line_col]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, debug_stack_anchor
    lea rax, [rel debug_stack_anchor]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x0, #0xE2
    mov rax, 0xe2
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_106]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_106:
    ; mov     x0, #0x96
    mov rax, 0x96
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_107]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_107:
    ; mov     x0, #0x88
    mov rax, 0x88
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_108]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_108:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_cursor_on
    lea rax, [rel debug_cursor_on]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_debug_cursor_off:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, debug_cursor_on
    lea rax, [rel debug_cursor_on]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, cursor_off_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je cursor_off_done
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; mov     x0, #8
    mov rax, 8
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_109]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_109:
    ; lea x0, debug_stack_anchor
    lea rax, [rel debug_stack_anchor]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, debug_line_col
    lea rax, [rel debug_line_col]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
cursor_off_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_debug_print_SR:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; lea x0, debug_field_len
    lea rax, [rel debug_field_len]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, debug_field_count
    lea rax, [rel debug_field_count]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x0, #83
    mov rax, 0x53
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_110]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_110:
    ; bl      _debug_print_dots
    lea rax, [rel xret_111]
    mov qword [rel arm_x30], rax
    jmp _debug_print_dots
    xret_111:
    ; lea x0, debug_field_len
    lea rax, [rel debug_field_len]
    mov qword [rel arm_x0], rax
    ; ldr     x19, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    ; cmp     x19, #45
    mov rax, qword [rel arm_x19]
    cmp rax, 0x2d
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    sr_past
    cmp byte [rel arm_c], 0
    jne sr_past
    ; mov     x0, #45
    mov rax, 0x2d
    mov qword [rel arm_x0], rax
    ; sub     x19, x0, x19
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x19]
    sub rax, rcx
    mov qword [rel arm_x19], rax
sr_pad:
    ; cbz     x19, sr_r
    mov rax, qword [rel arm_x19]
    cmp rax, 0
    je sr_r
    ; sub     x19, x19, #1
    mov rax, qword [rel arm_x19]
    sub rax, 1
    mov qword [rel arm_x19], rax
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_112]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_112:
    ; b       sr_pad
    jmp sr_pad
sr_past:
    ; b.eq    sr_r
    cmp byte [rel arm_z], 0
    jne sr_r
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_113]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_113:
sr_r:
    ; mov     x0, #82
    mov rax, 0x52
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_114]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_114:
    ; bl      _debug_print_rstack
    lea rax, [rel xret_115]
    mov qword [rel arm_x30], rax
    jmp _debug_print_rstack
    xret_115:
    ; lea x0, debug_field_count
    lea rax, [rel debug_field_count]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
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
_debug_print_dots:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; lea x19, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x19], rax
    ; add     x19, x19, #1, lsl #12
    mov rax, qword [rel arm_x19]
    add rax, 0x1000
    mov qword [rel arm_x19], rax
    ; cmp     x22, x19
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    dpd_empty
    cmp byte [rel arm_c], 0
    jne dpd_empty
    ; sub     x21, x19, x22
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x22]
    sub rax, rcx
    mov qword [rel arm_x21], rax
    ; lsr     x21, x21, #3
    mov rax, qword [rel arm_x21]
    shr rax, 3
    mov qword [rel arm_x21], rax
    ; mov     x0, #40
    mov rax, 0x28
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_116]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_116:
    ; mov     x0, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_117]
    mov qword [rel arm_x30], rax
    jmp _print_unsigned
    xret_117:
    ; mov     x0, #41
    mov rax, 0x29
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_118]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_118:
    ; mov     x0, #58
    mov rax, 0x3a
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_119]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_119:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_120]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_120:
    ; cmp     x21, #6
    mov rax, qword [rel arm_x21]
    cmp rax, 6
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    dpd_under
    cmp byte [rel arm_c], 0
    je dpd_under
    cmp byte [rel arm_z], 0
    jne dpd_under
    ; mov     x0, #'.'
    mov rax, 0x2e
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_121]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_121:
    ; mov     x0, #'.'
    mov rax, 0x2e
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_122]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_122:
    ; mov     x0, #'.'
    mov rax, 0x2e
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_123]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_123:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_124]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_124:
dpd_under:
    ; cmp     x21, #1
    mov rax, qword [rel arm_x21]
    cmp rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    dpd_tos
    cmp byte [rel arm_z], 0
    jne dpd_tos
    ; sub     x19, x21, #1
    mov rax, qword [rel arm_x21]
    sub rax, 1
    mov qword [rel arm_x19], rax
    ; cmp     x19, #5
    mov rax, qword [rel arm_x19]
    cmp rax, 5
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    dpd_mem
    cmp byte [rel arm_c], 0
    je dpd_mem
    cmp byte [rel arm_z], 0
    jne dpd_mem
    ; mov     x19, #5
    mov rax, 5
    mov qword [rel arm_x19], rax
dpd_mem:
    ; cbz     x19, dpd_tos
    mov rax, qword [rel arm_x19]
    cmp rax, 0
    je dpd_tos
    ; sub     x19, x19, #1
    mov rax, qword [rel arm_x19]
    sub rax, 1
    mov qword [rel arm_x19], rax
    ; lsl     x0, x19, #3
    mov rax, qword [rel arm_x19]
    shl rax, 3
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x22, x0]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_signed
    lea rax, [rel xret_125]
    mov qword [rel arm_x30], rax
    jmp _print_signed
    xret_125:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_126]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_126:
    ; b       dpd_mem
    jmp dpd_mem
dpd_tos:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      _print_signed
    lea rax, [rel xret_127]
    mov qword [rel arm_x30], rax
    jmp _print_signed
    xret_127:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_128]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_128:
    ; b       dpd_done
    jmp dpd_done
dpd_empty:
    ; mov     x0, #40
    mov rax, 0x28
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_129]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_129:
    ; mov     x0, #48
    mov rax, 0x30
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_130]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_130:
    ; mov     x0, #41
    mov rax, 0x29
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_131]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_131:
    ; mov     x0, #58
    mov rax, 0x3a
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_132]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_132:
dpd_done:
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
_debug_print_rstack:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; sub     sp, sp, #32
    mov rax, rsp
    sub rax, 0x20
    mov rsp, rax
    ; lea x19, return_stack
    lea rax, [rel return_stack]
    mov qword [rel arm_x19], rax
    ; add     x19, x19, #1, lsl #12
    mov rax, qword [rel arm_x19]
    add rax, 0x1000
    mov qword [rel arm_x19], rax
    ; lea x0, debug_floor
    lea rax, [rel debug_floor]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, dpr_clip
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je dpr_clip
    ; cmp     x0, x19
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    dpr_clip
    cmp byte [rel arm_c], 0
    je xsk_133
    cmp byte [rel arm_z], 0
    je dpr_clip
    xsk_133:
    ; cmp     x0, x23
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x23]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    dpr_clip
    cmp byte [rel arm_c], 0
    je dpr_clip
    cmp byte [rel arm_z], 0
    jne dpr_clip
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
dpr_clip:
    ; cmp     x23, x19
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x19]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    dpr_empty
    cmp byte [rel arm_c], 0
    jne dpr_empty
    ; sub     x21, x19, x23
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x23]
    sub rax, rcx
    mov qword [rel arm_x21], rax
    ; lsr     x21, x21, #3
    mov rax, qword [rel arm_x21]
    shr rax, 3
    mov qword [rel arm_x21], rax
    ; lea x22, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x22], rax
    ; ldr     x22, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x22], rax
    ; mov     x19, #0
    mov rax, 0
    mov qword [rel arm_x19], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
dpr_count:
    ; cmp     x20, x21
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x21]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    dpr_counted
    cmp byte [rel arm_c], 0
    jne dpr_counted
    ; add     x0, x23, x20, lsl #3
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x20]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; cmp     x0, x22
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x22]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    dpr_one
    cmp byte [rel arm_z], 0
    je dpr_one
    ; add     x20, x20, #6
    mov rax, qword [rel arm_x20]
    add rax, 6
    mov qword [rel arm_x20], rax
    ; b       dpr_count
    jmp dpr_count
dpr_one:
    ; add     x19, x19, #1
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; add     x20, x20, #1
    mov rax, qword [rel arm_x20]
    add rax, 1
    mov qword [rel arm_x20], rax
    ; b       dpr_count
    jmp dpr_count
dpr_counted:
    ; cbz     x19, dpr_empty
    mov rax, qword [rel arm_x19]
    cmp rax, 0
    je dpr_empty
    ; mov     x0, #40
    mov rax, 0x28
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_134]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_134:
    ; mov     x0, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_135]
    mov qword [rel arm_x30], rax
    jmp _print_unsigned
    xret_135:
    ; mov     x0, #41
    mov rax, 0x29
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_136]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_136:
    ; mov     x0, #58
    mov rax, 0x3a
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_137]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_137:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_138]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_138:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
    ; mov     x19, #0
    mov rax, 0
    mov qword [rel arm_x19], rax
dpr_show:
    ; cmp     x20, x21
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x21]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    dpr_done
    cmp byte [rel arm_c], 0
    jne dpr_done
    ; cmp     x19, #4
    mov rax, qword [rel arm_x19]
    cmp rax, 4
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    dpr_ellip
    cmp byte [rel arm_c], 0
    jne dpr_ellip
    ; add     x0, x23, x20, lsl #3
    mov rax, qword [rel arm_x23]
    mov rcx, qword [rel arm_x20]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; cmp     x0, x22
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x22]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    dpr_show_one
    cmp byte [rel arm_z], 0
    je dpr_show_one
    ; add     x20, x20, #6
    mov rax, qword [rel arm_x20]
    add rax, 6
    mov qword [rel arm_x20], rax
    ; b       dpr_show
    jmp dpr_show
dpr_show_one:
    ; ldr     x0, [x23, x20, lsl #3]
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x20]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_139]
    mov qword [rel arm_x30], rax
    jmp _print_unsigned
    xret_139:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_140]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_140:
    ; add     x20, x20, #1
    mov rax, qword [rel arm_x20]
    add rax, 1
    mov qword [rel arm_x20], rax
    ; add     x19, x19, #1
    mov rax, qword [rel arm_x19]
    add rax, 1
    mov qword [rel arm_x19], rax
    ; b       dpr_show
    jmp dpr_show
dpr_ellip:
    ; mov     x0, #'.'
    mov rax, 0x2e
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_141]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_141:
    ; mov     x0, #'.'
    mov rax, 0x2e
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_142]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_142:
    ; mov     x0, #'.'
    mov rax, 0x2e
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_143]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_143:
    ; b       dpr_done
    jmp dpr_done
dpr_empty:
    ; mov     x0, #40
    mov rax, 0x28
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_144]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_144:
    ; mov     x0, #48
    mov rax, 0x30
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_145]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_145:
    ; mov     x0, #41
    mov rax, 0x29
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_146]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_146:
    ; mov     x0, #58
    mov rax, 0x3a
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_147]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_147:
dpr_done:
    ; add     sp, sp, #32
    mov rax, rsp
    add rax, 0x20
    mov rsp, rax
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
_view_register_path:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x21]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x22]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
    ; cmp     x20, #0
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.le    vrp_fail
    cmp byte [rel arm_z], 0
    jne vrp_fail
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne vrp_fail
    ; cmp     x20, #255
    mov rax, qword [rel arm_x20]
    cmp rax, 0xff
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    vrp_len_ok
    cmp byte [rel arm_c], 0
    je vrp_len_ok
    cmp byte [rel arm_z], 0
    jne vrp_len_ok
    ; mov     x20, #255
    mov rax, 0xff
    mov qword [rel arm_x20], rax
vrp_len_ok:
    ; lea x21, view_file_n
    lea rax, [rel view_file_n]
    mov qword [rel arm_x21], rax
    ; ldr     x22, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x22], rax
    ; mov     x3, #1
    mov rax, 1
    mov qword [rel arm_x3], rax
vrp_search:
    ; cmp     x3, x22
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x22]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    vrp_append
    cmp byte [rel arm_c], 0
    je xsk_148
    cmp byte [rel arm_z], 0
    je vrp_append
    xsk_148:
    ; sub     x4, x3, #1
    mov rax, qword [rel arm_x3]
    sub rax, 1
    mov qword [rel arm_x4], rax
    ; mov     x5, #VIEW_PATH_MAX
    mov rax, 0x100
    mov qword [rel arm_x5], rax
    ; mul     x4, x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    imul rax, rcx
    mov qword [rel arm_x4], rax
    ; lea x5, view_paths
    lea rax, [rel view_paths]
    mov qword [rel arm_x5], rax
    ; add     x5, x5, x4
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x5], rax
    ; ldrb    w6, [x5]
    mov r10, qword [rel arm_x5]
    movzx eax, byte [r10]
    mov qword [rel arm_x6], rax
    ; cmp     x6, x20
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    vrp_next
    cmp byte [rel arm_z], 0
    je vrp_next
    ; mov     x7, #0
    mov rax, 0
    mov qword [rel arm_x7], rax
vrp_cmp:
    ; cmp     x7, x20
    mov rax, qword [rel arm_x7]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    vrp_found
    cmp byte [rel arm_c], 0
    jne vrp_found
    ; add     x8, x5, #1
    mov rax, qword [rel arm_x5]
    add rax, 1
    mov qword [rel arm_x8], rax
    ; ldrb    w9, [x8, x7]
    mov r10, qword [rel arm_x8]
    mov rax, qword [rel arm_x7]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x9], rax
    ; ldrb    w10, [x19, x7]
    mov r10, qword [rel arm_x19]
    mov rax, qword [rel arm_x7]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x10], rax
    ; cmp     w9, w10
    mov eax, dword [rel arm_x9]
    mov ecx, dword [rel arm_x10]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    vrp_next
    cmp byte [rel arm_z], 0
    je vrp_next
    ; add     x7, x7, #1
    mov rax, qword [rel arm_x7]
    add rax, 1
    mov qword [rel arm_x7], rax
    ; b       vrp_cmp
    jmp vrp_cmp
vrp_next:
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       vrp_search
    jmp vrp_search
vrp_append:
    ; cmp     x22, #VIEW_FILE_MAX
    mov rax, qword [rel arm_x22]
    cmp rax, 0x100
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    vrp_fail
    cmp byte [rel arm_c], 0
    jne vrp_fail
    ; add     x22, x22, #1
    mov rax, qword [rel arm_x22]
    add rax, 1
    mov qword [rel arm_x22], rax
    ; str     x22, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [rel arm_x22]
    mov qword [r10], rax
    ; mov     x3, x22
    mov rax, qword [rel arm_x22]
    mov qword [rel arm_x3], rax
    ; sub     x4, x3, #1
    mov rax, qword [rel arm_x3]
    sub rax, 1
    mov qword [rel arm_x4], rax
    ; mov     x5, #VIEW_PATH_MAX
    mov rax, 0x100
    mov qword [rel arm_x5], rax
    ; mul     x4, x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    imul rax, rcx
    mov qword [rel arm_x4], rax
    ; lea x5, view_paths
    lea rax, [rel view_paths]
    mov qword [rel arm_x5], rax
    ; add     x5, x5, x4
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x5], rax
    ; strb    w20, [x5]
    mov r10, qword [rel arm_x5]
    mov eax, dword [rel arm_x20]
    mov byte [r10], al
    ; mov     x7, #0
    mov rax, 0
    mov qword [rel arm_x7], rax
vrp_store:
    ; cmp     x7, x20
    mov rax, qword [rel arm_x7]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    vrp_found
    cmp byte [rel arm_c], 0
    jne vrp_found
    ; ldrb    w9, [x19, x7]
    mov r10, qword [rel arm_x19]
    mov rax, qword [rel arm_x7]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x9], rax
    ; add     x8, x5, #1
    mov rax, qword [rel arm_x5]
    add rax, 1
    mov qword [rel arm_x8], rax
    ; strb    w9, [x8, x7]
    mov r10, qword [rel arm_x8]
    mov rax, qword [rel arm_x7]
    add r10, rax
    mov eax, dword [rel arm_x9]
    mov byte [r10], al
    ; add     x7, x7, #1
    mov rax, qword [rel arm_x7]
    add rax, 1
    mov qword [rel arm_x7], rax
    ; b       vrp_store
    jmp vrp_store
vrp_found:
    ; mov     x0, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x0], rax
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
vrp_fail:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    add rsp, 0x10
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
_view_line_now:
    ; lea x0, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _vln_none
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _vln_none
    ; lea x0, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _vln_none
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _vln_none
    ; b       _source_line_now
    jmp _source_line_now
_vln_none:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_source_line_now:
    ; lea x1, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; lea x4, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x4], rax
    ; ldr     x4, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; cbz     x4, _source_line_at
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _source_line_at
    ; lea x3, line_origin
    lea rax, [rel line_origin]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; add     x4, x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x4], rax
    ; sub     x2, x4, x3
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x3]
    sub rax, rcx
    mov qword [rel arm_x2], rax
    ; mov     x1, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x1], rax
_source_line_at:
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
_sla_loop:
    ; cmp     x3, x2
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _sla_done
    cmp byte [rel arm_c], 0
    jne _sla_done
    ; ldrb    w4, [x1, x3]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x3]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _sla_next
    cmp byte [rel arm_z], 0
    je _sla_next
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
_sla_next:
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _sla_loop
    jmp _sla_loop
_sla_done:
    ; ret
    jmp qword [rel arm_x30]
_view_set_src_from_pending:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, include_name_len
    lea rax, [rel include_name_len]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _vset_clear
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _vset_clear
    ; lea x0, include_name_pending
    lea rax, [rel include_name_pending]
    mov qword [rel arm_x0], rax
    ; bl      _view_register_path
    lea rax, [rel xret_149]
    mov qword [rel arm_x30], rax
    jmp _view_register_path
    xret_149:
    ; lea x1, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_vset_clear:
    ; lea x1, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_view_push_src_id:
    ; lea x0, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, view_id_sp
    lea rax, [rel view_id_sp]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cmp     x3, #8
    mov rax, qword [rel arm_x3]
    cmp rax, 8
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _vpush_full
    cmp byte [rel arm_c], 0
    jne _vpush_full
    ; lea x4, view_id_stack
    lea rax, [rel view_id_stack]
    mov qword [rel arm_x4], rax
    ; str     x1, [x4, x3, lsl #3]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x3]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
_vpush_full:
    ; ret
    jmp qword [rel arm_x30]
_view_pop_src_id:
    ; lea x2, view_id_sp
    lea rax, [rel view_id_sp]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbz     x3, _vpop_empty
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je _vpop_empty
    ; sub     x3, x3, #1
    mov rax, qword [rel arm_x3]
    sub rax, 1
    mov qword [rel arm_x3], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x4, view_id_stack
    lea rax, [rel view_id_stack]
    mov qword [rel arm_x4], rax
    ; ldr     x1, [x4, x3, lsl #3]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x3]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; ret
    jmp qword [rel arm_x30]
_vpop_empty:
    ; lea x0, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; ret
    jmp qword [rel arm_x30]
_getchar:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x1, key_fn
    lea rax, [rel key_fn]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, getchar_none
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je getchar_none
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
    ; b       getchar_out
    jmp getchar_out
getchar_none:
    ; mov     x0, #-1
    mov rax, -1
    mov qword [rel arm_x0], rax
getchar_out:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
section .rodata
str_dbg_keys:
    ; DCB "[Space/o/Return=over i=into u=out Esc/q=abort g=go h=help]", 0
    db "[Space/o/Return=over i=into u=out Esc/q=abort g=go h=help]", 0
str_dbg_abort:
    ; DCB "DEBUG aborted", 10, 0
    db "DEBUG aborted", 0xa, 0
str_dbg_done:
    ; DCB "DEBUG done", 10, 0
    db "DEBUG done", 0xa, 0
str_traverse:
    ; DCB "(TRAVERSE)", 0
    db "(TRAVERSE)", 0
section .data
debug_armed:
    ; DCQ 0
    dq 0
tdebug_armed:
    ; DCQ 0
    dq 0
debug_midline:
    ; DCQ 0
    dq 0
debug_field_count:
    ; DCQ 0
    dq 0
debug_field_len:
    ; DCQ 0
    dq 0
debug_help_shown:
    ; DCQ 0
    dq 0
debug_cursor_on:
    ; DCQ 0
    dq 0
debug_need_stacks:
    ; DCQ 0
    dq 0
debug_need_intro:
    ; DCQ 0
    dq 0
debug_line_col:
    ; DCQ 0
    dq 0
debug_stack_anchor:
    ; DCQ 0
    dq 0
debug_busy:
    ; DCQ 0
    dq 0
debug_floor:
    ; DCQ 0
    dq 0
debug_bp_go:
    ; DCQ 0
    dq 0
debug_runto_ip:
    ; DCQ 0
    dq 0
debug_runto_off:
    ; DCQ 0
    dq 0
debug_runto_status:
    ; DCQ 0
    dq 0
debug_break_asap:
    ; DCQ 0
    dq 0
debug_break_min_cfa:
    ; DCQ 0
    dq 0
debug_bp_xts:
    ; SPACE 64
    times 64 db 0
debug_bp_en:
    ; SPACE 64
    times 64 db 0
debug_over:
    ; DCQ 0
    dq 0
debug_out:
    ; DCQ 0
    dq 0
debug_abort:
    ; DCQ 0
    dq 0
debug_show_xt:
    ; DCQ 0
    dq 0
debug_sync_ok:
    ; DCQ 0
    dq 0
debug_hl_xt:
    ; DCQ 0
    dq 0
debug_wheel_xt:
    ; DCQ 0
    dq 0
debug_pause_xt:
    ; DCQ 0
    dq 0
debug_pause_rsp:
    ; DCQ 0
    dq 0
debug_key_xt:
    ; DCQ 0
    dq 0
debug_key_raw:
    ; DCQ 0
    dq 0
debug_key_mode:
    ; DCQ 0
    dq 0
debug_call_tos:
    ; DCQ 0
    dq 0
debug_view_cfa:
    ; DCQ 0
    dq 0
debug_view_name:
    ; SPACE 32
    times 32 db 0
debug_call_depth:
    ; DCQ 0
    dq 0
    ; ALIGN 8
align 8
debug_vmsave_stack:
    ; SPACE 288
    times 288 db 0
debug_ret_cfa:
    ; DCQ XDBG_CALL_DONE
    dq XDBG_CALL_DONE
debug_ret_ipcell:
    ; DCQ debug_ret_cfa
    dq debug_ret_cfa
debug_skip_nl:
    ; DCQ 0
    dq 0
debug_xt:
    ; DCQ 0
    dq 0
debug_inline:
    ; DCQ 0
    dq 0
debug_ip:
    ; DCQ 0
    dq 0
debug_cfa:
    ; DCQ 0
    dq 0
debug_body_cells:
    ; DCQ 0
    dq 0
debug_scnt:
    ; DCQ 0
    dq 0
debug_sbuf:
    ; SPACE 128
    times 128 db 0
debug_rcnt:
    ; DCQ 0
    dq 0
debug_rbuf:
    ; SPACE 128
    times 128 db 0
debug_name:
    ; SPACE 32
    times 32 db 0
debug_rlab:
    ; SPACE 512
    times 512 db 0
debug_dsave_tos:
    ; DCQ 0
    dq 0
debug_dsave_dsp:
    ; DCQ 0
    dq 0
debug_dsave_n:
    ; DCQ 0
    dq 0
debug_dsave_buf:
    ; SPACE 512
    times 512 db 0
    ; ALIGN 8
align 8
debug_nest_rstack:
    ; SPACE 16384
    times 16384 db 0
view_src_id:
    ; DCQ 0
    dq 0
view_file_n:
    ; DCQ 0
    dq 0
view_paths:
    ; SPACE 65536
    times 65536 db 0
view_id_sp:
    ; DCQ 0
    dq 0
view_id_stack:
    ; SPACE 64
    times 64 db 0
include_name_len:
    ; DCQ 0
    dq 0
include_name_pending:
    ; SPACE 256
    times 256 db 0
