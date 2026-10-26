; Generated from Forth/kernel/arm64/prims_k2.asm. Do not edit.
OPTION CASEMAP:NONE
EXTRN arm_x0:QWORD
EXTRN arm_x1:QWORD
EXTRN arm_x2:QWORD
EXTRN arm_x3:QWORD
EXTRN arm_x4:QWORD
EXTRN arm_x5:QWORD
EXTRN arm_x6:QWORD
EXTRN arm_x7:QWORD
EXTRN arm_x8:QWORD
EXTRN arm_x9:QWORD
EXTRN arm_x10:QWORD
EXTRN arm_x11:QWORD
EXTRN arm_x12:QWORD
EXTRN arm_x13:QWORD
EXTRN arm_x14:QWORD
EXTRN arm_x15:QWORD
EXTRN arm_x16:QWORD
EXTRN arm_x17:QWORD
EXTRN arm_x18:QWORD
EXTRN arm_x19:QWORD
EXTRN arm_x20:QWORD
EXTRN arm_x21:QWORD
EXTRN arm_x22:QWORD
EXTRN arm_x23:QWORD
EXTRN arm_x24:QWORD
EXTRN arm_x25:QWORD
EXTRN arm_x26:QWORD
EXTRN arm_x27:QWORD
EXTRN arm_x28:QWORD
EXTRN arm_x29:QWORD
EXTRN arm_x30:QWORD
EXTRN arm_n:BYTE
EXTRN arm_z:BYTE
EXTRN arm_c:BYTE
EXTRN arm_v:BYTE
EXTRN XROLL:PROC
EXTRN XTYPE:PROC
EXTRN _arm_lines:PROC
EXTRN _compile_cell:PROC
EXTRN _cursor_commit:PROC
EXTRN _cursor_load:PROC
EXTRN _do_quit:PROC
EXTRN _eval_resume_push:PROC
EXTRN _file_op_call:PROC
EXTRN _find_word:PROC
EXTRN _float_op_call:PROC
EXTRN _getchar:PROC
EXTRN _interpret_empty:PROC
EXTRN _interpret_loop:PROC
EXTRN _local_add_name:PROC
EXTRN _local_compile_reset:PROC
EXTRN _local_finalize_compile:PROC
EXTRN _local_lookup:PROC
EXTRN _next_word:PROC
EXTRN _push_source:PROC
EXTRN _putchar:PROC
EXTRN _quit_exit:PROC
EXTRN _sa_print_unsigned:PROC
EXTRN _sa_putchar:PROC
EXTRN _take_line:PROC
EXTRN _view_push_src_id:PROC
EXTRN _view_set_src_from_pending:PROC
EXTRN base_var:BYTE
EXTRN blk_var:BYTE
EXTRN block_buf:BYTE
EXTRN block_file:BYTE
EXTRN block_nr:BYTE
EXTRN block_upd:BYTE
EXTRN bootptr_end:BYTE
EXTRN bootptr_start:BYTE
EXTRN catch_ok_cell:BYTE
EXTRN cfa_comma:BYTE
EXTRN cfa_execute:BYTE
EXTRN cfa_exit:BYTE
EXTRN cfa_flit:BYTE
EXTRN cfa_lit:BYTE
EXTRN cfa_local_store:BYTE
EXTRN cfa_slit:BYTE
EXTRN current_var:BYTE
EXTRN data_stack:BYTE
EXTRN debug_break_asap:BYTE
EXTRN debug_busy:BYTE
EXTRN emit_cstr:PROC
EXTRN emit_str:PROC
EXTRN eval_resume_sp:BYTE
EXTRN facility_op_hook:BYTE
EXTRN file_echo:BYTE
EXTRN forget_cut:BYTE
EXTRN grow_memory_used:BYTE
EXTRN here_ptr:BYTE
EXTRN host_accept:PROC
EXTRN host_alloc:PROC
EXTRN host_alloc_exec:PROC
EXTRN host_begin_load:PROC
EXTRN host_bi_divmod:PROC
EXTRN host_bi_isqrt:PROC
EXTRN host_bi_mul:PROC
EXTRN host_chdir:PROC
EXTRN host_clip_get:PROC
EXTRN host_clip_set:PROC
EXTRN host_cwd:PROC
EXTRN host_dir:PROC
EXTRN host_dot_included:PROC
EXTRN host_edit:PROC
EXTRN host_edit_at:PROC
EXTRN host_end_load:PROC
EXTRN host_facility_xy:PROC
EXTRN host_forget_drop_stale:PROC
EXTRN host_free:PROC
EXTRN host_free_exec:PROC
EXTRN host_fromlib:PROC
EXTRN host_fromlib_off:PROC
EXTRN host_fromlib_query:PROC
EXTRN host_hyper_reindex:PROC
EXTRN host_icache_inval:PROC
EXTRN host_include_dialog:PROC
EXTRN host_last_included:PROC
EXTRN host_library_path:PROC
EXTRN host_mprotect:PROC
EXTRN host_ms:PROC
EXTRN host_native_ret7:PROC
EXTRN host_pwd:PROC
EXTRN host_read:PROC
EXTRN host_register:PROC
EXTRN host_repos:PROC
EXTRN host_resize:PROC
EXTRN host_resolve:PROC
EXTRN host_sleep:PROC
EXTRN host_system:PROC
EXTRN host_time_date:PROC
EXTRN host_was_included:PROC
EXTRN include_name_len:BYTE
EXTRN include_name_pending:BYTE
EXTRN jit_exec_mode:BYTE
EXTRN key_fn:BYTE
EXTRN latest_var:BYTE
EXTRN library_path_buf:BYTE
EXTRN line_limit:BYTE
EXTRN line_mode:BYTE
EXTRN line_next:BYTE
EXTRN local_declaring:BYTE
EXTRN local_init_count:BYTE
EXTRN local_init_reverse:BYTE
EXTRN msg_allot:BYTE
EXTRN msg_huh:BYTE
EXTRN native_dsp_end:BYTE
EXTRN next_debug:PROC
EXTRN pad_buffer:BYTE
EXTRN redef_warn:BYTE
EXTRN resolve_buf:BYTE
EXTRN scr_var:BYTE
EXTRN search_order:BYTE
EXTRN search_order_n:BYTE
EXTRN source_base:BYTE
EXTRN source_cur:BYTE
EXTRN source_end:BYTE
EXTRN source_id:BYTE
EXTRN source_sp:BYTE
EXTRN state_var:BYTE
EXTRN throw_handler:BYTE
EXTRN to_in:BYTE
EXTRN tw_continue_cell:BYTE
EXTRN user_dict_area:BYTE
EXTRN user_dict_size_cell:BYTE
EXTRN wordlist_reg:BYTE
EXTRN wordlist_reg_n:BYTE
EXTRN words_user_base:BYTE
.CODE
PUBLIC XCATCH
PUBLIC XCATCH_OK
PUBLIC XTW_CONTINUE
PUBLIC XEXECUTE
PUBLIC _udivmod128
BWSTR SEGMENT ALIGN(1) READ
nm_XTUCK:
    ; DCB "TUCK", 0
    DB "TUCK", 0
hl_XTUCK:
    ; DCB "TUCK ( x1 x2 -- x2 x1 x2 ) copy TOS under the second", 0
    DB "TUCK ( x1 x2 -- x2 x1 x2 ) copy TOS under the second", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XTUCK:
    ; DCQ     nm_XTUCK, hl_XTUCK
    DQ OFFSET nm_XTUCK, OFFSET hl_XTUCK
    ; DCQ     0
    DQ 0
    ; DCQ     XTUCK, XTUCK_END
    DQ OFFSET XTUCK, OFFSET XTUCK_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XTUCK
    DQ OFFSET row_XTUCK
BOOTPTR ENDS
.CODE
XTUCK:
    ; ldr     x0, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    ; str     x20, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; str     x0, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x0
    mov QWORD PTR [r10], rax
XTUCK_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XPICK:
    ; DCB "PICK", 0
    DB "PICK", 0
