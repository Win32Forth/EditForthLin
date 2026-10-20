; Generated from Forth/kernel/arm64/prims_k2.asm. Do not edit.
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
extern XROLL
extern XTYPE
extern _arm_lines
extern _compile_cell
extern _cursor_commit
extern _cursor_load
extern _do_quit
extern _eval_resume_push
extern _file_op_call
extern _find_word
extern _float_op_call
extern _getchar
extern _interpret_empty
extern _interpret_loop
extern _local_add_name
extern _local_compile_reset
extern _local_finalize_compile
extern _local_lookup
extern _next_word
extern _push_source
extern _putchar
extern _quit_exit
extern _sa_print_unsigned
extern _sa_putchar
extern _take_line
extern _view_push_src_id
extern _view_set_src_from_pending
extern base_var
extern blk_var
extern block_buf
extern block_file
extern block_nr
extern block_upd
extern bootptr_end
extern bootptr_start
extern catch_ok_cell
extern cfa_comma
extern cfa_execute
extern cfa_exit
extern cfa_flit
extern cfa_lit
extern cfa_local_store
extern cfa_slit
extern current_var
extern data_stack
extern debug_break_asap
extern debug_busy
extern emit_cstr
extern emit_str
extern eval_resume_sp
extern facility_op_hook
extern file_echo
extern forget_cut
extern grow_memory_used
extern here_ptr
extern host_accept
extern host_alloc
extern host_alloc_exec
extern host_begin_load
extern host_bi_divmod
extern host_bi_isqrt
extern host_bi_mul
extern host_chdir
extern host_clip_get
extern host_clip_set
extern host_cwd
extern host_dir
extern host_dot_included
extern host_edit
extern host_edit_at
extern host_end_load
extern host_facility_xy
extern host_free
extern host_free_exec
extern host_fromlib
extern host_fromlib_off
extern host_fromlib_query
extern host_icache_inval
extern host_include_dialog
extern host_last_included
extern host_library_path
extern host_mprotect
extern host_ms
extern host_native_ret7
extern host_pwd
extern host_read
extern host_register
extern host_repos
extern host_resize
extern host_resolve
extern host_sleep
extern host_system
extern host_time_date
extern host_was_included
extern include_name_len
extern include_name_pending
extern jit_exec_mode
extern key_fn
extern latest_var
extern library_path_buf
extern line_limit
extern line_mode
extern line_next
extern local_declaring
extern local_init_count
extern local_init_reverse
extern msg_allot
extern msg_huh
extern native_dsp_end
extern next_debug
extern pad_buffer
extern redef_warn
extern resolve_buf
extern scr_var
extern search_order
extern search_order_n
extern source_base
extern source_cur
extern source_end
extern source_id
extern source_sp
extern state_var
extern throw_handler
extern to_in
extern tw_continue_cell
extern user_dict_area
extern user_dict_size_cell
extern wordlist_reg
extern wordlist_reg_n
extern words_user_base
section .text
global XCATCH
global XCATCH_OK
global XTW_CONTINUE
global XEXECUTE
global _udivmod128
section .bwstr align=1
nm_XTUCK:
    ; DCB "TUCK", 0
    db "TUCK", 0
hl_XTUCK:
    ; DCB "TUCK ( x1 x2 -- x2 x1 x2 ) copy TOS under the second", 0
    db "TUCK ( x1 x2 -- x2 x1 x2 ) copy TOS under the second", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTUCK:
    ; DCQ     nm_XTUCK, hl_XTUCK
    dq nm_XTUCK, hl_XTUCK
    ; DCQ     0
    dq 0
    ; DCQ     XTUCK, XTUCK_END
    dq XTUCK, XTUCK_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTUCK
    dq row_XTUCK
section .text
XTUCK:
    ; ldr     x0, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x20, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
XTUCK_END:
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
nm_XPICK:
    ; DCB "PICK", 0
    db "PICK", 0
hl_XPICK:
    ; DCB "PICK ( xu ... x0 u -- xu ... x0 xu ) copy the uth cell", 0
    db "PICK ( xu ... x0 u -- xu ... x0 xu ) copy the uth cell", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPICK:
    ; DCQ     nm_XPICK, hl_XPICK
    dq nm_XPICK, hl_XPICK
    ; DCQ     0
    dq 0
    ; DCQ     XPICK, XPICK_END
    dq XPICK, XPICK_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPICK
    dq row_XPICK
section .text
XPICK:
    ; lsl     x0, x20, #3
    mov rax, qword [rel arm_x20]
    shl rax, 3
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x22, x0]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XPICK_END:
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
nm_X2TOR:
    ; DCB "2>R", 0
    db "2>R", 0
hl_X2TOR:
    ; DCB "2>R ( n1 n2 -- ) two to the return stack", 0
    db "2>R ( n1 n2 -- ) two to the return stack", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_X2TOR:
    ; DCQ     nm_X2TOR, hl_X2TOR
    dq nm_X2TOR, hl_X2TOR
    ; DCQ     0
    dq 0
    ; DCQ     X2TOR, X2TOR_END
    dq X2TOR, X2TOR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_X2TOR
    dq row_X2TOR
section .text
X2TOR:
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
X2TOR_END:
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
nm_X2RTO:
    ; DCB "2R>", 0
    db "2R>", 0
hl_X2RTO:
    ; DCB "2R> ( -- n1 n2 ) two from the return stack", 0
    db "2R> ( -- n1 n2 ) two from the return stack", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_X2RTO:
    ; DCQ     nm_X2RTO, hl_X2RTO
    dq nm_X2RTO, hl_X2RTO
    ; DCQ     0
    dq 0
    ; DCQ     X2RTO, X2RTO_END
    dq X2RTO, X2RTO_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_X2RTO
    dq row_X2RTO
section .text
X2RTO:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
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
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
X2RTO_END:
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
nm_X2RFETCH:
    ; DCB "2R@", 0
    db "2R@", 0
hl_X2RFETCH:
    ; DCB "2R@ ( -- n1 n2 ) copy two from the return stack", 0
    db "2R@ ( -- n1 n2 ) copy two from the return stack", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_X2RFETCH:
    ; DCQ     nm_X2RFETCH, hl_X2RFETCH
    dq nm_X2RFETCH, hl_X2RFETCH
    ; DCQ     0
    dq 0
    ; DCQ     X2RFETCH, X2RFETCH_END
    dq X2RFETCH, X2RFETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_X2RFETCH
    dq row_X2RFETCH
section .text
X2RFETCH:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x0, [x23]
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x23, #8]
    mov r10, qword [rel arm_x23]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
X2RFETCH_END:
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
nm_XTWOROT:
    ; DCB "2ROT", 0
    db "2ROT", 0
hl_XTWOROT:
    ; DCB "2ROT ( x1 x2 x3 x4 x5 x6 -- x3 x4 x5 x6 x1 x2 ) rotate three pairs", 0
    db "2ROT ( x1 x2 x3 x4 x5 x6 -- x3 x4 x5 x6 x1 x2 ) rotate three pairs", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTWOROT:
    ; DCQ     nm_XTWOROT, hl_XTWOROT
    dq nm_XTWOROT, hl_XTWOROT
    ; DCQ     0
    dq 0
    ; DCQ     XTWOROT, XTWOROT_END
    dq XTWOROT, XTWOROT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTWOROT
    dq row_XTWOROT
section .text
XTWOROT:
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x4, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; str     x3, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; str     x4, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x4]
    mov qword [r10], rax
    ; str     x5, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x20], rax
XTWOROT_END:
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
nm_XONEMINUS:
    ; DCB "1-", 0
    db "1-", 0
hl_XONEMINUS:
    ; DCB "1- ( n -- n-1 ) decrement", 0
    db "1- ( n -- n-1 ) decrement", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XONEMINUS:
    ; DCQ     nm_XONEMINUS, hl_XONEMINUS
    dq nm_XONEMINUS, hl_XONEMINUS
    ; DCQ     0
    dq 0
    ; DCQ     XONEMINUS, XONEMINUS_END
    dq XONEMINUS, XONEMINUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XONEMINUS
    dq row_XONEMINUS
section .text
XONEMINUS:
    ; sub     x20, x20, #1
    mov rax, qword [rel arm_x20]
    sub rax, 1
    mov qword [rel arm_x20], rax
XONEMINUS_END:
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
nm_XNEGATE:
    ; DCB "NEGATE", 0
    db "NEGATE", 0
hl_XNEGATE:
    ; DCB "NEGATE ( n -- -n ) negate", 0
    db "NEGATE ( n -- -n ) negate", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNEGATE:
    ; DCQ     nm_XNEGATE, hl_XNEGATE
    dq nm_XNEGATE, hl_XNEGATE
    ; DCQ     0
    dq 0
    ; DCQ     XNEGATE, XNEGATE_END
    dq XNEGATE, XNEGATE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNEGATE
    dq row_XNEGATE
section .text
XNEGATE:
    ; neg     x20, x20
    mov rax, qword [rel arm_x20]
    neg rax
    mov qword [rel arm_x20], rax
XNEGATE_END:
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
nm_XABS:
    ; DCB "ABS", 0
    db "ABS", 0
hl_XABS:
    ; DCB "ABS ( n -- u ) absolute value", 0
    db "ABS ( n -- u ) absolute value", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XABS:
    ; DCQ     nm_XABS, hl_XABS
    dq nm_XABS, hl_XABS
    ; DCQ     0
    dq 0
    ; DCQ     XABS, XABS_END
    dq XABS, XABS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XABS
    dq row_XABS
section .text
XABS:
    ; cmp     x20, #0
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csneg   x20, x20, x20, ge
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_1
    mov rax, qword [rel arm_x20]
    neg rax
    jmp xsk_2
    xsk_1:
    mov rax, qword [rel arm_x20]
    xsk_2:
    mov qword [rel arm_x20], rax
XABS_END:
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
nm_XMIN:
    ; DCB "MIN", 0
    db "MIN", 0
hl_XMIN:
    ; DCB "MIN ( n1 n2 -- min ) minimum", 0
    db "MIN ( n1 n2 -- min ) minimum", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMIN:
    ; DCQ     nm_XMIN, hl_XMIN
    dq nm_XMIN, hl_XMIN
    ; DCQ     0
    dq 0
    ; DCQ     XMIN, XMIN_END
    dq XMIN, XMIN_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMIN
    dq row_XMIN
section .text
XMIN:
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
    ; csel    x20, x0, x20, lt
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne xsk_3
    mov rax, qword [rel arm_x20]
    jmp xsk_4
    xsk_3:
    mov rax, qword [rel arm_x0]
    xsk_4:
    mov qword [rel arm_x20], rax
XMIN_END:
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
nm_XMAX:
    ; DCB "MAX", 0
    db "MAX", 0
hl_XMAX:
    ; DCB "MAX ( n1 n2 -- max ) maximum", 0
    db "MAX ( n1 n2 -- max ) maximum", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMAX:
    ; DCQ     nm_XMAX, hl_XMAX
    dq nm_XMAX, hl_XMAX
    ; DCQ     0
    dq 0
    ; DCQ     XMAX, XMAX_END
    dq XMAX, XMAX_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMAX
    dq row_XMAX
section .text
XMAX:
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
    ; csel    x20, x0, x20, gt
    cmp byte [rel arm_z], 0
    jne xsk_7
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_5
    xsk_7:
    mov rax, qword [rel arm_x20]
    jmp xsk_6
    xsk_5:
    mov rax, qword [rel arm_x0]
    xsk_6:
    mov qword [rel arm_x20], rax
XMAX_END:
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
nm_XXOR:
    ; DCB "XOR", 0
    db "XOR", 0
hl_XXOR:
    ; DCB "XOR ( n1 n2 -- n ) bitwise xor", 0
    db "XOR ( n1 n2 -- n ) bitwise xor", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XXOR:
    ; DCQ     nm_XXOR, hl_XXOR
    dq nm_XXOR, hl_XXOR
    ; DCQ     0
    dq 0
    ; DCQ     XXOR, XXOR_END
    dq XXOR, XXOR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XXOR
    dq row_XXOR
section .text
XXOR:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; eor     x20, x20, x0
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x0]
    xor rax, rcx
    mov qword [rel arm_x20], rax
XXOR_END:
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
nm_XLSHIFT:
    ; DCB "LSHIFT", 0
    db "LSHIFT", 0
hl_XLSHIFT:
    ; DCB "LSHIFT ( n bits -- n ) logical left shift", 0
    db "LSHIFT ( n bits -- n ) logical left shift", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLSHIFT:
    ; DCQ     nm_XLSHIFT, hl_XLSHIFT
    dq nm_XLSHIFT, hl_XLSHIFT
    ; DCQ     0
    dq 0
    ; DCQ     XLSHIFT, XLSHIFT_END
    dq XLSHIFT, XLSHIFT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLSHIFT
    dq row_XLSHIFT
section .text
XLSHIFT:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; lsl     x20, x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    shl rax, cl
    mov qword [rel arm_x20], rax
XLSHIFT_END:
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
nm_XNEQUAL:
    ; DCB "<>", 0
    db "<>", 0
hl_XNEQUAL:
    ; DCB "<> ( n1 n2 -- flag ) not equal", 0
    db "<> ( n1 n2 -- flag ) not equal", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNEQUAL:
    ; DCQ     nm_XNEQUAL, hl_XNEQUAL
    dq nm_XNEQUAL, hl_XNEQUAL
    ; DCQ     0
    dq 0
    ; DCQ     XNEQUAL, XNEQUAL_END
    dq XNEQUAL, XNEQUAL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNEQUAL
    dq row_XNEQUAL
section .text
XNEQUAL:
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
    ; csetm   x20, ne
    xor eax, eax
    cmp byte [rel arm_z], 0
    jne xsk_8
    mov rax, -1
    xsk_8:
    mov qword [rel arm_x20], rax
XNEQUAL_END:
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
nm_XULESS:
    ; DCB "U<", 0
    db "U<", 0
hl_XULESS:
    ; DCB "U< ( u1 u2 -- flag ) unsigned less", 0
    db "U< ( u1 u2 -- flag ) unsigned less", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XULESS:
    ; DCQ     nm_XULESS, hl_XULESS
    dq nm_XULESS, hl_XULESS
    ; DCQ     0
    dq 0
    ; DCQ     XULESS, XULESS_END
    dq XULESS, XULESS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XULESS
    dq row_XULESS
section .text
XULESS:
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
    ; csetm   x20, lo
    xor eax, eax
    cmp byte [rel arm_c], 0
    jne xsk_9
    mov rax, -1
    xsk_9:
    mov qword [rel arm_x20], rax
XULESS_END:
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
nm_XUGREATER:
    ; DCB "U>", 0
    db "U>", 0
hl_XUGREATER:
    ; DCB "U> ( u1 u2 -- flag ) unsigned greater", 0
    db "U> ( u1 u2 -- flag ) unsigned greater", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XUGREATER:
    ; DCQ     nm_XUGREATER, hl_XUGREATER
    dq nm_XUGREATER, hl_XUGREATER
    ; DCQ     0
    dq 0
    ; DCQ     XUGREATER, XUGREATER_END
    dq XUGREATER, XUGREATER_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XUGREATER
    dq row_XUGREATER
section .text
XUGREATER:
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
    ; csetm   x20, hi
    xor eax, eax
    cmp byte [rel arm_c], 0
    je xsk_10
    cmp byte [rel arm_z], 0
    jne xsk_10
    mov rax, -1
    xsk_10:
    mov qword [rel arm_x20], rax
XUGREATER_END:
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
nm_XZLESS:
    ; DCB "0<", 0
    db "0<", 0
hl_XZLESS:
    ; DCB "0< ( n -- flag ) negative?", 0
    db "0< ( n -- flag ) negative?", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XZLESS:
    ; DCQ     nm_XZLESS, hl_XZLESS
    dq nm_XZLESS, hl_XZLESS
    ; DCQ     0
    dq 0
    ; DCQ     XZLESS, XZLESS_END
    dq XZLESS, XZLESS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XZLESS
    dq row_XZLESS
section .text
XZLESS:
    ; cmp     x20, #0
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, lt
    xor eax, eax
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_11
    mov rax, -1
    xsk_11:
    mov qword [rel arm_x20], rax
XZLESS_END:
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
nm_XZNOTEQUAL:
    ; DCB "0<>", 0
    db "0<>", 0
hl_XZNOTEQUAL:
    ; DCB "0<> ( x -- flag ) not zero?", 0
    db "0<> ( x -- flag ) not zero?", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XZNOTEQUAL:
    ; DCQ     nm_XZNOTEQUAL, hl_XZNOTEQUAL
    dq nm_XZNOTEQUAL, hl_XZNOTEQUAL
    ; DCQ     0
    dq 0
    ; DCQ     XZNOTEQUAL, XZNOTEQUAL_END
    dq XZNOTEQUAL, XZNOTEQUAL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XZNOTEQUAL
    dq row_XZNOTEQUAL
section .text
XZNOTEQUAL:
    ; cmp     x20, #0
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, ne
    xor eax, eax
    cmp byte [rel arm_z], 0
    jne xsk_12
    mov rax, -1
    xsk_12:
    mov qword [rel arm_x20], rax
XZNOTEQUAL_END:
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
nm_XZGREATER:
    ; DCB "0>", 0
    db "0>", 0
hl_XZGREATER:
    ; DCB "0> ( n -- flag ) positive?", 0
    db "0> ( n -- flag ) positive?", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XZGREATER:
    ; DCQ     nm_XZGREATER, hl_XZGREATER
    dq nm_XZGREATER, hl_XZGREATER
    ; DCQ     0
    dq 0
    ; DCQ     XZGREATER, XZGREATER_END
    dq XZGREATER, XZGREATER_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XZGREATER
    dq row_XZGREATER
section .text
XZGREATER:
    ; cmp     x20, #0
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, gt
    xor eax, eax
    cmp byte [rel arm_z], 0
    jne xsk_13
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne xsk_13
    mov rax, -1
    xsk_13:
    mov qword [rel arm_x20], rax
XZGREATER_END:
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
nm_XWITHIN:
    ; DCB "WITHIN", 0
    db "WITHIN", 0
hl_XWITHIN:
    ; DCB "WITHIN ( n1 n2 n3 -- flag ) n2 <= n1 < n3 with unsigned wrap", 0
    db "WITHIN ( n1 n2 n3 -- flag ) n2 <= n1 < n3 with unsigned wrap", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XWITHIN:
    ; DCQ     nm_XWITHIN, hl_XWITHIN
    dq nm_XWITHIN, hl_XWITHIN
    ; DCQ     0
    dq 0
    ; DCQ     XWITHIN, XWITHIN_END
    dq XWITHIN, XWITHIN_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XWITHIN
    dq row_XWITHIN
section .text
XWITHIN:
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
    ; sub     x1, x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; sub     x20, x20, x2
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x2]
    sub rax, rcx
    mov qword [rel arm_x20], rax
    ; cmp     x1, x20
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, lo
    xor eax, eax
    cmp byte [rel arm_c], 0
    jne xsk_14
    mov rax, -1
    xsk_14:
    mov qword [rel arm_x20], rax
XWITHIN_END:
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
nm_XTRUE:
    ; DCB "TRUE", 0
    db "TRUE", 0
hl_XTRUE:
    ; DCB "TRUE ( -- -1 ) true flag", 0
    db "TRUE ( -- -1 ) true flag", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTRUE:
    ; DCQ     nm_XTRUE, hl_XTRUE
    dq nm_XTRUE, hl_XTRUE
    ; DCQ     0
    dq 0
    ; DCQ     XTRUE, XTRUE_END
    dq XTRUE, XTRUE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTRUE
    dq row_XTRUE
section .text
XTRUE:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #-1
    mov rax, -1
    mov qword [rel arm_x20], rax
XTRUE_END:
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
nm_XFALSE:
    ; DCB "FALSE", 0
    db "FALSE", 0
hl_XFALSE:
    ; DCB "FALSE ( -- 0 ) false flag", 0
    db "FALSE ( -- 0 ) false flag", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFALSE:
    ; DCQ     nm_XFALSE, hl_XFALSE
    dq nm_XFALSE, hl_XFALSE
    ; DCQ     0
    dq 0
    ; DCQ     XFALSE, XFALSE_END
    dq XFALSE, XFALSE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFALSE
    dq row_XFALSE
section .text
XFALSE:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XFALSE_END:
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
nm_XPLUSSTORE:
    ; DCB "+!", 0
    db "+!", 0
hl_XPLUSSTORE:
    ; DCB "+! ( n addr -- ) add to memory", 0
    db "+! ( n addr -- ) add to memory", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPLUSSTORE:
    ; DCQ     nm_XPLUSSTORE, hl_XPLUSSTORE
    dq nm_XPLUSSTORE, hl_XPLUSSTORE
    ; DCQ     0
    dq 0
    ; DCQ     XPLUSSTORE, XPLUSSTORE_END
    dq XPLUSSTORE, XPLUSSTORE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPLUSSTORE
    dq row_XPLUSSTORE
section .text
XPLUSSTORE:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x1, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; add     x1, x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x1], rax
    ; str     x1, [x20]
    mov r10, qword [rel arm_x20]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XPLUSSTORE_END:
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
nm_XPAD:
    ; DCB "PAD", 0
    db "PAD", 0
hl_XPAD:
    ; DCB "PAD ( -- addr ) transient scratch of 1024 bytes", 0
    db "PAD ( -- addr ) transient scratch of 1024 bytes", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPAD:
    ; DCQ     nm_XPAD, hl_XPAD
    dq nm_XPAD, hl_XPAD
    ; DCQ     0
    dq 0
    ; DCQ     XPAD, XPAD_END
    dq XPAD, XPAD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPAD
    dq row_XPAD
section .text
XPAD:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, pad_buffer
    lea rax, [rel pad_buffer]
    mov qword [rel arm_x0], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XPAD_END:
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
nm_XUNUSED:
    ; DCB "UNUSED", 0
    db "UNUSED", 0
hl_XUNUSED:
    ; DCB "UNUSED ( -- u ) bytes from HERE to the dictionary end", 0
    db "UNUSED ( -- u ) bytes from HERE to the dictionary end", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XUNUSED:
    ; DCQ     nm_XUNUSED, hl_XUNUSED
    dq nm_XUNUSED, hl_XUNUSED
    ; DCQ     0
    dq 0
    ; DCQ     XUNUSED, XUNUSED_END
    dq XUNUSED, XUNUSED_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XUNUSED
    dq row_XUNUSED
section .text
XUNUSED:
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [rel arm_x0], rax
    ; lea x2, user_dict_size_cell
    lea rax, [rel user_dict_size_cell]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; add     x0, x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; subs    x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x0], rax
    ; b.hs    _unused_ok
    cmp byte [rel arm_c], 0
    jne _unused_ok
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
_unused_ok:
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
XUNUSED_END:
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
nm_XUSER_DICT:
    ; DCB "USER-DICT", 0
    db "USER-DICT", 0
hl_XUSER_DICT:
    ; DCB "USER-DICT ( -- addr ) base of user dictionary", 0
    db "USER-DICT ( -- addr ) base of user dictionary", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XUSER_DICT:
    ; DCQ     nm_XUSER_DICT, hl_XUSER_DICT
    dq nm_XUSER_DICT, hl_XUSER_DICT
    ; DCQ     0
    dq 0
    ; DCQ     XUSER_DICT, 0
    dq XUSER_DICT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XUSER_DICT
    dq row_XUSER_DICT
section .text
XUSER_DICT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [rel arm_x0], rax
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
nm_XGROWMEMORYMB:
    ; DCB "GROWMEMORYMB", 0
    db "GROWMEMORYMB", 0
hl_XGROWMEMORYMB:
    ; DCB "GROWMEMORYMB ( n -- ) grow user dictionary to n MiB once per session with no shrink and a max of 256", 0
    db "GROWMEMORYMB ( n -- ) grow user dictionary to n MiB once per session with no shrink and a max of 256", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XGROWMEMORYMB:
    ; DCQ     nm_XGROWMEMORYMB, hl_XGROWMEMORYMB
    dq nm_XGROWMEMORYMB, hl_XGROWMEMORYMB
    ; DCQ     0
    dq 0
    ; DCQ     XGROWMEMORYMB, 0
    dq XGROWMEMORYMB, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XGROWMEMORYMB
    dq row_XGROWMEMORYMB
section .text
XGROWMEMORYMB:
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
    ; lea x1, grow_memory_used
    lea rax, [rel grow_memory_used]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbnz    x2, _gmm_already
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    jne _gmm_already
    ; cmp     x0, #1
    mov rax, qword [rel arm_x0]
    cmp rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lt    _gmm_small
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne _gmm_small
    ; cmp     x0, #256
    mov rax, qword [rel arm_x0]
    cmp rax, 0x100
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _gmm_big
    cmp byte [rel arm_c], 0
    je xsk_15
    cmp byte [rel arm_z], 0
    je _gmm_big
    xsk_15:
    ; lsl     x3, x0, #20
    mov rax, qword [rel arm_x0]
    shl rax, 20
    mov qword [rel arm_x3], rax
    ; lea x4, user_dict_size_cell
    lea rax, [rel user_dict_size_cell]
    mov qword [rel arm_x4], rax
    ; ldr     x5, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; cmp     x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _gmm_shrink
    cmp byte [rel arm_c], 0
    je _gmm_shrink
    cmp byte [rel arm_z], 0
    jne _gmm_shrink
    ; str     x3, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
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
_gmm_already:
    ; lea x0, str_gmm_already
    lea rax, [rel str_gmm_already]
    mov qword [rel arm_x0], rax
    ; b       _gmm_fail
    jmp _gmm_fail
_gmm_small:
    ; lea x0, str_gmm_small
    lea rax, [rel str_gmm_small]
    mov qword [rel arm_x0], rax
    ; b       _gmm_fail
    jmp _gmm_fail
_gmm_big:
    ; lea x0, str_gmm_big
    lea rax, [rel str_gmm_big]
    mov qword [rel arm_x0], rax
    ; b       _gmm_fail
    jmp _gmm_fail
_gmm_shrink:
    ; lea x0, str_gmm_shrink
    lea rax, [rel str_gmm_shrink]
    mov qword [rel arm_x0], rax
_gmm_fail:
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
    ; bl      emit_cstr
    lea rax, [rel xret_16]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_16:
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
section .bwstr align=1
nm_XCCOMMA:
    ; DCB "C", 0x2C, 0
    db "C", 0x2c, 0
hl_XCCOMMA:
    ; DCB "C", 0x2C, "( b -- ) compile a byte", 0
    db "C", 0x2c, "( b -- ) compile a byte", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCCOMMA:
    ; DCQ     nm_XCCOMMA, hl_XCCOMMA
    dq nm_XCCOMMA, hl_XCCOMMA
    ; DCQ     0
    dq 0
    ; DCQ     XCCOMMA, 0
    dq XCCOMMA, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCCOMMA
    dq row_XCCOMMA
section .text
XCCOMMA:
    ; mov     w0, w20
    mov eax, dword [rel arm_x20]
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
    ; add     x3, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
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
    ; b.lo    _ccomma_fail
    cmp byte [rel arm_c], 0
    je _ccomma_fail
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
    ; b.hi    _ccomma_fail
    cmp byte [rel arm_c], 0
    je xsk_17
    cmp byte [rel arm_z], 0
    je _ccomma_fail
    xsk_17:
    ; strb    w0, [x2]
    mov r10, qword [rel arm_x2]
    mov eax, dword [rel arm_x0]
    mov byte [r10], al
    ; str     x3, [x1]
    mov r10, qword [rel arm_x1]
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
_ccomma_fail:
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
    lea rax, [rel xret_18]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
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
    ; b       _quit_exit
    jmp _quit_exit
section .bwstr align=1
nm_XTWOFETCH:
    ; DCB "2@", 0
    db "2@", 0
hl_XTWOFETCH:
    ; DCB "2@ ( addr -- n1 n2 ) fetch two cells", 0
    db "2@ ( addr -- n1 n2 ) fetch two cells", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTWOFETCH:
    ; DCQ     nm_XTWOFETCH, hl_XTWOFETCH
    dq nm_XTWOFETCH, hl_XTWOFETCH
    ; DCQ     0
    dq 0
    ; DCQ     XTWOFETCH, XTWOFETCH_END
    dq XTWOFETCH, XTWOFETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTWOFETCH
    dq row_XTWOFETCH
section .text
XTWOFETCH:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0, #8]
    mov r10, qword [rel arm_x0]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XTWOFETCH_END:
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
nm_XTWOSTORE:
    ; DCB "2!", 0
    db "2!", 0
hl_XTWOSTORE:
    ; DCB "2! ( n1 n2 addr -- ) store two cells", 0
    db "2! ( n1 n2 addr -- ) store two cells", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTWOSTORE:
    ; DCQ     nm_XTWOSTORE, hl_XTWOSTORE
    dq nm_XTWOSTORE, hl_XTWOSTORE
    ; DCQ     0
    dq 0
    ; DCQ     XTWOSTORE, XTWOSTORE_END
    dq XTWOSTORE, XTWOSTORE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTWOSTORE
    dq row_XTWOSTORE
