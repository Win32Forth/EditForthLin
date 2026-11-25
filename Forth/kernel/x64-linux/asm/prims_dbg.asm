; Generated from Forth/kernel/arm64/prims_dbg.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
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
extern console_task
extern data_stack
extern here_ptr
extern host_debug_get_span
extern host_debug_paint
extern host_debug_set_span
extern key_fn
extern latest_var
extern return_stack
extern throw_handler
extern tw_continue_cell
extern tw_continue_cfa
extern up_var
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
    ; lea x1, console_task
    lea rax, [rel console_task]
    mov qword [r15+8], rax
    ; cmp     x27, x1
    mov rax, qword [r15+216]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    nd_console
    cmp byte [r15+249], 0
    jne nd_console
    ; cbz     x27, nd_console
    mov rax, qword [r15+216]
    cmp rax, 0
    je nd_console
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
nd_console:
    ; lea x1, debug_busy
    lea rax, [rel debug_busy]
    mov qword [r15+8], rax
    ; ldr     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbnz    x2, nd_exec
    mov rax, qword [r15+16]
    cmp rax, 0
    jne nd_exec
    ; lea x2, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+16], rax
    ; ldr     x3, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cbz     x3, nd_floor
    mov rax, qword [r15+24]
    cmp rax, 0
    je nd_floor
    ; ldr     x21, [x19]
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    ; mov     x3, #1
    mov rax, 1
    mov qword [r15+24], rax
    ; mov     x28, x3
    mov rax, qword [r15+24]
    mov qword [r15+224], rax
    ; lea x4, debug_armed
    lea rax, [rel debug_armed]
    mov qword [r15+32], rax
    ; ldr     x5, [x4]
    mov r10, qword [r15+32]
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; str     x3, [x4]
    mov r10, qword [r15+32]
    mov rax, qword [r15+24]
    mov qword [r10], rax
    ; cbnz    x5, nd_asap_floor
    mov rax, qword [r15+40]
    cmp rax, 0
    jne nd_asap_floor
    ; lea x4, debug_need_intro
    lea rax, [rel debug_need_intro]
    mov qword [r15+32], rax
    ; str     x3, [x4]
    mov r10, qword [r15+32]
    mov rax, qword [r15+24]
    mov qword [r10], rax
nd_asap_floor:
    ; lea x4, debug_floor
    lea rax, [rel debug_floor]
    mov qword [r15+32], rax
    ; str     xzr, [x4]
    mov r10, qword [r15+32]
    mov qword [r10], 0
    ; lea x4, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+32], rax
    ; str     xzr, [x4]
    mov r10, qword [r15+32]
    mov qword [r10], 0
    ; lea x4, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [r15+32], rax
    ; str     xzr, [x4]
    mov r10, qword [r15+32]
    mov qword [r10], 0
    ; lea x4, debug_over
    lea rax, [rel debug_over]
    mov qword [r15+32], rax
    ; str     xzr, [x4]
    mov r10, qword [r15+32]
    mov qword [r10], 0
    ; lea x4, debug_out
    lea rax, [rel debug_out]
    mov qword [r15+32], rax
    ; str     xzr, [x4]
    mov r10, qword [r15+32]
    mov qword [r10], 0
    ; lea x4, debug_break_min_cfa
    lea rax, [rel debug_break_min_cfa]
    mov qword [r15+32], rax
    ; ldr     x4, [x4]
    mov r10, qword [r15+32]
    mov rax, qword [r10]
    mov qword [r15+32], rax
    ; cbz     x4, nd_asap_hit
    mov rax, qword [r15+32]
    cmp rax, 0
    je nd_asap_hit
    ; mov     x0, x19
    mov rax, qword [r15+152]
    mov qword [r15+0], rax
    ; mov     x1, x21
    mov rax, qword [r15+168]
    mov qword [r15+8], rax
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_resolve_enclosing
    lea rax, [rel xret_1]
    mov qword [r15+240], rax
    jmp _debug_resolve_enclosing
    xret_1:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; cbz     x0, nd_exec
    mov rax, qword [r15+0]
    cmp rax, 0
    je nd_exec
    ; lea x4, debug_break_min_cfa
    lea rax, [rel debug_break_min_cfa]
    mov qword [r15+32], rax
    ; ldr     x4, [x4]
    mov r10, qword [r15+32]
    mov rax, qword [r10]
    mov qword [r15+32], rax
    ; cmp     x0, x4
    mov rax, qword [r15+0]
    mov rcx, qword [r15+32]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    nd_exec
    cmp byte [r15+250], 0
    je nd_exec
