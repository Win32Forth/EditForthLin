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
extern host_forget_drop_stale
extern host_free
extern host_free_exec
extern host_fromlib
extern host_fromlib_off
extern host_fromlib_query
extern host_hyper_reindex
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