section .text
XTWOSTORE:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
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
    ; str     x2, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; str     x1, [x0, #8]
    mov r10, qword [rel arm_x0]
    add r10, 8
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XTWOSTORE_END:
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
nm_XI:
    ; DCB "I", 0
    db "I", 0
hl_XI:
    ; DCB "I ( -- n ) current DO loop index", 0
    db "I ( -- n ) current DO loop index", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XI:
    ; DCQ     nm_XI, hl_XI
    dq nm_XI, hl_XI
    ; DCQ     0
    dq 0
    ; DCQ     XI, XI_END
    dq XI, XI_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XI
    dq row_XI
section .text
XI:
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
XI_END:
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
nm_XJ:
    ; DCB "J", 0
    db "J", 0
hl_XJ:
    ; DCB "J ( -- n ) outer DO loop index", 0
    db "J ( -- n ) outer DO loop index", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XJ:
    ; DCQ     nm_XJ, hl_XJ
    dq nm_XJ, hl_XJ
    ; DCQ     0
    dq 0
    ; DCQ     XJ, XJ_END
    dq XJ, XJ_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XJ
    dq row_XJ
section .text
XJ:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x20, [x23, #16]
    mov r10, qword [rel arm_x23]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
XJ_END:
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
nm_XUNLOOP:
    ; DCB "UNLOOP", 0
    db "UNLOOP", 0
hl_XUNLOOP:
    ; DCB "UNLOOP ( -- ) discard the current DO loop", 0
    db "UNLOOP ( -- ) discard the current DO loop", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XUNLOOP:
    ; DCQ     nm_XUNLOOP, hl_XUNLOOP
    dq nm_XUNLOOP, hl_XUNLOOP
    ; DCQ     0
    dq 0
    ; DCQ     XUNLOOP, XUNLOOP_END
    dq XUNLOOP, XUNLOOP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XUNLOOP
    dq row_XUNLOOP
section .text
XUNLOOP:
    ; add     x23, x23, #16
    mov rax, qword [rel arm_x23]
    add rax, 0x10
    mov qword [rel arm_x23], rax
XUNLOOP_END:
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
nm_XSLMOD:
    ; DCB "/MOD", 0
    db "/MOD", 0
hl_XSLMOD:
    ; DCB "/MOD ( n1 n2 -- rem quot ) remainder and quotient", 0
    db "/MOD ( n1 n2 -- rem quot ) remainder and quotient", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSLMOD:
    ; DCQ     nm_XSLMOD, hl_XSLMOD
    dq nm_XSLMOD, hl_XSLMOD
    ; DCQ     0
    dq 0
    ; DCQ     XSLMOD, XSLMOD_END
    dq XSLMOD, XSLMOD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSLMOD
    dq row_XSLMOD
section .text
XSLMOD:
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
    je xdiv0_20
    cmp rcx, -1
    jne xdivov_21
    mov r8, 8000000000000000h
    cmp rax, r8
    je xdiv_19
    xdivov_21:
    cqo
    idiv rcx
    jmp xdiv_19
    xdiv0_20:
    xor eax, eax
    xdiv_19:
    mov qword [rel arm_x1], rax
    ; msub    x2, x1, x20, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    imul rax, rcx
    mov rcx, qword [rel arm_x0]
    sub rcx, rax
    mov rax, rcx
    mov qword [rel arm_x2], rax
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
XSLMOD_END:
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
nm_XUMSTAR:
    ; DCB "UM*", 0
    db "UM*", 0
hl_XUMSTAR:
    ; DCB "UM* ( u1 u2 -- ud ) unsigned double multiply", 0
    db "UM* ( u1 u2 -- ud ) unsigned double multiply", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XUMSTAR:
    ; DCQ     nm_XUMSTAR, hl_XUMSTAR
    dq nm_XUMSTAR, hl_XUMSTAR
    ; DCQ     0
    dq 0
    ; DCQ     XUMSTAR, XUMSTAR_END
    dq XUMSTAR, XUMSTAR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XUMSTAR
    dq row_XUMSTAR
section .text
XUMSTAR:
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
    ; mul     x2, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    imul rax, rcx
    mov qword [rel arm_x2], rax
    ; umulh   x20, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    mul rcx
    mov rax, rdx
    mov qword [rel arm_x20], rax
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
XUMSTAR_END:
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
nm_XMSTAR:
    ; DCB "M*", 0
    db "M*", 0
hl_XMSTAR:
    ; DCB "M* ( n1 n2 -- d ) signed double multiply", 0
    db "M* ( n1 n2 -- d ) signed double multiply", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMSTAR:
    ; DCQ     nm_XMSTAR, hl_XMSTAR
    dq nm_XMSTAR, hl_XMSTAR
    ; DCQ     0
    dq 0
    ; DCQ     XMSTAR, XMSTAR_END
    dq XMSTAR, XMSTAR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMSTAR
    dq row_XMSTAR
section .text
XMSTAR:
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
    ; mul     x2, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    imul rax, rcx
    mov qword [rel arm_x2], rax
    ; smulh   x20, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    imul rcx
    mov rax, rdx
    mov qword [rel arm_x20], rax
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
XMSTAR_END:
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
nm_XDPLUS:
    ; DCB "D+", 0
    db "D+", 0
hl_XDPLUS:
    ; DCB "D+ ( d1 d2 -- d3 ) double add", 0
    db "D+ ( d1 d2 -- d3 ) double add", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDPLUS:
    ; DCQ     nm_XDPLUS, hl_XDPLUS
    dq nm_XDPLUS, hl_XDPLUS
    ; DCQ     0
    dq 0
    ; DCQ     XDPLUS, XDPLUS_END
    dq XDPLUS, XDPLUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDPLUS
    dq row_XDPLUS
section .text
XDPLUS:
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; adds    x1, x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    add rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; adc     x20, x2, x20
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x20]
    mov dl, byte [rel arm_c]
    add dl, 255
    adc rax, rcx
    mov qword [rel arm_x20], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XDPLUS_END:
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
nm_XDNEGATE:
    ; DCB "DNEGATE", 0
    db "DNEGATE", 0
hl_XDNEGATE:
    ; DCB "DNEGATE ( d1 -- d2 ) negate a double", 0
    db "DNEGATE ( d1 -- d2 ) negate a double", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDNEGATE:
    ; DCQ     nm_XDNEGATE, hl_XDNEGATE
    dq nm_XDNEGATE, hl_XDNEGATE
    ; DCQ     0
    dq 0
    ; DCQ     XDNEGATE, XDNEGATE_END
    dq XDNEGATE, XDNEGATE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDNEGATE
    dq row_XDNEGATE
section .text
XDNEGATE:
    ; ldr     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; mov     x0, xzr
    xor eax, eax
    mov qword [rel arm_x0], rax
    ; subs    x1, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; sbc     x20, x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    mov dl, byte [rel arm_c]
    xor dl, 1
    add dl, 255
    sbb rax, rcx
    mov qword [rel arm_x20], rax
    ; str     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XDNEGATE_END:
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
nm_XDABS:
    ; DCB "DABS", 0
    db "DABS", 0
hl_XDABS:
    ; DCB "DABS ( d -- ud ) absolute value of a double", 0
    db "DABS ( d -- ud ) absolute value of a double", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDABS:
    ; DCQ     nm_XDABS, hl_XDABS
    dq nm_XDABS, hl_XDABS
    ; DCQ     0
    dq 0
    ; DCQ     XDABS, XDABS_END
    dq XDABS, XDABS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDABS
    dq row_XDABS
section .text
XDABS:
    ; tbnz    x20, #63, _dabs_neg
    mov rax, qword [rel arm_x20]
    bt rax, 63
    jc _dabs_neg
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
_dabs_neg:
    ; ldr     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; mov     x0, xzr
    xor eax, eax
    mov qword [rel arm_x0], rax
    ; subs    x1, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; sbc     x20, x0, x20
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x20]
    mov dl, byte [rel arm_c]
    xor dl, 1
    add dl, 255
    sbb rax, rcx
    mov qword [rel arm_x20], rax
    ; str     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XDABS_END:
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
nm_XD0LESS:
    ; DCB "D0<", 0
    db "D0<", 0
hl_XD0LESS:
    ; DCB "D0< ( d -- flag ) double negative?", 0
    db "D0< ( d -- flag ) double negative?", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XD0LESS:
    ; DCQ     nm_XD0LESS, hl_XD0LESS
    dq nm_XD0LESS, hl_XD0LESS
    ; DCQ     0
    dq 0
    ; DCQ     XD0LESS, XD0LESS_END
    dq XD0LESS, XD0LESS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XD0LESS
    dq row_XD0LESS
section .text
XD0LESS:
    ; cmp     x20, #0
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, lt
    xor eax, eax
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_22
    mov rax, -1
    xsk_22:
    mov qword [rel arm_x20], rax
    ; add     x22, x22, #8
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XD0LESS_END:
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
nm_XSTOD:
    ; DCB "S>D", 0
    db "S>D", 0
hl_XSTOD:
    ; DCB "S>D ( n -- d ) sign extend single to double", 0
    db "S>D ( n -- d ) sign extend single to double", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSTOD:
    ; DCQ     nm_XSTOD, hl_XSTOD
    dq nm_XSTOD, hl_XSTOD
    ; DCQ     0
    dq 0
    ; DCQ     XSTOD, XSTOD_END
    dq XSTOD, XSTOD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSTOD
    dq row_XSTOD
section .text
XSTOD:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; asr     x20, x20, #63
    mov rax, qword [rel arm_x20]
    sar rax, 63
    mov qword [rel arm_x20], rax
XSTOD_END:
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
nm_XDMINUS:
    ; DCB "D-", 0
    db "D-", 0
hl_XDMINUS:
    ; DCB "D- ( d1 d2 -- d3 ) double subtract", 0
    db "D- ( d1 d2 -- d3 ) double subtract", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDMINUS:
    ; DCQ     nm_XDMINUS, hl_XDMINUS
    dq nm_XDMINUS, hl_XDMINUS
    ; DCQ     0
    dq 0
    ; DCQ     XDMINUS, XDMINUS_END
    dq XDMINUS, XDMINUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDMINUS
    dq row_XDMINUS
section .text
XDMINUS:
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; subs    x1, x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    sub rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; sbc     x20, x2, x20
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x20]
    mov dl, byte [rel arm_c]
    xor dl, 1
    add dl, 255
    sbb rax, rcx
    mov qword [rel arm_x20], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XDMINUS_END:
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
nm_XD2STAR:
    ; DCB "D2*", 0
    db "D2*", 0
hl_XD2STAR:
    ; DCB "D2* ( xd1 -- xd2 ) shift double left 1", 0
    db "D2* ( xd1 -- xd2 ) shift double left 1", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XD2STAR:
    ; DCQ     nm_XD2STAR, hl_XD2STAR
    dq nm_XD2STAR, hl_XD2STAR
    ; DCQ     0
    dq 0
    ; DCQ     XD2STAR, XD2STAR_END
    dq XD2STAR, XD2STAR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XD2STAR
    dq row_XD2STAR
section .text
XD2STAR:
    ; ldr     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lsl     x20, x20, #1
    mov rax, qword [rel arm_x20]
    shl rax, 1
    mov qword [rel arm_x20], rax
    ; orr     x20, x20, x1, lsr #63
    mov rax, qword [rel arm_x20]
    mov rcx, qword [rel arm_x1]
    shr rcx, 63
    or rax, rcx
    mov qword [rel arm_x20], rax
    ; lsl     x1, x1, #1
    mov rax, qword [rel arm_x1]
    shl rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XD2STAR_END:
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
nm_XD2SLASH:
    ; DCB "D2/", 0
    db "D2/", 0
hl_XD2SLASH:
    ; DCB "D2/ ( xd1 -- xd2 ) arithmetic shift double right 1", 0
    db "D2/ ( xd1 -- xd2 ) arithmetic shift double right 1", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XD2SLASH:
    ; DCQ     nm_XD2SLASH, hl_XD2SLASH
    dq nm_XD2SLASH, hl_XD2SLASH
    ; DCQ     0
    dq 0
    ; DCQ     XD2SLASH, XD2SLASH_END
    dq XD2SLASH, XD2SLASH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XD2SLASH
    dq row_XD2SLASH
section .text
XD2SLASH:
    ; ldr     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; extr    x1, x20, x1, #1
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    mov rdx, rcx
    shrd rax, rdx, 1
    mov qword [rel arm_x1], rax
    ; asr     x20, x20, #1
    mov rax, qword [rel arm_x20]
    sar rax, 1
    mov qword [rel arm_x20], rax
    ; str     x1, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XD2SLASH_END:
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
nm_XD0EQUAL:
    ; DCB "D0=", 0
    db "D0=", 0
hl_XD0EQUAL:
    ; DCB "D0= ( xd -- flag ) double equal zero?", 0
    db "D0= ( xd -- flag ) double equal zero?", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XD0EQUAL:
    ; DCQ     nm_XD0EQUAL, hl_XD0EQUAL
    dq nm_XD0EQUAL, hl_XD0EQUAL
    ; DCQ     0
    dq 0
    ; DCQ     XD0EQUAL, XD0EQUAL_END
    dq XD0EQUAL, XD0EQUAL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XD0EQUAL
    dq row_XD0EQUAL
section .text
XD0EQUAL:
    ; ldr     x1, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; orr     x1, x1, x20
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    or rax, rcx
    mov qword [rel arm_x1], rax
    ; cmp     x1, #0
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, eq
    xor eax, eax
    cmp byte [rel arm_z], 0
    je xsk_23
    mov rax, -1
    xsk_23:
    mov qword [rel arm_x20], rax
XD0EQUAL_END:
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
nm_XDEQUAL:
    ; DCB "D=", 0
    db "D=", 0
hl_XDEQUAL:
    ; DCB "D= ( xd1 xd2 -- flag ) double equal?", 0
    db "D= ( xd1 xd2 -- flag ) double equal?", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDEQUAL:
    ; DCQ     nm_XDEQUAL, hl_XDEQUAL
    dq nm_XDEQUAL, hl_XDEQUAL
    ; DCQ     0
    dq 0
    ; DCQ     XDEQUAL, XDEQUAL_END
    dq XDEQUAL, XDEQUAL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDEQUAL
    dq row_XDEQUAL
section .text
XDEQUAL:
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; ccmp    x2, x20, #0, eq
    cmp byte [rel arm_z], 0
    jne xsk_24
    mov byte [rel arm_n], 0
    mov byte [rel arm_z], 0
    mov byte [rel arm_c], 0
    mov byte [rel arm_v], 0
    jmp xsk_25
    xsk_24:
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    xsk_25:
    ; csetm   x20, eq
    xor eax, eax
    cmp byte [rel arm_z], 0
    je xsk_26
    mov rax, -1
    xsk_26:
    mov qword [rel arm_x20], rax
XDEQUAL_END:
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
nm_XDLESS:
    ; DCB "D<", 0
    db "D<", 0
hl_XDLESS:
    ; DCB "D< ( d1 d2 -- flag ) signed double less", 0
    db "D< ( d1 d2 -- flag ) signed double less", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDLESS:
    ; DCQ     nm_XDLESS, hl_XDLESS
    dq nm_XDLESS, hl_XDLESS
    ; DCQ     0
    dq 0
    ; DCQ     XDLESS, XDLESS_END
    dq XDLESS, XDLESS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDLESS
    dq row_XDLESS
section .text
XDLESS:
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; cmp     x2, x20
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lt    _dless_yes
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne _dless_yes
    ; b.gt    _dless_no
    cmp byte [rel arm_z], 0
    jne xsk_27
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _dless_no
    xsk_27:
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, lo
    xor eax, eax
    cmp byte [rel arm_c], 0
    jne xsk_28
    mov rax, -1
    xsk_28:
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
_dless_yes:
    ; mov     x20, #-1
    mov rax, -1
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
_dless_no:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XDLESS_END:
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
nm_XDULESS:
    ; DCB "DU<", 0
    db "DU<", 0
hl_XDULESS:
    ; DCB "DU< ( ud1 ud2 -- flag ) unsigned double less", 0
    db "DU< ( ud1 ud2 -- flag ) unsigned double less", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDULESS:
    ; DCQ     nm_XDULESS, hl_XDULESS
    dq nm_XDULESS, hl_XDULESS
    ; DCQ     0
    dq 0
    ; DCQ     XDULESS, XDULESS_END
    dq XDULESS, XDULESS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDULESS
    dq row_XDULESS
section .text
XDULESS:
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; cmp     x2, x20
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _duless_yes
    cmp byte [rel arm_c], 0
    je _duless_yes
    ; b.hi    _duless_no
    cmp byte [rel arm_c], 0
    je xsk_29
    cmp byte [rel arm_z], 0
    je _duless_no
    xsk_29:
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, lo
    xor eax, eax
    cmp byte [rel arm_c], 0
    jne xsk_30
    mov rax, -1
    xsk_30:
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
_duless_yes:
    ; mov     x20, #-1
    mov rax, -1
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
_duless_no:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XDULESS_END:
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
nm_XDMIN:
    ; DCB "DMIN", 0
    db "DMIN", 0
hl_XDMIN:
    ; DCB "DMIN ( d1 d2 -- d3 ) minimum of two doubles", 0
    db "DMIN ( d1 d2 -- d3 ) minimum of two doubles", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDMIN:
    ; DCQ     nm_XDMIN, hl_XDMIN
    dq nm_XDMIN, hl_XDMIN
    ; DCQ     0
    dq 0
    ; DCQ     XDMIN, XDMIN_END
    dq XDMIN, XDMIN_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDMIN
    dq row_XDMIN
section .text
XDMIN:
    ; ldr     x3, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; ldr     x2, [x22, #8]
    mov r10, qword [rel arm_x22]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; ldr     x1, [x22, #16]
    mov r10, qword [rel arm_x22]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x2, x20
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lt    _dmin_d1
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne _dmin_d1
    ; b.gt    _dmin_d2
    cmp byte [rel arm_z], 0
    jne xsk_31
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _dmin_d2
    xsk_31:
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _dmin_d1
    cmp byte [rel arm_c], 0
    je _dmin_d1
    cmp byte [rel arm_z], 0
    jne _dmin_d1
_dmin_d2:
    ; str     x3, [x22, #16]
    mov r10, qword [rel arm_x22]
    add r10, 0x10
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; add     x22, x22, #16
    mov rax, qword [rel arm_x22]
    add rax, 0x10
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
_dmin_d1:
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x20], rax
    ; add     x22, x22, #16
    mov rax, qword [rel arm_x22]
    add rax, 0x10
    mov qword [rel arm_x22], rax
XDMIN_END:
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
nm_XDMAX:
    ; DCB "DMAX", 0
    db "DMAX", 0
hl_XDMAX:
    ; DCB "DMAX ( d1 d2 -- d3 ) maximum of two doubles", 0
    db "DMAX ( d1 d2 -- d3 ) maximum of two doubles", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDMAX:
    ; DCQ     nm_XDMAX, hl_XDMAX
    dq nm_XDMAX, hl_XDMAX
    ; DCQ     0
    dq 0
    ; DCQ     XDMAX, XDMAX_END
    dq XDMAX, XDMAX_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDMAX
    dq row_XDMAX
section .text
XDMAX:
    ; ldr     x3, [x22]
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; ldr     x2, [x22, #8]
    mov r10, qword [rel arm_x22]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; ldr     x1, [x22, #16]
    mov r10, qword [rel arm_x22]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cmp     x2, x20
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.gt    _dmax_d1
    cmp byte [rel arm_z], 0
    jne xsk_32
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _dmax_d1
    xsk_32:
    ; b.lt    _dmax_d2
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne _dmax_d2
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _dmax_d1
    cmp byte [rel arm_c], 0
    jne _dmax_d1
_dmax_d2:
    ; str     x3, [x22, #16]
    mov r10, qword [rel arm_x22]
    add r10, 0x10
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; add     x22, x22, #16
    mov rax, qword [rel arm_x22]
    add rax, 0x10
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
_dmax_d1:
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x20], rax
    ; add     x22, x22, #16
    mov rax, qword [rel arm_x22]
    add rax, 0x10
    mov qword [rel arm_x22], rax
XDMAX_END:
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
nm_XDTOS:
    ; DCB "D>S", 0
    db "D>S", 0
hl_XDTOS:
    ; DCB "D>S ( d -- n ) double to single", 0
    db "D>S ( d -- n ) double to single", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDTOS:
    ; DCQ     nm_XDTOS, hl_XDTOS
    dq nm_XDTOS, hl_XDTOS
    ; DCQ     0
    dq 0
    ; DCQ     XDTOS, XDTOS_END
    dq XDTOS, XDTOS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDTOS
    dq row_XDTOS
section .text
XDTOS:
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
XDTOS_END:
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
nm_XMPLUS:
    ; DCB "M+", 0
    db "M+", 0
hl_XMPLUS:
    ; DCB "M+ ( d1 n -- d2 ) add single to double", 0
    db "M+ ( d1 n -- d2 ) add single to double", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMPLUS:
    ; DCQ     nm_XMPLUS, hl_XMPLUS
    dq nm_XMPLUS, hl_XMPLUS
    ; DCQ     0
    dq 0
    ; DCQ     XMPLUS, XMPLUS_END
    dq XMPLUS, XMPLUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMPLUS
    dq row_XMPLUS
section .text
XMPLUS:
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
    ; asr     x3, x20, #63
    mov rax, qword [rel arm_x20]
    sar rax, 63
    mov qword [rel arm_x3], rax
    ; adds    x1, x1, x20
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    add rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; adc     x20, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    mov dl, byte [rel arm_c]
    add dl, 255
    adc rax, rcx
    mov qword [rel arm_x20], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
XMPLUS_END:
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
_udivmod128:
    ; cbz     x2, _udm_bad
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _udm_bad
    ; cmp     x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _udm_bad
    cmp byte [rel arm_c], 0
    jne _udm_bad
    ; mov     x3, xzr
    xor eax, eax
    mov qword [rel arm_x3], rax
    ; mov     x4, xzr
    xor eax, eax
    mov qword [rel arm_x4], rax
    ; mov     x5, #128
    mov rax, 0x80
    mov qword [rel arm_x5], rax
_udm_bit:
    ; sub     x5, x5, #1
    mov rax, qword [rel arm_x5]
    sub rax, 1
    mov qword [rel arm_x5], rax
    ; cmp     x5, #64
    mov rax, qword [rel arm_x5]
    cmp rax, 0x40
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _udm_hi
    cmp byte [rel arm_c], 0
    jne _udm_hi
    ; lsr     x6, x0, x5
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x5]
    shr rax, cl
    mov qword [rel arm_x6], rax
    ; b       _udm_got
    jmp _udm_got
_udm_hi:
    ; sub     x7, x5, #64
    mov rax, qword [rel arm_x5]
    sub rax, 0x40
    mov qword [rel arm_x7], rax
    ; lsr     x6, x1, x7
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x7]
    shr rax, cl
    mov qword [rel arm_x6], rax
_udm_got:
    ; and     x6, x6, #1
    mov rax, qword [rel arm_x6]
    and rax, 1
    mov qword [rel arm_x6], rax
    ; lsr     x7, x4, #63
    mov rax, qword [rel arm_x4]
    shr rax, 63
    mov qword [rel arm_x7], rax
    ; lsl     x4, x4, #1
    mov rax, qword [rel arm_x4]
    shl rax, 1
    mov qword [rel arm_x4], rax
    ; orr     x4, x4, x6
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x6]
    or rax, rcx
    mov qword [rel arm_x4], rax
    ; lsl     x3, x3, #1
    mov rax, qword [rel arm_x3]
    shl rax, 1
    mov qword [rel arm_x3], rax
    ; cbnz    x7, _udm_sub
    mov rax, qword [rel arm_x7]
    cmp rax, 0
    jne _udm_sub
    ; cmp     x4, x2
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _udm_next
    cmp byte [rel arm_c], 0
    je _udm_next
_udm_sub:
    ; sub     x4, x4, x2
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x2]
    sub rax, rcx
    mov qword [rel arm_x4], rax
    ; orr     x3, x3, #1
    mov rax, qword [rel arm_x3]
    or rax, 1
    mov qword [rel arm_x3], rax
_udm_next:
    ; cbnz    x5, _udm_bit
    mov rax, qword [rel arm_x5]
    cmp rax, 0
    jne _udm_bit
    ; ret
    jmp qword [rel arm_x30]
_udm_bad:
    ; mov     x3, #-1
    mov rax, -1
    mov qword [rel arm_x3], rax
    ; mov     x4, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x4], rax
    ; ret
    jmp qword [rel arm_x30]
section .bwstr align=1
nm_XUMMOD:
    ; DCB "UM/MOD", 0
    db "UM/MOD", 0
hl_XUMMOD:
    ; DCB "UM/MOD ( ud u -- rem quot ) unsigned divmod", 0
    db "UM/MOD ( ud u -- rem quot ) unsigned divmod", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XUMMOD:
    ; DCQ     nm_XUMMOD, hl_XUMMOD
    dq nm_XUMMOD, hl_XUMMOD
    ; DCQ     0
    dq 0
    ; DCQ     XUMMOD, XUMMOD_END
    dq XUMMOD, XUMMOD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XUMMOD
    dq row_XUMMOD
section .text
XUMMOD:
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
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; bl      _udivmod128
    lea rax, [rel xret_33]
    mov qword [rel arm_x30], rax
    jmp _udivmod128
    xret_33:
    ; str     x4, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x4]
    mov qword [r10], rax
    ; mov     x20, x3
    mov rax, qword [rel arm_x3]
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
XUMMOD_END:
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
nm_XSMREM:
    ; DCB "SM/REM", 0
    db "SM/REM", 0
hl_XSMREM:
    ; DCB "SM/REM ( d n -- rem quot ) symmetric divmod", 0
    db "SM/REM ( d n -- rem quot ) symmetric divmod", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSMREM:
    ; DCQ     nm_XSMREM, hl_XSMREM
    dq nm_XSMREM, hl_XSMREM
    ; DCQ     0
    dq 0
    ; DCQ     XSMREM, XSMREM_END
    dq XSMREM, XSMREM_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSMREM
    dq row_XSMREM
section .text
XSMREM:
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
    ; mov     x5, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x5], rax
    ; ldr     x4, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cmp     x4, #0
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; cset    x6, lt
    xor eax, eax
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_34
    mov eax, 1
    xsk_34:
    mov qword [rel arm_x6], rax
    ; cmp     x5, #0
    mov rax, qword [rel arm_x5]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; cset    x7, lt
    xor eax, eax
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_35
    mov eax, 1
    xsk_35:
    mov qword [rel arm_x7], rax
    ; stp     x6, x7, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x6]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x7]
    mov qword [r10+8], rax
    ; mov     x0, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x0], rax
    ; mov     x1, x4
    mov rax, qword [rel arm_x4]
    mov qword [rel arm_x1], rax
    ; cbz     x6, _sm_absd
    mov rax, qword [rel arm_x6]
    cmp rax, 0
    je _sm_absd
    ; mvn     x0, x0
    mov rax, qword [rel arm_x0]
    not rax
    mov qword [rel arm_x0], rax
    ; mvn     x1, x1
    mov rax, qword [rel arm_x1]
    not rax
    mov qword [rel arm_x1], rax
    ; adds    x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    mov qword [rel arm_x0], rax
    ; adc     x1, x1, xzr
    mov rax, qword [rel arm_x1]
    xor ecx, ecx
    mov dl, byte [rel arm_c]
    add dl, 255
    adc rax, rcx
    mov qword [rel arm_x1], rax
_sm_absd:
    ; mov     x2, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x2], rax
    ; cbz     x7, _sm_absn
    mov rax, qword [rel arm_x7]
    cmp rax, 0
    je _sm_absn
    ; neg     x2, x2
    mov rax, qword [rel arm_x2]
    neg rax
    mov qword [rel arm_x2], rax
_sm_absn:
    ; cbz     x2, _sm_div0
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _sm_div0
    ; bl      _udivmod128
    lea rax, [rel xret_36]
    mov qword [rel arm_x30], rax
    jmp _udivmod128
    xret_36:
    ; ldp     x6, x7, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x6], rax
    mov qword [rel arm_x7], rcx
    add rsp, 0x10
    ; cbz     x6, _sm_quotsign
    mov rax, qword [rel arm_x6]
    cmp rax, 0
    je _sm_quotsign
    ; neg     x4, x4
    mov rax, qword [rel arm_x4]
    neg rax
    mov qword [rel arm_x4], rax
_sm_quotsign:
    ; eor     x8, x6, x7
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x7]
    xor rax, rcx
    mov qword [rel arm_x8], rax
    ; cbz     x8, _sm_push
    mov rax, qword [rel arm_x8]
    cmp rax, 0
    je _sm_push
    ; neg     x3, x3
    mov rax, qword [rel arm_x3]
    neg rax
    mov qword [rel arm_x3], rax
_sm_push:
    ; str     x4, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x4]
    mov qword [r10], rax
    ; mov     x20, x3
    mov rax, qword [rel arm_x3]
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
_sm_div0:
    ; add     sp, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov rsp, rax
    ; str     xzr, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov qword [r10], 0
    ; mov     x20, #-1
    mov rax, -1
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
XSMREM_END:
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
nm_XFMMOD:
    ; DCB "FM/MOD", 0
    db "FM/MOD", 0
hl_XFMMOD:
    ; DCB "FM/MOD ( d n -- rem quot ) floored divmod", 0
    db "FM/MOD ( d n -- rem quot ) floored divmod", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFMMOD:
    ; DCQ     nm_XFMMOD, hl_XFMMOD
    dq nm_XFMMOD, hl_XFMMOD
    ; DCQ     0
    dq 0
    ; DCQ     XFMMOD, XFMMOD_END
    dq XFMMOD, XFMMOD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFMMOD
    dq row_XFMMOD
section .text
XFMMOD:
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
    ; mov     x5, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x5], rax
    ; ldr     x4, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cmp     x4, #0
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; cset    x6, lt
    xor eax, eax
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_37
    mov eax, 1
    xsk_37:
    mov qword [rel arm_x6], rax
    ; cmp     x5, #0
    mov rax, qword [rel arm_x5]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; cset    x7, lt
    xor eax, eax
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je xsk_38
    mov eax, 1
    xsk_38:
    mov qword [rel arm_x7], rax
    ; stp     x6, x7, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x6]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x7]
    mov qword [r10+8], rax
    ; str     x5, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; mov     x0, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x0], rax
    ; mov     x1, x4
    mov rax, qword [rel arm_x4]
    mov qword [rel arm_x1], rax
    ; cbz     x6, _fm_absd
    mov rax, qword [rel arm_x6]
    cmp rax, 0
    je _fm_absd
    ; mvn     x0, x0
    mov rax, qword [rel arm_x0]
    not rax
    mov qword [rel arm_x0], rax
    ; mvn     x1, x1
    mov rax, qword [rel arm_x1]
    not rax
    mov qword [rel arm_x1], rax
    ; adds    x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    mov qword [rel arm_x0], rax
    ; adc     x1, x1, xzr
    mov rax, qword [rel arm_x1]
    xor ecx, ecx
    mov dl, byte [rel arm_c]
    add dl, 255
    adc rax, rcx
    mov qword [rel arm_x1], rax
_fm_absd:
    ; mov     x2, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x2], rax
    ; cbz     x7, _fm_absn
    mov rax, qword [rel arm_x7]
    cmp rax, 0
    je _fm_absn
    ; neg     x2, x2
    mov rax, qword [rel arm_x2]
    neg rax
    mov qword [rel arm_x2], rax
_fm_absn:
    ; cbz     x2, _fm_div0
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _fm_div0
    ; bl      _udivmod128
    lea rax, [rel xret_39]
    mov qword [rel arm_x30], rax
    jmp _udivmod128
    xret_39:
    ; ldp     x6, x7, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x6], rax
    mov qword [rel arm_x7], rcx
    ; ldr     x5, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; cbz     x6, _fm_remsign
    mov rax, qword [rel arm_x6]
    cmp rax, 0
    je _fm_remsign
    ; neg     x4, x4
    mov rax, qword [rel arm_x4]
    neg rax
    mov qword [rel arm_x4], rax
_fm_remsign:
    ; eor     x8, x6, x7
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x7]
    xor rax, rcx
    mov qword [rel arm_x8], rax
    ; cbz     x8, _fm_floor
    mov rax, qword [rel arm_x8]
    cmp rax, 0
    je _fm_floor
    ; neg     x3, x3
    mov rax, qword [rel arm_x3]
    neg rax
    mov qword [rel arm_x3], rax
_fm_floor:
    ; cbz     x4, _fm_push
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _fm_push
    ; eor     x8, x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    xor rax, rcx
    mov qword [rel arm_x8], rax
    ; tbz     x8, #63, _fm_push
    mov rax, qword [rel arm_x8]
    bt rax, 63
    jnc _fm_push
    ; sub     x3, x3, #1
    mov rax, qword [rel arm_x3]
    sub rax, 1
    mov qword [rel arm_x3], rax
    ; add     x4, x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    add rax, rcx
    mov qword [rel arm_x4], rax
_fm_push:
    ; str     x4, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x4]
    mov qword [r10], rax
    ; mov     x20, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x20], rax
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
_fm_div0:
    ; str     xzr, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov qword [r10], 0
    ; mov     x20, #-1
    mov rax, -1
    mov qword [rel arm_x20], rax
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
XFMMOD_END:
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
nm_XSEARCH:
    ; DCB "SEARCH", 0
    db "SEARCH", 0