nd_asap_hit:
    ; lea x2, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; add     x3, x23, #8
    mov rax, qword [r15+184]
    add rax, 8
    mov qword [r15+24], rax
    ; lea x4, debug_floor
    lea rax, [rel debug_floor]
    mov qword [r15+32], rax
    ; str     x3, [x4]
    mov r10, qword [r15+32]
    mov rax, qword [r15+24]
    mov qword [r10], rax
    ; b       nd_force
    jmp nd_force
nd_floor:
    ; lea x2, debug_floor
    lea rax, [rel debug_floor]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbz     x2, nd_out
    mov rax, qword [r15+16]
    cmp rax, 0
    je nd_out
    ; cmp     x23, x2
    mov rax, qword [r15+184]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    nd_out
    cmp byte [r15+250], 0
    je nd_out
    ; b.eq    nd_exec
    cmp byte [r15+249], 0
    jne nd_exec
    ; mov     x28, #0
    mov rax, 0
    mov qword [r15+224], rax
    ; lea x3, debug_armed
    lea rax, [rel debug_armed]
    mov qword [r15+24], rax
    ; str     xzr, [x3]
    mov r10, qword [r15+24]
    mov qword [r10], 0
    ; lea x3, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+24], rax
    ; str     xzr, [x3]
    mov r10, qword [r15+24]
    mov qword [r10], 0
    ; lea x3, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [r15+24], rax
    ; str     xzr, [x3]
    mov r10, qword [r15+24]
    mov qword [r10], 0
    ; lea x3, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+24], rax
    ; str     xzr, [x3]
    mov r10, qword [r15+24]
    mov qword [r10], 0
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; b       nd_exec
    jmp nd_exec
nd_out:
    ; lea x2, debug_out
    lea rax, [rel debug_out]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbz     x2, nd_over
    mov rax, qword [r15+16]
    cmp rax, 0
    je nd_over
    ; cmp     x23, x2
    mov rax, qword [r15+184]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    nd_exec
    cmp byte [r15+250], 0
    je nd_exec
    cmp byte [r15+249], 0
    jne nd_exec
nd_over:
    ; lea x2, debug_over
    lea rax, [rel debug_over]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbz     x2, nd_peek
    mov rax, qword [r15+16]
    cmp rax, 0
    je nd_peek
    ; cmp     x23, x2
    mov rax, qword [r15+184]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    nd_exec
    cmp byte [r15+250], 0
    je nd_exec
nd_peek:
    ; ldr     x21, [x19]
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    ; lea x2, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [r15+16], rax
    ; ldr     x3, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cbz     x3, nd_bp
    mov rax, qword [r15+24]
    cmp rax, 0
    je nd_bp
    ; cmp     x19, x3
    mov rax, qword [r15+152]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    nd_runto_miss
    cmp byte [r15+249], 0
    je nd_runto_miss
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; lea x2, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; b       nd_force
    jmp nd_force
nd_runto_miss:
    ; lea x2, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+16], rax
    ; ldr     x3, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cbz     x3, nd_exec
    mov rax, qword [r15+24]
    cmp rax, 0
    je nd_exec
    ; b       nd_scan
    jmp nd_scan
nd_bp:
    ; lea x2, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+16], rax
    ; ldr     x3, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cbz     x3, nd_force
    mov rax, qword [r15+24]
    cmp rax, 0
    je nd_force
nd_scan:
    ; lea x3, debug_bp_xts
    lea rax, [rel debug_bp_xts]
    mov qword [r15+24], rax
    ; lea x6, debug_bp_en
    lea rax, [rel debug_bp_en]
    mov qword [r15+48], rax
    ; mov     x4, #8
    mov rax, 8
    mov qword [r15+32], rax