hl_XPICK:
    ; DCB "PICK ( xu ... x0 u -- xu ... x0 xu ) copy the uth cell", 0
    DB "PICK ( xu ... x0 u -- xu ... x0 xu ) copy the uth cell", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XPICK:
    ; DCQ     nm_XPICK, hl_XPICK
    DQ OFFSET nm_XPICK, OFFSET hl_XPICK
    ; DCQ     0
    DQ 0
    ; DCQ     XPICK, XPICK_END
    DQ OFFSET XPICK, OFFSET XPICK_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XPICK
    DQ OFFSET row_XPICK
BOOTPTR ENDS
.CODE
XPICK:
    ; lsl     x0, x20, #3
    mov rax, QWORD PTR arm_x20
    shl rax, 3
    mov QWORD PTR arm_x0, rax
    ; ldr     x0, [x22, x0]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x0
    add r10, rax
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    ; mov     x20, x0
    mov rax, QWORD PTR arm_x0
    mov QWORD PTR arm_x20, rax
XPICK_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_X2TOR:
    ; DCB "2>R", 0
    DB "2>R", 0
hl_X2TOR:
    ; DCB "2>R ( n1 n2 -- ) two to the return stack", 0
    DB "2>R ( n1 n2 -- ) two to the return stack", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_X2TOR:
    ; DCQ     nm_X2TOR, hl_X2TOR
    DQ OFFSET nm_X2TOR, OFFSET hl_X2TOR
    ; DCQ     0
    DQ 0
    ; DCQ     X2TOR, X2TOR_END
    DQ OFFSET X2TOR, OFFSET X2TOR_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_X2TOR
    DQ OFFSET row_X2TOR