hl_XSEARCH:
    ; DCB "SEARCH ( c-addr1 u1 c-addr2 u2 -- c-addr3 u3 flag ) find substring", 0
    db "SEARCH ( c-addr1 u1 c-addr2 u2 -- c-addr3 u3 flag ) find substring", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSEARCH:
    ; DCQ     nm_XSEARCH, hl_XSEARCH
    dq nm_XSEARCH, hl_XSEARCH
    ; DCQ     0
    dq 0
    ; DCQ     XSEARCH, XSEARCH_END
    dq XSEARCH, XSEARCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSEARCH
    dq row_XSEARCH
section .text
XSEARCH:
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
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x9, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x9], rax
    ; mov     x10, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x10], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; cbz     x3, _search_hit
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    je _search_hit
_search_off:
    ; subs    x5, x1, x4
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x4]
    sub rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x5], rax
    ; b.lo    _search_miss
    cmp byte [rel arm_c], 0
    je _search_miss
    ; cmp     x5, x3
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _search_miss
    cmp byte [rel arm_c], 0
    je _search_miss
    ; mov     x6, #0
    mov rax, 0
    mov qword [rel arm_x6], rax
_search_cmp:
    ; cmp     x6, x3
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _search_hit
    cmp byte [rel arm_c], 0
    jne _search_hit
    ; add     x7, x0, x4
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x7], rax
    ; ldrb    w8, [x7, x6]
    mov r10, qword [rel arm_x7]
    mov rax, qword [rel arm_x6]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x8], rax
    ; ldrb    w11, [x2, x6]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x6]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x11], rax
    ; cmp     w8, w11
    mov eax, dword [rel arm_x8]
    mov ecx, dword [rel arm_x11]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _search_next
    cmp byte [rel arm_z], 0
    je _search_next
    ; add     x6, x6, #1
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; b       _search_cmp
    jmp _search_cmp
_search_next:
    ; add     x4, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x4], rax
    ; b       _search_off
    jmp _search_off
_search_hit:
    ; add     x0, x0, x4
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; sub     x1, x1, x4
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x4]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x20, #-1
    mov rax, -1
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
_search_miss:
    ; str     x9, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x9]
    mov qword [r10], rax
    ; str     x10, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x10]
    mov qword [r10], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XSEARCH_END:
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
nm_XCONTAINS:
    ; DCB "CONTAINS", 0
    db "CONTAINS", 0
hl_XCONTAINS:
    ; DCB "CONTAINS ( hay-a hay-u ned-a ned-u -- flag ) case-insensitive substring", 0
    db "CONTAINS ( hay-a hay-u ned-a ned-u -- flag ) case-insensitive substring", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCONTAINS:
    ; DCQ     nm_XCONTAINS, hl_XCONTAINS
    dq nm_XCONTAINS, hl_XCONTAINS
    ; DCQ     0
    dq 0
    ; DCQ     XCONTAINS, XCONTAINS_END
    dq XCONTAINS, XCONTAINS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCONTAINS
    dq row_XCONTAINS
section .text
XCONTAINS:
    ; mov     x4, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x4], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; cbz     x4, _cont_yes
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _cont_yes
    ; cmp     x2, x4
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _cont_no
    cmp byte [rel arm_c], 0
    je _cont_no
    ; sub     x5, x2, x4
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x4]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; add     x5, x5, #1
    mov rax, qword [rel arm_x5]
    add rax, 1
    mov qword [rel arm_x5], rax
    ; mov     x6, #0
    mov rax, 0
    mov qword [rel arm_x6], rax
_cont_i:
    ; cmp     x6, x5
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _cont_no
    cmp byte [rel arm_c], 0
    jne _cont_no
    ; mov     x7, #0
    mov rax, 0
    mov qword [rel arm_x7], rax
_cont_j:
    ; cmp     x7, x4
    mov rax, qword [rel arm_x7]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _cont_yes
    cmp byte [rel arm_c], 0
    jne _cont_yes
    ; add     x8, x1, x6
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x6]
    add rax, rcx
    mov qword [rel arm_x8], rax
    ; add     x8, x8, x7
    mov rax, qword [rel arm_x8]
    mov rcx, qword [rel arm_x7]
    add rax, rcx
    mov qword [rel arm_x8], rax
    ; ldrb    w9, [x8]
    mov r10, qword [rel arm_x8]
    movzx eax, byte [r10]
    mov qword [rel arm_x9], rax
    ; ldrb    w10, [x3, x7]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x7]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x10], rax
    ; cmp     w9, #'a'
    mov eax, dword [rel arm_x9]
    cmp eax, 0x61
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _cont_hfold
    cmp byte [rel arm_c], 0
    je _cont_hfold
    ; cmp     w9, #'z'
    mov eax, dword [rel arm_x9]
    cmp eax, 0x7a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _cont_hfold
    cmp byte [rel arm_c], 0
    je xsk_40
    cmp byte [rel arm_z], 0
    je _cont_hfold
    xsk_40:
    ; sub     w9, w9, #32
    mov eax, dword [rel arm_x9]
    sub eax, 0x20
    mov qword [rel arm_x9], rax
_cont_hfold:
    ; cmp     w10, #'a'
    mov eax, dword [rel arm_x10]
    cmp eax, 0x61
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _cont_nfold
    cmp byte [rel arm_c], 0
    je _cont_nfold
    ; cmp     w10, #'z'
    mov eax, dword [rel arm_x10]
    cmp eax, 0x7a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _cont_nfold
    cmp byte [rel arm_c], 0
    je xsk_41
    cmp byte [rel arm_z], 0
    je _cont_nfold
    xsk_41:
    ; sub     w10, w10, #32
    mov eax, dword [rel arm_x10]
    sub eax, 0x20
    mov qword [rel arm_x10], rax
_cont_nfold:
    ; cmp     w9, w10
    mov eax, dword [rel arm_x9]
    mov ecx, dword [rel arm_x10]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _cont_next_i
    cmp byte [rel arm_z], 0
    je _cont_next_i
    ; add     x7, x7, #1
    mov rax, qword [rel arm_x7]
    add rax, 1
    mov qword [rel arm_x7], rax
    ; b       _cont_j
    jmp _cont_j
_cont_next_i:
    ; add     x6, x6, #1
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; b       _cont_i
    jmp _cont_i
_cont_yes:
    ; mov     x20, #-1
    mov rax, -1
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
_cont_no:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XCONTAINS_END:
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
nm_XUDOT:
    ; DCB "U.", 0
    db "U.", 0
hl_XUDOT:
    ; DCB "U. ( u -- ) print unsigned with a trailing space", 0
    db "U. ( u -- ) print unsigned with a trailing space", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XUDOT:
    ; DCQ     nm_XUDOT, hl_XUDOT
    dq nm_XUDOT, hl_XUDOT
    ; DCQ     0
    dq 0
    ; DCQ     XUDOT, XUDOT_END
    dq XUDOT, XUDOT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XUDOT
    dq row_XUDOT
section .text
XUDOT:
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
    ; bl      _sa_print_unsigned
    lea rax, [rel xret_42]
    mov qword [rel arm_x30], rax
    jmp _sa_print_unsigned
    xret_42:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _sa_putchar
    lea rax, [rel xret_43]
    mov qword [rel arm_x30], rax
    jmp _sa_putchar
    xret_43:
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
XUDOT_END:
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
nm_XSPACES:
    ; DCB "SPACES", 0
    db "SPACES", 0
hl_XSPACES:
    ; DCB "SPACES ( n -- ) emit n spaces", 0
    db "SPACES ( n -- ) emit n spaces", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSPACES:
    ; DCQ     nm_XSPACES, hl_XSPACES
    dq nm_XSPACES, hl_XSPACES
    ; DCQ     0
    dq 0
    ; DCQ     XSPACES, XSPACES_END
    dq XSPACES, XSPACES_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSPACES
    dq row_XSPACES
section .text
XSPACES:
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
    ; cmp     x1, #0
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.le    XSPACES_END
    cmp byte [rel arm_z], 0
    jne XSPACES_END
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne XSPACES_END
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
_spaces_loop:
    ; str     x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_44]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_44:
    ; ldr     x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; subs    x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; b.ne    _spaces_loop
    cmp byte [rel arm_z], 0
    je _spaces_loop
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
XSPACES_END:
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
nm_XMSFETCH:
    ; DCB "MS@", 0
    db "MS@", 0
hl_XMSFETCH:
    ; DCB "MS@ ( -- u ) milliseconds since the host started", 0
    db "MS@ ( -- u ) milliseconds since the host started", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMSFETCH:
    ; DCQ     nm_XMSFETCH, hl_XMSFETCH
    dq nm_XMSFETCH, hl_XMSFETCH
    ; DCQ     0
    dq 0
    ; DCQ     XMSFETCH, XMSFETCH_END
    dq XMSFETCH, XMSFETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMSFETCH
    dq row_XMSFETCH
section .text
XMSFETCH:
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
    ; bl      host_ms
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
    call host_ms
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
XMSFETCH_END:
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
nm_XMS:
    ; DCB "MS", 0
    db "MS", 0
hl_XMS:
    ; DCB "MS ( u -- ) wait that many milliseconds", 0
    db "MS ( u -- ) wait that many milliseconds", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMS:
    ; DCQ     nm_XMS, hl_XMS
    dq nm_XMS, hl_XMS
    ; DCQ     0
    dq 0
    ; DCQ     XMS, XMS_END
    dq XMS, XMS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMS
    dq row_XMS
section .text
XMS:
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
    ; bl      host_sleep
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
    call host_sleep
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
XMS_END:
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
nm_XTIME_DATE:
    ; DCB "TIME", 0x26, "DATE", 0
    db "TIME", 0x26, "DATE", 0
hl_XTIME_DATE:
    ; DCB "TIME", 0x26, "DATE", "( -- sec min hour day month year ) local wall time", 0
    db "TIME", 0x26, "DATE", "( -- sec min hour day month year ) local wall time", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTIME_DATE:
    ; DCQ     nm_XTIME_DATE, hl_XTIME_DATE
    dq nm_XTIME_DATE, hl_XTIME_DATE
    ; DCQ     0
    dq 0
    ; DCQ     XTIME_DATE, XTIME_DATE_END
    dq XTIME_DATE, XTIME_DATE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTIME_DATE
    dq row_XTIME_DATE
section .text
XTIME_DATE:
    ; sub     sp, sp, #112
    mov rax, rsp
    sub rax, 0x70
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; add     x0, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [rel arm_x0], rax
    ; bl      host_time_date
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
    call host_time_date
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [sp, #72]
    lea r10, [rsp]
    add r10, 0x48
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; ldr     x4, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; ldr     x5, [sp, #88]
    lea r10, [rsp]
    add r10, 0x58
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #112
    mov rax, rsp
    add rax, 0x70
    mov rsp, rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; str     x3, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; str     x4, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x4]
    mov qword [r10], rax
    ; mov     x20, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x20], rax
XTIME_DATE_END:
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
nm_XKEY:
    ; DCB "KEY", 0
    db "KEY", 0
hl_XKEY:
    ; DCB "KEY ( -- c ) next character from the host", 0
    db "KEY ( -- c ) next character from the host", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XKEY:
    ; DCQ     nm_XKEY, hl_XKEY
    dq nm_XKEY, hl_XKEY
    ; DCQ     0
    dq 0
    ; DCQ     XKEY, XKEY_END
    dq XKEY, XKEY_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XKEY
    dq row_XKEY
section .text
XKEY:
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
    ; lea x1, key_fn
    lea rax, [rel key_fn]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _key_none
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _key_none
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
    ; b       _key_push
    jmp _key_push
_key_none:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
_key_push:
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
XKEY_END:
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
nm_XEKEY:
    ; DCB "EKEY", 0
    db "EKEY", 0
hl_XEKEY:
    ; DCB "EKEY ( -- u ) next key event", 0
    db "EKEY ( -- u ) next key event", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XEKEY:
    ; DCQ     nm_XEKEY, hl_XEKEY
    dq nm_XEKEY, hl_XEKEY
    ; DCQ     0
    dq 0
    ; DCQ     XEKEY, XEKEY_END
    dq XEKEY, XEKEY_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XEKEY
    dq row_XEKEY
section .text
XEKEY:
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
    ; bl      _getchar
    lea rax, [rel xret_45]
    mov qword [rel arm_x30], rax
    jmp _getchar
    xret_45:
    ; lea x1, debug_busy
    lea rax, [rel debug_busy]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, ekey_push
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je ekey_push
    ; mov     x28, #0
    mov rax, 0
    mov qword [rel arm_x28], rax
ekey_push:
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
XEKEY_END:
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
nm_XKEYQ:
    ; DCB "KEY?", 0
    db "KEY?", 0
hl_XKEYQ:
    ; DCB "KEY? ( -- flag ) true if a key is waiting", 0
    db "KEY? ( -- flag ) true if a key is waiting", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XKEYQ:
    ; DCQ     nm_XKEYQ, hl_XKEYQ
    dq nm_XKEYQ, hl_XKEYQ
    ; DCQ     0
    dq 0
    ; DCQ     XKEYQ, XKEYQ_END
    dq XKEYQ, XKEYQ_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XKEYQ
    dq row_XKEYQ
section .text
XKEYQ:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XKEYQ_END:
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
nm_XFIND:
    ; DCB "FIND", 0
    db "FIND", 0
hl_XFIND:
    ; DCB "FIND ( c-addr -- c-addr 0 | xt 1 | xt -1 ) find a counted name", 0
    db "FIND ( c-addr -- c-addr 0 | xt 1 | xt -1 ) find a counted name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFIND:
    ; DCQ     nm_XFIND, hl_XFIND
    dq nm_XFIND, hl_XFIND
    ; DCQ     0
    dq 0
    ; DCQ     XFIND, 0
    dq XFIND, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFIND
    dq row_XFIND
section .text
XFIND:
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
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldrb    w1, [x2]
    mov r10, qword [rel arm_x2]
    movzx eax, byte [r10]
    mov qword [rel arm_x1], rax
    ; add     x0, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; bl      _find_word
    lea rax, [rel xret_46]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_46:
    ; cbz     x0, _xfind_not
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _xfind_not
    ; tbnz    x1, #63, _xfind_imm
    mov rax, qword [rel arm_x1]
    bt rax, 63
    jc _xfind_imm
    ; mov     x4, #-1
    mov rax, -1
    mov qword [rel arm_x4], rax
    ; b       _xfind_flag
    jmp _xfind_flag
_xfind_imm:
    ; mov     x4, #1
    mov rax, 1
    mov qword [rel arm_x4], rax
_xfind_flag:
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
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
_xfind_not:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #0
    mov rax, 0
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
section .bwstr align=1
nm_XTICK:
    ; DCB "'", 0
    db "'", 0
hl_XTICK:
    ; DCB "' ( name -- xt ) xt of the next name", 0
    db "' ( name -- xt ) xt of the next name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTICK:
    ; DCQ     nm_XTICK, hl_XTICK
    dq nm_XTICK, hl_XTICK
    ; DCQ     0
    dq 0
    ; DCQ     XTICK, 0
    dq XTICK, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTICK
    dq row_XTICK
section .text
XTICK:
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
    ; bl      _next_word
    lea rax, [rel xret_47]
    mov qword [rel arm_x30], rax
    jmp _next_word
    xret_47:
    ; cbz     x1, _tick_fail
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _tick_fail
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _find_word
    lea rax, [rel xret_48]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_48:
    ; cbz     x0, _tick_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _tick_fail
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
_tick_fail:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; cbz     x1, _tick_mark
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _tick_mark
    ; bl      emit_str
    lea rax, [rel xret_49]
    mov qword [rel arm_x30], rax
    jmp emit_str
    xret_49:
_tick_mark:
    ; lea x0, msg_huh
    lea rax, [rel msg_huh]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_50]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_50:
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
section .bwstr align=1
nm_XEXECUTE:
    ; DCB "EXECUTE", 0
    db "EXECUTE", 0
hl_XEXECUTE:
    ; DCB "EXECUTE ( xt -- ) run the word at xt", 0
    db "EXECUTE ( xt -- ) run the word at xt", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XEXECUTE:
    ; DCQ     nm_XEXECUTE, hl_XEXECUTE
    dq nm_XEXECUTE, hl_XEXECUTE
    ; DCQ     0
    dq 0
    ; DCQ     XEXECUTE, XEXECUTE_END
    dq XEXECUTE, XEXECUTE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XEXECUTE
    dq row_XEXECUTE
section .text
XEXECUTE:
    ; mov     x21, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x21], rax
    ; lea x0, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x0], rax
    ; add     x0, x0, #1, lsl #12
    mov rax, qword [rel arm_x0]
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
    ; b.hs    _exec_empty
    cmp byte [rel arm_c], 0
    jne _exec_empty
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; b       _exec_go
    jmp _exec_go
_exec_empty:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
_exec_go:
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
XEXECUTE_END:
section .bwstr align=1
nm_XLITERAL:
    ; DCB "LITERAL", 0
    db "LITERAL", 0
hl_XLITERAL:
    ; DCB "LITERAL ( x -- ) compile x as a literal", 0
    db "LITERAL ( x -- ) compile x as a literal", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLITERAL:
    ; DCQ     nm_XLITERAL, hl_XLITERAL
    dq nm_XLITERAL, hl_XLITERAL
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XLITERAL, 0
    dq XLITERAL, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLITERAL
    dq row_XLITERAL
section .text
XLITERAL:
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
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_51]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_51:
    ; ldr     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_52]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_52:
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
nm_XTOIN:
    ; DCB ">IN", 0
    db ">IN", 0
hl_XTOIN:
    ; DCB ">IN ( -- addr ) input offset from the source base", 0
    db ">IN ( -- addr ) input offset from the source base", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTOIN:
    ; DCQ     nm_XTOIN, hl_XTOIN
    dq nm_XTOIN, hl_XTOIN
    ; DCQ     0
    dq 0
    ; DCQ     XTOIN, 0
    dq XTOIN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTOIN
    dq row_XTOIN
section .text
XTOIN:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x0], rax
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
nm_XPARSE_NAME:
    ; DCB "PARSE-NAME", 0
    db "PARSE-NAME", 0
hl_XPARSE_NAME:
    ; DCB "PARSE-NAME ( -- c-addr u ) next blank-delimited name", 0
    db "PARSE-NAME ( -- c-addr u ) next blank-delimited name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPARSE_NAME:
    ; DCQ     nm_XPARSE_NAME, hl_XPARSE_NAME
    dq nm_XPARSE_NAME, hl_XPARSE_NAME
    ; DCQ     0
    dq 0
    ; DCQ     XPARSE_NAME, 0
    dq XPARSE_NAME, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPARSE_NAME
    dq row_XPARSE_NAME
section .text
XPARSE_NAME:
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
    ; bl      _parse_name_raw
    lea rax, [rel xret_53]
    mov qword [rel arm_x30], rax
    jmp _parse_name_raw
    xret_53:
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
    ; mov     x20, x2
    mov rax, qword [rel arm_x2]
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
_block_load_nr:
    ; stp     x29, x30, [sp, #-32]!
    add rsp, -32
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; str     x19, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
    ; lea x0, block_nr
    lea rax, [rel block_nr]
    mov qword [rel arm_x0], rax
    ; str     x19, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
    ; lea x0, block_file
    lea rax, [rel block_file]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _bln_blank
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _bln_blank
    ; lsl     x1, x19, #10
    mov rax, qword [rel arm_x19]
    shl rax, 10
    mov qword [rel arm_x1], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; bl      host_repos
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
    call host_repos
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; cbnz    x0, _bln_blank
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _bln_blank
    ; lea x0, block_buf
    lea rax, [rel block_buf]
    mov qword [rel arm_x0], rax
    ; mov     x1, #1024
    mov rax, 0x400
    mov qword [rel arm_x1], rax
    ; lea x2, block_file
    lea rax, [rel block_file]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; bl      host_read
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
    call host_read
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; cmp     x0, #0
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lt    _bln_blank
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne _bln_blank
    ; cmp     x0, #1024
    mov rax, qword [rel arm_x0]
    cmp rax, 0x400
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _bln_done
    cmp byte [rel arm_c], 0
    jne _bln_done
    ; lea x1, block_buf
    lea rax, [rel block_buf]
    mov qword [rel arm_x1], rax
    ; add     x1, x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    add rax, rcx
    mov qword [rel arm_x1], rax
    ; mov     x2, #1024
    mov rax, 0x400
    mov qword [rel arm_x2], rax
    ; sub     x2, x2, x0
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x0]
    sub rax, rcx
    mov qword [rel arm_x2], rax
    ; mov     w3, #32
    mov eax, 0x20
    mov qword [rel arm_x3], rax
_bln_pad:
    ; cbz     x2, _bln_done
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _bln_done
    ; strb    w3, [x1], #1
    mov r10, qword [rel arm_x1]
    mov eax, dword [rel arm_x3]
    mov byte [r10], al
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; sub     x2, x2, #1
    mov rax, qword [rel arm_x2]
    sub rax, 1
    mov qword [rel arm_x2], rax
    ; b       _bln_pad
    jmp _bln_pad
_bln_blank:
    ; lea x0, block_buf
    lea rax, [rel block_buf]
    mov qword [rel arm_x0], rax
    ; mov     x1, #1024
    mov rax, 0x400
    mov qword [rel arm_x1], rax
    ; mov     w2, #32
    mov eax, 0x20
    mov qword [rel arm_x2], rax
_bln_fill:
    ; cbz     x1, _bln_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _bln_done
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; b       _bln_fill
    jmp _bln_fill
_bln_done:
    ; lea x0, block_upd
    lea rax, [rel block_upd]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; ldr     x19, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    ; ldp     x29, x30, [sp], #32
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x20
    ; ret
    jmp qword [rel arm_x30]
section .bwstr align=1
nm_XREFILL:
    ; DCB "REFILL", 0
    db "REFILL", 0
hl_XREFILL:
    ; DCB "REFILL ( -- flag ) next line when a file is the source", 0
    db "REFILL ( -- flag ) next line when a file is the source", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XREFILL:
    ; DCQ     nm_XREFILL, hl_XREFILL
    dq nm_XREFILL, hl_XREFILL
    ; DCQ     0
    dq 0
    ; DCQ     XREFILL, 0
    dq XREFILL, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XREFILL
    dq row_XREFILL
section .text
XREFILL:
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
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, _refill_block
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _refill_block
    ; lea x0, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _refill_no
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _refill_no
    ; bl      _take_line
    lea rax, [rel xret_54]
    mov qword [rel arm_x30], rax
    jmp _take_line
    xret_54:
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
    ; cmp     x0, #0
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csetm   x20, ne
    xor eax, eax
    cmp byte [rel arm_z], 0
    jne xsk_55
    mov rax, -1
    xsk_55:
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
_refill_no:
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
_refill_block:
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
    ; bl      _block_load_nr
    lea rax, [rel xret_56]
    mov qword [rel arm_x30], rax
    jmp _block_load_nr
    xret_56:
    ; lea x0, block_buf
    lea rax, [rel block_buf]
    mov qword [rel arm_x0], rax
    ; lea x2, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; add     x0, x0, #1024
    mov rax, qword [rel arm_x0]
    add rax, 0x400
    mov qword [rel arm_x0], rax
    ; lea x2, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
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
    ; mov     x20, #-1
    mov rax, -1
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
nm_XEXIT_ADDR:
    ; DCB "EXIT-ADDR", 0
    db "EXIT-ADDR", 0
hl_XEXIT_ADDR:
    ; DCB "EXIT-ADDR ( -- xt ) xt of EXIT", 0
    db "EXIT-ADDR ( -- xt ) xt of EXIT", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XEXIT_ADDR:
    ; DCQ     nm_XEXIT_ADDR, hl_XEXIT_ADDR
    dq nm_XEXIT_ADDR, hl_XEXIT_ADDR
    ; DCQ     0
    dq 0
    ; DCQ     XEXIT_ADDR, 0
    dq XEXIT_ADDR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XEXIT_ADDR
    dq row_XEXIT_ADDR
section .text
XEXIT_ADDR:
    ; lea x0, cfa_exit
    lea rax, [rel cfa_exit]
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
nm_XSLIT_ADDR:
    ; DCB "SLIT-ADDR", 0
    db "SLIT-ADDR", 0
hl_XSLIT_ADDR:
    ; DCB "SLIT-ADDR ( -- xt ) xt of the compiled string runtime", 0
    db "SLIT-ADDR ( -- xt ) xt of the compiled string runtime", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSLIT_ADDR:
    ; DCQ     nm_XSLIT_ADDR, hl_XSLIT_ADDR
    dq nm_XSLIT_ADDR, hl_XSLIT_ADDR
    ; DCQ     0
    dq 0
    ; DCQ     XSLIT_ADDR, 0
    dq XSLIT_ADDR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSLIT_ADDR
    dq row_XSLIT_ADDR
section .text
XSLIT_ADDR:
    ; lea x0, cfa_slit
    lea rax, [rel cfa_slit]
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
nm_XDOTQ:
    ; DCB ".", 0x22, 0
    db ".", 0x22, 0
hl_XDOTQ:
    ; DCB ".", 0x22, "print text until a quote", 0
    db ".", 0x22, "print text until a quote", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOTQ:
    ; DCQ     nm_XDOTQ, hl_XDOTQ
    dq nm_XDOTQ, hl_XDOTQ
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XDOTQ, 0
    dq XDOTQ, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOTQ
    dq row_XDOTQ
section .text
XDOTQ:
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
    lea rax, [rel xret_57]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_57:
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
    ; mov     x1, x9
    mov rax, qword [rel arm_x9]
    mov qword [rel arm_x1], rax
_dq_scan:
    ; cmp     x1, x6
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x6]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _dq_len
    cmp byte [rel arm_c], 0
    jne _dq_len
    ; ldrb    w3, [x1]
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; cbz     w3, _dq_len
    mov eax, dword [rel arm_x3]
    cmp rax, 0
    je _dq_len
    ; cmp     w3, #34
    mov eax, dword [rel arm_x3]
    cmp eax, 0x22
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _dq_hit
    cmp byte [rel arm_z], 0
    jne _dq_hit
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _dq_scan
    jmp _dq_scan
_dq_hit:
    ; sub     x5, x1, x9
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _dq_commit
    jmp _dq_commit
_dq_len:
    ; sub     x5, x1, x9
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x9]
    sub rax, rcx
    mov qword [rel arm_x5], rax
_dq_commit:
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_58]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_58:
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, _dq_comp
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _dq_comp
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
_dq_comp:
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
    lea rax, [rel xret_59]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_59:
    ; ldr     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_60]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_60:
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
_dq_cpy:
    ; cmp     x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ge    _dq_align
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _dq_align
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
    ; b       _dq_cpy
    jmp _dq_cpy
_dq_align:
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
    ; lea x0, str_type
    lea rax, [rel str_type]
    mov qword [rel arm_x0], rax
    ; mov     x1, #4
    mov rax, 4
    mov qword [rel arm_x1], rax
    ; bl      _find_word
    lea rax, [rel xret_61]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_61:
    ; cbz     x0, _dq_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _dq_fail
    ; bl      _compile_cell
    lea rax, [rel xret_62]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_62:
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
_dq_fail:
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
_parse_name_raw:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _cursor_load
    lea rax, [rel xret_63]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_63:
    ; mov     x2, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x2], rax
    ; lea x9, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x9], rax
    ; ldr     x9, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
_pn_skip:
    ; cmp     x2, x9
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pn_empty
    cmp byte [rel arm_c], 0
    jne _pn_empty
    ; ldrb    w4, [x2]
    mov r10, qword [rel arm_x2]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _pn_empty
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _pn_empty
    ; cmp     w4, #32
    mov eax, dword [rel arm_x4]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pn_sk
    cmp byte [rel arm_z], 0
    jne _pn_sk
    ; cmp     w4, #9
    mov eax, dword [rel arm_x4]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pn_sk
    cmp byte [rel arm_z], 0
    jne _pn_sk
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pn_sk
    cmp byte [rel arm_z], 0
    jne _pn_sk
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pn_sk
    cmp byte [rel arm_z], 0
    jne _pn_sk
    ; b       _pn_start
    jmp _pn_start
_pn_sk:
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _pn_skip
    jmp _pn_skip
_pn_start:
    ; mov     x3, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x3], rax
_pn_scan:
    ; cmp     x2, x9
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pn_end
    cmp byte [rel arm_c], 0
    jne _pn_end
    ; ldrb    w4, [x2]
    mov r10, qword [rel arm_x2]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _pn_end
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _pn_end
    ; cmp     w4, #32
    mov eax, dword [rel arm_x4]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pn_end
    cmp byte [rel arm_z], 0
    jne _pn_end
    ; cmp     w4, #9
    mov eax, dword [rel arm_x4]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pn_end
    cmp byte [rel arm_z], 0
    jne _pn_end
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pn_end
    cmp byte [rel arm_z], 0
    jne _pn_end
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pn_end
    cmp byte [rel arm_z], 0
    jne _pn_end
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _pn_scan
    jmp _pn_scan
_pn_end:
    ; sub     x5, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; cmp     x2, x9
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pn_commit
    cmp byte [rel arm_c], 0
    jne _pn_commit
    ; ldrb    w4, [x2]
    mov r10, qword [rel arm_x2]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _pn_commit
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _pn_commit
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
_pn_commit:
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; mov     x2, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x2], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_64]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_64:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_pn_empty:
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_65]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_65:
    ; mov     x2, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x2], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
section .bwstr align=1
nm_XTO_IMM:
    ; DCB "TO", 0
    db "TO", 0
hl_XTO_IMM:
    ; DCB "TO ( x name -- ) store into a VALUE or DEFER", 0
    db "TO ( x name -- ) store into a VALUE or DEFER", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTO_IMM:
    ; DCQ     nm_XTO_IMM, hl_XTO_IMM
    dq nm_XTO_IMM, hl_XTO_IMM
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XTO_IMM, XTO_IMM_END
    dq XTO_IMM, XTO_IMM_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTO_IMM
    dq row_XTO_IMM
section .text
XTO_IMM:
    ; sub     sp, sp, #128
    mov rax, rsp
    sub rax, 0x80
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _next_word
    lea rax, [rel xret_66]
    mov qword [rel arm_x30], rax
    jmp _next_word
    xret_66:
    ; cbz     x1, _to_fail
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _to_fail
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, _to_interp
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _to_interp
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; bl      _local_lookup
    lea rax, [rel xret_67]
    mov qword [rel arm_x30], rax
    jmp _local_lookup
    xret_67:
    ; cmp     x0, #-1
    mov rax, qword [rel arm_x0]
    cmp rax, -1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _to_compile_value
    cmp byte [rel arm_z], 0
    jne _to_compile_value
    ; str     x0, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_68]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_68:
    ; ldr     x0, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_69]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_69:
    ; lea x0, cfa_local_store
    lea rax, [rel cfa_local_store]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_70]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_70:
    ; b       _to_leave
    jmp _to_leave