nd_scan_loop:
    ; ldr     x5, [x3], #8
    mov r10, qword [r15+24]
    mov rax, qword [r10]
    mov qword [r15+40], rax
    mov rax, qword [r15+24]
    add rax, 8
    mov qword [r15+24], rax
    ; ldr     x7, [x6], #8
    mov r10, qword [r15+48]
    mov rax, qword [r10]
    mov qword [r15+56], rax
    mov rax, qword [r15+48]
    add rax, 8
    mov qword [r15+48], rax
    ; cbz     x5, nd_scan_next
    mov rax, qword [r15+40]
    cmp rax, 0
    je nd_scan_next
    ; cbz     x7, nd_scan_next
    mov rax, qword [r15+56]
    cmp rax, 0
    je nd_scan_next
    ; cmp     x5, x21
    mov rax, qword [r15+40]
    mov rcx, qword [r15+168]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    nd_scan_hit
    cmp byte [r15+249], 0
    jne nd_scan_hit
nd_scan_next:
    ; subs    x4, x4, #1
    mov rax, qword [r15+32]
    sub rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    mov qword [r15+32], rax
    ; b.ne    nd_scan_loop
    cmp byte [r15+249], 0
    je nd_scan_loop
    ; b       nd_exec
    jmp nd_exec
nd_scan_hit:
    ; lea x2, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; lea x3, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [r15+24], rax
    ; str     xzr, [x3]
    mov r10, qword [r15+24]
    mov qword [r10], 0
nd_force:
    ; ldr     x2, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; lea x3, XCATCH_OK
    lea rax, [rel XCATCH_OK]
    mov qword [r15+24], rax
    ; cmp     x2, x3
    mov rax, qword [r15+16]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    nd_exec
    cmp byte [r15+249], 0
    jne nd_exec
    ; lea x3, XDBGOFF
    lea rax, [rel XDBGOFF]
    mov qword [r15+24], rax
    ; cmp     x2, x3
    mov rax, qword [r15+16]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    nd_exec
    cmp byte [r15+249], 0
    jne nd_exec
    ; lea x2, debug_over
    lea rax, [rel debug_over]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; lea x2, debug_out
    lea rax, [rel debug_out]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; lea x1, debug_busy
    lea rax, [rel debug_busy]
    mov qword [r15+8], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [r15+16], rax
    ; str     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+16]
    mov qword [r10], rax
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_pause
    lea rax, [rel xret_2]
    mov qword [r15+240], rax
    jmp _debug_pause
    xret_2:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; lea x1, debug_busy
    lea rax, [rel debug_busy]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, debug_abort
    lea rax, [rel debug_abort]
    mov qword [r15+8], rax
    ; ldr     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbz     x2, nd_exec
    mov rax, qword [r15+16]
    cmp rax, 0
    je nd_exec
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; mov     x20, x2
    mov rax, qword [r15+16]
    mov qword [r15+160], rax
    ; b       XTHROW
    jmp XTHROW
nd_exec:
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_show_xt
    lea rax, [rel debug_show_xt]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_sync_ok
    lea rax, [rel debug_sync_ok]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_hl_xt
    lea rax, [rel debug_hl_xt]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_wheel_xt
    lea rax, [rel debug_wheel_xt]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_pause_xt
    lea rax, [rel debug_pause_xt]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_key_xt
    lea rax, [rel debug_key_xt]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_inline
    lea rax, [rel debug_inline]
    mov qword [r15+160], rax
    ; ldr     x20, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r10]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x0, debug_scnt
    lea rax, [rel debug_scnt]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, dbg_tos_empty
    mov rax, qword [r15+0]
    cmp rax, 0
    je dbg_tos_empty
    ; lea x1, debug_sbuf
    lea rax, [rel debug_sbuf]
    mov qword [r15+8], rax
    ; sub     x0, x0, #1
    mov rax, qword [r15+0]
    sub rax, 1
    mov qword [r15+0], rax
    ; ldr     x20, [x1, x0, lsl #3]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
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
dbg_tos_empty:
    ; mov     x20, #0
    mov rax, 0
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_xt
    lea rax, [rel debug_xt]
    mov qword [r15+160], rax
    ; ldr     x20, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r10]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_ip
    lea rax, [rel debug_ip]
    mov qword [r15+160], rax
    ; ldr     x20, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r10]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_cfa
    lea rax, [rel debug_cfa]
    mov qword [r15+160], rax
    ; ldr     x20, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r10]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_body_cells
    lea rax, [rel debug_body_cells]
    mov qword [r15+160], rax
    ; ldr     x20, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r10]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_need_intro
    lea rax, [rel debug_need_intro]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_need_stacks
    lea rax, [rel debug_need_stacks]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_help_shown
    lea rax, [rel debug_help_shown]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_skip_nl
    lea rax, [rel debug_skip_nl]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_midline
    lea rax, [rel debug_midline]
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
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, debug_line_col
    lea rax, [rel debug_line_col]
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+184]
    mov qword [r10+0], rax
    mov rax, qword [r15+192]
    mov qword [r10+8], rax
    ; lea x0, debug_busy
    lea rax, [rel debug_busy]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, dbg_sr_live
    mov rax, qword [r15+0]
    cmp rax, 0
    je dbg_sr_live
    ; lea x0, debug_pause_rsp
    lea rax, [rel debug_pause_rsp]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, dbg_sr_live
    mov rax, qword [r15+0]
    cmp rax, 0
    je dbg_sr_live
    ; mov     x23, x0
    mov rax, qword [r15+0]
    mov qword [r15+184], rax