BOOTPTR ENDS
.CODE
X2TOR:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; str     x0, [x23, #-8]!
    mov rax, QWORD PTR arm_x23
    add rax, -8
    mov QWORD PTR arm_x23, rax
    mov r10, QWORD PTR arm_x23
    mov rax, QWORD PTR arm_x0
    mov QWORD PTR [r10], rax
    ; str     x20, [x23, #-8]!
    mov rax, QWORD PTR arm_x23
    add rax, -8
    mov QWORD PTR arm_x23, rax
    mov r10, QWORD PTR arm_x23
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x20, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
X2TOR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_X2RTO:
    ; DCB "2R>", 0
    DB "2R>", 0
hl_X2RTO:
    ; DCB "2R> ( -- n1 n2 ) two from the return stack", 0
    DB "2R> ( -- n1 n2 ) two from the return stack", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_X2RTO:
    ; DCQ     nm_X2RTO, hl_X2RTO
    DQ OFFSET nm_X2RTO, OFFSET hl_X2RTO
    ; DCQ     0
    DQ 0
    ; DCQ     X2RTO, X2RTO_END
    DQ OFFSET X2RTO, OFFSET X2RTO_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_X2RTO
    DQ OFFSET row_X2RTO
BOOTPTR ENDS
.CODE
X2RTO:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; ldr     x0, [x23], #8
    mov r10, QWORD PTR arm_x23
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x23
    add rax, 8
    mov QWORD PTR arm_x23, rax
    ; ldr     x1, [x23], #8
    mov r10, QWORD PTR arm_x23
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    mov rax, QWORD PTR arm_x23
    add rax, 8
    mov QWORD PTR arm_x23, rax
    ; str     x1, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
    ; mov     x20, x0
    mov rax, QWORD PTR arm_x0
    mov QWORD PTR arm_x20, rax
X2RTO_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_X2RFETCH:
    ; DCB "2R@", 0
    DB "2R@", 0
hl_X2RFETCH:
    ; DCB "2R@ ( -- n1 n2 ) copy two from the return stack", 0
    DB "2R@ ( -- n1 n2 ) copy two from the return stack", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_X2RFETCH:
    ; DCQ     nm_X2RFETCH, hl_X2RFETCH
    DQ OFFSET nm_X2RFETCH, OFFSET hl_X2RFETCH
    ; DCQ     0
    DQ 0
    ; DCQ     X2RFETCH, X2RFETCH_END
    DQ OFFSET X2RFETCH, OFFSET X2RFETCH_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_X2RFETCH
    DQ OFFSET row_X2RFETCH
BOOTPTR ENDS
.CODE
X2RFETCH:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; ldr     x0, [x23]
    mov r10, QWORD PTR arm_x23
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    ; ldr     x1, [x23, #8]
    mov r10, QWORD PTR arm_x23
    add r10, 8
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; str     x1, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
    ; mov     x20, x0
    mov rax, QWORD PTR arm_x0
    mov QWORD PTR arm_x20, rax
X2RFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XTWOROT:
    ; DCB "2ROT", 0
    DB "2ROT", 0
hl_XTWOROT:
    ; DCB "2ROT ( x1 x2 x3 x4 x5 x6 -- x3 x4 x5 x6 x1 x2 ) rotate three pairs", 0
    DB "2ROT ( x1 x2 x3 x4 x5 x6 -- x3 x4 x5 x6 x1 x2 ) rotate three pairs", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XTWOROT:
    ; DCQ     nm_XTWOROT, hl_XTWOROT
    DQ OFFSET nm_XTWOROT, OFFSET hl_XTWOROT
    ; DCQ     0
    DQ 0
    ; DCQ     XTWOROT, XTWOROT_END
    DQ OFFSET XTWOROT, OFFSET XTWOROT_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XTWOROT
    DQ OFFSET row_XTWOROT
BOOTPTR ENDS
.CODE
XTWOROT:
    ; ldr     x5, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x5, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x4, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x4, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x3, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x3, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x2, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x1, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; str     x3, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x3
    mov QWORD PTR [r10], rax
    ; str     x4, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x4
    mov QWORD PTR [r10], rax
    ; str     x5, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x5
    mov QWORD PTR [r10], rax
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; str     x1, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
    ; mov     x20, x2
    mov rax, QWORD PTR arm_x2
    mov QWORD PTR arm_x20, rax
XTWOROT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XONEMINUS:
    ; DCB "1-", 0
    DB "1-", 0
hl_XONEMINUS:
    ; DCB "1- ( n -- n-1 ) decrement", 0
    DB "1- ( n -- n-1 ) decrement", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XONEMINUS:
    ; DCQ     nm_XONEMINUS, hl_XONEMINUS
    DQ OFFSET nm_XONEMINUS, OFFSET hl_XONEMINUS
    ; DCQ     0
    DQ 0
    ; DCQ     XONEMINUS, XONEMINUS_END
    DQ OFFSET XONEMINUS, OFFSET XONEMINUS_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XONEMINUS
    DQ OFFSET row_XONEMINUS
BOOTPTR ENDS
.CODE
XONEMINUS:
    ; sub     x20, x20, #1
    mov rax, QWORD PTR arm_x20
    sub rax, 1
    mov QWORD PTR arm_x20, rax
XONEMINUS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XNEGATE:
    ; DCB "NEGATE", 0
    DB "NEGATE", 0
hl_XNEGATE:
    ; DCB "NEGATE ( n -- -n ) negate", 0
    DB "NEGATE ( n -- -n ) negate", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XNEGATE:
    ; DCQ     nm_XNEGATE, hl_XNEGATE
    DQ OFFSET nm_XNEGATE, OFFSET hl_XNEGATE
    ; DCQ     0
    DQ 0
    ; DCQ     XNEGATE, XNEGATE_END
    DQ OFFSET XNEGATE, OFFSET XNEGATE_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XNEGATE
    DQ OFFSET row_XNEGATE
BOOTPTR ENDS
.CODE
XNEGATE:
    ; neg     x20, x20
    mov rax, QWORD PTR arm_x20
    neg rax
    mov QWORD PTR arm_x20, rax
XNEGATE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XABS:
    ; DCB "ABS", 0
    DB "ABS", 0
hl_XABS:
    ; DCB "ABS ( n -- u ) absolute value", 0
    DB "ABS ( n -- u ) absolute value", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XABS:
    ; DCQ     nm_XABS, hl_XABS
    DQ OFFSET nm_XABS, OFFSET hl_XABS
    ; DCQ     0
    DQ 0
    ; DCQ     XABS, XABS_END
    DQ OFFSET XABS, OFFSET XABS_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XABS
    DQ OFFSET row_XABS
BOOTPTR ENDS
.CODE
XABS:
    ; cmp     x20, #0
    mov rax, QWORD PTR arm_x20
    cmp rax, 0
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csneg   x20, x20, x20, ge
    mov r11b, BYTE PTR arm_n
    cmp r11b, BYTE PTR arm_v
    je xsk_1
    mov rax, QWORD PTR arm_x20
    neg rax
    jmp xsk_2
    xsk_1:
    mov rax, QWORD PTR arm_x20
    xsk_2:
    mov QWORD PTR arm_x20, rax
XABS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XMIN:
    ; DCB "MIN", 0
    DB "MIN", 0
hl_XMIN:
    ; DCB "MIN ( n1 n2 -- min ) minimum", 0
    DB "MIN ( n1 n2 -- min ) minimum", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XMIN:
    ; DCQ     nm_XMIN, hl_XMIN
    DQ OFFSET nm_XMIN, OFFSET hl_XMIN
    ; DCQ     0
    DQ 0
    ; DCQ     XMIN, XMIN_END
    DQ OFFSET XMIN, OFFSET XMIN_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XMIN
    DQ OFFSET row_XMIN
BOOTPTR ENDS
.CODE
XMIN:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; cmp     x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csel    x20, x0, x20, lt
    mov r11b, BYTE PTR arm_n
    cmp r11b, BYTE PTR arm_v
    jne xsk_3
    mov rax, QWORD PTR arm_x20
    jmp xsk_4
    xsk_3:
    mov rax, QWORD PTR arm_x0
    xsk_4:
    mov QWORD PTR arm_x20, rax
XMIN_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XMAX:
    ; DCB "MAX", 0
    DB "MAX", 0
hl_XMAX:
    ; DCB "MAX ( n1 n2 -- max ) maximum", 0
    DB "MAX ( n1 n2 -- max ) maximum", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XMAX:
    ; DCQ     nm_XMAX, hl_XMAX
    DQ OFFSET nm_XMAX, OFFSET hl_XMAX
    ; DCQ     0
    DQ 0
    ; DCQ     XMAX, XMAX_END
    DQ OFFSET XMAX, OFFSET XMAX_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XMAX
    DQ OFFSET row_XMAX
BOOTPTR ENDS
.CODE
XMAX:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; cmp     x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csel    x20, x0, x20, gt
    cmp BYTE PTR arm_z, 0
    jne xsk_7
    mov r11b, BYTE PTR arm_n
    cmp r11b, BYTE PTR arm_v
    je xsk_5
    xsk_7:
    mov rax, QWORD PTR arm_x20
    jmp xsk_6
    xsk_5:
    mov rax, QWORD PTR arm_x0
    xsk_6:
    mov QWORD PTR arm_x20, rax
XMAX_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XXOR:
    ; DCB "XOR", 0
    DB "XOR", 0
hl_XXOR:
    ; DCB "XOR ( n1 n2 -- n ) bitwise xor", 0
    DB "XOR ( n1 n2 -- n ) bitwise xor", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XXOR:
    ; DCQ     nm_XXOR, hl_XXOR
    DQ OFFSET nm_XXOR, OFFSET hl_XXOR
    ; DCQ     0
    DQ 0
    ; DCQ     XXOR, XXOR_END
    DQ OFFSET XXOR, OFFSET XXOR_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XXOR
    DQ OFFSET row_XXOR
BOOTPTR ENDS
.CODE
XXOR:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; eor     x20, x20, x0
    mov rax, QWORD PTR arm_x20
    mov rcx, QWORD PTR arm_x0
    xor rax, rcx
    mov QWORD PTR arm_x20, rax
XXOR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XLSHIFT:
    ; DCB "LSHIFT", 0
    DB "LSHIFT", 0
hl_XLSHIFT:
    ; DCB "LSHIFT ( n bits -- n ) logical left shift", 0
    DB "LSHIFT ( n bits -- n ) logical left shift", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XLSHIFT:
    ; DCQ     nm_XLSHIFT, hl_XLSHIFT
    DQ OFFSET nm_XLSHIFT, OFFSET hl_XLSHIFT
    ; DCQ     0
    DQ 0
    ; DCQ     XLSHIFT, XLSHIFT_END
    DQ OFFSET XLSHIFT, OFFSET XLSHIFT_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XLSHIFT
    DQ OFFSET row_XLSHIFT
BOOTPTR ENDS
.CODE
XLSHIFT:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; lsl     x20, x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
    shl rax, cl
    mov QWORD PTR arm_x20, rax
XLSHIFT_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XNEQUAL:
    ; DCB "<>", 0
    DB "<>", 0
hl_XNEQUAL:
    ; DCB "<> ( n1 n2 -- flag ) not equal", 0
    DB "<> ( n1 n2 -- flag ) not equal", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XNEQUAL:
    ; DCQ     nm_XNEQUAL, hl_XNEQUAL
    DQ OFFSET nm_XNEQUAL, OFFSET hl_XNEQUAL
    ; DCQ     0
    DQ 0
    ; DCQ     XNEQUAL, XNEQUAL_END
    DQ OFFSET XNEQUAL, OFFSET XNEQUAL_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XNEQUAL
    DQ OFFSET row_XNEQUAL
BOOTPTR ENDS
.CODE
XNEQUAL:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; cmp     x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, ne
    xor eax, eax
    cmp BYTE PTR arm_z, 0
    jne xsk_8
    mov rax, -1
    xsk_8:
    mov QWORD PTR arm_x20, rax
XNEQUAL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XULESS:
    ; DCB "U<", 0
    DB "U<", 0
hl_XULESS:
    ; DCB "U< ( u1 u2 -- flag ) unsigned less", 0
    DB "U< ( u1 u2 -- flag ) unsigned less", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XULESS:
    ; DCQ     nm_XULESS, hl_XULESS
    DQ OFFSET nm_XULESS, OFFSET hl_XULESS
    ; DCQ     0
    DQ 0
    ; DCQ     XULESS, XULESS_END
    DQ OFFSET XULESS, OFFSET XULESS_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XULESS
    DQ OFFSET row_XULESS
BOOTPTR ENDS
.CODE
XULESS:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; cmp     x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, lo
    xor eax, eax
    cmp BYTE PTR arm_c, 0
    jne xsk_9
    mov rax, -1
    xsk_9:
    mov QWORD PTR arm_x20, rax
XULESS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XUGREATER:
    ; DCB "U>", 0
    DB "U>", 0
hl_XUGREATER:
    ; DCB "U> ( u1 u2 -- flag ) unsigned greater", 0
    DB "U> ( u1 u2 -- flag ) unsigned greater", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XUGREATER:
    ; DCQ     nm_XUGREATER, hl_XUGREATER
    DQ OFFSET nm_XUGREATER, OFFSET hl_XUGREATER
    ; DCQ     0
    DQ 0
    ; DCQ     XUGREATER, XUGREATER_END
    DQ OFFSET XUGREATER, OFFSET XUGREATER_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XUGREATER
    DQ OFFSET row_XUGREATER
BOOTPTR ENDS
.CODE
XUGREATER:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; cmp     x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, hi
    xor eax, eax
    cmp BYTE PTR arm_c, 0
    je xsk_10
    cmp BYTE PTR arm_z, 0
    jne xsk_10
    mov rax, -1
    xsk_10:
    mov QWORD PTR arm_x20, rax
XUGREATER_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XZLESS:
    ; DCB "0<", 0
    DB "0<", 0
hl_XZLESS:
    ; DCB "0< ( n -- flag ) negative?", 0
    DB "0< ( n -- flag ) negative?", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XZLESS:
    ; DCQ     nm_XZLESS, hl_XZLESS
    DQ OFFSET nm_XZLESS, OFFSET hl_XZLESS
    ; DCQ     0
    DQ 0
    ; DCQ     XZLESS, XZLESS_END
    DQ OFFSET XZLESS, OFFSET XZLESS_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XZLESS
    DQ OFFSET row_XZLESS
BOOTPTR ENDS
.CODE
XZLESS:
    ; cmp     x20, #0
    mov rax, QWORD PTR arm_x20
    cmp rax, 0
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, lt
    xor eax, eax
    mov r11b, BYTE PTR arm_n
    cmp r11b, BYTE PTR arm_v
    je xsk_11
    mov rax, -1
    xsk_11:
    mov QWORD PTR arm_x20, rax
XZLESS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XZNOTEQUAL:
    ; DCB "0<>", 0
    DB "0<>", 0
hl_XZNOTEQUAL:
    ; DCB "0<> ( x -- flag ) not zero?", 0
    DB "0<> ( x -- flag ) not zero?", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XZNOTEQUAL:
    ; DCQ     nm_XZNOTEQUAL, hl_XZNOTEQUAL
    DQ OFFSET nm_XZNOTEQUAL, OFFSET hl_XZNOTEQUAL
    ; DCQ     0
    DQ 0
    ; DCQ     XZNOTEQUAL, XZNOTEQUAL_END
    DQ OFFSET XZNOTEQUAL, OFFSET XZNOTEQUAL_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XZNOTEQUAL
    DQ OFFSET row_XZNOTEQUAL
BOOTPTR ENDS
.CODE
XZNOTEQUAL:
    ; cmp     x20, #0
    mov rax, QWORD PTR arm_x20
    cmp rax, 0
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, ne
    xor eax, eax
    cmp BYTE PTR arm_z, 0
    jne xsk_12
    mov rax, -1
    xsk_12:
    mov QWORD PTR arm_x20, rax
XZNOTEQUAL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XZGREATER:
    ; DCB "0>", 0
    DB "0>", 0
hl_XZGREATER:
    ; DCB "0> ( n -- flag ) positive?", 0
    DB "0> ( n -- flag ) positive?", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XZGREATER:
    ; DCQ     nm_XZGREATER, hl_XZGREATER
    DQ OFFSET nm_XZGREATER, OFFSET hl_XZGREATER
    ; DCQ     0
    DQ 0
    ; DCQ     XZGREATER, XZGREATER_END
    DQ OFFSET XZGREATER, OFFSET XZGREATER_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XZGREATER
    DQ OFFSET row_XZGREATER
BOOTPTR ENDS
.CODE
XZGREATER:
    ; cmp     x20, #0
    mov rax, QWORD PTR arm_x20
    cmp rax, 0
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, gt
    xor eax, eax
    cmp BYTE PTR arm_z, 0
    jne xsk_13
    mov r11b, BYTE PTR arm_n
    cmp r11b, BYTE PTR arm_v
    jne xsk_13
    mov rax, -1
    xsk_13:
    mov QWORD PTR arm_x20, rax
XZGREATER_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XWITHIN:
    ; DCB "WITHIN", 0
    DB "WITHIN", 0
hl_XWITHIN:
    ; DCB "WITHIN ( n1 n2 n3 -- flag ) n2 <= n1 < n3 with unsigned wrap", 0
    DB "WITHIN ( n1 n2 n3 -- flag ) n2 <= n1 < n3 with unsigned wrap", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XWITHIN:
    ; DCQ     nm_XWITHIN, hl_XWITHIN
    DQ OFFSET nm_XWITHIN, OFFSET hl_XWITHIN
    ; DCQ     0
    DQ 0
    ; DCQ     XWITHIN, XWITHIN_END
    DQ OFFSET XWITHIN, OFFSET XWITHIN_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XWITHIN
    DQ OFFSET row_XWITHIN
BOOTPTR ENDS
.CODE
XWITHIN:
    ; ldr     x2, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x1, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; sub     x1, x1, x2
    mov rax, QWORD PTR arm_x1
    mov rcx, QWORD PTR arm_x2
    sub rax, rcx
    mov QWORD PTR arm_x1, rax
    ; sub     x20, x20, x2
    mov rax, QWORD PTR arm_x20
    mov rcx, QWORD PTR arm_x2
    sub rax, rcx
    mov QWORD PTR arm_x20, rax
    ; cmp     x1, x20
    mov rax, QWORD PTR arm_x1
    mov rcx, QWORD PTR arm_x20
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, lo
    xor eax, eax
    cmp BYTE PTR arm_c, 0
    jne xsk_14
    mov rax, -1
    xsk_14:
    mov QWORD PTR arm_x20, rax
XWITHIN_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XTRUE:
    ; DCB "TRUE", 0
    DB "TRUE", 0
hl_XTRUE:
    ; DCB "TRUE ( -- -1 ) true flag", 0
    DB "TRUE ( -- -1 ) true flag", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XTRUE:
    ; DCQ     nm_XTRUE, hl_XTRUE
    DQ OFFSET nm_XTRUE, OFFSET hl_XTRUE
    ; DCQ     0
    DQ 0
    ; DCQ     XTRUE, XTRUE_END
    DQ OFFSET XTRUE, OFFSET XTRUE_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XTRUE
    DQ OFFSET row_XTRUE
BOOTPTR ENDS
.CODE
XTRUE:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; mov     x20, #-1
    mov rax, -1
    mov QWORD PTR arm_x20, rax
XTRUE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XFALSE:
    ; DCB "FALSE", 0
    DB "FALSE", 0
hl_XFALSE:
    ; DCB "FALSE ( -- 0 ) false flag", 0
    DB "FALSE ( -- 0 ) false flag", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XFALSE:
    ; DCQ     nm_XFALSE, hl_XFALSE
    DQ OFFSET nm_XFALSE, OFFSET hl_XFALSE
    ; DCQ     0
    DQ 0
    ; DCQ     XFALSE, XFALSE_END
    DQ OFFSET XFALSE, OFFSET XFALSE_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XFALSE
    DQ OFFSET row_XFALSE
BOOTPTR ENDS
.CODE
XFALSE:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; mov     x20, #0
    mov rax, 0
    mov QWORD PTR arm_x20, rax
XFALSE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XPLUSSTORE:
    ; DCB "+!", 0
    DB "+!", 0
hl_XPLUSSTORE:
    ; DCB "+! ( n addr -- ) add to memory", 0
    DB "+! ( n addr -- ) add to memory", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XPLUSSTORE:
    ; DCQ     nm_XPLUSSTORE, hl_XPLUSSTORE
    DQ OFFSET nm_XPLUSSTORE, OFFSET hl_XPLUSSTORE
    ; DCQ     0
    DQ 0
    ; DCQ     XPLUSSTORE, XPLUSSTORE_END
    DQ OFFSET XPLUSSTORE, OFFSET XPLUSSTORE_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XPLUSSTORE
    DQ OFFSET row_XPLUSSTORE
BOOTPTR ENDS
.CODE
XPLUSSTORE:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x1, [x20]
    mov r10, QWORD PTR arm_x20
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; add     x1, x1, x0
    mov rax, QWORD PTR arm_x1
    mov rcx, QWORD PTR arm_x0
    add rax, rcx
    mov QWORD PTR arm_x1, rax
    ; str     x1, [x20]
    mov r10, QWORD PTR arm_x20
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x20, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
XPLUSSTORE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XPAD:
    ; DCB "PAD", 0
    DB "PAD", 0
hl_XPAD:
    ; DCB "PAD ( -- addr ) transient scratch of 1024 bytes", 0
    DB "PAD ( -- addr ) transient scratch of 1024 bytes", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XPAD:
    ; DCQ     nm_XPAD, hl_XPAD
    DQ OFFSET nm_XPAD, OFFSET hl_XPAD
    ; DCQ     0
    DQ 0
    ; DCQ     XPAD, XPAD_END
    DQ OFFSET XPAD, OFFSET XPAD_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XPAD
    DQ OFFSET row_XPAD
BOOTPTR ENDS
.CODE
XPAD:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; lea x0, pad_buffer
    lea rax, pad_buffer
    mov QWORD PTR arm_x0, rax
    ; mov     x20, x0
    mov rax, QWORD PTR arm_x0
    mov QWORD PTR arm_x20, rax
XPAD_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XUNUSED:
    ; DCB "UNUSED", 0
    DB "UNUSED", 0
hl_XUNUSED:
    ; DCB "UNUSED ( -- u ) bytes from HERE to the dictionary end", 0
    DB "UNUSED ( -- u ) bytes from HERE to the dictionary end", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XUNUSED:
    ; DCQ     nm_XUNUSED, hl_XUNUSED
    DQ OFFSET nm_XUNUSED, OFFSET hl_XUNUSED
    ; DCQ     0
    DQ 0
    ; DCQ     XUNUSED, XUNUSED_END
    DQ OFFSET XUNUSED, OFFSET XUNUSED_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XUNUSED
    DQ OFFSET row_XUNUSED
BOOTPTR ENDS
.CODE
XUNUSED:
    ; lea x0, here_ptr
    lea rax, here_ptr
    mov QWORD PTR arm_x0, rax
    ; ldr     x1, [x0]
    mov r10, QWORD PTR arm_x0
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; lea x0, user_dict_area
    lea rax, user_dict_area
    mov QWORD PTR arm_x0, rax
    ; lea x2, user_dict_size_cell
    lea rax, user_dict_size_cell
    mov QWORD PTR arm_x2, rax
    ; ldr     x2, [x2]
    mov r10, QWORD PTR arm_x2
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    ; add     x0, x0, x2
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x2
    add rax, rcx
    mov QWORD PTR arm_x0, rax
    ; subs    x0, x0, x1
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x1
    sub rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    mov QWORD PTR arm_x0, rax
    ; b.hs    _unused_ok
    cmp BYTE PTR arm_c, 0
    jne _unused_ok
    ; mov     x0, #0
    mov rax, 0
    mov QWORD PTR arm_x0, rax
_unused_ok:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; mov     x20, x0
    mov rax, QWORD PTR arm_x0
    mov QWORD PTR arm_x20, rax
XUNUSED_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XUSER_DICT:
    ; DCB "USER-DICT", 0
    DB "USER-DICT", 0
hl_XUSER_DICT:
    ; DCB "USER-DICT ( -- addr ) base of user dictionary", 0
    DB "USER-DICT ( -- addr ) base of user dictionary", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XUSER_DICT:
    ; DCQ     nm_XUSER_DICT, hl_XUSER_DICT
    DQ OFFSET nm_XUSER_DICT, OFFSET hl_XUSER_DICT
    ; DCQ     0
    DQ 0
    ; DCQ     XUSER_DICT, 0
    DQ OFFSET XUSER_DICT, 0
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XUSER_DICT
    DQ OFFSET row_XUSER_DICT
BOOTPTR ENDS
.CODE
XUSER_DICT:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; lea x0, user_dict_area
    lea rax, user_dict_area
    mov QWORD PTR arm_x0, rax
    ; mov     x20, x0
    mov rax, QWORD PTR arm_x0
    mov QWORD PTR arm_x20, rax
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XGROWMEMORYMB:
    ; DCB "GROWMEMORYMB", 0
    DB "GROWMEMORYMB", 0
hl_XGROWMEMORYMB:
    ; DCB "GROWMEMORYMB ( n -- ) grow user dictionary to n MiB once per session with no shrink and a max of 256", 0
    DB "GROWMEMORYMB ( n -- ) grow user dictionary to n MiB once per session with no shrink and a max of 256", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XGROWMEMORYMB:
    ; DCQ     nm_XGROWMEMORYMB, hl_XGROWMEMORYMB
    DQ OFFSET nm_XGROWMEMORYMB, OFFSET hl_XGROWMEMORYMB
    ; DCQ     0
    DQ 0
    ; DCQ     XGROWMEMORYMB, 0
    DQ OFFSET XGROWMEMORYMB, 0
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XGROWMEMORYMB
    DQ OFFSET row_XGROWMEMORYMB
BOOTPTR ENDS
.CODE
XGROWMEMORYMB:
    ; mov     x0, x20
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR arm_x0, rax
    ; ldr     x20, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x20, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; lea x1, grow_memory_used
    lea rax, grow_memory_used
    mov QWORD PTR arm_x1, rax
    ; ldr     x2, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    ; cbnz    x2, _gmm_already
    mov rax, QWORD PTR arm_x2
    cmp rax, 0
    jne _gmm_already
    ; cmp     x0, #1
    mov rax, QWORD PTR arm_x0
    cmp rax, 1
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; b.lt    _gmm_small
    mov r11b, BYTE PTR arm_n
    cmp r11b, BYTE PTR arm_v
    jne _gmm_small
    ; cmp     x0, #256
    mov rax, QWORD PTR arm_x0
    cmp rax, 100h
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; b.hi    _gmm_big
    cmp BYTE PTR arm_c, 0
    je xsk_15
    cmp BYTE PTR arm_z, 0
    je _gmm_big
    xsk_15:
    ; lsl     x3, x0, #20
    mov rax, QWORD PTR arm_x0
    shl rax, 20
    mov QWORD PTR arm_x3, rax
    ; lea x4, user_dict_size_cell
    lea rax, user_dict_size_cell
    mov QWORD PTR arm_x4, rax
    ; ldr     x5, [x4]
    mov r10, QWORD PTR arm_x4
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x5, rax
    ; cmp     x3, x5
    mov rax, QWORD PTR arm_x3
    mov rcx, QWORD PTR arm_x5
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; b.ls    _gmm_shrink
    cmp BYTE PTR arm_c, 0
    je _gmm_shrink
    cmp BYTE PTR arm_z, 0
    jne _gmm_shrink
    ; str     x3, [x4]
    mov r10, QWORD PTR arm_x4
    mov rax, QWORD PTR arm_x3
    mov QWORD PTR [r10], rax
    ; mov     x2, #1
    mov rax, 1
    mov QWORD PTR arm_x2, rax
    ; str     x2, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR arm_x2
    mov QWORD PTR [r10], rax
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
_gmm_already:
    ; lea x0, str_gmm_already
    lea rax, str_gmm_already
    mov QWORD PTR arm_x0, rax
    ; b       _gmm_fail
    jmp _gmm_fail
_gmm_small:
    ; lea x0, str_gmm_small
    lea rax, str_gmm_small
    mov QWORD PTR arm_x0, rax
    ; b       _gmm_fail
    jmp _gmm_fail
_gmm_big:
    ; lea x0, str_gmm_big
    lea rax, str_gmm_big
    mov QWORD PTR arm_x0, rax
    ; b       _gmm_fail
    jmp _gmm_fail
_gmm_shrink:
    ; lea x0, str_gmm_shrink
    lea rax, str_gmm_shrink
    mov QWORD PTR arm_x0, rax
_gmm_fail:
    ; sub     sp, sp, #64
    mov rax, rsp
    sub rax, 40h
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 20h
    mov rax, QWORD PTR arm_x29
    mov QWORD PTR [r10+0], rax
    mov rax, QWORD PTR arm_x30
    mov QWORD PTR [r10+8], rax
    ; bl      emit_cstr
    lea rax, xret_16
    mov QWORD PTR arm_x30, rax
    jmp emit_cstr
    xret_16:
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 20h
    mov rax, QWORD PTR [r10]
    mov rcx, QWORD PTR [r10+8]
    mov QWORD PTR arm_x29, rax
    mov QWORD PTR arm_x30, rcx
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 40h
    mov rsp, rax
    ; b       _quit_exit
    jmp _quit_exit
BWSTR SEGMENT ALIGN(1) READ
nm_XCCOMMA:
    ; DCB "C", 0x2C, 0
    DB "C", 2Ch, 0
hl_XCCOMMA:
    ; DCB "C", 0x2C, "( b -- ) compile a byte", 0
    DB "C", 2Ch, "( b -- ) compile a byte", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XCCOMMA:
    ; DCQ     nm_XCCOMMA, hl_XCCOMMA
    DQ OFFSET nm_XCCOMMA, OFFSET hl_XCCOMMA
    ; DCQ     0
    DQ 0
    ; DCQ     XCCOMMA, 0
    DQ OFFSET XCCOMMA, 0
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XCCOMMA
    DQ OFFSET row_XCCOMMA
BOOTPTR ENDS
.CODE
XCCOMMA:
    ; mov     w0, w20
    mov eax, DWORD PTR arm_x20
    mov QWORD PTR arm_x0, rax
    ; ldr     x20, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x20, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; lea x1, here_ptr
    lea rax, here_ptr
    mov QWORD PTR arm_x1, rax
    ; ldr     x2, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    ; add     x3, x2, #1
    mov rax, QWORD PTR arm_x2
    add rax, 1
    mov QWORD PTR arm_x3, rax
    ; lea x4, user_dict_area
    lea rax, user_dict_area
    mov QWORD PTR arm_x4, rax
    ; cmp     x3, x4
    mov rax, QWORD PTR arm_x3
    mov rcx, QWORD PTR arm_x4
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; b.lo    _ccomma_fail
    cmp BYTE PTR arm_c, 0
    je _ccomma_fail
    ; lea x5, user_dict_size_cell
    lea rax, user_dict_size_cell
    mov QWORD PTR arm_x5, rax
    ; ldr     x5, [x5]
    mov r10, QWORD PTR arm_x5
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x5, rax
    ; add     x5, x4, x5
    mov rax, QWORD PTR arm_x4
    mov rcx, QWORD PTR arm_x5
    add rax, rcx
    mov QWORD PTR arm_x5, rax
    ; cmp     x3, x5
    mov rax, QWORD PTR arm_x3
    mov rcx, QWORD PTR arm_x5
    cmp rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; b.hi    _ccomma_fail
    cmp BYTE PTR arm_c, 0
    je xsk_17
    cmp BYTE PTR arm_z, 0
    je _ccomma_fail
    xsk_17:
    ; strb    w0, [x2]
    mov r10, QWORD PTR arm_x2
    mov eax, DWORD PTR arm_x0
    mov BYTE PTR [r10], al
    ; str     x3, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR arm_x3
    mov QWORD PTR [r10], rax
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
_ccomma_fail:
    ; sub     sp, sp, #64
    mov rax, rsp
    sub rax, 40h
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 20h
    mov rax, QWORD PTR arm_x29
    mov QWORD PTR [r10+0], rax
    mov rax, QWORD PTR arm_x30
    mov QWORD PTR [r10+8], rax
    ; lea x0, msg_allot
    lea rax, msg_allot
    mov QWORD PTR arm_x0, rax
    ; bl      emit_cstr
    lea rax, xret_18
    mov QWORD PTR arm_x30, rax
    jmp emit_cstr
    xret_18:
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 20h
    mov rax, QWORD PTR [r10]
    mov rcx, QWORD PTR [r10+8]
    mov QWORD PTR arm_x29, rax
    mov QWORD PTR arm_x30, rcx
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 40h
    mov rsp, rax
    ; b       _quit_exit
    jmp _quit_exit
BWSTR SEGMENT ALIGN(1) READ
nm_XTWOFETCH:
    ; DCB "2@", 0
    DB "2@", 0
hl_XTWOFETCH:
    ; DCB "2@ ( addr -- n1 n2 ) fetch two cells", 0
    DB "2@ ( addr -- n1 n2 ) fetch two cells", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XTWOFETCH:
    ; DCQ     nm_XTWOFETCH, hl_XTWOFETCH
    DQ OFFSET nm_XTWOFETCH, OFFSET hl_XTWOFETCH
    ; DCQ     0
    DQ 0
    ; DCQ     XTWOFETCH, XTWOFETCH_END
    DQ OFFSET XTWOFETCH, OFFSET XTWOFETCH_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XTWOFETCH
    DQ OFFSET row_XTWOFETCH
BOOTPTR ENDS
.CODE
XTWOFETCH:
    ; mov     x0, x20
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR arm_x0, rax
    ; ldr     x1, [x0, #8]
    mov r10, QWORD PTR arm_x0
    add r10, 8
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; ldr     x20, [x0]
    mov r10, QWORD PTR arm_x0
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x20, rax
    ; str     x1, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
XTWOFETCH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XTWOSTORE:
    ; DCB "2!", 0
    DB "2!", 0
hl_XTWOSTORE:
    ; DCB "2! ( n1 n2 addr -- ) store two cells", 0
    DB "2! ( n1 n2 addr -- ) store two cells", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XTWOSTORE:
    ; DCQ     nm_XTWOSTORE, hl_XTWOSTORE
    DQ OFFSET nm_XTWOSTORE, OFFSET hl_XTWOSTORE
    ; DCQ     0
    DQ 0
    ; DCQ     XTWOSTORE, XTWOSTORE_END
    DQ OFFSET XTWOSTORE, OFFSET XTWOSTORE_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XTWOSTORE
    DQ OFFSET row_XTWOSTORE
BOOTPTR ENDS
.CODE
XTWOSTORE:
    ; mov     x0, x20
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR arm_x0, rax
    ; ldr     x2, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x1, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x20, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x20, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; str     x2, [x0]
    mov r10, QWORD PTR arm_x0
    mov rax, QWORD PTR arm_x2
    mov QWORD PTR [r10], rax
    ; str     x1, [x0, #8]
    mov r10, QWORD PTR arm_x0
    add r10, 8
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
XTWOSTORE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XI:
    ; DCB "I", 0
    DB "I", 0
hl_XI:
    ; DCB "I ( -- n ) current DO loop index", 0
    DB "I ( -- n ) current DO loop index", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XI:
    ; DCQ     nm_XI, hl_XI
    DQ OFFSET nm_XI, OFFSET hl_XI
    ; DCQ     0
    DQ 0
    ; DCQ     XI, XI_END
    DQ OFFSET XI, OFFSET XI_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XI
    DQ OFFSET row_XI
BOOTPTR ENDS
.CODE
XI:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; ldr     x20, [x23]
    mov r10, QWORD PTR arm_x23
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x20, rax
XI_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XJ:
    ; DCB "J", 0
    DB "J", 0
hl_XJ:
    ; DCB "J ( -- n ) outer DO loop index", 0
    DB "J ( -- n ) outer DO loop index", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XJ:
    ; DCQ     nm_XJ, hl_XJ
    DQ OFFSET nm_XJ, OFFSET hl_XJ
    ; DCQ     0
    DQ 0
    ; DCQ     XJ, XJ_END
    DQ OFFSET XJ, OFFSET XJ_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XJ
    DQ OFFSET row_XJ
BOOTPTR ENDS
.CODE
XJ:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; ldr     x20, [x23, #16]
    mov r10, QWORD PTR arm_x23
    add r10, 10h
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x20, rax
XJ_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XUNLOOP:
    ; DCB "UNLOOP", 0
    DB "UNLOOP", 0
hl_XUNLOOP:
    ; DCB "UNLOOP ( -- ) discard the current DO loop", 0
    DB "UNLOOP ( -- ) discard the current DO loop", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XUNLOOP:
    ; DCQ     nm_XUNLOOP, hl_XUNLOOP
    DQ OFFSET nm_XUNLOOP, OFFSET hl_XUNLOOP
    ; DCQ     0
    DQ 0
    ; DCQ     XUNLOOP, XUNLOOP_END
    DQ OFFSET XUNLOOP, OFFSET XUNLOOP_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XUNLOOP
    DQ OFFSET row_XUNLOOP
BOOTPTR ENDS
.CODE
XUNLOOP:
    ; add     x23, x23, #16
    mov rax, QWORD PTR arm_x23
    add rax, 10h
    mov QWORD PTR arm_x23, rax
XUNLOOP_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XSLMOD:
    ; DCB "/MOD", 0
    DB "/MOD", 0
hl_XSLMOD:
    ; DCB "/MOD ( n1 n2 -- rem quot ) remainder and quotient", 0
    DB "/MOD ( n1 n2 -- rem quot ) remainder and quotient", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XSLMOD:
    ; DCQ     nm_XSLMOD, hl_XSLMOD
    DQ OFFSET nm_XSLMOD, OFFSET hl_XSLMOD
    ; DCQ     0
    DQ 0
    ; DCQ     XSLMOD, XSLMOD_END
    DQ OFFSET XSLMOD, OFFSET XSLMOD_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XSLMOD
    DQ OFFSET row_XSLMOD
BOOTPTR ENDS
.CODE
XSLMOD:
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; sdiv    x1, x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
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
    mov QWORD PTR arm_x1, rax
    ; msub    x2, x1, x20, x0
    mov rax, QWORD PTR arm_x1
    mov rcx, QWORD PTR arm_x20
    imul rax, rcx
    mov rcx, QWORD PTR arm_x0
    sub rcx, rax
    mov rax, rcx
    mov QWORD PTR arm_x2, rax
    ; str     x2, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x2
    mov QWORD PTR [r10], rax
    ; mov     x20, x1
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR arm_x20, rax
XSLMOD_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XUMSTAR:
    ; DCB "UM*", 0
    DB "UM*", 0
hl_XUMSTAR:
    ; DCB "UM* ( u1 u2 -- ud ) unsigned double multiply", 0
    DB "UM* ( u1 u2 -- ud ) unsigned double multiply", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XUMSTAR:
    ; DCQ     nm_XUMSTAR, hl_XUMSTAR
    DQ OFFSET nm_XUMSTAR, OFFSET hl_XUMSTAR
    ; DCQ     0
    DQ 0
    ; DCQ     XUMSTAR, XUMSTAR_END
    DQ OFFSET XUMSTAR, OFFSET XUMSTAR_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XUMSTAR
    DQ OFFSET row_XUMSTAR
BOOTPTR ENDS
.CODE
XUMSTAR:
    ; mov     x1, x20
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR arm_x1, rax
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; mul     x2, x0, x1
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x1
    imul rax, rcx
    mov QWORD PTR arm_x2, rax
    ; umulh   x20, x0, x1
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x1
    mul rcx
    mov rax, rdx
    mov QWORD PTR arm_x20, rax
    ; str     x2, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x2
    mov QWORD PTR [r10], rax
XUMSTAR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XMSTAR:
    ; DCB "M*", 0
    DB "M*", 0
hl_XMSTAR:
    ; DCB "M* ( n1 n2 -- d ) signed double multiply", 0
    DB "M* ( n1 n2 -- d ) signed double multiply", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XMSTAR:
    ; DCQ     nm_XMSTAR, hl_XMSTAR
    DQ OFFSET nm_XMSTAR, OFFSET hl_XMSTAR
    ; DCQ     0
    DQ 0
    ; DCQ     XMSTAR, XMSTAR_END
    DQ OFFSET XMSTAR, OFFSET XMSTAR_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XMSTAR
    DQ OFFSET row_XMSTAR
BOOTPTR ENDS
.CODE
XMSTAR:
    ; mov     x1, x20
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR arm_x1, rax
    ; ldr     x0, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x0, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; mul     x2, x0, x1
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x1
    imul rax, rcx
    mov QWORD PTR arm_x2, rax
    ; smulh   x20, x0, x1
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x1
    imul rcx
    mov rax, rdx
    mov QWORD PTR arm_x20, rax
    ; str     x2, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x2
    mov QWORD PTR [r10], rax
XMSTAR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XDPLUS:
    ; DCB "D+", 0
    DB "D+", 0
hl_XDPLUS:
    ; DCB "D+ ( d1 d2 -- d3 ) double add", 0
    DB "D+ ( d1 d2 -- d3 ) double add", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XDPLUS:
    ; DCQ     nm_XDPLUS, hl_XDPLUS
    DQ OFFSET nm_XDPLUS, OFFSET hl_XDPLUS
    ; DCQ     0
    DQ 0
    ; DCQ     XDPLUS, XDPLUS_END
    DQ OFFSET XDPLUS, OFFSET XDPLUS_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XDPLUS
    DQ OFFSET row_XDPLUS
BOOTPTR ENDS
.CODE
XDPLUS:
    ; ldr     x3, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x3, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x2, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x1, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; adds    x1, x1, x3
    mov rax, QWORD PTR arm_x1
    mov rcx, QWORD PTR arm_x3
    add rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setc BYTE PTR arm_c
    mov QWORD PTR arm_x1, rax
    ; adc     x20, x2, x20
    mov rax, QWORD PTR arm_x2
    mov rcx, QWORD PTR arm_x20
    mov dl, BYTE PTR arm_c
    add dl, 255
    adc rax, rcx
    mov QWORD PTR arm_x20, rax
    ; str     x1, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
XDPLUS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XDNEGATE:
    ; DCB "DNEGATE", 0
    DB "DNEGATE", 0
hl_XDNEGATE:
    ; DCB "DNEGATE ( d1 -- d2 ) negate a double", 0
    DB "DNEGATE ( d1 -- d2 ) negate a double", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XDNEGATE:
    ; DCQ     nm_XDNEGATE, hl_XDNEGATE
    DQ OFFSET nm_XDNEGATE, OFFSET hl_XDNEGATE
    ; DCQ     0
    DQ 0
    ; DCQ     XDNEGATE, XDNEGATE_END
    DQ OFFSET XDNEGATE, OFFSET XDNEGATE_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XDNEGATE
    DQ OFFSET row_XDNEGATE
BOOTPTR ENDS
.CODE
XDNEGATE:
    ; ldr     x1, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; mov     x0, xzr
    xor eax, eax
    mov QWORD PTR arm_x0, rax
    ; subs    x1, x0, x1
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x1
    sub rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    mov QWORD PTR arm_x1, rax
    ; sbc     x20, x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
    mov dl, BYTE PTR arm_c
    xor dl, 1
    add dl, 255
    sbb rax, rcx
    mov QWORD PTR arm_x20, rax
    ; str     x1, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
XDNEGATE_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XDABS:
    ; DCB "DABS", 0
    DB "DABS", 0
hl_XDABS:
    ; DCB "DABS ( d -- ud ) absolute value of a double", 0
    DB "DABS ( d -- ud ) absolute value of a double", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XDABS:
    ; DCQ     nm_XDABS, hl_XDABS
    DQ OFFSET nm_XDABS, OFFSET hl_XDABS
    ; DCQ     0
    DQ 0
    ; DCQ     XDABS, XDABS_END
    DQ OFFSET XDABS, OFFSET XDABS_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XDABS
    DQ OFFSET row_XDABS
BOOTPTR ENDS
.CODE
XDABS:
    ; tbnz    x20, #63, _dabs_neg
    mov rax, QWORD PTR arm_x20
    bt rax, 63
    jc _dabs_neg
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
_dabs_neg:
    ; ldr     x1, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; mov     x0, xzr
    xor eax, eax
    mov QWORD PTR arm_x0, rax
    ; subs    x1, x0, x1
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x1
    sub rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    mov QWORD PTR arm_x1, rax
    ; sbc     x20, x0, x20
    mov rax, QWORD PTR arm_x0
    mov rcx, QWORD PTR arm_x20
    mov dl, BYTE PTR arm_c
    xor dl, 1
    add dl, 255
    sbb rax, rcx
    mov QWORD PTR arm_x20, rax
    ; str     x1, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
XDABS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XD0LESS:
    ; DCB "D0<", 0
    DB "D0<", 0
hl_XD0LESS:
    ; DCB "D0< ( d -- flag ) double negative?", 0
    DB "D0< ( d -- flag ) double negative?", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XD0LESS:
    ; DCQ     nm_XD0LESS, hl_XD0LESS
    DQ OFFSET nm_XD0LESS, OFFSET hl_XD0LESS
    ; DCQ     0
    DQ 0
    ; DCQ     XD0LESS, XD0LESS_END
    DQ OFFSET XD0LESS, OFFSET XD0LESS_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XD0LESS
    DQ OFFSET row_XD0LESS
BOOTPTR ENDS
.CODE
XD0LESS:
    ; cmp     x20, #0
    mov rax, QWORD PTR arm_x20
    cmp rax, 0
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, lt
    xor eax, eax
    mov r11b, BYTE PTR arm_n
    cmp r11b, BYTE PTR arm_v
    je xsk_22
    mov rax, -1
    xsk_22:
    mov QWORD PTR arm_x20, rax
    ; add     x22, x22, #8
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
XD0LESS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XSTOD:
    ; DCB "S>D", 0
    DB "S>D", 0
hl_XSTOD:
    ; DCB "S>D ( n -- d ) sign extend single to double", 0
    DB "S>D ( n -- d ) sign extend single to double", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XSTOD:
    ; DCQ     nm_XSTOD, hl_XSTOD
    DQ OFFSET nm_XSTOD, OFFSET hl_XSTOD
    ; DCQ     0
    DQ 0
    ; DCQ     XSTOD, XSTOD_END
    DQ OFFSET XSTOD, OFFSET XSTOD_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XSTOD
    DQ OFFSET row_XSTOD
BOOTPTR ENDS
.CODE
XSTOD:
    ; str     x20, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x20
    mov QWORD PTR [r10], rax
    ; asr     x20, x20, #63
    mov rax, QWORD PTR arm_x20
    sar rax, 63
    mov QWORD PTR arm_x20, rax
XSTOD_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XDMINUS:
    ; DCB "D-", 0
    DB "D-", 0
hl_XDMINUS:
    ; DCB "D- ( d1 d2 -- d3 ) double subtract", 0
    DB "D- ( d1 d2 -- d3 ) double subtract", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XDMINUS:
    ; DCQ     nm_XDMINUS, hl_XDMINUS
    DQ OFFSET nm_XDMINUS, OFFSET hl_XDMINUS
    ; DCQ     0
    DQ 0
    ; DCQ     XDMINUS, XDMINUS_END
    DQ OFFSET XDMINUS, OFFSET XDMINUS_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XDMINUS
    DQ OFFSET row_XDMINUS
BOOTPTR ENDS
.CODE
XDMINUS:
    ; ldr     x3, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x3, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x2, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x1, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; subs    x1, x1, x3
    mov rax, QWORD PTR arm_x1
    mov rcx, QWORD PTR arm_x3
    sub rax, rcx
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    mov QWORD PTR arm_x1, rax
    ; sbc     x20, x2, x20
    mov rax, QWORD PTR arm_x2
    mov rcx, QWORD PTR arm_x20
    mov dl, BYTE PTR arm_c
    xor dl, 1
    add dl, 255
    sbb rax, rcx
    mov QWORD PTR arm_x20, rax
    ; str     x1, [x22, #-8]!
    mov rax, QWORD PTR arm_x22
    add rax, -8
    mov QWORD PTR arm_x22, rax
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
XDMINUS_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XD2STAR:
    ; DCB "D2*", 0
    DB "D2*", 0
hl_XD2STAR:
    ; DCB "D2* ( xd1 -- xd2 ) shift double left 1", 0
    DB "D2* ( xd1 -- xd2 ) shift double left 1", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XD2STAR:
    ; DCQ     nm_XD2STAR, hl_XD2STAR
    DQ OFFSET nm_XD2STAR, OFFSET hl_XD2STAR
    ; DCQ     0
    DQ 0
    ; DCQ     XD2STAR, XD2STAR_END
    DQ OFFSET XD2STAR, OFFSET XD2STAR_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XD2STAR
    DQ OFFSET row_XD2STAR
BOOTPTR ENDS
.CODE
XD2STAR:
    ; ldr     x1, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; lsl     x20, x20, #1
    mov rax, QWORD PTR arm_x20
    shl rax, 1
    mov QWORD PTR arm_x20, rax
    ; orr     x20, x20, x1, lsr #63
    mov rax, QWORD PTR arm_x20
    mov rcx, QWORD PTR arm_x1
    shr rcx, 63
    or rax, rcx
    mov QWORD PTR arm_x20, rax
    ; lsl     x1, x1, #1
    mov rax, QWORD PTR arm_x1
    shl rax, 1
    mov QWORD PTR arm_x1, rax
    ; str     x1, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
XD2STAR_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XD2SLASH:
    ; DCB "D2/", 0
    DB "D2/", 0
hl_XD2SLASH:
    ; DCB "D2/ ( xd1 -- xd2 ) arithmetic shift double right 1", 0
    DB "D2/ ( xd1 -- xd2 ) arithmetic shift double right 1", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XD2SLASH:
    ; DCQ     nm_XD2SLASH, hl_XD2SLASH
    DQ OFFSET nm_XD2SLASH, OFFSET hl_XD2SLASH
    ; DCQ     0
    DQ 0
    ; DCQ     XD2SLASH, XD2SLASH_END
    DQ OFFSET XD2SLASH, OFFSET XD2SLASH_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XD2SLASH
    DQ OFFSET row_XD2SLASH
BOOTPTR ENDS
.CODE
XD2SLASH:
    ; ldr     x1, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; extr    x1, x20, x1, #1
    mov rax, QWORD PTR arm_x1
    mov rcx, QWORD PTR arm_x20
    mov rdx, rcx
    shrd rax, rdx, 1
    mov QWORD PTR arm_x1, rax
    ; asr     x20, x20, #1
    mov rax, QWORD PTR arm_x20
    sar rax, 1
    mov QWORD PTR arm_x20, rax
    ; str     x1, [x22]
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR arm_x1
    mov QWORD PTR [r10], rax
XD2SLASH_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XD0EQUAL:
    ; DCB "D0=", 0
    DB "D0=", 0
hl_XD0EQUAL:
    ; DCB "D0= ( xd -- flag ) double equal zero?", 0
    DB "D0= ( xd -- flag ) double equal zero?", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XD0EQUAL:
    ; DCQ     nm_XD0EQUAL, hl_XD0EQUAL
    DQ OFFSET nm_XD0EQUAL, OFFSET hl_XD0EQUAL
    ; DCQ     0
    DQ 0
    ; DCQ     XD0EQUAL, XD0EQUAL_END
    DQ OFFSET XD0EQUAL, OFFSET XD0EQUAL_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XD0EQUAL
    DQ OFFSET row_XD0EQUAL
BOOTPTR ENDS
.CODE
XD0EQUAL:
    ; ldr     x1, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; orr     x1, x1, x20
    mov rax, QWORD PTR arm_x1
    mov rcx, QWORD PTR arm_x20
    or rax, rcx
    mov QWORD PTR arm_x1, rax
    ; cmp     x1, #0
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    seto BYTE PTR arm_v
    sets BYTE PTR arm_n
    setz BYTE PTR arm_z
    setnc BYTE PTR arm_c
    ; csetm   x20, eq
    xor eax, eax
    cmp BYTE PTR arm_z, 0
    je xsk_23
    mov rax, -1
    xsk_23:
    mov QWORD PTR arm_x20, rax
XD0EQUAL_END:
    ; cbnz    x28, next_debug_gate
    mov rax, QWORD PTR arm_x28
    cmp rax, 0
    jne next_debug_gate
    ; lea x1, debug_break_asap
    lea rax, debug_break_asap
    mov QWORD PTR arm_x1, rax
    ; ldr     x1, [x1]
    mov r10, QWORD PTR arm_x1
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; cbnz    x1, next_debug_gate
    mov rax, QWORD PTR arm_x1
    cmp rax, 0
    jne next_debug_gate
    ; ldr     x21, [x19], #8
    mov r10, QWORD PTR arm_x19
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x21, rax
    mov rax, QWORD PTR arm_x19
    add rax, 8
    mov QWORD PTR arm_x19, rax
    ; ldr     x1, [x21]
    mov r10, QWORD PTR arm_x21
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x1, rax
    ; br      x1
    mov rax, QWORD PTR arm_x1
    jmp rax
BWSTR SEGMENT ALIGN(1) READ
nm_XDEQUAL:
    ; DCB "D=", 0
    DB "D=", 0
hl_XDEQUAL:
    ; DCB "D= ( xd1 xd2 -- flag ) double equal?", 0
    DB "D= ( xd1 xd2 -- flag ) double equal?", 0
BWSTR ENDS
BOOTWORD SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
row_XDEQUAL:
    ; DCQ     nm_XDEQUAL, hl_XDEQUAL
    DQ OFFSET nm_XDEQUAL, OFFSET hl_XDEQUAL
    ; DCQ     0
    DQ 0
    ; DCQ     XDEQUAL, XDEQUAL_END
    DQ OFFSET XDEQUAL, OFFSET XDEQUAL_END
BOOTWORD ENDS
BOOTPTR SEGMENT ALIGN(8) READ
    ; ALIGN 8
ALIGN 8
    ; DCQ     row_XDEQUAL
    DQ OFFSET row_XDEQUAL
BOOTPTR ENDS
.CODE
XDEQUAL:
    ; ldr     x3, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x3, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x2, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
    mov QWORD PTR arm_x2, rax
    mov rax, QWORD PTR arm_x22
    add rax, 8
    mov QWORD PTR arm_x22, rax
    ; ldr     x1, [x22], #8
    mov r10, QWORD PTR arm_x22
    mov rax, QWORD PTR [r10]