_to_compile_value:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; bl      _find_word
    lea rax, [rel xret_71]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_71:
    ; cbz     x0, _to_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _to_fail
    ; add     x0, x0, #16
    mov rax, qword [rel arm_x0]
    add rax, 0x10
    mov qword [rel arm_x0], rax
    ; str     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _to_bang
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _to_bang
    ; ldr     x3, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [sp, #72]
    lea r10, [rsp]
    add r10, 0x48
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x0, str_twofetch
    lea rax, [rel str_twofetch]
    mov qword [rel arm_x0], rax
    ; mov     x1, #2
    mov rax, 2
    mov qword [rel arm_x1], rax
    ; bl      _find_word
    lea rax, [rel xret_72]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_72:
    ; ldr     x3, [sp, #72]
    lea r10, [rsp]
    add r10, 0x48
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cmp     x0, x3
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _to_bang
    cmp byte [rel arm_z], 0
    je _to_bang
    ; lea x0, str_twostore
    lea rax, [rel str_twostore]
    mov qword [rel arm_x0], rax
    ; mov     x1, #2
    mov rax, 2
    mov qword [rel arm_x1], rax
    ; b       _to_plant
    jmp _to_plant
_to_bang:
    ; lea x0, str_bang
    lea rax, [rel str_bang]
    mov qword [rel arm_x0], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
_to_plant:
    ; stp     x0, x1, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_73]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_73:
    ; ldr     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_74]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_74:
    ; ldp     x0, x1, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; bl      _find_word
    lea rax, [rel xret_75]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_75:
    ; cbz     x0, _to_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _to_fail
    ; bl      _compile_cell
    lea rax, [rel xret_76]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_76:
    ; b       _to_leave
    jmp _to_leave
_to_interp:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; bl      _find_word
    lea rax, [rel xret_77]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_77:
    ; cbz     x0, _to_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _to_fail
    ; add     x0, x0, #16
    mov rax, qword [rel arm_x0]
    add rax, 0x10
    mov qword [rel arm_x0], rax
    ; lea x3, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x3], rax
    ; add     x3, x3, #1, lsl #12
    mov rax, qword [rel arm_x3]
    add rax, 0x1000
    mov qword [rel arm_x3], rax
    ; mov     x4, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x4], rax
    ; sub     x3, x3, x22
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x22]
    sub rax, rcx
    mov qword [rel arm_x3], rax
    ; lsr     x3, x3, #3
    mov rax, qword [rel arm_x3]
    shr rax, 3
    mov qword [rel arm_x3], rax
    ; cmp     x3, #2
    mov rax, qword [rel arm_x3]
    cmp rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _to_one
    cmp byte [rel arm_c], 0
    je _to_one
    ; str     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; str     x1, [x0, #8]
    mov r10, qword [rel arm_x0]
    add r10, 8
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; b       _to_pop
    jmp _to_pop
_to_one:
    ; str     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
_to_pop:
    ; cmp     x22, x4
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _to_empty
    cmp byte [rel arm_c], 0
    jne _to_empty
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; b       _to_leave
    jmp _to_leave
_to_empty:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
_to_leave:
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #128
    mov rax, rsp
    add rax, 0x80
    mov rsp, rax
XTO_IMM_END:
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
_to_fail:
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #128
    mov rax, rsp
    add rax, 0x80
    mov rsp, rax
    ; lea x0, msg_huh
    lea rax, [rel msg_huh]
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
    ; bl      emit_cstr
    lea rax, [rel xret_78]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_78:
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
section .bwstr align=1
nm_XCOMPARE:
    ; DCB "COMPARE", 0
    db "COMPARE", 0
hl_XCOMPARE:
    ; DCB "COMPARE ( c-addr1 u1 c-addr2 u2 -- n ) -1 0 or 1", 0
    db "COMPARE ( c-addr1 u1 c-addr2 u2 -- n ) -1 0 or 1", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCOMPARE:
    ; DCQ     nm_XCOMPARE, hl_XCOMPARE
    dq nm_XCOMPARE, hl_XCOMPARE
    ; DCQ     0
    dq 0
    ; DCQ     XCOMPARE, XCOMPARE_END
    dq XCOMPARE, XCOMPARE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCOMPARE
    dq row_XCOMPARE
section .text
XCOMPARE:
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
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; csel    x4, x1, x3, lo
    cmp byte [rel arm_c], 0
    je xsk_79
    mov rax, qword [rel arm_x3]
    jmp xsk_80
    xsk_79:
    mov rax, qword [rel arm_x1]
    xsk_80:
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
_cmp_loop:
    ; cmp     x5, x4
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _cmp_len
    cmp byte [rel arm_c], 0
    jne _cmp_len
    ; ldrb    w6, [x0, x5]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x5]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x6], rax
    ; ldrb    w7, [x2, x5]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x5]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x7], rax
    ; cmp     w6, w7
    mov eax, dword [rel arm_x6]
    mov ecx, dword [rel arm_x7]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _cmp_diff
    cmp byte [rel arm_z], 0
    je _cmp_diff
    ; add     x5, x5, #1
    mov rax, qword [rel arm_x5]
    add rax, 1
    mov qword [rel arm_x5], rax
    ; b       _cmp_loop
    jmp _cmp_loop
_cmp_diff:
    ; mov     x20, #1
    mov rax, 1
    mov qword [rel arm_x20], rax
    ; b.hi    XCOMPARE_END
    cmp byte [rel arm_c], 0
    je xsk_81
    cmp byte [rel arm_z], 0
    je XCOMPARE_END
    xsk_81:
    ; mov     x20, #-1
    mov rax, -1
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
_cmp_len:
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _cmp_eq
    cmp byte [rel arm_z], 0
    jne _cmp_eq
    ; mov     x20, #1
    mov rax, 1
    mov qword [rel arm_x20], rax
    ; b.hi    XCOMPARE_END
    cmp byte [rel arm_c], 0
    je xsk_82
    cmp byte [rel arm_z], 0
    je XCOMPARE_END
    xsk_82:
    ; mov     x20, #-1
    mov rax, -1
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
_cmp_eq:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XCOMPARE_END:
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
nm_XLATEST:
    ; DCB "LATEST", 0
    db "LATEST", 0
hl_XLATEST:
    ; DCB "LATEST ( -- addr ) FORTH wordlist head array", 0
    db "LATEST ( -- addr ) FORTH wordlist head array", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLATEST:
    ; DCQ     nm_XLATEST, hl_XLATEST
    dq nm_XLATEST, hl_XLATEST
    ; DCQ     0
    dq 0
    ; DCQ     XLATEST, 0
    dq XLATEST, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLATEST
    dq row_XLATEST
section .text
XLATEST:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x0], rax
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
nm_XFORTH_WORDLIST:
    ; DCB "FORTH-WORDLIST", 0
    db "FORTH-WORDLIST", 0
hl_XFORTH_WORDLIST:
    ; DCB "FORTH-WORDLIST ( -- wid ) main FORTH word list", 0
    db "FORTH-WORDLIST ( -- wid ) main FORTH word list", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFORTH_WORDLIST:
    ; DCQ     nm_XFORTH_WORDLIST, hl_XFORTH_WORDLIST
    dq nm_XFORTH_WORDLIST, hl_XFORTH_WORDLIST
    ; DCQ     0
    dq 0
    ; DCQ     XFORTH_WORDLIST, 0
    dq XFORTH_WORDLIST, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFORTH_WORDLIST
    dq row_XFORTH_WORDLIST
section .text
XFORTH_WORDLIST:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x0], rax
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
nm_XWORDLISTS:
    ; DCB "WORDLISTS", 0
    db "WORDLISTS", 0
hl_XWORDLISTS:
    ; DCB "WORDLISTS ( -- addr n ) registered wordlist table", 0
    db "WORDLISTS ( -- addr n ) registered wordlist table", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XWORDLISTS:
    ; DCQ     nm_XWORDLISTS, hl_XWORDLISTS
    dq nm_XWORDLISTS, hl_XWORDLISTS
    ; DCQ     0
    dq 0
    ; DCQ     XWORDLISTS, 0
    dq XWORDLISTS, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XWORDLISTS
    dq row_XWORDLISTS
section .text
XWORDLISTS:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, wordlist_reg
    lea rax, [rel wordlist_reg]
    mov qword [rel arm_x0], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x0, wordlist_reg_n
    lea rax, [rel wordlist_reg_n]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
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
nm_XALSO:
    ; DCB "ALSO", 0
    db "ALSO", 0
hl_XALSO:
    ; DCB "ALSO ( -- ) duplicate the first search-order entry", 0
    db "ALSO ( -- ) duplicate the first search-order entry", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XALSO:
    ; DCQ     nm_XALSO, hl_XALSO
    dq nm_XALSO, hl_XALSO
    ; DCQ     0
    dq 0
    ; DCQ     XALSO, 0
    dq XALSO, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XALSO
    dq row_XALSO
section .text
XALSO:
    ; lea x0, search_order_n
    lea rax, [rel search_order_n]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _also_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _also_done
    ; cmp     x1, #8
    mov rax, qword [rel arm_x1]
    cmp rax, 8
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _also_done
    cmp byte [rel arm_c], 0
    jne _also_done
    ; lea x2, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; mov     x4, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x4], rax
_also_shift:
    ; cbz     x4, _also_put
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _also_put
    ; sub     x4, x4, #1
    mov rax, qword [rel arm_x4]
    sub rax, 1
    mov qword [rel arm_x4], rax
    ; ldr     x5, [x2, x4, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x4]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; add     x6, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; str     x5, [x2, x6, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x6]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; b       _also_shift
    jmp _also_shift
_also_put:
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
_also_done:
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
nm_XREDEF_WARNING:
    ; DCB "REDEF-WARNING", 0
    db "REDEF-WARNING", 0
hl_XREDEF_WARNING:
    ; DCB "REDEF-WARNING ( -- addr ) nonzero warns on redefine", 0
    db "REDEF-WARNING ( -- addr ) nonzero warns on redefine", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XREDEF_WARNING:
    ; DCQ     nm_XREDEF_WARNING, hl_XREDEF_WARNING
    dq nm_XREDEF_WARNING, hl_XREDEF_WARNING
    ; DCQ     0
    dq 0
    ; DCQ     XREDEF_WARNING, 0
    dq XREDEF_WARNING, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XREDEF_WARNING
    dq row_XREDEF_WARNING
section .text
XREDEF_WARNING:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, redef_warn
    lea rax, [rel redef_warn]
    mov qword [rel arm_x0], rax
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
nm_XTRAVERSE_WORDLIST:
    ; DCB "TRAVERSE-WORDLIST", 0
    db "TRAVERSE-WORDLIST", 0
hl_XTRAVERSE_WORDLIST:
    ; DCB "TRAVERSE-WORDLIST ( i*x xt wid -- j*x ) visit each name", 0
    db "TRAVERSE-WORDLIST ( i*x xt wid -- j*x ) visit each name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTRAVERSE_WORDLIST:
    ; DCQ     nm_XTRAVERSE_WORDLIST, hl_XTRAVERSE_WORDLIST
    dq nm_XTRAVERSE_WORDLIST, hl_XTRAVERSE_WORDLIST
    ; DCQ     0
    dq 0
    ; DCQ     XTRAVERSE_WORDLIST, 0
    dq XTRAVERSE_WORDLIST, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTRAVERSE_WORDLIST
    dq row_XTRAVERSE_WORDLIST
section .text
XTRAVERSE_WORDLIST:
    ; mov     x5, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x5], rax
    ; ldr     x6, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
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
    ; str     x19, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
    ; str     x5, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; mov     x7, #0
    mov rax, 0
    mov qword [rel arm_x7], rax
    ; str     x7, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x7]
    mov qword [r10], rax
    ; str     x6, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; ldr     x7, [x5]
    mov r10, qword [rel arm_x5]
    mov rax, qword [r10]
    mov qword [rel arm_x7], rax
_tw_loop:
    ; cbz     x7, _tw_advance
    mov rax, qword [rel arm_x7]
    cmp rax, 0
    je _tw_advance
    ; ldr     x8, [x7, #-16]
    mov r10, qword [rel arm_x7]
    add r10, -16
    mov rax, qword [r10]
    mov qword [rel arm_x8], rax
    ; ldr     x0, [x7, #-8]
    mov r10, qword [rel arm_x7]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; and     x0, x0, #0xFFFF
    mov rax, qword [rel arm_x0]
    and rax, 0xffff
    mov qword [rel arm_x0], rax
    ; sub     x0, x7, x0
    mov rax, qword [rel arm_x7]
    mov rcx, qword [rel arm_x0]
    sub rax, rcx
    mov qword [rel arm_x0], rax
    ; ldrb    w0, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    ; tst     w0, #0x80
    mov eax, dword [rel arm_x0]
    test eax, 0x80
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    _tw_skip
    cmp byte [rel arm_z], 0
    je _tw_skip
    ; and     w0, w0, #0x7F
    mov eax, dword [rel arm_x0]
    and eax, 0x7f
    mov qword [rel arm_x0], rax
    ; cbz     w0, _tw_skip
    mov eax, dword [rel arm_x0]
    cmp rax, 0
    je _tw_skip
    ; ldr     x6, [x23]
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; str     x8, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x8]
    mov qword [r10], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x7
    mov rax, qword [rel arm_x7]
    mov qword [rel arm_x20], rax
    ; mov     x21, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x21], rax
    ; lea x19, tw_continue_cell
    lea rax, [rel tw_continue_cell]
    mov qword [rel arm_x19], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
_tw_skip:
    ; mov     x7, x8
    mov rax, qword [rel arm_x8]
    mov qword [rel arm_x7], rax
    ; b       _tw_loop
    jmp _tw_loop
_tw_advance:
    ; ldr     x6, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x7, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x7], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x5, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; add     x7, x7, #1
    mov rax, qword [rel arm_x7]
    add rax, 1
    mov qword [rel arm_x7], rax
    ; cmp     x7, #16
    mov rax, qword [rel arm_x7]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _tw_done
    cmp byte [rel arm_c], 0
    jne _tw_done
    ; str     x5, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; str     x7, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x7]
    mov qword [r10], rax
    ; str     x6, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; add     x0, x5, x7, lsl #3
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x7]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; ldr     x7, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x7], rax
    ; b       _tw_loop
    jmp _tw_loop
_tw_done:
    ; ldr     x19, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
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
XTW_CONTINUE:
    ; ldr     x8, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x8], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x6, [x23]
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; cbz     x20, _tw_stop
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    je _tw_stop
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x7, x8
    mov rax, qword [rel arm_x8]
    mov qword [rel arm_x7], rax
    ; cbz     x7, _tw_advance
    mov rax, qword [rel arm_x7]
    cmp rax, 0
    je _tw_advance
    ; b       _tw_loop
    jmp _tw_loop
_tw_stop:
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x6, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x7, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x7], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x5, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; ldr     x19, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x19], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
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
nm_XCATCH:
    ; DCB "CATCH", 0
    db "CATCH", 0
hl_XCATCH:
    ; DCB "CATCH ( xt -- n ) run xt and push 0 or the throw code", 0
    db "CATCH ( xt -- n ) run xt and push 0 or the throw code", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCATCH:
    ; DCQ     nm_XCATCH, hl_XCATCH
    dq nm_XCATCH, hl_XCATCH
    ; DCQ     0
    dq 0
    ; DCQ     XCATCH, XCATCH_END
    dq XCATCH, XCATCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCATCH
    dq row_XCATCH
section .text
XCATCH:
    ; mov     x5, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x5], rax
    ; lea x0, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x0], rax
    ; add     x0, x0, #1, lsl #12
    mov rax, qword [rel arm_x0]
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
    ; b.hs    _catch_empty
    cmp byte [rel arm_c], 0
    jne _catch_empty
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; b       _catch_save
    jmp _catch_save
_catch_empty:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
_catch_save:
    ; lea x7, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x7], rax
    ; ldr     x2, [x7]
    mov r10, qword [rel arm_x7]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; lea x3, eval_resume_sp
    lea rax, [rel eval_resume_sp]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; str     x2, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; str     x20, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; str     x22, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x22]
    mov qword [r10], rax
    ; lea x2, source_sp
    lea rax, [rel source_sp]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; str     x2, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; str     x19, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
    ; str     x23, [x7]
    mov r10, qword [rel arm_x7]
    mov rax, qword [rel arm_x23]
    mov qword [r10], rax
    ; lea x19, catch_ok_cell
    lea rax, [rel catch_ok_cell]
    mov qword [rel arm_x19], rax
    ; mov     x21, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x21], rax
    ; ldr     x1, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; br      x1
    mov rax, qword [rel arm_x1]
    jmp rax
XCATCH_END:
section .bwstr align=1
nm_XCATCH_OK:
    ; DCB "(CATCH-OK)", 0
    db "(CATCH-OK)", 0
hl_XCATCH_OK:
    ; DCB "(CATCH-OK) ( -- 0 ) CATCH success path", 0
    db "(CATCH-OK) ( -- 0 ) CATCH success path", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCATCH_OK:
    ; DCQ     nm_XCATCH_OK, hl_XCATCH_OK
    dq nm_XCATCH_OK, hl_XCATCH_OK
    ; DCQ     0
    dq 0
    ; DCQ     XCATCH_OK, XCATCH_OK_END
    dq XCATCH_OK, XCATCH_OK_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCATCH_OK
    dq row_XCATCH_OK
section .text
XCATCH_OK:
    ; lea x7, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x7], rax
    ; ldr     x1, [x7]
    mov r10, qword [rel arm_x7]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _cok_push
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _cok_push
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
    ; add     x23, x23, #24
    mov rax, qword [rel arm_x23]
    add rax, 0x18
    mov qword [rel arm_x23], rax
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
    ; add     x23, x23, #8
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
_cok_push:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XCATCH_OK_END:
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
nm_XXC_STORE_PLUS:
    ; DCB "XC!+", 0
    db "XC!+", 0
hl_XXC_STORE_PLUS:
    ; DCB "XC!+ ( xchar xc-addr1 -- xc-addr2 ) store one UTF-8 xchar", 0
    db "XC!+ ( xchar xc-addr1 -- xc-addr2 ) store one UTF-8 xchar", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XXC_STORE_PLUS:
    ; DCQ     nm_XXC_STORE_PLUS, hl_XXC_STORE_PLUS
    dq nm_XXC_STORE_PLUS, hl_XXC_STORE_PLUS
    ; DCQ     0
    dq 0
    ; DCQ     XXC_STORE_PLUS, XXC_STORE_PLUS_END
    dq XXC_STORE_PLUS, XXC_STORE_PLUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XXC_STORE_PLUS
    dq row_XXC_STORE_PLUS
section .text
XXC_STORE_PLUS:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
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
    je xsk_85
    cmp byte [rel arm_z], 0
    je xsk_83
    xsk_85:
    mov rax, qword [rel arm_x1]
    jmp xsk_84
    xsk_83:
    mov rax, qword [rel arm_x2]
    xsk_84:
    mov qword [rel arm_x1], rax
    ; cmp     x1, #0x7F
    mov rax, qword [rel arm_x1]
    cmp rax, 0x7f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _xcsp_1
    cmp byte [rel arm_c], 0
    je _xcsp_1
    cmp byte [rel arm_z], 0
    jne _xcsp_1
    ; cmp     x1, #0x7FF
    mov rax, qword [rel arm_x1]
    cmp rax, 0x7ff
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _xcsp_2
    cmp byte [rel arm_c], 0
    je _xcsp_2
    cmp byte [rel arm_z], 0
    jne _xcsp_2
    ; movz    x2, #0xFFFF
    mov rax, 0xffff
    mov qword [rel arm_x2], rax
    ; cmp     x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _xcsp_3
    cmp byte [rel arm_c], 0
    je _xcsp_3
    cmp byte [rel arm_z], 0
    jne _xcsp_3
    ; lsr     x2, x1, #18
    mov rax, qword [rel arm_x1]
    shr rax, 18
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0xF0
    mov eax, dword [rel arm_x2]
    or eax, 0xf0
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; lsr     x2, x1, #12
    mov rax, qword [rel arm_x1]
    shr rax, 12
    mov qword [rel arm_x2], rax
    ; and     w2, w2, #0x3F
    mov eax, dword [rel arm_x2]
    and eax, 0x3f
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0x80
    mov eax, dword [rel arm_x2]
    or eax, 0x80
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; lsr     x2, x1, #6
    mov rax, qword [rel arm_x1]
    shr rax, 6
    mov qword [rel arm_x2], rax
    ; and     w2, w2, #0x3F
    mov eax, dword [rel arm_x2]
    and eax, 0x3f
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0x80
    mov eax, dword [rel arm_x2]
    or eax, 0x80
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w2, w1, #0x3F
    mov eax, dword [rel arm_x1]
    and eax, 0x3f
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0x80
    mov eax, dword [rel arm_x2]
    or eax, 0x80
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
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
_xcsp_3:
    ; lsr     x2, x1, #12
    mov rax, qword [rel arm_x1]
    shr rax, 12
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0xE0
    mov eax, dword [rel arm_x2]
    or eax, 0xe0
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; lsr     x2, x1, #6
    mov rax, qword [rel arm_x1]
    shr rax, 6
    mov qword [rel arm_x2], rax
    ; and     w2, w2, #0x3F
    mov eax, dword [rel arm_x2]
    and eax, 0x3f
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0x80
    mov eax, dword [rel arm_x2]
    or eax, 0x80
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w2, w1, #0x3F
    mov eax, dword [rel arm_x1]
    and eax, 0x3f
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0x80
    mov eax, dword [rel arm_x2]
    or eax, 0x80
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
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
_xcsp_2:
    ; lsr     x2, x1, #6
    mov rax, qword [rel arm_x1]
    shr rax, 6
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0xC0
    mov eax, dword [rel arm_x2]
    or eax, 0xc0
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w2, w1, #0x3F
    mov eax, dword [rel arm_x1]
    and eax, 0x3f
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0x80
    mov eax, dword [rel arm_x2]
    or eax, 0x80
    mov qword [rel arm_x2], rax
    ; strb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
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
_xcsp_1:
    ; strb    w1, [x0], #1
    mov r10, qword [rel arm_x0]
    mov eax, dword [rel arm_x1]
    mov byte [r10], al
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XXC_STORE_PLUS_END:
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
nm_XXC_FETCH_PLUS:
    ; DCB "XC@+", 0
    db "XC@+", 0
hl_XXC_FETCH_PLUS:
    ; DCB "XC@+ ( xc-addr1 -- xc-addr2 xchar ) fetch one UTF-8 xchar", 0
    db "XC@+ ( xc-addr1 -- xc-addr2 xchar ) fetch one UTF-8 xchar", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XXC_FETCH_PLUS:
    ; DCQ     nm_XXC_FETCH_PLUS, hl_XXC_FETCH_PLUS
    dq nm_XXC_FETCH_PLUS, hl_XXC_FETCH_PLUS
    ; DCQ     0
    dq 0
    ; DCQ     XXC_FETCH_PLUS, XXC_FETCH_PLUS_END
    dq XXC_FETCH_PLUS, XXC_FETCH_PLUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XXC_FETCH_PLUS
    dq row_XXC_FETCH_PLUS
section .text
XXC_FETCH_PLUS:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; ldrb    w1, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; cmp     w1, #0x80
    mov eax, dword [rel arm_x1]
    cmp eax, 0x80
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _xcfp_1
    cmp byte [rel arm_c], 0
    je _xcfp_1
    ; cmp     w1, #0xE0
    mov eax, dword [rel arm_x1]
    cmp eax, 0xe0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _xcfp_2
    cmp byte [rel arm_c], 0
    je _xcfp_2
    ; cmp     w1, #0xF0
    mov eax, dword [rel arm_x1]
    cmp eax, 0xf0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _xcfp_3
    cmp byte [rel arm_c], 0
    je _xcfp_3
    ; and     w2, w1, #0x07
    mov eax, dword [rel arm_x1]
    and eax, 7
    mov qword [rel arm_x2], rax
    ; ldrb    w3, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w3, w3, #0x3F
    mov eax, dword [rel arm_x3]
    and eax, 0x3f
    mov qword [rel arm_x3], rax
    ; lsl     w2, w2, #6
    mov eax, dword [rel arm_x2]
    shl eax, 6
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, w3
    mov eax, dword [rel arm_x2]
    mov ecx, dword [rel arm_x3]
    or eax, ecx
    mov qword [rel arm_x2], rax
    ; ldrb    w3, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w3, w3, #0x3F
    mov eax, dword [rel arm_x3]
    and eax, 0x3f
    mov qword [rel arm_x3], rax
    ; lsl     w2, w2, #6
    mov eax, dword [rel arm_x2]
    shl eax, 6
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, w3
    mov eax, dword [rel arm_x2]
    mov ecx, dword [rel arm_x3]
    or eax, ecx
    mov qword [rel arm_x2], rax
    ; ldrb    w3, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w3, w3, #0x3F
    mov eax, dword [rel arm_x3]
    and eax, 0x3f
    mov qword [rel arm_x3], rax
    ; lsl     w2, w2, #6
    mov eax, dword [rel arm_x2]
    shl eax, 6
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, w3
    mov eax, dword [rel arm_x2]
    mov ecx, dword [rel arm_x3]
    or eax, ecx
    mov qword [rel arm_x2], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
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
_xcfp_3:
    ; and     w2, w1, #0x0F
    mov eax, dword [rel arm_x1]
    and eax, 0xf
    mov qword [rel arm_x2], rax
    ; ldrb    w3, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w3, w3, #0x3F
    mov eax, dword [rel arm_x3]
    and eax, 0x3f
    mov qword [rel arm_x3], rax
    ; lsl     w2, w2, #6
    mov eax, dword [rel arm_x2]
    shl eax, 6
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, w3
    mov eax, dword [rel arm_x2]
    mov ecx, dword [rel arm_x3]
    or eax, ecx
    mov qword [rel arm_x2], rax
    ; ldrb    w3, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w3, w3, #0x3F
    mov eax, dword [rel arm_x3]
    and eax, 0x3f
    mov qword [rel arm_x3], rax
    ; lsl     w2, w2, #6
    mov eax, dword [rel arm_x2]
    shl eax, 6
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, w3
    mov eax, dword [rel arm_x2]
    mov ecx, dword [rel arm_x3]
    or eax, ecx
    mov qword [rel arm_x2], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
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
_xcfp_2:
    ; and     w2, w1, #0x1F
    mov eax, dword [rel arm_x1]
    and eax, 0x1f
    mov qword [rel arm_x2], rax
    ; ldrb    w3, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; and     w3, w3, #0x3F
    mov eax, dword [rel arm_x3]
    and eax, 0x3f
    mov qword [rel arm_x3], rax
    ; lsl     w2, w2, #6
    mov eax, dword [rel arm_x2]
    shl eax, 6
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, w3
    mov eax, dword [rel arm_x2]
    mov ecx, dword [rel arm_x3]
    or eax, ecx
    mov qword [rel arm_x2], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
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
_xcfp_1:
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
XXC_FETCH_PLUS_END:
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
nm_XBOOT_WORD_TABLE:
    ; DCB "BOOT-WORD-TABLE", 0
    db "BOOT-WORD-TABLE", 0
hl_XBOOT_WORD_TABLE:
    ; DCB "BOOT-WORD-TABLE ( -- addr ) start of the boot-word pointer table", 0
    db "BOOT-WORD-TABLE ( -- addr ) start of the boot-word pointer table", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBOOT_WORD_TABLE:
    ; DCQ     nm_XBOOT_WORD_TABLE, hl_XBOOT_WORD_TABLE
    dq nm_XBOOT_WORD_TABLE, hl_XBOOT_WORD_TABLE
    ; DCQ     0
    dq 0
    ; DCQ     XBOOT_WORD_TABLE, XBOOT_WORD_TABLE_END
    dq XBOOT_WORD_TABLE, XBOOT_WORD_TABLE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBOOT_WORD_TABLE
    dq row_XBOOT_WORD_TABLE
section .text
XBOOT_WORD_TABLE:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, bootptr_start
    lea rax, [rel bootptr_start]
    mov qword [rel arm_x20], rax
XBOOT_WORD_TABLE_END:
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
nm_XBW_TABLE_LIM:
    ; DCB "BOOT-WORD-TABLE-END", 0
    db "BOOT-WORD-TABLE-END", 0
hl_XBW_TABLE_LIM:
    ; DCB "BOOT-WORD-TABLE-END ( -- addr ) end of the boot-word pointer table", 0
    db "BOOT-WORD-TABLE-END ( -- addr ) end of the boot-word pointer table", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBW_TABLE_LIM:
    ; DCQ     nm_XBW_TABLE_LIM, hl_XBW_TABLE_LIM
    dq nm_XBW_TABLE_LIM, hl_XBW_TABLE_LIM
    ; DCQ     0
    dq 0
    ; DCQ     XBW_TABLE_LIM, XBW_TABLE_LIM_END
    dq XBW_TABLE_LIM, XBW_TABLE_LIM_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBW_TABLE_LIM
    dq row_XBW_TABLE_LIM
section .text
XBW_TABLE_LIM:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x20, bootptr_end
    lea rax, [rel bootptr_end]
    mov qword [rel arm_x20], rax
XBW_TABLE_LIM_END:
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
nm_XFLIT:
    ; DCB "FLIT", 0
    db "FLIT", 0
hl_XFLIT:
    ; DCB "FLIT ( -- ) push the inline float bits", 0
    db "FLIT ( -- ) push the inline float bits", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFLIT:
    ; DCQ     nm_XFLIT, hl_XFLIT
    dq nm_XFLIT, hl_XFLIT
    ; DCQ     0
    dq 0
    ; DCQ     XFLIT, XFLIT_END
    dq XFLIT, XFLIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFLIT
    dq row_XFLIT
section .text
XFLIT:
    ; ldr     x1, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; mov     x0, #101
    mov rax, 0x65
    mov qword [rel arm_x0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _float_op_call
    lea rax, [rel xret_86]
    mov qword [rel arm_x30], rax
    jmp _float_op_call
    xret_86:
XFLIT_END:
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
nm_XFLIT_ADDR:
    ; DCB "FLIT-ADDR", 0
    db "FLIT-ADDR", 0
hl_XFLIT_ADDR:
    ; DCB "FLIT-ADDR ( -- xt ) xt of FLIT", 0
    db "FLIT-ADDR ( -- xt ) xt of FLIT", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFLIT_ADDR:
    ; DCQ     nm_XFLIT_ADDR, hl_XFLIT_ADDR
    dq nm_XFLIT_ADDR, hl_XFLIT_ADDR
    ; DCQ     0
    dq 0
    ; DCQ     XFLIT_ADDR, XFLIT_ADDR_END
    dq XFLIT_ADDR, XFLIT_ADDR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFLIT_ADDR
    dq row_XFLIT_ADDR
section .text
XFLIT_ADDR:
    ; lea x0, cfa_flit
    lea rax, [rel cfa_flit]
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
XFLIT_ADDR_END:
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
nm_XFLOAT_OP:
    ; DCB "(F-OP)", 0
    db "(F-OP)", 0
hl_XFLOAT_OP:
    ; DCB "(F-OP) ( i*x op -- j*x ) float host multiplex", 0
    db "(F-OP) ( i*x op -- j*x ) float host multiplex", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFLOAT_OP:
    ; DCQ     nm_XFLOAT_OP, hl_XFLOAT_OP
    dq nm_XFLOAT_OP, hl_XFLOAT_OP
    ; DCQ     0
    dq 0
    ; DCQ     XFLOAT_OP, XFLOAT_OP_END
    dq XFLOAT_OP, XFLOAT_OP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFLOAT_OP
    dq row_XFLOAT_OP
section .text
XFLOAT_OP:
    ; mov     x9, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x9], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; cmp     x9, #22
    mov rax, qword [rel arm_x9]
    cmp rax, 0x16
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #23
    mov rax, qword [rel arm_x9]
    cmp rax, 0x17
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #24
    mov rax, qword [rel arm_x9]
    cmp rax, 0x18
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #25
    mov rax, qword [rel arm_x9]
    cmp rax, 0x19
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #26
    mov rax, qword [rel arm_x9]
    cmp rax, 0x1a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #27
    mov rax, qword [rel arm_x9]
    cmp rax, 0x1b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #28
    mov rax, qword [rel arm_x9]
    cmp rax, 0x1c
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #37
    mov rax, qword [rel arm_x9]
    cmp rax, 0x25
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #39
    mov rax, qword [rel arm_x9]
    cmp rax, 0x27
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #40
    mov rax, qword [rel arm_x9]
    cmp rax, 0x28
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #41
    mov rax, qword [rel arm_x9]
    cmp rax, 0x29
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #42
    mov rax, qword [rel arm_x9]
    cmp rax, 0x2a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #43
    mov rax, qword [rel arm_x9]
    cmp rax, 0x2b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #44
    mov rax, qword [rel arm_x9]
    cmp rax, 0x2c
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #70
    mov rax, qword [rel arm_x9]
    cmp rax, 0x46
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #71
    mov rax, qword [rel arm_x9]
    cmp rax, 0x47
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #72
    mov rax, qword [rel arm_x9]
    cmp rax, 0x48
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #73
    mov rax, qword [rel arm_x9]
    cmp rax, 0x49
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #74
    mov rax, qword [rel arm_x9]
    cmp rax, 0x4a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #75
    mov rax, qword [rel arm_x9]
    cmp rax, 0x4b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_a1
    cmp byte [rel arm_z], 0
    jne _fo_a1
    ; cmp     x9, #30
    mov rax, qword [rel arm_x9]
    cmp rax, 0x1e
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_d2
    cmp byte [rel arm_z], 0
    jne _fo_d2
    ; cmp     x9, #32
    mov rax, qword [rel arm_x9]
    cmp rax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_cu
    cmp byte [rel arm_z], 0
    jne _fo_cu
    ; cmp     x9, #38
    mov rax, qword [rel arm_x9]
    cmp rax, 0x26
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_cu
    cmp byte [rel arm_z], 0
    jne _fo_cu
    ; b       _fo_go
    jmp _fo_go