dbg_sr_live:
    ; bl      _debug_pad_to_stack_col
    lea rax, [rel xret_3]
    mov qword [r15+240], rax
    jmp _debug_pad_to_stack_col
    xret_3:
    ; bl      _debug_print_SR
    lea rax, [rel xret_4]
    mov qword [r15+240], rax
    jmp _debug_print_SR
    xret_4:
    ; ldp     x23, x24, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+184], rax
    mov qword [r15+192], rcx
    add rsp, 0x10
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_on
    lea rax, [rel xret_5]
    mov qword [r15+240], rax
    jmp _debug_cursor_on
    xret_5:
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_6]
    mov qword [r15+240], rax
    jmp _debug_cursor_off
    xret_6:
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_print_inline_suffix
    lea rax, [rel xret_7]
    mov qword [r15+240], rax
    jmp _debug_print_inline_suffix
    xret_7:
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _print_xt_name
    lea rax, [rel xret_8]
    mov qword [r15+240], rax
    jmp _print_xt_name
    xret_8:
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _debug_xt_intoable
    lea rax, [rel xret_9]
    mov qword [r15+240], rax
    jmp _debug_xt_intoable
    xret_9:
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
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
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      host_debug_set_span
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
    call host_debug_set_span
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; mov     x0, sp
    mov rax, rsp
    mov qword [r15+0], rax
    ; add     x1, sp, #8
    mov rax, rsp
    add rax, 8
    mov qword [r15+8], rax
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
    call host_debug_get_span
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x1, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; ldr     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; ldp     x29, x30, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #32
    mov rax, rsp
    add rax, 0x20
    mov rsp, rax
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
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x20, x2
    mov rax, qword [r15+16]
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+168]
    mov qword [r10+0], rax
    mov rax, qword [r15+176]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+184]
    mov qword [r10+0], rax
    mov rax, qword [r15+192]
    mov qword [r10+8], rax
    ; bl      _debug_sync_view
    lea rax, [rel xret_10]
    mov qword [r15+240], rax
    jmp _debug_sync_view
    xret_10:
    ; bl      _debug_highlight
    lea rax, [rel xret_11]
    mov qword [r15+240], rax
    jmp _debug_highlight
    xret_11:
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x23, x24, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+184], rax
    mov qword [r15+192], rcx
    add rsp, 0x10
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+168], rax
    mov qword [r15+176], rcx
    add rsp, 0x10
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
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+168]
    mov qword [r10+0], rax
    mov rax, qword [r15+176]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+184]
    mov qword [r10+0], rax
    mov rax, qword [r15+192]
    mov qword [r10+8], rax
    ; bl      _debug_wheel
    lea rax, [rel xret_12]
    mov qword [r15+240], rax
    jmp _debug_wheel
    xret_12:
    ; ldp     x23, x24, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+184], rax
    mov qword [r15+192], rcx
    add rsp, 0x10
    ; ldp     x21, x22, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+168], rax
    mov qword [r15+176], rcx
    add rsp, 0x10
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_13]
    mov qword [r15+240], rax
    jmp _debug_cursor_off
    xret_13:
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x0, debug_xt
    lea rax, [rel debug_xt]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, dbg_over_done
    mov rax, qword [r15+0]
    cmp rax, 0
    je dbg_over_done
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; lea x2, DOCOL
    lea rax, [rel DOCOL]
    mov qword [r15+16], rax
    ; cmp     x0, x2
    mov rax, qword [r15+0]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    dbg_over_done
    cmp byte [r15+249], 0
    je dbg_over_done
    ; lea x0, debug_pause_rsp
    lea rax, [rel debug_pause_rsp]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