_fo_a1:
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
    ; b       _fo_go
    jmp _fo_go
_fo_d2:
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
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
    ; b       _fo_go
    jmp _fo_go
_fo_cu:
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
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
_fo_go:
    ; str     x9, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x9]
    mov qword [r10], rax
    ; mov     x0, x9
    mov rax, qword [rel arm_x9]
    mov qword [rel arm_x0], rax
    ; bl      _float_op_call
    lea rax, [rel xret_87]
    mov qword [rel arm_x30], rax
    jmp _float_op_call
    xret_87:
    ; ldr     x9, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; cmp     x9, #31
    mov rax, qword [rel arm_x9]
    cmp rax, 0x1f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push2
    cmp byte [rel arm_z], 0
    jne _fo_push2
    ; cmp     x9, #38
    mov rax, qword [rel arm_x9]
    cmp rax, 0x26
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push3
    cmp byte [rel arm_z], 0
    jne _fo_push3
    ; cmp     x9, #1
    mov rax, qword [rel arm_x9]
    cmp rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #15
    mov rax, qword [rel arm_x9]
    cmp rax, 0xf
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #16
    mov rax, qword [rel arm_x9]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #17
    mov rax, qword [rel arm_x9]
    cmp rax, 0x11
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #18
    mov rax, qword [rel arm_x9]
    cmp rax, 0x12
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #19
    mov rax, qword [rel arm_x9]
    cmp rax, 0x13
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #20
    mov rax, qword [rel arm_x9]
    cmp rax, 0x14
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #21
    mov rax, qword [rel arm_x9]
    cmp rax, 0x15
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #29
    mov rax, qword [rel arm_x9]
    cmp rax, 0x1d
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #32
    mov rax, qword [rel arm_x9]
    cmp rax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #36
    mov rax, qword [rel arm_x9]
    cmp rax, 0x24
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #39
    mov rax, qword [rel arm_x9]
    cmp rax, 0x27
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #40
    mov rax, qword [rel arm_x9]
    cmp rax, 0x28
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #41
    mov rax, qword [rel arm_x9]
    cmp rax, 0x29
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #42
    mov rax, qword [rel arm_x9]
    cmp rax, 0x2a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #43
    mov rax, qword [rel arm_x9]
    cmp rax, 0x2b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #44
    mov rax, qword [rel arm_x9]
    cmp rax, 0x2c
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #70
    mov rax, qword [rel arm_x9]
    cmp rax, 0x46
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #71
    mov rax, qword [rel arm_x9]
    cmp rax, 0x47
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #72
    mov rax, qword [rel arm_x9]
    cmp rax, 0x48
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #73
    mov rax, qword [rel arm_x9]
    cmp rax, 0x49
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #74
    mov rax, qword [rel arm_x9]
    cmp rax, 0x4a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #75
    mov rax, qword [rel arm_x9]
    cmp rax, 0x4b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; cmp     x9, #102
    mov rax, qword [rel arm_x9]
    cmp rax, 0x66
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fo_push1
    cmp byte [rel arm_z], 0
    jne _fo_push1
    ; b       _fo_none
    jmp _fo_none
_fo_push1:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x20], rax
    ; b       _fo_none
    jmp _fo_none
_fo_push2:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; mov     x20, x7
    mov rax, qword [rel arm_x7]
    mov qword [rel arm_x20], rax
    ; b       _fo_none
    jmp _fo_none
_fo_push3:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; str     x7, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x7]
    mov qword [r10], rax
    ; mov     x20, x8
    mov rax, qword [rel arm_x8]
    mov qword [rel arm_x20], rax
_fo_none:
XFLOAT_OP_END:
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
nm_XLOCAL_PAREN:
    ; DCB "(LOCAL)", 0
    db "(LOCAL)", 0
hl_XLOCAL_PAREN:
    ; DCB "(LOCAL) ( c-addr u -- ) declare a local or end the local list", 0
    db "(LOCAL) ( c-addr u -- ) declare a local or end the local list", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_PAREN:
    ; DCQ     nm_XLOCAL_PAREN, hl_XLOCAL_PAREN
    dq nm_XLOCAL_PAREN, hl_XLOCAL_PAREN
    ; DCQ     0
    dq 0
    ; DCQ     XLOCAL_PAREN, XLOCAL_PAREN_END
    dq XLOCAL_PAREN, XLOCAL_PAREN_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_PAREN
    dq row_XLOCAL_PAREN
section .text
XLOCAL_PAREN:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _lp_leave
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _lp_leave
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
    ; cbz     x1, _lp_last
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _lp_last
    ; lea x2, local_declaring
    lea rax, [rel local_declaring]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbnz    x3, _lp_add
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    jne _lp_add
    ; stp     x0, x1, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _local_compile_reset
    lea rax, [rel xret_88]
    mov qword [rel arm_x30], rax
    jmp _local_compile_reset
    xret_88:
    ; ldp     x0, x1, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    add rsp, 0x10
    ; lea x3, local_init_reverse
    lea rax, [rel local_init_reverse]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
    ; mov     x3, #1
    mov rax, 1
    mov qword [rel arm_x3], rax
    ; lea x2, local_declaring
    lea rax, [rel local_declaring]
    mov qword [rel arm_x2], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
_lp_add:
    ; bl      _local_add_name
    lea rax, [rel xret_89]
    mov qword [rel arm_x30], rax
    jmp _local_add_name
    xret_89:
    ; lea x2, local_init_count
    lea rax, [rel local_init_count]
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
    ; b       _lp_leave
    jmp _lp_leave
_lp_last:
    ; lea x2, local_declaring
    lea rax, [rel local_declaring]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbnz    x3, _lp_fin
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    jne _lp_fin
    ; bl      _local_compile_reset
    lea rax, [rel xret_90]
    mov qword [rel arm_x30], rax
    jmp _local_compile_reset
    xret_90:
    ; lea x3, local_init_reverse
    lea rax, [rel local_init_reverse]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x3]
    mov r10, qword [rel arm_x3]
    mov qword [r10], 0
_lp_fin:
    ; bl      _local_finalize_compile
    lea rax, [rel xret_91]
    mov qword [rel arm_x30], rax
    jmp _local_finalize_compile
    xret_91:
    ; lea x2, local_declaring
    lea rax, [rel local_declaring]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
_lp_leave:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
XLOCAL_PAREN_END:
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
nm_XTEXTEDIT:
    ; DCB "TEXTEDIT", 0
    db "TEXTEDIT", 0
hl_XTEXTEDIT:
    ; DCB "TEXTEDIT ( -- ) open the next file name in the editor", 0
    db "TEXTEDIT ( -- ) open the next file name in the editor", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTEXTEDIT:
    ; DCQ     nm_XTEXTEDIT, hl_XTEXTEDIT
    dq nm_XTEXTEDIT, hl_XTEXTEDIT
    ; DCQ     0
    dq 0
    ; DCQ     XTEXTEDIT, 0
    dq XTEXTEDIT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTEXTEDIT
    dq row_XTEXTEDIT
section .text
XTEXTEDIT:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _parse_filespec
    lea rax, [rel xret_92]
    mov qword [rel arm_x30], rax
    jmp _parse_filespec
    xret_92:
    ; bl      host_edit
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
    call host_edit
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
nm_XEDIT_AT:
    ; DCB "EDIT-AT", 0
    db "EDIT-AT", 0
hl_XEDIT_AT:
    ; DCB "EDIT-AT ( c-addr u line -- ) open path at line in the editor", 0
    db "EDIT-AT ( c-addr u line -- ) open path at line in the editor", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XEDIT_AT:
    ; DCQ     nm_XEDIT_AT, hl_XEDIT_AT
    dq nm_XEDIT_AT, hl_XEDIT_AT
    ; DCQ     0
    dq 0
    ; DCQ     XEDIT_AT, 0
    dq XEDIT_AT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XEDIT_AT
    dq row_XEDIT_AT
section .text
XEDIT_AT:
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
    ; lea x9, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x9], rax
    ; add     x9, x9, #1, lsl #12
    mov rax, qword [rel arm_x9]
    add rax, 0x1000
    mov qword [rel arm_x9], rax
    ; cmp     x22, x9
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _eat_empty
    cmp byte [rel arm_c], 0
    jne _eat_empty
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; b       _eat_call
    jmp _eat_call
_eat_empty:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
_eat_call:
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
    ; mov     x1, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x1], rax
    ; mov     x2, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x2], rax
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
    ; bl      host_edit_at
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
    call host_edit_at
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
nm_XSYSTEM:
    ; DCB "SYSTEM", 0
    db "SYSTEM", 0
hl_XSYSTEM:
    ; DCB "SYSTEM ( c-addr u -- n ) run a shell command and return the exit code or -1", 0
    db "SYSTEM ( c-addr u -- n ) run a shell command and return the exit code or -1", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSYSTEM:
    ; DCQ     nm_XSYSTEM, hl_XSYSTEM
    dq nm_XSYSTEM, hl_XSYSTEM
    ; DCQ     0
    dq 0
    ; DCQ     XSYSTEM, XSYSTEM_END
    dq XSYSTEM, XSYSTEM_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSYSTEM
    dq row_XSYSTEM
section .text
XSYSTEM:
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
    ; bl      host_system
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
    call host_system
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; str     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; ldr     x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
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
XSYSTEM_END:
section .bwstr align=1
nm_XRO:
    ; DCB "R/O", 0
    db "R/O", 0
hl_XRO:
    ; DCB "R/O ( -- fam ) read-only file access method", 0
    db "R/O ( -- fam ) read-only file access method", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRO:
    ; DCQ     nm_XRO, hl_XRO
    dq nm_XRO, hl_XRO
    ; DCQ     0
    dq 0
    ; DCQ     XRO, XRO_END
    dq XRO, XRO_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRO
    dq row_XRO
section .text
XRO:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #1
    mov rax, 1
    mov qword [rel arm_x20], rax
XRO_END:
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
nm_XRW:
    ; DCB "R/W", 0
    db "R/W", 0
hl_XRW:
    ; DCB "R/W ( -- fam ) read-write file access method", 0
    db "R/W ( -- fam ) read-write file access method", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRW:
    ; DCQ     nm_XRW, hl_XRW
    dq nm_XRW, hl_XRW
    ; DCQ     0
    dq 0
    ; DCQ     XRW, XRW_END
    dq XRW, XRW_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRW
    dq row_XRW
section .text
XRW:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #3
    mov rax, 3
    mov qword [rel arm_x20], rax
XRW_END:
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
nm_XW_O:
    ; DCB "W/O", 0
    db "W/O", 0
hl_XW_O:
    ; DCB "W/O ( -- fam ) write-only file access method", 0
    db "W/O ( -- fam ) write-only file access method", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XW_O:
    ; DCQ     nm_XW_O, hl_XW_O
    dq nm_XW_O, hl_XW_O
    ; DCQ     0
    dq 0
    ; DCQ     XW_O, XW_O_END
    dq XW_O, XW_O_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XW_O
    dq row_XW_O
section .text
XW_O:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #2
    mov rax, 2
    mov qword [rel arm_x20], rax
XW_O_END:
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
nm_XBIN:
    ; DCB "BIN", 0
    db "BIN", 0
hl_XBIN:
    ; DCB "BIN ( fam -- fam ) binary access is the same fam here", 0
    db "BIN ( fam -- fam ) binary access is the same fam here", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBIN:
    ; DCQ     nm_XBIN, hl_XBIN
    dq nm_XBIN, hl_XBIN
    ; DCQ     0
    dq 0
    ; DCQ     XBIN, 0
    dq XBIN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBIN
    dq row_XBIN
section .text
XBIN:
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
nm_XOPEN_FILE:
    ; DCB "OPEN-FILE", 0
    db "OPEN-FILE", 0
hl_XOPEN_FILE:
    ; DCB "OPEN-FILE ( c-addr u fam -- fileid ior ) open an existing file", 0
    db "OPEN-FILE ( c-addr u fam -- fileid ior ) open an existing file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XOPEN_FILE:
    ; DCQ     nm_XOPEN_FILE, hl_XOPEN_FILE
    dq nm_XOPEN_FILE, hl_XOPEN_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XOPEN_FILE, XOPEN_FILE_END
    dq XOPEN_FILE, XOPEN_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XOPEN_FILE
    dq row_XOPEN_FILE
section .text
XOPEN_FILE:
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
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; bl      _file_op_call
    lea rax, [rel xret_93]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_93:
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
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XOPEN_FILE_END:
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
nm_XCREATE_FILE:
    ; DCB "CREATE-FILE", 0
    db "CREATE-FILE", 0
hl_XCREATE_FILE:
    ; DCB "CREATE-FILE ( c-addr u fam -- fileid ior ) create or truncate a file", 0
    db "CREATE-FILE ( c-addr u fam -- fileid ior ) create or truncate a file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCREATE_FILE:
    ; DCQ     nm_XCREATE_FILE, hl_XCREATE_FILE
    dq nm_XCREATE_FILE, hl_XCREATE_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XCREATE_FILE, XCREATE_FILE_END
    dq XCREATE_FILE, XCREATE_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCREATE_FILE
    dq row_XCREATE_FILE
section .text
XCREATE_FILE:
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
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #2
    mov rax, 2
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; bl      _file_op_call
    lea rax, [rel xret_94]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_94:
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
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XCREATE_FILE_END:
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
nm_XFILE_SIZE:
    ; DCB "FILE-SIZE", 0
    db "FILE-SIZE", 0
hl_XFILE_SIZE:
    ; DCB "FILE-SIZE ( fileid -- ud ior ) size of an open file", 0
    db "FILE-SIZE ( fileid -- ud ior ) size of an open file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFILE_SIZE:
    ; DCQ     nm_XFILE_SIZE, hl_XFILE_SIZE
    dq nm_XFILE_SIZE, hl_XFILE_SIZE
    ; DCQ     0
    dq 0
    ; DCQ     XFILE_SIZE, XFILE_SIZE_END
    dq XFILE_SIZE, XFILE_SIZE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFILE_SIZE
    dq row_XFILE_SIZE
section .text
XFILE_SIZE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; mov     x0, #9
    mov rax, 9
    mov qword [rel arm_x0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _file_op_call
    lea rax, [rel xret_95]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_95:
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
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; str     x7, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x7]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XFILE_SIZE_END:
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
nm_XCLOSE_FILE:
    ; DCB "CLOSE-FILE", 0
    db "CLOSE-FILE", 0
hl_XCLOSE_FILE:
    ; DCB "CLOSE-FILE ( fileid -- ior ) close an open file", 0
    db "CLOSE-FILE ( fileid -- ior ) close an open file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCLOSE_FILE:
    ; DCQ     nm_XCLOSE_FILE, hl_XCLOSE_FILE
    dq nm_XCLOSE_FILE, hl_XCLOSE_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XCLOSE_FILE, XCLOSE_FILE_END
    dq XCLOSE_FILE, XCLOSE_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCLOSE_FILE
    dq row_XCLOSE_FILE
section .text
XCLOSE_FILE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; mov     x0, #3
    mov rax, 3
    mov qword [rel arm_x0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _file_op_call
    lea rax, [rel xret_96]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_96:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
XCLOSE_FILE_END:
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
nm_XALLOCATE:
    ; DCB "ALLOCATE", 0
    db "ALLOCATE", 0
hl_XALLOCATE:
    ; DCB "ALLOCATE ( u -- a-addr ior ) allocate heap memory", 0
    db "ALLOCATE ( u -- a-addr ior ) allocate heap memory", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XALLOCATE:
    ; DCQ     nm_XALLOCATE, hl_XALLOCATE
    dq nm_XALLOCATE, hl_XALLOCATE
    ; DCQ     0
    dq 0
    ; DCQ     XALLOCATE, XALLOCATE_END
    dq XALLOCATE, XALLOCATE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XALLOCATE
    dq row_XALLOCATE
section .text
XALLOCATE:
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
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      host_alloc
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
    call host_alloc
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
    ; cbz     x0, _alloc_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _alloc_fail
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
    ; b       _alloc_leave
    jmp _alloc_leave
_alloc_fail:
    ; str     xzr, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov qword [r10], 0
    ; mov     x20, #-1
    mov rax, -1
    mov qword [rel arm_x20], rax
_alloc_leave:
XALLOCATE_END:
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
nm_XFREE:
    ; DCB "FREE", 0
    db "FREE", 0
hl_XFREE:
    ; DCB "FREE ( a-addr -- ior ) release heap memory", 0
    db "FREE ( a-addr -- ior ) release heap memory", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFREE:
    ; DCQ     nm_XFREE, hl_XFREE
    dq nm_XFREE, hl_XFREE
    ; DCQ     0
    dq 0
    ; DCQ     XFREE, XFREE_END
    dq XFREE, XFREE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFREE
    dq row_XFREE
section .text
XFREE:
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
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      host_free
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
    call host_free
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
XFREE_END:
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
nm_XRESIZE:
    ; DCB "RESIZE", 0
    db "RESIZE", 0
hl_XRESIZE:
    ; DCB "RESIZE ( a-addr1 u -- a-addr2 ior ) resize heap memory", 0
    db "RESIZE ( a-addr1 u -- a-addr2 ior ) resize heap memory", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRESIZE:
    ; DCQ     nm_XRESIZE, hl_XRESIZE
    dq nm_XRESIZE, hl_XRESIZE
    ; DCQ     0
    dq 0
    ; DCQ     XRESIZE, XRESIZE_END
    dq XRESIZE, XRESIZE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRESIZE
    dq row_XRESIZE
section .text
XRESIZE:
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
    ; str     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; bl      host_resize
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
    call host_resize
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
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
    ; cbz     x0, _resize_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _resize_fail
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
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
_resize_fail:
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x20, #-1
    mov rax, -1
    mov qword [rel arm_x20], rax
XRESIZE_END:
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
nm_XREAD_FILE:
    ; DCB "READ-FILE", 0
    db "READ-FILE", 0
hl_XREAD_FILE:
    ; DCB "READ-FILE ( c-addr u1 fileid -- u2 ior ) read from an open file", 0
    db "READ-FILE ( c-addr u1 fileid -- u2 ior ) read from an open file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XREAD_FILE:
    ; DCQ     nm_XREAD_FILE, hl_XREAD_FILE
    dq nm_XREAD_FILE, hl_XREAD_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XREAD_FILE, XREAD_FILE_END
    dq XREAD_FILE, XREAD_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XREAD_FILE
    dq row_XREAD_FILE
section .text
XREAD_FILE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #4
    mov rax, 4
    mov qword [rel arm_x0], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; bl      _file_op_call
    lea rax, [rel xret_97]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_97:
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
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XREAD_FILE_END:
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
nm_XWRITE_FILE:
    ; DCB "WRITE-FILE", 0
    db "WRITE-FILE", 0
hl_XWRITE_FILE:
    ; DCB "WRITE-FILE ( c-addr u fileid -- ior ) write to an open file", 0
    db "WRITE-FILE ( c-addr u fileid -- ior ) write to an open file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XWRITE_FILE:
    ; DCQ     nm_XWRITE_FILE, hl_XWRITE_FILE
    dq nm_XWRITE_FILE, hl_XWRITE_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XWRITE_FILE, XWRITE_FILE_END
    dq XWRITE_FILE, XWRITE_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XWRITE_FILE
    dq row_XWRITE_FILE
section .text
XWRITE_FILE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #5
    mov rax, 5
    mov qword [rel arm_x0], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; bl      _file_op_call
    lea rax, [rel xret_98]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_98:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
XWRITE_FILE_END:
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
nm_XREPOSITION_FILE:
    ; DCB "REPOSITION-FILE", 0
    db "REPOSITION-FILE", 0
hl_XREPOSITION_FILE:
    ; DCB "REPOSITION-FILE ( ud fileid -- ior ) seek in an open file", 0
    db "REPOSITION-FILE ( ud fileid -- ior ) seek in an open file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XREPOSITION_FILE:
    ; DCQ     nm_XREPOSITION_FILE, hl_XREPOSITION_FILE
    dq nm_XREPOSITION_FILE, hl_XREPOSITION_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XREPOSITION_FILE, XREPOSITION_FILE_END
    dq XREPOSITION_FILE, XREPOSITION_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XREPOSITION_FILE
    dq row_XREPOSITION_FILE
section .text
XREPOSITION_FILE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _file_op_call
    lea rax, [rel xret_99]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_99:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
XREPOSITION_FILE_END:
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
nm_XFLUSH_FILE:
    ; DCB "FLUSH-FILE", 0
    db "FLUSH-FILE", 0
hl_XFLUSH_FILE:
    ; DCB "FLUSH-FILE ( fileid -- ior ) flush an open file", 0
    db "FLUSH-FILE ( fileid -- ior ) flush an open file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFLUSH_FILE:
    ; DCQ     nm_XFLUSH_FILE, hl_XFLUSH_FILE
    dq nm_XFLUSH_FILE, hl_XFLUSH_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XFLUSH_FILE, XFLUSH_FILE_END
    dq XFLUSH_FILE, XFLUSH_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFLUSH_FILE
    dq row_XFLUSH_FILE
section .text
XFLUSH_FILE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; mov     x0, #15
    mov rax, 0xf
    mov qword [rel arm_x0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _file_op_call
    lea rax, [rel xret_100]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_100:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
XFLUSH_FILE_END:
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
nm_XREAD_LINE:
    ; DCB "READ-LINE", 0
    db "READ-LINE", 0
hl_XREAD_LINE:
    ; DCB "READ-LINE ( c-addr u1 fileid -- u2 flag ior ) read one line. flag is true when a line was read", 0
    db "READ-LINE ( c-addr u1 fileid -- u2 flag ior ) read one line. flag is true when a line was read", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XREAD_LINE:
    ; DCQ     nm_XREAD_LINE, hl_XREAD_LINE
    dq nm_XREAD_LINE, hl_XREAD_LINE
    ; DCQ     0
    dq 0
    ; DCQ     XREAD_LINE, XREAD_LINE_END
    dq XREAD_LINE, XREAD_LINE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XREAD_LINE
    dq row_XREAD_LINE
section .text
XREAD_LINE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #6
    mov rax, 6
    mov qword [rel arm_x0], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; bl      _file_op_call
    lea rax, [rel xret_101]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_101:
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
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; str     x7, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x7]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XREAD_LINE_END:
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
nm_XWRITE_LINE:
    ; DCB "WRITE-LINE", 0
    db "WRITE-LINE", 0
hl_XWRITE_LINE:
    ; DCB "WRITE-LINE ( c-addr u fileid -- ior ) write the bytes and a newline", 0
    db "WRITE-LINE ( c-addr u fileid -- ior ) write the bytes and a newline", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XWRITE_LINE:
    ; DCQ     nm_XWRITE_LINE, hl_XWRITE_LINE
    dq nm_XWRITE_LINE, hl_XWRITE_LINE
    ; DCQ     0
    dq 0
    ; DCQ     XWRITE_LINE, XWRITE_LINE_END
    dq XWRITE_LINE, XWRITE_LINE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XWRITE_LINE
    dq row_XWRITE_LINE
section .text
XWRITE_LINE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #7
    mov rax, 7
    mov qword [rel arm_x0], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; bl      _file_op_call
    lea rax, [rel xret_102]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_102:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
XWRITE_LINE_END:
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
nm_XFILE_POSITION:
    ; DCB "FILE-POSITION", 0
    db "FILE-POSITION", 0
hl_XFILE_POSITION:
    ; DCB "FILE-POSITION ( fileid -- ud ior ) byte offset in an open file", 0
    db "FILE-POSITION ( fileid -- ud ior ) byte offset in an open file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFILE_POSITION:
    ; DCQ     nm_XFILE_POSITION, hl_XFILE_POSITION
    dq nm_XFILE_POSITION, hl_XFILE_POSITION
    ; DCQ     0
    dq 0
    ; DCQ     XFILE_POSITION, XFILE_POSITION_END
    dq XFILE_POSITION, XFILE_POSITION_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFILE_POSITION
    dq row_XFILE_POSITION
section .text
XFILE_POSITION:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; mov     x0, #8
    mov rax, 8
    mov qword [rel arm_x0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _file_op_call
    lea rax, [rel xret_103]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_103:
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
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; str     x7, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x7]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XFILE_POSITION_END:
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
nm_XRESIZE_FILE:
    ; DCB "RESIZE-FILE", 0
    db "RESIZE-FILE", 0
hl_XRESIZE_FILE:
    ; DCB "RESIZE-FILE ( ud fileid -- ior ) set the length of an open file", 0
    db "RESIZE-FILE ( ud fileid -- ior ) set the length of an open file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRESIZE_FILE:
    ; DCQ     nm_XRESIZE_FILE, hl_XRESIZE_FILE
    dq nm_XRESIZE_FILE, hl_XRESIZE_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XRESIZE_FILE, XRESIZE_FILE_END
    dq XRESIZE_FILE, XRESIZE_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRESIZE_FILE
    dq row_XRESIZE_FILE
section .text
XRESIZE_FILE:
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
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #11
    mov rax, 0xb
    mov qword [rel arm_x0], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _file_op_call
    lea rax, [rel xret_104]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_104:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
XRESIZE_FILE_END:
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
nm_XDELETE_FILE:
    ; DCB "DELETE-FILE", 0
    db "DELETE-FILE", 0
hl_XDELETE_FILE:
    ; DCB "DELETE-FILE ( c-addr u -- ior ) delete a named file", 0
    db "DELETE-FILE ( c-addr u -- ior ) delete a named file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDELETE_FILE:
    ; DCQ     nm_XDELETE_FILE, hl_XDELETE_FILE
    dq nm_XDELETE_FILE, hl_XDELETE_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XDELETE_FILE, XDELETE_FILE_END
    dq XDELETE_FILE, XDELETE_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDELETE_FILE
    dq row_XDELETE_FILE
section .text
XDELETE_FILE:
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
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #12
    mov rax, 0xc
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; bl      _file_op_call
    lea rax, [rel xret_105]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_105:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
XDELETE_FILE_END:
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
nm_XRENAME_FILE:
    ; DCB "RENAME-FILE", 0
    db "RENAME-FILE", 0
hl_XRENAME_FILE:
    ; DCB "RENAME-FILE ( c-addr1 u1 c-addr2 u2 -- ior ) rename a file", 0
    db "RENAME-FILE ( c-addr1 u1 c-addr2 u2 -- ior ) rename a file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRENAME_FILE:
    ; DCQ     nm_XRENAME_FILE, hl_XRENAME_FILE
    dq nm_XRENAME_FILE, hl_XRENAME_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XRENAME_FILE, XRENAME_FILE_END
    dq XRENAME_FILE, XRENAME_FILE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRENAME_FILE
    dq row_XRENAME_FILE
section .text
XRENAME_FILE:
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
    ; mov     x4, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x4], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #13
    mov rax, 0xd
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; bl      _file_op_call
    lea rax, [rel xret_106]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_106:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
XRENAME_FILE_END:
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
nm_XFILE_STATUS:
    ; DCB "FILE-STATUS", 0
    db "FILE-STATUS", 0
hl_XFILE_STATUS:
    ; DCB "FILE-STATUS ( c-addr u -- x ior ) attributes of a named file", 0
    db "FILE-STATUS ( c-addr u -- x ior ) attributes of a named file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFILE_STATUS:
    ; DCQ     nm_XFILE_STATUS, hl_XFILE_STATUS
    dq nm_XFILE_STATUS, hl_XFILE_STATUS
    ; DCQ     0
    dq 0
    ; DCQ     XFILE_STATUS, XFILE_STATUS_END
    dq XFILE_STATUS, XFILE_STATUS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFILE_STATUS
    dq row_XFILE_STATUS
section .text
XFILE_STATUS:
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
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; mov     x0, #14
    mov rax, 0xe
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; bl      _file_op_call
    lea rax, [rel xret_107]
    mov qword [rel arm_x30], rax
    jmp _file_op_call
    xret_107:
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
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XFILE_STATUS_END:
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
nm_XLINE_SOURCE:
    ; DCB "(LINE-SOURCE)", 0
    db "(LINE-SOURCE)", 0
hl_XLINE_SOURCE:
    ; DCB "(LINE-SOURCE) ( c-addr u -- ) interpret one line per SOURCE", 0
    db "(LINE-SOURCE) ( c-addr u -- ) interpret one line per SOURCE", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLINE_SOURCE:
    ; DCQ     nm_XLINE_SOURCE, hl_XLINE_SOURCE
    dq nm_XLINE_SOURCE, hl_XLINE_SOURCE
    ; DCQ     0
    dq 0
    ; DCQ     XLINE_SOURCE, 0
    dq XLINE_SOURCE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLINE_SOURCE
    dq row_XLINE_SOURCE
section .text
XLINE_SOURCE:
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
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _push_source
    lea rax, [rel xret_108]
    mov qword [rel arm_x30], rax
    jmp _push_source
    xret_108:
    ; bl      _view_push_src_id
    lea rax, [rel xret_109]
    mov qword [rel arm_x30], rax
    jmp _view_push_src_id
    xret_109:
    ; bl      _view_set_src_from_pending
    lea rax, [rel xret_110]
    mov qword [rel arm_x30], rax
    jmp _view_set_src_from_pending
    xret_110:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; bl      _arm_lines
    lea rax, [rel xret_111]
    mov qword [rel arm_x30], rax
    jmp _arm_lines
    xret_111:
    ; lea x0, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x0], rax
    ; mov     x1, #2
    mov rax, 2
    mov qword [rel arm_x1], rax
    ; neg     x1, x1
    mov rax, qword [rel arm_x1]
    neg rax
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; bl      _eval_resume_push
    lea rax, [rel xret_112]
    mov qword [rel arm_x30], rax
    jmp _eval_resume_push
    xret_112:
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
    ; b       _interpret_empty
    jmp _interpret_empty
section .bwstr align=1
nm_XRESOLVE_KEY:
    ; DCB "RESOLVE-KEY", 0
    db "RESOLVE-KEY", 0
hl_XRESOLVE_KEY:
    ; DCB "RESOLVE-KEY ( c-addr u -- c-addr u ) absolute path for a load name", 0
    db "RESOLVE-KEY ( c-addr u -- c-addr u ) absolute path for a load name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRESOLVE_KEY:
    ; DCQ     nm_XRESOLVE_KEY, hl_XRESOLVE_KEY
    dq nm_XRESOLVE_KEY, hl_XRESOLVE_KEY
    ; DCQ     0
    dq 0
    ; DCQ     XRESOLVE_KEY, 0
    dq XRESOLVE_KEY, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRESOLVE_KEY
    dq row_XRESOLVE_KEY
section .text
XRESOLVE_KEY:
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
    ; cbz     x1, _resolve_empty
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _resolve_empty
    ; lea x2, resolve_buf
    lea rax, [rel resolve_buf]
    mov qword [rel arm_x2], rax
    ; mov     x3, #256
    mov rax, 0x100
    mov qword [rel arm_x3], rax
    ; bl      host_resolve
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
    call host_resolve
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; mov     x1, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x1], rax
    ; cmp     x1, #255
    mov rax, qword [rel arm_x1]
    cmp rax, 0xff
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _rk_cap
    cmp byte [rel arm_c], 0
    je _rk_cap
    cmp byte [rel arm_z], 0
    jne _rk_cap
    ; mov     x1, #255
    mov rax, 0xff
    mov qword [rel arm_x1], rax
_rk_cap:
    ; lea x3, include_name_len
    lea rax, [rel include_name_len]
    mov qword [rel arm_x3], rax
    ; str     x1, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; cbz     x1, _rk_copied
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _rk_copied
    ; lea x2, resolve_buf
    lea rax, [rel resolve_buf]
    mov qword [rel arm_x2], rax
    ; lea x3, include_name_pending
    lea rax, [rel include_name_pending]
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
_rk_cp:
    ; cmp     x4, x1
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _rk_copied
    cmp byte [rel arm_c], 0
    jne _rk_copied
    ; ldrb    w5, [x2, x4]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x4]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x5], rax
    ; strb    w5, [x3, x4]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x4]
    add r10, rax
    mov eax, dword [rel arm_x5]
    mov byte [r10], al
    ; add     x4, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x4], rax
    ; b       _rk_cp
    jmp _rk_cp
_rk_copied:
    ; lea x2, resolve_buf
    lea rax, [rel resolve_buf]
    mov qword [rel arm_x2], rax
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
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
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
_resolve_empty:
    ; lea x1, include_name_len
    lea rax, [rel include_name_len]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
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
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
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
nm_XBEGIN_LOAD_CWD:
    ; DCB "BEGIN-LOAD-CWD", 0
    db "BEGIN-LOAD-CWD", 0
hl_XBEGIN_LOAD_CWD:
    ; DCB "BEGIN-LOAD-CWD ( c-addr u -- ) push the directory of this path", 0
    db "BEGIN-LOAD-CWD ( c-addr u -- ) push the directory of this path", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBEGIN_LOAD_CWD:
    ; DCQ     nm_XBEGIN_LOAD_CWD, hl_XBEGIN_LOAD_CWD
    dq nm_XBEGIN_LOAD_CWD, hl_XBEGIN_LOAD_CWD
    ; DCQ     0
    dq 0
    ; DCQ     XBEGIN_LOAD_CWD, 0
    dq XBEGIN_LOAD_CWD, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBEGIN_LOAD_CWD
    dq row_XBEGIN_LOAD_CWD
section .text
XBEGIN_LOAD_CWD:
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
    ; bl      host_begin_load
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
    call host_begin_load
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
nm_XEND_LOAD_CWD:
    ; DCB "END-LOAD-CWD", 0
    db "END-LOAD-CWD", 0
hl_XEND_LOAD_CWD:
    ; DCB "END-LOAD-CWD ( -- ) pop the directory pushed for this load", 0
    db "END-LOAD-CWD ( -- ) pop the directory pushed for this load", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XEND_LOAD_CWD:
    ; DCQ     nm_XEND_LOAD_CWD, hl_XEND_LOAD_CWD
    dq nm_XEND_LOAD_CWD, hl_XEND_LOAD_CWD
    ; DCQ     0
    dq 0
    ; DCQ     XEND_LOAD_CWD, 0
    dq XEND_LOAD_CWD, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XEND_LOAD_CWD
    dq row_XEND_LOAD_CWD
section .text
XEND_LOAD_CWD:
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
    ; bl      host_end_load
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
    call host_end_load
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
nm_XREG_INCLUDED:
    ; DCB "REGISTER-INCLUDED-STR", 0
    db "REGISTER-INCLUDED-STR", 0
hl_XREG_INCLUDED:
    ; DCB "REGISTER-INCLUDED-STR ( c-addr u -- ) remember a loaded path", 0
    db "REGISTER-INCLUDED-STR ( c-addr u -- ) remember a loaded path", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XREG_INCLUDED:
    ; DCQ     nm_XREG_INCLUDED, hl_XREG_INCLUDED
    dq nm_XREG_INCLUDED, hl_XREG_INCLUDED
    ; DCQ     0
    dq 0
    ; DCQ     XREG_INCLUDED, 0
    dq XREG_INCLUDED, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XREG_INCLUDED
    dq row_XREG_INCLUDED
section .text
XREG_INCLUDED:
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
    ; bl      host_register
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
    call host_register
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
_parse_filespec:
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
    lea rax, [rel xret_113]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_113:
    ; mov     x2, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x2], rax
    ; lea x9, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x9], rax
    ; ldr     x9, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
_pfs_skip:
    ; cmp     x2, x9
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pfs_empty
    cmp byte [rel arm_c], 0
    jne _pfs_empty
    ; ldrb    w4, [x2]
    mov r10, qword [rel arm_x2]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #32
    mov eax, dword [rel arm_x4]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pfs_sk
    cmp byte [rel arm_z], 0
    jne _pfs_sk
    ; cmp     w4, #9
    mov eax, dword [rel arm_x4]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pfs_sk
    cmp byte [rel arm_z], 0
    jne _pfs_sk
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pfs_sk
    cmp byte [rel arm_z], 0
    jne _pfs_sk
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _pfs_sk
    cmp byte [rel arm_z], 0
    jne _pfs_sk
    ; b       _pfs_body
    jmp _pfs_body
_pfs_sk:
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _pfs_skip
    jmp _pfs_skip
_pfs_body:
    ; cmp     w4, #34
    mov eax, dword [rel arm_x4]
    cmp eax, 0x22
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pfs_word
    cmp byte [rel arm_z], 0
    je _pfs_word
    ; add     x3, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x3], rax
_pfs_q:
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; cmp     x2, x9
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x9]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pfs_qend
    cmp byte [rel arm_c], 0
    jne _pfs_qend
    ; ldrb    w4, [x2]
    mov r10, qword [rel arm_x2]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #34
    mov eax, dword [rel arm_x4]
    cmp eax, 0x22
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pfs_q
    cmp byte [rel arm_z], 0
    je _pfs_q
    ; sub     x5, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _pfs_out
    jmp _pfs_out
_pfs_qend:
    ; sub     x5, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    sub rax, rcx
    mov qword [rel arm_x5], rax
    ; b       _pfs_out
    jmp _pfs_out
_pfs_word:
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_114]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_114:
    ; bl      _parse_name_raw
    lea rax, [rel xret_115]
    mov qword [rel arm_x30], rax
    jmp _parse_name_raw
    xret_115:
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; mov     x1, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x1], rax
    ; b       _pfs_ret
    jmp _pfs_ret
_pfs_out:
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; mov     x2, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x2], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_116]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_116:
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; mov     x1, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x1], rax
    ; b       _pfs_ret
    jmp _pfs_ret
_pfs_empty:
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; bl      _cursor_commit
    lea rax, [rel xret_117]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_117:
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
_pfs_ret:
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
section .bwstr align=1
nm_XPARSE_FILESPEC:
    ; DCB "PARSE-FILESPEC", 0
    db "PARSE-FILESPEC", 0
hl_XPARSE_FILESPEC:
    ; DCB "PARSE-FILESPEC ( -- c-addr u ) next file name or quoted path", 0
    db "PARSE-FILESPEC ( -- c-addr u ) next file name or quoted path", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPARSE_FILESPEC:
    ; DCQ     nm_XPARSE_FILESPEC, hl_XPARSE_FILESPEC
    dq nm_XPARSE_FILESPEC, hl_XPARSE_FILESPEC
    ; DCQ     0
    dq 0
    ; DCQ     XPARSE_FILESPEC, 0
    dq XPARSE_FILESPEC, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPARSE_FILESPEC
    dq row_XPARSE_FILESPEC
section .text
XPARSE_FILESPEC:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _parse_filespec
    lea rax, [rel xret_118]
    mov qword [rel arm_x30], rax
    jmp _parse_filespec
    xret_118:
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
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
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
nm_XFROMLIB:
    ; DCB "FROMLIB", 0
    db "FROMLIB", 0
hl_XFROMLIB:
    ; DCB "FROMLIB ( -- ) arm the next relative load to use Library", 0
    db "FROMLIB ( -- ) arm the next relative load to use Library", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFROMLIB:
    ; DCQ     nm_XFROMLIB, hl_XFROMLIB
    dq nm_XFROMLIB, hl_XFROMLIB
    ; DCQ     0
    dq 0
    ; DCQ     XFROMLIB, 0
    dq XFROMLIB, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFROMLIB
    dq row_XFROMLIB
section .text
XFROMLIB:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_fromlib
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
    call host_fromlib
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
nm_XFROM_LIBRARY:
    ; DCB "FROM-LIBRARY", 0
    db "FROM-LIBRARY", 0
hl_XFROM_LIBRARY:
    ; DCB "FROM-LIBRARY ( -- ) same as FROMLIB", 0
    db "FROM-LIBRARY ( -- ) same as FROMLIB", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFROM_LIBRARY:
    ; DCQ     nm_XFROM_LIBRARY, hl_XFROM_LIBRARY
    dq nm_XFROM_LIBRARY, hl_XFROM_LIBRARY
    ; DCQ     0
    dq 0
    ; DCQ     XFROM_LIBRARY, 0
    dq XFROM_LIBRARY, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFROM_LIBRARY
    dq row_XFROM_LIBRARY
section .text
XFROM_LIBRARY:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_fromlib
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
    call host_fromlib
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
nm_XFROMLIB_OFF:
    ; DCB "FROMLIB-OFF", 0
    db "FROMLIB-OFF", 0
hl_XFROMLIB_OFF:
    ; DCB "FROMLIB-OFF ( -- ) clear an armed FROMLIB", 0
    db "FROMLIB-OFF ( -- ) clear an armed FROMLIB", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFROMLIB_OFF:
    ; DCQ     nm_XFROMLIB_OFF, hl_XFROMLIB_OFF
    dq nm_XFROMLIB_OFF, hl_XFROMLIB_OFF
    ; DCQ     0
    dq 0
    ; DCQ     XFROMLIB_OFF, 0
    dq XFROMLIB_OFF, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFROMLIB_OFF
    dq row_XFROMLIB_OFF
section .text
XFROMLIB_OFF:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_fromlib_off
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
    call host_fromlib_off
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
nm_XFROMLIB_Q:
    ; DCB "FROMLIB?", 0
    db "FROMLIB?", 0
hl_XFROMLIB_Q:
    ; DCB "FROMLIB? ( -- flag ) true when FROMLIB is armed", 0
    db "FROMLIB? ( -- flag ) true when FROMLIB is armed", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFROMLIB_Q:
    ; DCQ     nm_XFROMLIB_Q, hl_XFROMLIB_Q
    dq nm_XFROMLIB_Q, hl_XFROMLIB_Q
    ; DCQ     0
    dq 0
    ; DCQ     XFROMLIB_Q, XFROMLIB_Q_END
    dq XFROMLIB_Q, XFROMLIB_Q_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFROMLIB_Q
    dq row_XFROMLIB_Q
section .text
XFROMLIB_Q:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_fromlib_query
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
    call host_fromlib_query
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
XFROMLIB_Q_END:
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
nm_XFILE_ECHO:
    ; DCB "FILE-ECHO", 0
    db "FILE-ECHO", 0
hl_XFILE_ECHO:
    ; DCB "FILE-ECHO ( -- addr ) echo INCLUDE and FLOAD lines with a line number", 0
    db "FILE-ECHO ( -- addr ) echo INCLUDE and FLOAD lines with a line number", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFILE_ECHO:
    ; DCQ     nm_XFILE_ECHO, hl_XFILE_ECHO
    dq nm_XFILE_ECHO, hl_XFILE_ECHO
    ; DCQ     0
    dq 0
    ; DCQ     XFILE_ECHO, 0
    dq XFILE_ECHO, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFILE_ECHO
    dq row_XFILE_ECHO
section .text
XFILE_ECHO:
    ; lea x0, file_echo
    lea rax, [rel file_echo]
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
nm_XCLS:
    ; DCB "CLS", 0
    db "CLS", 0
hl_XCLS:
    ; DCB "CLS ( -- ) clear the host console", 0
    db "CLS ( -- ) clear the host console", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCLS:
    ; DCQ     nm_XCLS, hl_XCLS
    dq nm_XCLS, hl_XCLS
    ; DCQ     0
    dq 0
    ; DCQ     XCLS, XCLS_END
    dq XCLS, XCLS_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCLS
    dq row_XCLS
section .text
XCLS:
    ; mov     x0, #9
    mov rax, 9
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; b       _facility_op_go
    jmp _facility_op_go
XCLS_END:
section .bwstr align=1
nm_XBIMUL:
    ; DCB "BI-MUL", 0
    db "BI-MUL", 0
hl_XBIMUL:
    ; DCB "BI-MUL ( a b r -- ) BIG-INTEGER host multiply", 0
    db "BI-MUL ( a b r -- ) BIG-INTEGER host multiply", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBIMUL:
    ; DCQ     nm_XBIMUL, hl_XBIMUL
    dq nm_XBIMUL, hl_XBIMUL
    ; DCQ     0
    dq 0
    ; DCQ     XBIMUL, XBIMUL_END
    dq XBIMUL, XBIMUL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBIMUL
    dq row_XBIMUL
section .text
XBIMUL:
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; bl      host_bi_mul
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
    call host_bi_mul
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
XBIMUL_END:
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
nm_XBIDIVMOD:
    ; DCB "BI-DIVMOD", 0
    db "BI-DIVMOD", 0
hl_XBIDIVMOD:
    ; DCB "BI-DIVMOD ( num den quot rem work -- ) BIG-INTEGER host divmod", 0
    db "BI-DIVMOD ( num den quot rem work -- ) BIG-INTEGER host divmod", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBIDIVMOD:
    ; DCQ     nm_XBIDIVMOD, hl_XBIDIVMOD
    dq nm_XBIDIVMOD, hl_XBIDIVMOD
    ; DCQ     0
    dq 0
    ; DCQ     XBIDIVMOD, XBIDIVMOD_END
    dq XBIDIVMOD, XBIDIVMOD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBIDIVMOD
    dq row_XBIDIVMOD
section .text
XBIDIVMOD:
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; bl      host_bi_divmod
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
    call host_bi_divmod
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
XBIDIVMOD_END:
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
nm_XBIISQRT:
    ; DCB "BI-ISQRT", 0
    db "BI-ISQRT", 0
hl_XBIISQRT:
    ; DCB "BI-ISQRT ( a r quot rem work t1 t2 -- ) BIG-INTEGER host isqrt", 0
    db "BI-ISQRT ( a r quot rem work t1 t2 -- ) BIG-INTEGER host isqrt", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBIISQRT:
    ; DCQ     nm_XBIISQRT, hl_XBIISQRT
    dq nm_XBIISQRT, hl_XBIISQRT
    ; DCQ     0
    dq 0
    ; DCQ     XBIISQRT, XBIISQRT_END
    dq XBIISQRT, XBIISQRT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBIISQRT
    dq row_XBIISQRT
section .text
XBIISQRT:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
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
    ; bl      host_bi_isqrt
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
    call host_bi_isqrt
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
XBIISQRT_END:
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
nm_XCHDIR:
    ; DCB "CHDIR", 0
    db "CHDIR", 0
hl_XCHDIR:
    ; DCB "CHDIR ( -- ) change directory. a bare call waits for a dialog", 0
    db "CHDIR ( -- ) change directory. a bare call waits for a dialog", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCHDIR:
    ; DCQ     nm_XCHDIR, hl_XCHDIR
    dq nm_XCHDIR, hl_XCHDIR
    ; DCQ     0
    dq 0
    ; DCQ     XCHDIR, 0
    dq XCHDIR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCHDIR
    dq row_XCHDIR
section .text
XCHDIR:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _parse_filespec
    lea rax, [rel xret_119]
    mov qword [rel arm_x30], rax
    jmp _parse_filespec
    xret_119:
    ; cbz     x1, _chdir_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _chdir_done
    ; bl      host_chdir
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
    call host_chdir
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
_chdir_done:
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
nm_XPWD:
    ; DCB "PWD", 0
    db "PWD", 0
hl_XPWD:
    ; DCB "PWD ( -- ) print the current directory", 0
    db "PWD ( -- ) print the current directory", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPWD:
    ; DCQ     nm_XPWD, hl_XPWD
    dq nm_XPWD, hl_XPWD
    ; DCQ     0
    dq 0
    ; DCQ     XPWD, 0
    dq XPWD, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPWD
    dq row_XPWD
section .text
XPWD:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_pwd
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
    call host_pwd
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
nm_XCWD_FETCH:
    ; DCB "CWD@", 0
    db "CWD@", 0
hl_XCWD_FETCH:
    ; DCB "CWD@ ( c-addr max -- u ) copy the current directory", 0
    db "CWD@ ( c-addr max -- u ) copy the current directory", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCWD_FETCH:
    ; DCQ     nm_XCWD_FETCH, hl_XCWD_FETCH
    dq nm_XCWD_FETCH, hl_XCWD_FETCH
    ; DCQ     0
    dq 0
    ; DCQ     XCWD_FETCH, 0
    dq XCWD_FETCH, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCWD_FETCH
    dq row_XCWD_FETCH
section .text
XCWD_FETCH:
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
    ; bl      host_cwd
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
    call host_cwd
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
XCWD_FETCH_END:
section .bwstr align=1
nm_XDIR:
    ; DCB "DIR", 0
    db "DIR", 0
hl_XDIR:
    ; DCB "DIR ( -- ) list files. a bare call lists the current directory", 0
    db "DIR ( -- ) list files. a bare call lists the current directory", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDIR:
    ; DCQ     nm_XDIR, hl_XDIR
    dq nm_XDIR, hl_XDIR
    ; DCQ     0
    dq 0
    ; DCQ     XDIR, 0
    dq XDIR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDIR
    dq row_XDIR
section .text
XDIR:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _parse_filespec
    lea rax, [rel xret_120]
    mov qword [rel arm_x30], rax
    jmp _parse_filespec
    xret_120:
    ; bl      host_dir
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
    call host_dir
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
nm_XLAST_INCLUDED:
    ; DCB "LAST-INCLUDED", 0
    db "LAST-INCLUDED", 0
hl_XLAST_INCLUDED:
    ; DCB "LAST-INCLUDED ( -- c-addr u ) path of the last included file", 0
    db "LAST-INCLUDED ( -- c-addr u ) path of the last included file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLAST_INCLUDED:
    ; DCQ     nm_XLAST_INCLUDED, hl_XLAST_INCLUDED
    dq nm_XLAST_INCLUDED, hl_XLAST_INCLUDED
    ; DCQ     0
    dq 0
    ; DCQ     XLAST_INCLUDED, XLAST_INCLUDED_END
    dq XLAST_INCLUDED, XLAST_INCLUDED_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLAST_INCLUDED
    dq row_XLAST_INCLUDED
section .text
XLAST_INCLUDED:
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
    ; add     x0, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [rel arm_x0], rax
    ; add     x1, sp, #56
    mov rax, rsp
    add rax, 0x38
    mov qword [rel arm_x1], rax
    ; bl      host_last_included
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
    call host_last_included
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
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
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
XLAST_INCLUDED_END:
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
nm_XDOT_INCLUDED:
    ; DCB ".INCLUDED", 0
    db ".INCLUDED", 0
hl_XDOT_INCLUDED:
    ; DCB ".INCLUDED ( -- ) list files registered by INCLUDE/REQUIRED", 0
    db ".INCLUDED ( -- ) list files registered by INCLUDE/REQUIRED", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDOT_INCLUDED:
    ; DCQ     nm_XDOT_INCLUDED, hl_XDOT_INCLUDED
    dq nm_XDOT_INCLUDED, hl_XDOT_INCLUDED
    ; DCQ     0
    dq 0
    ; DCQ     XDOT_INCLUDED, 0
    dq XDOT_INCLUDED, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDOT_INCLUDED
    dq row_XDOT_INCLUDED
section .text
XDOT_INCLUDED:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_dot_included
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
    call host_dot_included
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
nm_XINCLUDE_PAREN:
    ; DCB "(INCLUDE)", 0
    db "(INCLUDE)", 0
hl_XINCLUDE_PAREN:
    ; DCB "(INCLUDE) ( -- ) bare INCLUDE opens a file dialog", 0
    db "(INCLUDE) ( -- ) bare INCLUDE opens a file dialog", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XINCLUDE_PAREN:
    ; DCQ     nm_XINCLUDE_PAREN, hl_XINCLUDE_PAREN
    dq nm_XINCLUDE_PAREN, hl_XINCLUDE_PAREN
    ; DCQ     0
    dq 0
    ; DCQ     XINCLUDE_PAREN, 0
    dq XINCLUDE_PAREN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XINCLUDE_PAREN
    dq row_XINCLUDE_PAREN
section .text
XINCLUDE_PAREN:
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
    ; add     x0, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [rel arm_x0], rax
    ; bl      host_include_dialog
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
    call host_include_dialog
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; cbz     x0, _inc_none
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _inc_none
    ; str     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldr     x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; str     x1, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, req_included_name
    lea rax, [rel req_included_name]
    mov qword [rel arm_x0], rax
    ; mov     x1, #8
    mov rax, 8
    mov qword [rel arm_x1], rax
    ; bl      _find_word
    lea rax, [rel xret_121]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_121:
    ; cbz     x0, _inc_none
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _inc_none
    ; ldr     x2, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
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
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; mov     x20, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x20], rax
    ; mov     x21, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x21], rax
    ; ldr     x5, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; br      x5
    mov rax, qword [rel arm_x5]
    jmp rax
_inc_none:
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
nm_XREQUIRED:
    ; DCB "REQUIRED", 0
    db "REQUIRED", 0
hl_XREQUIRED:
    ; DCB "REQUIRED ( c-addr u -- ) INCLUDED unless this path was loaded", 0
    db "REQUIRED ( c-addr u -- ) INCLUDED unless this path was loaded", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XREQUIRED:
    ; DCQ     nm_XREQUIRED, hl_XREQUIRED
    dq nm_XREQUIRED, hl_XREQUIRED
    ; DCQ     0
    dq 0
    ; DCQ     XREQUIRED, 0
    dq XREQUIRED, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XREQUIRED
    dq row_XREQUIRED
section .text
XREQUIRED:
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
    ; cbz     x1, _req_drop
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _req_drop
    ; lea x2, resolve_buf
    lea rax, [rel resolve_buf]
    mov qword [rel arm_x2], rax
    ; mov     x3, #256
    mov rax, 0x100
    mov qword [rel arm_x3], rax
    ; bl      host_resolve
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
    call host_resolve
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; cbz     x0, _req_drop
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _req_drop
    ; str     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x0, resolve_buf
    lea rax, [rel resolve_buf]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; bl      host_was_included
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
    call host_was_included
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; cbnz    x0, _req_drop
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _req_drop
    ; lea x0, req_included_name
    lea rax, [rel req_included_name]
    mov qword [rel arm_x0], rax
    ; mov     x1, #8
    mov rax, 8
    mov qword [rel arm_x1], rax
    ; bl      _find_word
    lea rax, [rel xret_122]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_122:
    ; cbz     x0, _req_drop
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _req_drop
    ; ldr     x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, resolve_buf
    lea rax, [rel resolve_buf]
    mov qword [rel arm_x2], rax
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
    ; mov     x21, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x21], rax
    ; ldr     x5, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
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
    ; br      x5
    mov rax, qword [rel arm_x5]
    jmp rax
_req_drop:
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
nm_XFORGET:
    ; DCB "FORGET", 0
    db "FORGET", 0
hl_XFORGET:
    ; DCB "FORGET ( name -- ) remove that word and everything newer", 0
    db "FORGET ( name -- ) remove that word and everything newer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFORGET:
    ; DCQ     nm_XFORGET, hl_XFORGET
    dq nm_XFORGET, hl_XFORGET
    ; DCQ     0
    dq 0
    ; DCQ     XFORGET, 0
    dq XFORGET, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFORGET
    dq row_XFORGET
section .text
XFORGET:
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
    ; bl      _next_word
    lea rax, [rel xret_123]
    mov qword [rel arm_x30], rax
    jmp _next_word
    xret_123:
    ; cbz     x1, _forget_empty
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _forget_empty
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _find_word
    lea rax, [rel xret_124]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_124:
    ; cbz     x0, _forget_undef
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _forget_undef
    ; lea x1, words_user_base
    lea rax, [rel words_user_base]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, _forget_fence
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne _forget_fence
    ; lea x1, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [rel arm_x1], rax
_forget_fence:
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _forget_prot
    cmp byte [rel arm_c], 0
    je _forget_prot
    ; lea x2, forget_cut
    lea rax, [rel forget_cut]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x1, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x0, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; bl      _prune_wid
    lea rax, [rel xret_125]
    mov qword [rel arm_x30], rax
    jmp _prune_wid
    xret_125:
    ; lea x3, current_var
    lea rax, [rel current_var]
    mov qword [rel arm_x3], rax
    ; ldr     x0, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _forget_search
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _forget_search
    ; lea x2, forget_cut
    lea rax, [rel forget_cut]
    mov qword [rel arm_x2], rax
    ; ldr     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; bl      _prune_wid
    lea rax, [rel xret_126]
    mov qword [rel arm_x30], rax
    jmp _prune_wid
    xret_126:
_forget_search:
    ; lea x2, search_order_n
    lea rax, [rel search_order_n]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; lea x3, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
_forget_sloop:
    ; cmp     x4, x2
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _forget_regs
    cmp byte [rel arm_c], 0
    jne _forget_regs
    ; ldr     x0, [x3, x4, lsl #3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x4]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _forget_snext
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _forget_snext
    ; stp     x2, x3, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x2]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x3]
    mov qword [r10+8], rax
    ; stp     x4, xzr, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x4]
    mov qword [r10+0], rax
    mov qword [r10+8], 0
    ; lea x1, forget_cut
    lea rax, [rel forget_cut]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; bl      _prune_wid
    lea rax, [rel xret_127]
    mov qword [rel arm_x30], rax
    jmp _prune_wid
    xret_127:
    ; ldp     x4, xzr, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x4], rax
    add rsp, 0x10
    ; ldp     x2, x3, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x2], rax
    mov qword [rel arm_x3], rcx
    add rsp, 0x10
_forget_snext:
    ; add     x4, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x4], rax
    ; b       _forget_sloop
    jmp _forget_sloop
_forget_regs:
    ; lea x2, wordlist_reg_n
    lea rax, [rel wordlist_reg_n]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; lea x3, wordlist_reg
    lea rax, [rel wordlist_reg]
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
_forget_rloop:
    ; cmp     x4, x2
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _forget_done
    cmp byte [rel arm_c], 0
    jne _forget_done
    ; ldr     x0, [x3, x4, lsl #3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [rel arm_x4]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _forget_rnext
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _forget_rnext
    ; stp     x2, x3, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x2]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x3]
    mov qword [r10+8], rax
    ; stp     x4, xzr, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x4]
    mov qword [r10+0], rax
    mov qword [r10+8], 0
    ; lea x1, forget_cut
    lea rax, [rel forget_cut]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; bl      _prune_wid
    lea rax, [rel xret_128]
    mov qword [rel arm_x30], rax
    jmp _prune_wid
    xret_128:
    ; ldp     x4, xzr, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x4], rax
    add rsp, 0x10
    ; ldp     x2, x3, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x2], rax
    mov qword [rel arm_x3], rcx
    add rsp, 0x10
_forget_rnext:
    ; add     x4, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x4], rax
    ; b       _forget_rloop
    jmp _forget_rloop
_forget_done:
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
_forget_prot:
    ; lea x0, str_protected
    lea rax, [rel str_protected]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_129]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_129:
    ; b       _forget_done
    jmp _forget_done
_forget_empty:
    ; lea x0, msg_huh
    lea rax, [rel msg_huh]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_130]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_130:
    ; b       _forget_done
    jmp _forget_done
_forget_undef:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; bl      emit_str
    lea rax, [rel xret_131]
    mov qword [rel arm_x30], rax
    jmp emit_str
    xret_131:
    ; lea x0, msg_huh
    lea rax, [rel msg_huh]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_132]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_132:
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
_prune_wid:
    ; cbz     x0, _prune_ret
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _prune_ret
    ; mov     x3, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x3], rax
    ; mov     x4, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