dbg_over_done:
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_14]
    mov qword [r15+240], rax
    jmp _debug_cursor_off
    xret_14:
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_15]
    mov qword [r15+240], rax
    jmp _debug_cursor_off
    xret_15:
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x1, debug_over
    lea rax, [rel debug_over]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, debug_out
    lea rax, [rel debug_out]
    mov qword [r15+8], rax
    ; lea x0, debug_pause_rsp
    lea rax, [rel debug_pause_rsp]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_16]
    mov qword [r15+240], rax
    jmp _debug_cursor_off
    xret_16:
    ; bl      _debug_clear_step
    lea rax, [rel xret_17]
    mov qword [r15+240], rax
    jmp _debug_clear_step
    xret_17:
    ; lea x1, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+8], rax
    ; ldr     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbnz    x0, dbg_go_keep
    mov rax, qword [r15+0]
    cmp rax, 0
    jne dbg_go_keep
    ; lea x1, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [r15+8], rax
    ; ldr     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbnz    x0, dbg_go_keep
    mov rax, qword [r15+0]
    cmp rax, 0
    jne dbg_go_keep
    ; mov     x28, #0
    mov rax, 0
    mov qword [r15+224], rax
    ; lea x1, debug_armed
    lea rax, [rel debug_armed]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
dbg_go_keep:
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _debug_cursor_off
    lea rax, [rel xret_18]
    mov qword [r15+240], rax
    jmp _debug_cursor_off
    xret_18:
    ; bl      _debug_clear_step
    lea rax, [rel xret_19]
    mov qword [r15+240], rax
    jmp _debug_clear_step
    xret_19:
    ; lea x0, str_dbg_abort
    lea rax, [rel str_dbg_abort]
    mov qword [r15+0], rax
    ; bl      _emit_z
    lea rax, [rel xret_20]
    mov qword [r15+240], rax
    jmp _emit_z
    xret_20:
    ; bl      _debug_disarm
    lea rax, [rel xret_21]
    mov qword [r15+240], rax
    jmp _debug_disarm
    xret_21:
    ; bl      host_debug_paint
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
    call host_debug_paint
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
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
    mov qword [r15+0], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
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
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
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
    mov qword [r15+0], rax
    ; str     x23, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+184]
    mov qword [r10], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; mov     x28, x1
    mov rax, qword [r15+8]
    mov qword [r15+224], rax
    ; lea x0, debug_armed
    lea rax, [rel debug_armed]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x0, debug_bp_go
    lea rax, [rel debug_bp_go]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_runto_ip
    lea rax, [rel debug_runto_ip]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_runto_off
    lea rax, [rel debug_runto_off]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_runto_status
    lea rax, [rel debug_runto_status]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_over
    lea rax, [rel debug_over]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_out
    lea rax, [rel debug_out]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_abort
    lea rax, [rel debug_abort]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_view_cfa
    lea rax, [rel debug_view_cfa]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_skip_nl
    lea rax, [rel debug_skip_nl]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x0, debug_midline
    lea rax, [rel debug_midline]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_help_shown
    lea rax, [rel debug_help_shown]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_cursor_on
    lea rax, [rel debug_cursor_on]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_need_stacks
    lea rax, [rel debug_need_stacks]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_need_intro
    lea rax, [rel debug_need_intro]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x0, debug_line_col
    lea rax, [rel debug_line_col]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_stack_anchor
    lea rax, [rel debug_stack_anchor]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_ip
    lea rax, [rel debug_ip]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_cfa
    lea rax, [rel debug_cfa]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_body_cells
    lea rax, [rel debug_body_cells]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_call_depth
    lea rax, [rel debug_call_depth]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
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
    mov qword [r15+224], rax
    ; lea x0, debug_armed
    lea rax, [rel debug_armed]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_call_depth
    lea rax, [rel debug_call_depth]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_midline
    lea rax, [rel debug_midline]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, debug_help_shown
    lea rax, [rel debug_help_shown]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