_prune_thread:
    ; cmp     x5, #16
    mov rax, qword [rel arm_x5]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _prune_ret
    cmp byte [rel arm_c], 0
    jne _prune_ret
    ; add     x0, x3, x5, lsl #3
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x0], rax
_prune_head:
    ; ldr     x2, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, _prune_next
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _prune_next
    ; cmp     x2, x4
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x4]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _prune_next
    cmp byte [rel arm_c], 0
    je _prune_next
    ; ldr     x2, [x2, #-16]
    mov r10, qword [rel arm_x2]
    add r10, -16
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; str     x2, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; b       _prune_head
    jmp _prune_head
_prune_next:
    ; add     x5, x5, #1
    mov rax, qword [rel arm_x5]
    add rax, 1
    mov qword [rel arm_x5], rax
    ; b       _prune_thread
    jmp _prune_thread
_prune_ret:
    ; ret
    jmp qword [rel arm_x30]
section .bwstr align=1
nm_XBLOCK_FILE:
    ; DCB "BLOCK-FILE", 0
    db "BLOCK-FILE", 0
hl_XBLOCK_FILE:
    ; DCB "BLOCK-FILE ( -- addr ) current block fileid", 0
    db "BLOCK-FILE ( -- addr ) current block fileid", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBLOCK_FILE:
    ; DCQ     nm_XBLOCK_FILE, hl_XBLOCK_FILE
    dq nm_XBLOCK_FILE, hl_XBLOCK_FILE
    ; DCQ     0
    dq 0
    ; DCQ     XBLOCK_FILE, 0
    dq XBLOCK_FILE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBLOCK_FILE
    dq row_XBLOCK_FILE
section .text
XBLOCK_FILE:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, block_file
    lea rax, [rel block_file]
    mov qword [rel arm_x0], rax
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
nm_XBLOCK_BUF:
    ; DCB "(BLOCK-BUF)", 0
    db "(BLOCK-BUF)", 0
hl_XBLOCK_BUF:
    ; DCB "(BLOCK-BUF) ( -- addr ) 1024-byte block buffer", 0
    db "(BLOCK-BUF) ( -- addr ) 1024-byte block buffer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBLOCK_BUF:
    ; DCQ     nm_XBLOCK_BUF, hl_XBLOCK_BUF
    dq nm_XBLOCK_BUF, hl_XBLOCK_BUF
    ; DCQ     0
    dq 0
    ; DCQ     XBLOCK_BUF, 0
    dq XBLOCK_BUF, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBLOCK_BUF
    dq row_XBLOCK_BUF
section .text
XBLOCK_BUF:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, block_buf
    lea rax, [rel block_buf]
    mov qword [rel arm_x0], rax
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
nm_XBLOCK_UPD:
    ; DCB "(BLOCK-UPD)", 0
    db "(BLOCK-UPD)", 0
hl_XBLOCK_UPD:
    ; DCB "(BLOCK-UPD) ( -- addr ) block-buffer dirty flag", 0
    db "(BLOCK-UPD) ( -- addr ) block-buffer dirty flag", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBLOCK_UPD:
    ; DCQ     nm_XBLOCK_UPD, hl_XBLOCK_UPD
    dq nm_XBLOCK_UPD, hl_XBLOCK_UPD
    ; DCQ     0
    dq 0
    ; DCQ     XBLOCK_UPD, 0
    dq XBLOCK_UPD, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBLOCK_UPD
    dq row_XBLOCK_UPD
section .text
XBLOCK_UPD:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, block_upd
    lea rax, [rel block_upd]
    mov qword [rel arm_x0], rax
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
nm_XBLOCK_NR:
    ; DCB "(BLOCK-NR)", 0
    db "(BLOCK-NR)", 0
hl_XBLOCK_NR:
    ; DCB "(BLOCK-NR) ( -- addr ) current block number", 0
    db "(BLOCK-NR) ( -- addr ) current block number", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBLOCK_NR:
    ; DCQ     nm_XBLOCK_NR, hl_XBLOCK_NR
    dq nm_XBLOCK_NR, hl_XBLOCK_NR
    ; DCQ     0
    dq 0
    ; DCQ     XBLOCK_NR, 0
    dq XBLOCK_NR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBLOCK_NR
    dq row_XBLOCK_NR
section .text
XBLOCK_NR:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, block_nr
    lea rax, [rel block_nr]
    mov qword [rel arm_x0], rax
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
nm_XBLK:
    ; DCB "BLK", 0
    db "BLK", 0
hl_XBLK:
    ; DCB "BLK ( -- addr ) block being loaded or zero", 0
    db "BLK ( -- addr ) block being loaded or zero", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBLK:
    ; DCQ     nm_XBLK, hl_XBLK
    dq nm_XBLK, hl_XBLK
    ; DCQ     0
    dq 0
    ; DCQ     XBLK, 0
    dq XBLK, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBLK
    dq row_XBLK
section .text
XBLK:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
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
nm_XSCR:
    ; DCB "SCR", 0
    db "SCR", 0
hl_XSCR:
    ; DCB "SCR ( -- addr ) last listed block number", 0
    db "SCR ( -- addr ) last listed block number", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSCR:
    ; DCQ     nm_XSCR, hl_XSCR
    dq nm_XSCR, hl_XSCR
    ; DCQ     0
    dq 0
    ; DCQ     XSCR, 0
    dq XSCR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSCR
    dq row_XSCR
section .text
XSCR:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, scr_var
    lea rax, [rel scr_var]
    mov qword [rel arm_x0], rax
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
nm_XLOAD_ENTER:
    ; DCB "(LOAD-ENTER)", 0
    db "(LOAD-ENTER)", 0
hl_XLOAD_ENTER:
    ; DCB "(LOAD-ENTER) ( u -- u ) save SOURCE and set BLK", 0
    db "(LOAD-ENTER) ( u -- u ) save SOURCE and set BLK", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOAD_ENTER:
    ; DCQ     nm_XLOAD_ENTER, hl_XLOAD_ENTER
    dq nm_XLOAD_ENTER, hl_XLOAD_ENTER
    ; DCQ     0
    dq 0
    ; DCQ     XLOAD_ENTER, 0
    dq XLOAD_ENTER, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOAD_ENTER
    dq row_XLOAD_ENTER
section .text
XLOAD_ENTER:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _push_source
    lea rax, [rel xret_133]
    mov qword [rel arm_x30], rax
    jmp _push_source
    xret_133:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
    ; str     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x20]
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
nm_XLOAD_RUN:
    ; DCB "(LOAD-RUN)", 0
    db "(LOAD-RUN)", 0
hl_XLOAD_RUN:
    ; DCB "(LOAD-RUN) ( c-addr u -- ) interpret a block buffer", 0
    db "(LOAD-RUN) ( c-addr u -- ) interpret a block buffer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOAD_RUN:
    ; DCQ     nm_XLOAD_RUN, hl_XLOAD_RUN
    dq nm_XLOAD_RUN, hl_XLOAD_RUN
    ; DCQ     0
    dq 0
    ; DCQ     XLOAD_RUN, 0
    dq XLOAD_RUN, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOAD_RUN
    dq row_XLOAD_RUN
section .text
XLOAD_RUN:
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
    ; lea x2, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; add     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; lea x2, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x2], rax
    ; mov     x3, #-1
    mov rax, -1
    mov qword [rel arm_x3], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; bl      _eval_resume_push
    lea rax, [rel xret_134]
    mov qword [rel arm_x30], rax
    jmp _eval_resume_push
    xret_134:
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
    ; b       _interpret_loop
    jmp _interpret_loop
section .bwstr align=1
nm_XRBRA:
    ; DCB "]", 0
    db "]", 0
hl_XRBRA:
    ; DCB "] ( -- ) enter compile mode", 0
    db "] ( -- ) enter compile mode", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRBRA:
    ; DCQ     nm_XRBRA, hl_XRBRA
    dq nm_XRBRA, hl_XRBRA
    ; DCQ     0
    dq 0
    ; DCQ     XRBRA, 0
    dq XRBRA, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRBRA
    dq row_XRBRA
section .text
XRBRA:
    ; lea x0, state_var
    lea rax, [rel state_var]
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
nm_XLBRA:
    ; DCB "[", 0
    db "[", 0
hl_XLBRA:
    ; DCB "[ ( -- ) enter interpret mode", 0
    db "[ ( -- ) enter interpret mode", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLBRA:
    ; DCQ     nm_XLBRA, hl_XLBRA
    dq nm_XLBRA, hl_XLBRA
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XLBRA, 0
    dq XLBRA, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLBRA
    dq row_XLBRA
section .text
XLBRA:
    ; lea x0, state_var
    lea rax, [rel state_var]
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
nm_XEVALUATE:
    ; DCB "EVALUATE", 0
    db "EVALUATE", 0
hl_XEVALUATE:
    ; DCB "EVALUATE ( i*x c-addr u -- j*x ) interpret the string as Forth source", 0
    db "EVALUATE ( i*x c-addr u -- j*x ) interpret the string as Forth source", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XEVALUATE:
    ; DCQ     nm_XEVALUATE, hl_XEVALUATE
    dq nm_XEVALUATE, hl_XEVALUATE
    ; DCQ     0
    dq 0
    ; DCQ     XEVALUATE, 0
    dq XEVALUATE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XEVALUATE
    dq row_XEVALUATE
section .text
XEVALUATE:
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
    ; bl      _push_source
    lea rax, [rel xret_135]
    mov qword [rel arm_x30], rax
    jmp _push_source
    xret_135:
    ; cbz     x0, _ev_fail
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _ev_fail
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; lea x2, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; add     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; lea x2, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x2], rax
    ; mov     x3, #-1
    mov rax, -1
    mov qword [rel arm_x3], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x2, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; bl      _eval_resume_push
    lea rax, [rel xret_136]
    mov qword [rel arm_x30], rax
    jmp _eval_resume_push
    xret_136:
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
    ; b       _interpret_loop
    jmp _interpret_loop
_ev_fail:
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
nm_XQUIT:
    ; DCB "QUIT", 0
    db "QUIT", 0
hl_XQUIT:
    ; DCB "QUIT ( -- ) empty the return stack and return to the outer interpreter", 0
    db "QUIT ( -- ) empty the return stack and return to the outer interpreter", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XQUIT:
    ; DCQ     nm_XQUIT, hl_XQUIT
    dq nm_XQUIT, hl_XQUIT
    ; DCQ     0
    dq 0
    ; DCQ     XQUIT, XQUIT_END
    dq XQUIT, XQUIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XQUIT
    dq row_XQUIT
section .text
XQUIT:
    ; b       _do_quit
    jmp _do_quit
XQUIT_END:
section .bwstr align=1
nm_XBACKSLASH_S:
    ; DCB 0x5C, "S", 0
    db 0x5c, "S", 0
hl_XBACKSLASH_S:
    ; DCB 0x5C, "S", "stop the rest of this source", 0
    db 0x5c, "S", "stop the rest of this source", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XBACKSLASH_S:
    ; DCQ     nm_XBACKSLASH_S, hl_XBACKSLASH_S
    dq nm_XBACKSLASH_S, hl_XBACKSLASH_S
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XBACKSLASH_S, 0
    dq XBACKSLASH_S, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XBACKSLASH_S
    dq row_XBACKSLASH_S
section .text
XBACKSLASH_S:
    ; lea x0, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _bs_pin
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _bs_pin
    ; lea x0, line_limit
    lea rax, [rel line_limit]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x0, line_next
    lea rax, [rel line_next]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
_bs_pin:
    ; lea x0, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; lea x1, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; sub     x2, x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    sub rax, rcx
    mov qword [rel arm_x2], rax
    ; lea x0, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x0], rax
    ; str     x2, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; lea x0, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x0], rax
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
nm_XSOURCE_ID:
    ; DCB "SOURCE-ID", 0
    db "SOURCE-ID", 0
hl_XSOURCE_ID:
    ; DCB "SOURCE-ID ( -- id ) 0 console -1 evaluate -2 file", 0
    db "SOURCE-ID ( -- id ) 0 console -1 evaluate -2 file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSOURCE_ID:
    ; DCQ     nm_XSOURCE_ID, hl_XSOURCE_ID
    dq nm_XSOURCE_ID, hl_XSOURCE_ID
    ; DCQ     0
    dq 0
    ; DCQ     XSOURCE_ID, 0
    dq XSOURCE_ID, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSOURCE_ID
    dq row_XSOURCE_ID
section .text
XSOURCE_ID:
    ; lea x0, source_id
    lea rax, [rel source_id]
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
nm_XACCEPT:
    ; DCB "ACCEPT", 0
    db "ACCEPT", 0
hl_XACCEPT:
    ; DCB "ACCEPT ( c-addr +n1 -- +n2 ) read a line into the buffer", 0
    db "ACCEPT ( c-addr +n1 -- +n2 ) read a line into the buffer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XACCEPT:
    ; DCQ     nm_XACCEPT, hl_XACCEPT
    dq nm_XACCEPT, hl_XACCEPT
    ; DCQ     0
    dq 0
    ; DCQ     XACCEPT, XACCEPT_END
    dq XACCEPT, XACCEPT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XACCEPT
    dq row_XACCEPT
section .text
XACCEPT:
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
    ; b.gt    _acc_read
    cmp byte [rel arm_z], 0
    jne xsk_137
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _acc_read
    xsk_137:
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
    ; b       XACCEPT_END
    jmp XACCEPT_END
_acc_read:
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
    ; bl      host_accept
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
    call host_accept
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
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
    ; mov     x20, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x20], rax
XACCEPT_END:
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
nm_XTONUMBER:
    ; DCB ">NUMBER", 0
    db ">NUMBER", 0
hl_XTONUMBER:
    ; DCB ">NUMBER ( ud1 c-addr1 u1 -- ud2 c-addr2 u2 ) convert digits in the current base", 0
    db ">NUMBER ( ud1 c-addr1 u1 -- ud2 c-addr2 u2 ) convert digits in the current base", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTONUMBER:
    ; DCQ     nm_XTONUMBER, hl_XTONUMBER
    dq nm_XTONUMBER, hl_XTONUMBER
    ; DCQ     0
    dq 0
    ; DCQ     XTONUMBER, XTONUMBER_END
    dq XTONUMBER, XTONUMBER_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTONUMBER
    dq row_XTONUMBER
section .text
XTONUMBER:
    ; mov     x4, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x4], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
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
    ; lea x5, base_var
    lea rax, [rel base_var]
    mov qword [rel arm_x5], rax
    ; ldr     x5, [x5]
    mov r10, qword [rel arm_x5]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; cmp     x5, #2
    mov rax, qword [rel arm_x5]
    cmp rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _tn_base10
    cmp byte [rel arm_c], 0
    je _tn_base10
    ; cmp     x5, #36
    mov rax, qword [rel arm_x5]
    cmp rax, 0x24
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _tn_loop
    cmp byte [rel arm_c], 0
    je _tn_loop
    cmp byte [rel arm_z], 0
    jne _tn_loop
_tn_base10:
    ; mov     x5, #10
    mov rax, 0xa
    mov qword [rel arm_x5], rax
_tn_loop:
    ; cbz     x4, _tn_done
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _tn_done
    ; ldrb    w6, [x3]
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x6], rax
    ; sub     w7, w6, #48
    mov eax, dword [rel arm_x6]
    sub eax, 0x30
    mov qword [rel arm_x7], rax
    ; cmp     w7, #9
    mov eax, dword [rel arm_x7]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _tn_dig
    cmp byte [rel arm_c], 0
    je _tn_dig
    cmp byte [rel arm_z], 0
    jne _tn_dig
    ; cmp     w6, #'a'
    mov eax, dword [rel arm_x6]
    cmp eax, 0x61
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _tn_up
    cmp byte [rel arm_c], 0
    je _tn_up
    ; cmp     w6, #'z'
    mov eax, dword [rel arm_x6]
    cmp eax, 0x7a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _tn_done
    cmp byte [rel arm_c], 0
    je xsk_138
    cmp byte [rel arm_z], 0
    je _tn_done
    xsk_138:
    ; sub     w6, w6, #32
    mov eax, dword [rel arm_x6]
    sub eax, 0x20
    mov qword [rel arm_x6], rax
_tn_up:
    ; sub     w7, w6, #'A'
    mov eax, dword [rel arm_x6]
    sub eax, 0x41
    mov qword [rel arm_x7], rax
    ; cmp     w7, #25
    mov eax, dword [rel arm_x7]
    cmp eax, 0x19
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _tn_done
    cmp byte [rel arm_c], 0
    je xsk_139
    cmp byte [rel arm_z], 0
    je _tn_done
    xsk_139:
    ; add     w7, w7, #10
    mov eax, dword [rel arm_x7]
    add eax, 0xa
    mov qword [rel arm_x7], rax
_tn_dig:
    ; cmp     x7, x5
    mov rax, qword [rel arm_x7]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _tn_done
    cmp byte [rel arm_c], 0
    jne _tn_done
    ; mul     x8, x1, x5
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x5]
    imul rax, rcx
    mov qword [rel arm_x8], rax
    ; umulh   x9, x1, x5
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x5]
    mul rcx
    mov rax, rdx
    mov qword [rel arm_x9], rax
    ; mul     x10, x2, x5
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x5]
    imul rax, rcx
    mov qword [rel arm_x10], rax
    ; add     x9, x9, x10
    mov rax, qword [rel arm_x9]
    mov rcx, qword [rel arm_x10]
    add rax, rcx
    mov qword [rel arm_x9], rax
    ; adds    x1, x8, x7
    mov rax, qword [rel arm_x8]
    mov rcx, qword [rel arm_x7]
    add rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; adc     x2, x9, xzr
    mov rax, qword [rel arm_x9]
    xor ecx, ecx
    mov dl, byte [rel arm_c]
    add dl, 255
    adc rax, rcx
    mov qword [rel arm_x2], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; sub     x4, x4, #1
    mov rax, qword [rel arm_x4]
    sub rax, 1
    mov qword [rel arm_x4], rax
    ; b       _tn_loop
    jmp _tn_loop
_tn_done:
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; str     x3, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; mov     x20, x4
    mov rax, qword [rel arm_x4]
    mov qword [rel arm_x20], rax
XTONUMBER_END:
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
nm_XENVIRONMENT_Q:
    ; DCB "ENVIRONMENT?", 0
    db "ENVIRONMENT?", 0
hl_XENVIRONMENT_Q:
    ; DCB "ENVIRONMENT? ( c-addr u -- false | i*x true ) query an environment string", 0
    db "ENVIRONMENT? ( c-addr u -- false | i*x true ) query an environment string", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XENVIRONMENT_Q:
    ; DCQ     nm_XENVIRONMENT_Q, hl_XENVIRONMENT_Q
    dq nm_XENVIRONMENT_Q, hl_XENVIRONMENT_Q
    ; DCQ     0
    dq 0
    ; DCQ     XENVIRONMENT_Q, 0
    dq XENVIRONMENT_Q, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XENVIRONMENT_Q
    dq row_XENVIRONMENT_Q
section .text
XENVIRONMENT_Q:
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
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
_env_next:
    ; cmp     x4, #ENV_COUNT
    mov rax, qword [rel arm_x4]
    cmp rax, 0x1f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _env_no
    cmp byte [rel arm_c], 0
    jne _env_no
    ; lea x5, env_name_ptrs
    lea rax, [rel env_name_ptrs]
    mov qword [rel arm_x5], rax
    ; ldr     x5, [x5, x4, lsl #3]
    mov r10, qword [rel arm_x5]
    mov rax, qword [rel arm_x4]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; mov     x6, #0
    mov rax, 0
    mov qword [rel arm_x6], rax
_env_len:
    ; ldrb    w7, [x5, x6]
    mov r10, qword [rel arm_x5]
    mov rax, qword [rel arm_x6]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x7], rax
    ; cbz     w7, _env_len_done
    mov eax, dword [rel arm_x7]
    cmp rax, 0
    je _env_len_done
    ; add     x6, x6, #1
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; b       _env_len
    jmp _env_len
_env_len_done:
    ; cmp     x6, x1
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _env_cont
    cmp byte [rel arm_z], 0
    je _env_cont
    ; mov     x7, #0
    mov rax, 0
    mov qword [rel arm_x7], rax
_env_cmp:
    ; cmp     x7, x6
    mov rax, qword [rel arm_x7]
    mov rcx, qword [rel arm_x6]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _env_yes
    cmp byte [rel arm_z], 0
    jne _env_yes
    ; ldrb    w8, [x5, x7]
    mov r10, qword [rel arm_x5]
    mov rax, qword [rel arm_x7]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x8], rax
    ; ldrb    w9, [x0, x7]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x7]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x9], rax
    ; cmp     w8, w9
    mov eax, dword [rel arm_x8]
    mov ecx, dword [rel arm_x9]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _env_cont
    cmp byte [rel arm_z], 0
    je _env_cont
    ; add     x7, x7, #1
    mov rax, qword [rel arm_x7]
    add rax, 1
    mov qword [rel arm_x7], rax
    ; b       _env_cmp
    jmp _env_cmp
_env_cont:
    ; add     x4, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x4], rax
    ; b       _env_next
    jmp _env_next
_env_yes:
    ; lea x5, env_kinds
    lea rax, [rel env_kinds]
    mov qword [rel arm_x5], rax
    ; ldrb    w5, [x5, x4]
    mov r10, qword [rel arm_x5]
    mov rax, qword [rel arm_x4]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x5], rax
    ; lea x6, env_values
    lea rax, [rel env_values]
    mov qword [rel arm_x6], rax
    ; ldr     x6, [x6, x4, lsl #3]
    mov r10, qword [rel arm_x6]
    mov rax, qword [rel arm_x4]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; cbz     w5, _env_flag
    mov eax, dword [rel arm_x5]
    cmp rax, 0
    je _env_flag
    ; cmp     w5, #2
    mov eax, dword [rel arm_x5]
    cmp eax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _env_string
    cmp byte [rel arm_z], 0
    jne _env_string
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; mov     x20, #-1
    mov rax, -1
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
_env_string:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
_env_slen:
    ; ldrb    w1, [x6, x0]
    mov r10, qword [rel arm_x6]
    mov rax, qword [rel arm_x0]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x1], rax
    ; cbz     w1, _env_spush
    mov eax, dword [rel arm_x1]
    cmp rax, 0
    je _env_spush
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _env_slen
    jmp _env_slen
_env_spush:
    ; str     x6, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x20, #-1
    mov rax, -1
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
_env_flag:
    ; mov     x20, x6
    mov rax, qword [rel arm_x6]
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
_env_no:
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
nm_XSAVE_INPUT:
    ; DCB "SAVE-INPUT", 0
    db "SAVE-INPUT", 0
hl_XSAVE_INPUT:
    ; DCB "SAVE-INPUT ( -- xn .. x1 n ) save the current input source", 0
    db "SAVE-INPUT ( -- xn .. x1 n ) save the current input source", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSAVE_INPUT:
    ; DCQ     nm_XSAVE_INPUT, hl_XSAVE_INPUT
    dq nm_XSAVE_INPUT, hl_XSAVE_INPUT
    ; DCQ     0
    dq 0
    ; DCQ     XSAVE_INPUT, 0
    dq XSAVE_INPUT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSAVE_INPUT
    dq row_XSAVE_INPUT
section .text
XSAVE_INPUT:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x1, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; sub     x20, x1, x20
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x20]
    sub rax, rcx
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #5
    mov rax, 5
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
nm_XRESTORE_INPUT:
    ; DCB "RESTORE-INPUT", 0
    db "RESTORE-INPUT", 0
hl_XRESTORE_INPUT:
    ; DCB "RESTORE-INPUT ( xn .. x1 n -- flag ) restore input source. 0 means ok", 0
    db "RESTORE-INPUT ( xn .. x1 n -- flag ) restore input source. 0 means ok", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRESTORE_INPUT:
    ; DCQ     nm_XRESTORE_INPUT, hl_XRESTORE_INPUT
    dq nm_XRESTORE_INPUT, hl_XRESTORE_INPUT
    ; DCQ     0
    dq 0
    ; DCQ     XRESTORE_INPUT, 0
    dq XRESTORE_INPUT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRESTORE_INPUT
    dq row_XRESTORE_INPUT
section .text
XRESTORE_INPUT:
    ; cmp     x20, #5
    mov rax, qword [rel arm_x20]
    cmp rax, 5
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _ri_n5
    cmp byte [rel arm_z], 0
    jne _ri_n5
    ; cmp     x20, #4
    mov rax, qword [rel arm_x20]
    cmp rax, 4
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _ri_fail
    cmp byte [rel arm_z], 0
    je _ri_fail
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; b       _ri_common
    jmp _ri_common
_ri_n5:
    ; ldr     x5, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
_ri_common:
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
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
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
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
    ; lea x4, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x4], rax
    ; str     x5, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; cbz     x5, _ri_apply
    mov rax, qword [rel arm_x5]
    cmp rax, 0
    je _ri_apply
    ; sub     sp, sp, #64
    mov rax, rsp
    sub rax, 0x40
    mov rsp, rax
    ; stp     x29, x30, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x0, x1, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; str     x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x0, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x0], rax
    ; bl      _block_load_nr
    lea rax, [rel xret_140]
    mov qword [rel arm_x30], rax
    jmp _block_load_nr
    xret_140:
    ; ldp     x0, x1, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; ldr     x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; ldp     x29, x30, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
    ; lea x3, block_buf
    lea rax, [rel block_buf]
    mov qword [rel arm_x3], rax
    ; mov     x2, #1024
    mov rax, 0x400
    mov qword [rel arm_x2], rax
_ri_apply:
    ; lea x4, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x4], rax
    ; str     x3, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x4, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x4], rax
    ; add     x6, x3, x1
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x1]
    add rax, rcx
    mov qword [rel arm_x6], rax
    ; str     x6, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; add     x6, x3, x2
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x6], rax
    ; lea x4, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x4], rax
    ; str     x6, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; lea x4, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x4], rax
    ; str     x1, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x4, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x4], rax
    ; str     x0, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x4, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x4], rax
    ; ldr     x4, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; cbz     x4, _ri_ok
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _ri_ok
    ; lea x4, line_limit
    lea rax, [rel line_limit]
    mov qword [rel arm_x4], rax
    ; ldr     x5, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; add     x3, x3, x2
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x3], rax
    ; cmp     x3, x5
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _ri_next
    cmp byte [rel arm_c], 0
    jne _ri_next
    ; ldrb    w4, [x3]
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _ri_nl
    cmp byte [rel arm_z], 0
    jne _ri_nl
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _ri_next
    cmp byte [rel arm_z], 0
    je _ri_next
    ; add     x4, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x4], rax
    ; cmp     x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _ri_next
    cmp byte [rel arm_c], 0
    jne _ri_next
    ; ldrb    w6, [x4]
    mov r10, qword [rel arm_x4]
    movzx eax, byte [r10]
    mov qword [rel arm_x6], rax
    ; cmp     w6, #10
    mov eax, dword [rel arm_x6]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _ri_next
    cmp byte [rel arm_z], 0
    je _ri_next
    ; add     x3, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _ri_next
    jmp _ri_next
_ri_nl:
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
_ri_next:
    ; lea x4, line_next
    lea rax, [rel line_next]
    mov qword [rel arm_x4], rax
    ; str     x3, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
_ri_ok:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
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
_ri_fail:
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
_ri_drop:
    ; cbz     x1, _ri_bad
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _ri_bad
    ; ldr     x20, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; b       _ri_drop
    jmp _ri_drop
_ri_bad:
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x20, #-1
    mov rax, -1
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
nm_XNTOR:
    ; DCB "N>R", 0
    db "N>R", 0
hl_XNTOR:
    ; DCB "N>R ( xn .. x1 n -- ) ( R: -- xn .. x1 n ) move n items and the count to the return stack", 0
    db "N>R ( xn .. x1 n -- ) ( R: -- xn .. x1 n ) move n items and the count to the return stack", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNTOR:
    ; DCQ     nm_XNTOR, hl_XNTOR
    dq nm_XNTOR, hl_XNTOR
    ; DCQ     0
    dq 0
    ; DCQ     XNTOR, 0
    dq XNTOR, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNTOR
    dq row_XNTOR
section .text
XNTOR:
    ; mov     x5, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x5], rax
    ; mov     x1, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x1], rax
_ntor_loop:
    ; cbz     x1, _ntor_count
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _ntor_count
    ; ldr     x2, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; str     x2, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; b       _ntor_loop
    jmp _ntor_loop
_ntor_count:
    ; str     x5, [x23, #-8]!
    mov rax, qword [rel arm_x23]
    add rax, -8
    mov qword [rel arm_x23], rax
    mov r10, qword [rel arm_x23]
    mov rax, qword [rel arm_x5]
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
nm_XNRFROM:
    ; DCB "NR>", 0
    db "NR>", 0
hl_XNRFROM:
    ; DCB "NR> ( -- xn .. x1 n ) ( R: xn .. x1 n -- ) restore n items and the count", 0
    db "NR> ( -- xn .. x1 n ) ( R: xn .. x1 n -- ) restore n items and the count", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNRFROM:
    ; DCQ     nm_XNRFROM, hl_XNRFROM
    dq nm_XNRFROM, hl_XNRFROM
    ; DCQ     0
    dq 0
    ; DCQ     XNRFROM, 0
    dq XNRFROM, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNRFROM
    dq row_XNRFROM
section .text
XNRFROM:
    ; ldr     x5, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; mov     x1, x5
    mov rax, qword [rel arm_x5]
    mov qword [rel arm_x1], rax
_nrfrom_loop:
    ; cbz     x1, _nrfrom_count
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _nrfrom_count
    ; ldr     x2, [x23], #8
    mov r10, qword [rel arm_x23]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x23]
    add rax, 8
    mov qword [rel arm_x23], rax
    ; str     x2, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; b       _nrfrom_loop
    jmp _nrfrom_loop
_nrfrom_count:
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
section .bwstr align=1
nm_XCSPICK:
    ; DCB "CS-PICK", 0
    db "CS-PICK", 0
hl_XCSPICK:
    ; DCB "CS-PICK ( i*x u -- i*x x_u ) copy the uth control-flow item", 0
    db "CS-PICK ( i*x u -- i*x x_u ) copy the uth control-flow item", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCSPICK:
    ; DCQ     nm_XCSPICK, hl_XCSPICK
    dq nm_XCSPICK, hl_XCSPICK
    ; DCQ     0
    dq 0
    ; DCQ     XCSPICK, 0
    dq XCSPICK, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCSPICK
    dq row_XCSPICK
section .text
XCSPICK:
    ; b       XPICK
    jmp XPICK
section .bwstr align=1
nm_XCSROLL:
    ; DCB "CS-ROLL", 0
    db "CS-ROLL", 0
hl_XCSROLL:
    ; DCB "CS-ROLL ( xu .. x0 u -- xu-1 .. x0 xu ) rotate the uth control-flow item to the top", 0
    db "CS-ROLL ( xu .. x0 u -- xu-1 .. x0 xu ) rotate the uth control-flow item to the top", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCSROLL:
    ; DCQ     nm_XCSROLL, hl_XCSROLL
    dq nm_XCSROLL, hl_XCSROLL
    ; DCQ     0
    dq 0
    ; DCQ     XCSROLL, 0
    dq XCSROLL, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCSROLL
    dq row_XCSROLL
section .text
XCSROLL:
    ; b       XROLL
    jmp XROLL
section .bwstr align=1
nm_XNAME_INTERPRET:
    ; DCB "NAME>INTERPRET", 0
    db "NAME>INTERPRET", 0
hl_XNAME_INTERPRET:
    ; DCB "NAME>INTERPRET ( nt -- xt | 0 ) interpretation xt for a name token", 0
    db "NAME>INTERPRET ( nt -- xt | 0 ) interpretation xt for a name token", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNAME_INTERPRET:
    ; DCQ     nm_XNAME_INTERPRET, hl_XNAME_INTERPRET
    dq nm_XNAME_INTERPRET, hl_XNAME_INTERPRET
    ; DCQ     0
    dq 0
    ; DCQ     XNAME_INTERPRET, 0
    dq XNAME_INTERPRET, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNAME_INTERPRET
    dq row_XNAME_INTERPRET
section .text
XNAME_INTERPRET:
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
nm_XNAME_COMPILE:
    ; DCB "NAME>COMPILE", 0
    db "NAME>COMPILE", 0
hl_XNAME_COMPILE:
    ; DCB "NAME>COMPILE ( nt -- x xt ) compilation semantics pair for a name token", 0
    db "NAME>COMPILE ( nt -- x xt ) compilation semantics pair for a name token", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNAME_COMPILE:
    ; DCQ     nm_XNAME_COMPILE, hl_XNAME_COMPILE
    dq nm_XNAME_COMPILE, hl_XNAME_COMPILE
    ; DCQ     0
    dq 0
    ; DCQ     XNAME_COMPILE, 0
    dq XNAME_COMPILE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNAME_COMPILE
    dq row_XNAME_COMPILE
section .text
XNAME_COMPILE:
    ; mov     x5, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x5], rax
    ; ldr     x0, [x5, #-8]
    mov r10, qword [rel arm_x5]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; tbnz    x0, #63, _nc_imm
    mov rax, qword [rel arm_x0]
    bt rax, 63
    jc _nc_imm
    ; lea x1, cfa_comma
    lea rax, [rel cfa_comma]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; str     x5, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x5]
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
_nc_imm:
    ; lea x1, cfa_execute
    lea rax, [rel cfa_execute]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; str     x5, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x5]
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
nm_XLIBRARY_PATH:
    ; DCB "LIBRARY-PATH", 0
    db "LIBRARY-PATH", 0
hl_XLIBRARY_PATH:
    ; DCB "LIBRARY-PATH ( -- c-addr u ) absolute Library directory", 0
    db "LIBRARY-PATH ( -- c-addr u ) absolute Library directory", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLIBRARY_PATH:
    ; DCQ     nm_XLIBRARY_PATH, hl_XLIBRARY_PATH
    dq nm_XLIBRARY_PATH, hl_XLIBRARY_PATH
    ; DCQ     0
    dq 0
    ; DCQ     XLIBRARY_PATH, XLIBRARY_PATH_END
    dq XLIBRARY_PATH, XLIBRARY_PATH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLIBRARY_PATH
    dq row_XLIBRARY_PATH
section .text
XLIBRARY_PATH:
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
    ; lea x0, library_path_buf
    lea rax, [rel library_path_buf]
    mov qword [rel arm_x0], rax
    ; mov     x1, #1024
    mov rax, 0x400
    mov qword [rel arm_x1], rax
    ; bl      host_library_path
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
    call host_library_path
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; mov     x1, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x1], rax
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
    ; lea x0, library_path_buf
    lea rax, [rel library_path_buf]
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
XLIBRARY_PATH_END:
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
nm_XPAGE:
    ; DCB "PAGE", 0
    db "PAGE", 0
hl_XPAGE:
    ; DCB "PAGE ( -- ) clear facility terminal and home cursor", 0
    db "PAGE ( -- ) clear facility terminal and home cursor", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPAGE:
    ; DCQ     nm_XPAGE, hl_XPAGE
    dq nm_XPAGE, hl_XPAGE
    ; DCQ     0
    dq 0
    ; DCQ     XPAGE, XPAGE_END
    dq XPAGE, XPAGE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPAGE
    dq row_XPAGE
section .text
XPAGE:
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; b       _facility_op_go
    jmp _facility_op_go
XPAGE_END:
section .bwstr align=1
nm_XAT_XY:
    ; DCB "AT-XY", 0
    db "AT-XY", 0
hl_XAT_XY:
    ; DCB "AT-XY ( u1 u2 -- ) facility cursor to column u1 row u2", 0
    db "AT-XY ( u1 u2 -- ) facility cursor to column u1 row u2", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAT_XY:
    ; DCQ     nm_XAT_XY, hl_XAT_XY
    dq nm_XAT_XY, hl_XAT_XY
    ; DCQ     0
    dq 0
    ; DCQ     XAT_XY, XAT_XY_END
    dq XAT_XY, XAT_XY_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAT_XY
    dq row_XAT_XY
section .text
XAT_XY:
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
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
    ; mov     x0, #2
    mov rax, 2
    mov qword [rel arm_x0], rax
    ; b       _facility_op_go
    jmp _facility_op_go
XAT_XY_END:
section .bwstr align=1
nm_XAT_XY_Q:
    ; DCB "AT-XY?", 0
    db "AT-XY?", 0
hl_XAT_XY_Q:
    ; DCB "AT-XY? ( -- col row ) facility cursor position", 0
    db "AT-XY? ( -- col row ) facility cursor position", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAT_XY_Q:
    ; DCQ     nm_XAT_XY_Q, hl_XAT_XY_Q
    dq nm_XAT_XY_Q, hl_XAT_XY_Q
    ; DCQ     0
    dq 0
    ; DCQ     XAT_XY_Q, XAT_XY_Q_END
    dq XAT_XY_Q, XAT_XY_Q_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAT_XY_Q
    dq row_XAT_XY_Q
section .text
XAT_XY_Q:
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
    ; bl      host_facility_xy
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
    call host_facility_xy
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
XAT_XY_Q_END:
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
nm_XCLIP_STORE:
    ; DCB "CLIP!", 0
    db "CLIP!", 0
hl_XCLIP_STORE:
    ; DCB "CLIP! ( c-addr u -- ) set host clipboard", 0
    db "CLIP! ( c-addr u -- ) set host clipboard", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCLIP_STORE:
    ; DCQ     nm_XCLIP_STORE, hl_XCLIP_STORE
    dq nm_XCLIP_STORE, hl_XCLIP_STORE
    ; DCQ     0
    dq 0
    ; DCQ     XCLIP_STORE, XCLIP_STORE_END
    dq XCLIP_STORE, XCLIP_STORE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCLIP_STORE
    dq row_XCLIP_STORE
section .text
XCLIP_STORE:
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
    ; bl      host_clip_set
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
    call host_clip_set
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
XCLIP_STORE_END:
section .bwstr align=1
nm_XCLIP_FETCH:
    ; DCB "CLIP@", 0
    db "CLIP@", 0
hl_XCLIP_FETCH:
    ; DCB "CLIP@ ( c-addr max -- u ) fetch host clipboard", 0
    db "CLIP@ ( c-addr max -- u ) fetch host clipboard", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCLIP_FETCH:
    ; DCQ     nm_XCLIP_FETCH, hl_XCLIP_FETCH
    dq nm_XCLIP_FETCH, hl_XCLIP_FETCH
    ; DCQ     0
    dq 0
    ; DCQ     XCLIP_FETCH, XCLIP_FETCH_END
    dq XCLIP_FETCH, XCLIP_FETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCLIP_FETCH
    dq row_XCLIP_FETCH
section .text
XCLIP_FETCH:
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
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_clip_get
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
    call host_clip_get
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
XCLIP_FETCH_END:
section .bwstr align=1
nm_XTERM_REFRESH:
    ; DCB "TERMINAL-REFRESH", 0
    db "TERMINAL-REFRESH", 0
hl_XTERM_REFRESH:
    ; DCB "TERMINAL-REFRESH ( -- ) paint facility terminal to host console", 0
    db "TERMINAL-REFRESH ( -- ) paint facility terminal to host console", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTERM_REFRESH:
    ; DCQ     nm_XTERM_REFRESH, hl_XTERM_REFRESH
    dq nm_XTERM_REFRESH, hl_XTERM_REFRESH
    ; DCQ     0
    dq 0
    ; DCQ     XTERM_REFRESH, 0
    dq XTERM_REFRESH, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTERM_REFRESH
    dq row_XTERM_REFRESH
section .text
XTERM_REFRESH:
    ; mov     x0, #3
    mov rax, 3
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; b       _facility_op_go
    jmp _facility_op_go
section .bwstr align=1
nm_XFACILITY_OFF:
    ; DCB "FACILITY-OFF", 0
    db "FACILITY-OFF", 0
hl_XFACILITY_OFF:
    ; DCB "FACILITY-OFF ( -- ) leave facility terminal mode", 0
    db "FACILITY-OFF ( -- ) leave facility terminal mode", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFACILITY_OFF:
    ; DCQ     nm_XFACILITY_OFF, hl_XFACILITY_OFF
    dq nm_XFACILITY_OFF, hl_XFACILITY_OFF
    ; DCQ     0
    dq 0
    ; DCQ     XFACILITY_OFF, 0
    dq XFACILITY_OFF, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFACILITY_OFF
    dq row_XFACILITY_OFF
section .text
XFACILITY_OFF:
    ; mov     x0, #4
    mov rax, 4
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; b       _facility_op_go
    jmp _facility_op_go
section .bwstr align=1
nm_XFACILITY_SIZE:
    ; DCB "(FACILITY-SIZE)", 0
    db "(FACILITY-SIZE)", 0
hl_XFACILITY_SIZE:
    ; DCB "(FACILITY-SIZE) ( cols rows -- ) resize facility terminal grid", 0
    db "(FACILITY-SIZE) ( cols rows -- ) resize facility terminal grid", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFACILITY_SIZE:
    ; DCQ     nm_XFACILITY_SIZE, hl_XFACILITY_SIZE
    dq nm_XFACILITY_SIZE, hl_XFACILITY_SIZE
    ; DCQ     0
    dq 0
    ; DCQ     XFACILITY_SIZE, XFACILITY_SIZE_END
    dq XFACILITY_SIZE, XFACILITY_SIZE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFACILITY_SIZE
    dq row_XFACILITY_SIZE
section .text
XFACILITY_SIZE:
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
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
    ; mov     x0, #5
    mov rax, 5
    mov qword [rel arm_x0], rax
    ; b       _facility_op_go
    jmp _facility_op_go
XFACILITY_SIZE_END:
section .bwstr align=1
nm_XFACILITY_REV:
    ; DCB "FACILITY-REV", 0
    db "FACILITY-REV", 0
hl_XFACILITY_REV:
    ; DCB "FACILITY-REV ( f -- ) reverse-video on or off for facility EMIT", 0
    db "FACILITY-REV ( f -- ) reverse-video on or off for facility EMIT", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFACILITY_REV:
    ; DCQ     nm_XFACILITY_REV, hl_XFACILITY_REV
    dq nm_XFACILITY_REV, hl_XFACILITY_REV
    ; DCQ     0
    dq 0
    ; DCQ     XFACILITY_REV, XFACILITY_REV_END
    dq XFACILITY_REV, XFACILITY_REV_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFACILITY_REV
    dq row_XFACILITY_REV
section .text
XFACILITY_REV:
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
    ; mov     x0, #6
    mov rax, 6
    mov qword [rel arm_x0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
    ; b       _facility_op_go
    jmp _facility_op_go
XFACILITY_REV_END:
section .bwstr align=1
nm_XFACILITY_OP_GO:
    ; DCB "(XFACILITY-OP-GO)", 0
    db "(XFACILITY-OP-GO)", 0
hl_XFACILITY_OP_GO:
    ; DCB "(XFACILITY-OP-GO) ( -- ) facility host hook x0=op x1 x2=args", 0
    db "(XFACILITY-OP-GO) ( -- ) facility host hook x0=op x1 x2=args", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFACILITY_OP_GO:
    ; DCQ     nm_XFACILITY_OP_GO, hl_XFACILITY_OP_GO
    dq nm_XFACILITY_OP_GO, hl_XFACILITY_OP_GO
    ; DCQ     0
    dq 0
    ; DCQ     XFACILITY_OP_GO, XFACILITY_OP_GO_END
    dq XFACILITY_OP_GO, XFACILITY_OP_GO_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFACILITY_OP_GO
    dq row_XFACILITY_OP_GO
section .text
XFACILITY_OP_GO:
_facility_op_go:
    ; lea x9, facility_op_hook
    lea rax, [rel facility_op_hook]
    mov qword [rel arm_x9], rax
    ; ldr     x9, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
    ; cbz     x9, fac_op_done
    mov rax, qword [rel arm_x9]
    cmp rax, 0
    je fac_op_done
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; blr     x9
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
    mov r11, qword [rel arm_x9]
    call r11
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
fac_op_done:
XFACILITY_OP_GO_END:
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
_call_native_regs:
    ; stp     x29, x30, [sp, #-128]!
    add rsp, -128
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
    ; stp     x28, x18, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x28]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x18]
    mov qword [r10+8], rax
    ; stp     x0, x1, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; str     x2, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; mov     x1, #64
    mov rax, 0x40
    mov qword [rel arm_x1], rax
    ; bl      host_icache_inval
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
    call host_icache_inval
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x0, x1, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; ldr     x2, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; mov     x19, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x19], rax
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
    ; ldp     x28, x18, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x28], rax
    mov qword [rel arm_x18], rcx
    ; ldp     x23, x24, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
    ; ldp     x21, x22, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x21], rax
    mov qword [rel arm_x22], rcx
    ; ldp     x19, x20, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x19], rax
    mov qword [rel arm_x20], rcx
    ; ldp     x29, x30, [sp], #128
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x80
    ; ret
    jmp qword [rel arm_x30]
section .bwstr align=1
nm_XMPROTECT:
    ; DCB "MPROTECT", 0
    db "MPROTECT", 0
hl_XMPROTECT:
    ; DCB "MPROTECT ( addr u prot -- ior ) protect pages prot 1=R 2=W 4=X", 0
    db "MPROTECT ( addr u prot -- ior ) protect pages prot 1=R 2=W 4=X", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMPROTECT:
    ; DCQ     nm_XMPROTECT, hl_XMPROTECT
    dq nm_XMPROTECT, hl_XMPROTECT
    ; DCQ     0
    dq 0
    ; DCQ     XMPROTECT, 0
    dq XMPROTECT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMPROTECT
    dq row_XMPROTECT
section .text
XMPROTECT:
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
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
    ; bl      host_mprotect
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
    call host_mprotect
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
nm_XICACHE_INVAL:
    ; DCB "ICACHE-INVAL", 0
    db "ICACHE-INVAL", 0
hl_XICACHE_INVAL:
    ; DCB "ICACHE-INVAL ( addr u -- ) flush the instruction cache for a range", 0
    db "ICACHE-INVAL ( addr u -- ) flush the instruction cache for a range", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XICACHE_INVAL:
    ; DCQ     nm_XICACHE_INVAL, hl_XICACHE_INVAL
    dq nm_XICACHE_INVAL, hl_XICACHE_INVAL
    ; DCQ     0
    dq 0
    ; DCQ     XICACHE_INVAL, 0
    dq XICACHE_INVAL, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XICACHE_INVAL
    dq row_XICACHE_INVAL
section .text
XICACHE_INVAL:
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
    ; bl      host_icache_inval
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
    call host_icache_inval
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
nm_XCALL_NATIVE:
    ; DCB "CALL-NATIVE", 0
    db "CALL-NATIVE", 0
hl_XCALL_NATIVE:
    ; DCB "CALL-NATIVE ( x0 dsp code -- x0' ) call native code and save the VM", 0
    db "CALL-NATIVE ( x0 dsp code -- x0' ) call native code and save the VM", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCALL_NATIVE:
    ; DCQ     nm_XCALL_NATIVE, hl_XCALL_NATIVE
    dq nm_XCALL_NATIVE, hl_XCALL_NATIVE
    ; DCQ     0
    dq 0
    ; DCQ     XCALL_NATIVE, 0
    dq XCALL_NATIVE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCALL_NATIVE
    dq row_XCALL_NATIVE
section .text
XCALL_NATIVE:
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    mov rax, qword [rel arm_x22]
    add rax, 8
    mov qword [rel arm_x22], rax
    ; ldr     x0, [x22], #8
    mov r10, qword [rel arm_x22]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
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
    ; bl      _call_native_regs
    lea rax, [rel xret_141]
    mov qword [rel arm_x30], rax
    jmp _call_native_regs
    xret_141:
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
section .bwstr align=1
nm_XCALL_NATIVE_LEAF:
    ; DCB "CALL-NATIVE-LEAF", 0
    db "CALL-NATIVE-LEAF", 0
hl_XCALL_NATIVE_LEAF:
    ; DCB "CALL-NATIVE-LEAF ( code -- x0' ) call code with x0=0 and a BSS DSP", 0
    db "CALL-NATIVE-LEAF ( code -- x0' ) call code with x0=0 and a BSS DSP", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCALL_NATIVE_LEAF:
    ; DCQ     nm_XCALL_NATIVE_LEAF, hl_XCALL_NATIVE_LEAF
    dq nm_XCALL_NATIVE_LEAF, hl_XCALL_NATIVE_LEAF
    ; DCQ     0
    dq 0
    ; DCQ     XCALL_NATIVE_LEAF, 0
    dq XCALL_NATIVE_LEAF, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCALL_NATIVE_LEAF
    dq row_XCALL_NATIVE_LEAF
section .text
XCALL_NATIVE_LEAF:
    ; mov     x2, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x2], rax
    ; lea x1, native_dsp_end
    lea rax, [rel native_dsp_end]
    mov qword [rel arm_x1], rax
    ; sub     x1, x1, #64
    mov rax, qword [rel arm_x1]
    sub rax, 0x40
    mov qword [rel arm_x1], rax
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _call_native_regs
    lea rax, [rel xret_142]
    mov qword [rel arm_x30], rax
    jmp _call_native_regs
    xret_142:
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
section .bwstr align=1
nm_XALLOCATE_EXEC:
    ; DCB "ALLOCATE-EXEC", 0
    db "ALLOCATE-EXEC", 0
hl_XALLOCATE_EXEC:
    ; DCB "ALLOCATE-EXEC ( u -- a-addr ior ) RW buffer for later R+X", 0
    db "ALLOCATE-EXEC ( u -- a-addr ior ) RW buffer for later R+X", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XALLOCATE_EXEC:
    ; DCQ     nm_XALLOCATE_EXEC, hl_XALLOCATE_EXEC
    dq nm_XALLOCATE_EXEC, hl_XALLOCATE_EXEC
    ; DCQ     0
    dq 0
    ; DCQ     XALLOCATE_EXEC, 0
    dq XALLOCATE_EXEC, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XALLOCATE_EXEC
    dq row_XALLOCATE_EXEC
section .text
XALLOCATE_EXEC:
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; cbnz    x0, _ax_size
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _ax_size
    ; mov     x0, #0x1000
    mov rax, 0x1000
    mov qword [rel arm_x0], rax
_ax_size:
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
    ; add     x1, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [rel arm_x1], rax
    ; str     xzr, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov qword [r10], 0
    ; bl      host_alloc_exec
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
    call host_alloc_exec
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
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
    ; str     x1, [x22, #-8]!
    mov rax, qword [rel arm_x22]
    add rax, -8
    mov qword [rel arm_x22], rax
    mov r10, qword [rel arm_x22]
    mov rax, qword [rel arm_x1]
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
nm_XFREE_EXEC:
    ; DCB "FREE-EXEC", 0
    db "FREE-EXEC", 0
hl_XFREE_EXEC:
    ; DCB "FREE-EXEC ( a-addr u -- ior ) release an ALLOCATE-EXEC buffer", 0
    db "FREE-EXEC ( a-addr u -- ior ) release an ALLOCATE-EXEC buffer", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XFREE_EXEC:
    ; DCQ     nm_XFREE_EXEC, hl_XFREE_EXEC
    dq nm_XFREE_EXEC, hl_XFREE_EXEC
    ; DCQ     0
    dq 0
    ; DCQ     XFREE_EXEC, 0
    dq XFREE_EXEC, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XFREE_EXEC
    dq row_XFREE_EXEC
section .text
XFREE_EXEC:
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
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      host_free_exec
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
    call host_free_exec
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
nm_XJIT_WPROTECT:
    ; DCB "JIT-WPROTECT", 0
    db "JIT-WPROTECT", 0
hl_XJIT_WPROTECT:
    ; DCB "JIT-WPROTECT ( f -- ) record write or execute mode for this thread", 0
    db "JIT-WPROTECT ( f -- ) record write or execute mode for this thread", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XJIT_WPROTECT:
    ; DCQ     nm_XJIT_WPROTECT, hl_XJIT_WPROTECT
    dq nm_XJIT_WPROTECT, hl_XJIT_WPROTECT
    ; DCQ     0
    dq 0
    ; DCQ     XJIT_WPROTECT, 0
    dq XJIT_WPROTECT, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XJIT_WPROTECT
    dq row_XJIT_WPROTECT
section .text
XJIT_WPROTECT:
    ; cmp     x20, #0
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; cset    x1, ne
    xor eax, eax
    cmp byte [rel arm_z], 0
    jne xsk_143
    mov eax, 1
    xsk_143:
    mov qword [rel arm_x1], rax
    ; lea x0, jit_exec_mode
    lea rax, [rel jit_exec_mode]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
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
nm_XNATIVE_SMOKE:
    ; DCB "NATIVE-SMOKE", 0
    db "NATIVE-SMOKE", 0
hl_XNATIVE_SMOKE:
    ; DCB "NATIVE-SMOKE ( -- ior ) test RW map then RX call", 0
    db "NATIVE-SMOKE ( -- ior ) test RW map then RX call", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNATIVE_SMOKE:
    ; DCQ     nm_XNATIVE_SMOKE, hl_XNATIVE_SMOKE
    dq nm_XNATIVE_SMOKE, hl_XNATIVE_SMOKE
    ; DCQ     0
    dq 0
    ; DCQ     XNATIVE_SMOKE, 0
    dq XNATIVE_SMOKE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNATIVE_SMOKE
    dq row_XNATIVE_SMOKE
section .text
XNATIVE_SMOKE:
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
    ; mov     x0, #0x1000
    mov rax, 0x1000
    mov qword [rel arm_x0], rax
    ; add     x1, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [rel arm_x1], rax
    ; str     xzr, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov qword [r10], 0
    ; bl      host_alloc_exec
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
    call host_alloc_exec
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; cbnz    x0, _ns_bad
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _ns_bad
    ; ldr     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; bl      host_native_ret7
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
    call host_native_ret7
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; mov     x1, #0x1000
    mov rax, 0x1000
    mov qword [rel arm_x1], rax
    ; mov     x2, #5
    mov rax, 5
    mov qword [rel arm_x2], rax
    ; bl      host_mprotect
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
    call host_mprotect
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; cbnz    x0, _ns_free
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _ns_free
    ; ldr     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; mov     x1, #0x1000
    mov rax, 0x1000
    mov qword [rel arm_x1], rax
    ; bl      host_icache_inval
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
    call host_icache_inval
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; lea x1, native_dsp_end
    lea rax, [rel native_dsp_end]
    mov qword [rel arm_x1], rax
    ; sub     x1, x1, #64
    mov rax, qword [rel arm_x1]
    sub rax, 0x40
    mov qword [rel arm_x1], rax
    ; ldr     x2, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; bl      _call_native_regs
    lea rax, [rel xret_144]
    mov qword [rel arm_x30], rax
    jmp _call_native_regs
    xret_144:
    ; str     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldr     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; mov     x1, #0x1000
    mov rax, 0x1000
    mov qword [rel arm_x1], rax
    ; bl      host_free_exec
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
    call host_free_exec
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; cbnz    x0, _ns_bad
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _ns_bad
    ; ldr     x0, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cmp     x0, #7
    mov rax, qword [rel arm_x0]
    cmp rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _ns_bad
    cmp byte [rel arm_z], 0
    je _ns_bad
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; b       _ns_out
    jmp _ns_out
_ns_free:
    ; ldr     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; mov     x1, #0x1000
    mov rax, 0x1000
    mov qword [rel arm_x1], rax
    ; bl      host_free_exec
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
    call host_free_exec
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
_ns_bad:
    ; mov     x0, #-1
    mov rax, -1
    mov qword [rel arm_x0], rax
_ns_out:
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
next_debug_gate:
    ; lea x16, next_debug
    lea rax, [rel next_debug]
    mov qword [rel arm_x16], rax
    ; br      x16
    mov rax, qword [rel arm_x16]
    jmp rax
section .rodata
req_included_name:
    ; DCB   "INCLUDED"
    db "INCLUDED"
str_protected:
    ; DCB     "protected (system word)", 10, 0
    db "protected (system word)", 0xa, 0
str_gmm_already:
    ; DCB     "? GROWMEMORYMB already used (once per session)", 10, 0
    db "? GROWMEMORYMB already used (once per session)", 0xa, 0
str_gmm_small:
    ; DCB     "? GROWMEMORYMB needs at least 1 MB", 10, 0
    db "? GROWMEMORYMB needs at least 1 MB", 0xa, 0
str_gmm_big:
    ; DCB     "? GROWMEMORYMB exceeds maximum (256 MB)", 10, 0
    db "? GROWMEMORYMB exceeds maximum (256 MB)", 0xa, 0
str_gmm_shrink:
    ; DCB     "? GROWMEMORYMB cannot shrink memory", 10, 0
    db "? GROWMEMORYMB cannot shrink memory", 0xa, 0
str_bang:
    ; DCB     "!", 0
    db "!", 0
str_twostore:
    ; DCB     "2!", 0
    db "2!", 0
str_twofetch:
    ; DCB     "2@", 0
    db "2@", 0
str_type:
    ; DCB     "TYPE", 0
    db "TYPE", 0
    ; ALIGN 8
align 8
env_name_ptrs:
    ; DCQ     env_n_counted
    dq env_n_counted
    ; DCQ     env_n_aub
    dq env_n_aub
    ; DCQ     env_n_core
    dq env_n_core
    ; DCQ     env_n_core_ext
    dq env_n_core_ext
    ; DCQ     env_n_floored
    dq env_n_floored
    ; DCQ     env_n_maxchar
    dq env_n_maxchar
    ; DCQ     env_n_maxn
    dq env_n_maxn
    ; DCQ     env_n_maxu
    dq env_n_maxu
    ; DCQ     env_n_rstack
    dq env_n_rstack
    ; DCQ     env_n_stack
    dq env_n_stack
    ; DCQ     env_n_floating
    dq env_n_floating
    ; DCQ     env_n_float_ext
    dq env_n_float_ext
    ; DCQ     env_n_floating_stack
    dq env_n_floating_stack
    ; DCQ     env_n_max_float
    dq env_n_max_float
    ; DCQ     env_n_string
    dq env_n_string
    ; DCQ     env_n_facility
    dq env_n_facility
    ; DCQ     env_n_facility_ext
    dq env_n_facility_ext
    ; DCQ     env_n_locals
    dq env_n_locals
    ; DCQ     env_n_nlocals
    dq env_n_nlocals
    ; DCQ     env_n_xchar
    dq env_n_xchar
    ; DCQ     env_n_xchar_enc
    dq env_n_xchar_enc
    ; DCQ     env_n_max_xchar
    dq env_n_max_xchar
    ; DCQ     env_n_xchar_maxmem
    dq env_n_xchar_maxmem
    ; DCQ     env_n_double
    dq env_n_double
    ; DCQ     env_n_exception
    dq env_n_exception
    ; DCQ     env_n_mem
    dq env_n_mem
    ; DCQ     env_n_search
    dq env_n_search
    ; DCQ     env_n_wordlists
    dq env_n_wordlists
    ; DCQ     env_n_block
    dq env_n_block
    ; DCQ     env_n_file
    dq env_n_file
    ; DCQ     env_n_file_ext
    dq env_n_file_ext
env_values:
    ; DCQ     255
    dq 0xff
    ; DCQ     8
    dq 8
    ; DCQ     -1
    dq -1
    ; DCQ     -1
    dq -1
    ; DCQ     0
    dq 0
    ; DCQ     255
    dq 0xff
    ; DCQ     0x7FFFFFFFFFFFFFFF
    dq 0x7fffffffffffffff
    ; DCQ     -1
    dq -1
    ; DCQ     512
    dq 0x200
    ; DCQ     512
    dq 0x200
    ; DCQ     -1
    dq -1
    ; DCQ     -1
    dq -1
    ; DCQ     16
    dq 0x10
    ; DCQ     0x7FEFFFFFFFFFFFFF
    dq 0x7fefffffffffffff
    ; DCQ     -1
    dq -1
    ; DCQ     0
    dq 0
    ; DCQ     0
    dq 0
    ; DCQ     -1
    dq -1
    ; DCQ     32
    dq 0x20
    ; DCQ     0
    dq 0
    ; DCQ     env_s_utf8
    dq env_s_utf8
    ; DCQ     0x10FFFF
    dq 0x10ffff
    ; DCQ     4
    dq 4
    ; DCQ     -1
    dq -1
    ; DCQ     -1
    dq -1
    ; DCQ     -1
    dq -1
    ; DCQ     -1
    dq -1
    ; DCQ     8
    dq 8
    ; DCQ     -1
    dq -1
    ; DCQ     -1
    dq -1
    ; DCQ     -1
    dq -1
env_kinds:
    ; DCB     1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    ; DCB     2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    db 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
env_n_counted:
    ; DCB "/COUNTED-STRING", 0
    db "/COUNTED-STRING", 0
env_n_aub:
    ; DCB "ADDRESS-UNIT-BITS", 0
    db "ADDRESS-UNIT-BITS", 0
env_n_core:
    ; DCB "CORE", 0
    db "CORE", 0
env_n_core_ext:
    ; DCB "CORE-EXT", 0
    db "CORE-EXT", 0
env_n_floored:
    ; DCB "FLOORED", 0
    db "FLOORED", 0
env_n_maxchar:
    ; DCB "MAX-CHAR", 0
    db "MAX-CHAR", 0
env_n_maxn:
    ; DCB "MAX-N", 0
    db "MAX-N", 0
env_n_maxu:
    ; DCB "MAX-U", 0
    db "MAX-U", 0
env_n_rstack:
    ; DCB "RETURN-STACK-CELLS", 0
    db "RETURN-STACK-CELLS", 0
env_n_stack:
    ; DCB "STACK-CELLS", 0
    db "STACK-CELLS", 0
env_n_floating:
    ; DCB "FLOATING", 0
    db "FLOATING", 0
env_n_float_ext:
    ; DCB "FLOAT-EXT", 0
    db "FLOAT-EXT", 0
env_n_floating_stack:
    ; DCB "FLOATING-STACK", 0
    db "FLOATING-STACK", 0
env_n_max_float:
    ; DCB "MAX-FLOAT", 0
    db "MAX-FLOAT", 0
env_n_string:
    ; DCB "STRING", 0
    db "STRING", 0
env_n_facility:
    ; DCB "FACILITY", 0
    db "FACILITY", 0
env_n_facility_ext:
    ; DCB "FACILITY-EXT", 0
    db "FACILITY-EXT", 0
env_n_locals:
    ; DCB "LOCALS", 0
    db "LOCALS", 0
env_n_nlocals:
    ; DCB "#LOCALS", 0
    db "#LOCALS", 0
env_n_xchar:
    ; DCB "EXTENDED-CHARACTER", 0
    db "EXTENDED-CHARACTER", 0
env_n_xchar_enc:
    ; DCB "XCHAR-ENCODING", 0
    db "XCHAR-ENCODING", 0
env_n_max_xchar:
    ; DCB "MAX-XCHAR", 0
    db "MAX-XCHAR", 0
env_n_xchar_maxmem:
    ; DCB "XCHAR-MAXMEM", 0
    db "XCHAR-MAXMEM", 0
env_n_double:
    ; DCB "DOUBLE", 0
    db "DOUBLE", 0
env_n_exception:
    ; DCB "EXCEPTION", 0
    db "EXCEPTION", 0
env_n_mem:
    ; DCB "MEMORY-ALLOCATION", 0
    db "MEMORY-ALLOCATION", 0
env_n_search:
    ; DCB "SEARCH-ORDER", 0
    db "SEARCH-ORDER", 0
env_n_wordlists:
    ; DCB "WORDLISTS", 0
    db "WORDLISTS", 0
env_n_block:
    ; DCB "BLOCK", 0
    db "BLOCK", 0
env_n_file:
    ; DCB "FILE", 0
    db "FILE", 0
env_n_file_ext:
    ; DCB "FILE-EXT", 0
    db "FILE-EXT", 0
env_s_utf8:
    ; DCB "UTF-8", 0
    db "UTF-8", 0
