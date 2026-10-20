; Generated from Forth/kernel/arm64/entry.asm. Do not edit.
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
extern XTHROW
extern _compile_cell
extern _find_word
extern _header_build
extern _local_compile_reset
extern _local_lookup
extern _next_word
extern _parse_number
extern _print_unsigned
extern _putchar
extern _record_words_user_base_once
extern _strlen
extern _view_pop_src_id
extern blk_stack
extern blk_var
extern bootptr_end
extern bootptr_start
extern bye_flag
extern cfa_0branch
extern cfa_branch
extern cfa_comma
extern cfa_cstr
extern cfa_does
extern cfa_execute
extern cfa_exit
extern cfa_flit
extern cfa_lit
extern cfa_local_at
extern cfa_local_init
extern cfa_local_store
extern cfa_loop
extern cfa_plusloop
extern cfa_slit
extern data_stack
extern debug_armed
extern debug_break_asap
extern emit_cstr
extern emit_hook
extern emit_str
extern eval_resume_sp
extern eval_resume_stack
extern facility_op_hook
extern file_echo
extern file_echo_pos
extern file_echo_stack
extern forth_init_end
extern forth_init_str
extern here_ptr
extern host_float_op
extern kernel_inited
extern key_hook
extern last_cfa
extern latest_var
extern line_limit
extern line_mode
extern line_next
extern line_origin
extern local_frame_depth
extern next_debug
extern noname_xt
extern restart_cell
extern return_stack
extern source_base
extern source_cur
extern source_end
extern source_id
extern source_sp
extern source_stack
extern state_var
extern throw_handler
extern to_in
extern user_dict_area
extern view_id_sp
extern view_src_id
extern vm_dsp
extern vm_rsp
extern vm_tos
section .text
global kernel_init
global _kernel_init
global kernel_eval
global _kernel_eval
global kernel_set_emit
global _kernel_set_emit
global kernel_set_key
global _kernel_set_key
global kernel_set_facility_op
global _kernel_set_facility_op
global _kernel_cold_common
global _boot_kernel
global _boot_cache_cfa
global _zcmp
global _vm_save
global _vm_load
global _vm_reset_stacks
global _interpret_loop
global _try_find
global _exec_found
global _compile_entry
global _compile_lit
global _try_number_after_find
global _interpret_empty
global _embed_finish
global _do_quit
global _arm_lines
global _take_line
global _push_source
global _pop_source
global _eval_resume_push
global _eval_resume_pop
global _throw_unwind_to_sp
global _quit_exit
global _embed_bye_return
global _embed_ret_x0
_kernel_set_emit:
global kernel_set_emit
kernel_set_emit:
    mov qword [rel arm_x0], rdi
    mov qword [rel arm_x1], rsi
    mov qword [rel arm_x2], rdx
    mov qword [rel arm_x3], rcx
    ; lea x1, emit_hook
    lea rax, [rel emit_hook]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ret
    mov rax, qword [rel arm_x0]
    ret
_kernel_set_key:
global kernel_set_key
kernel_set_key:
    mov qword [rel arm_x0], rdi
    mov qword [rel arm_x1], rsi
    mov qword [rel arm_x2], rdx
    mov qword [rel arm_x3], rcx
    ; lea x1, key_hook
    lea rax, [rel key_hook]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ret
    mov rax, qword [rel arm_x0]
    ret
_kernel_set_facility_op:
global kernel_set_facility_op
kernel_set_facility_op:
    mov qword [rel arm_x0], rdi
    mov qword [rel arm_x1], rsi
    mov qword [rel arm_x2], rdx
    mov qword [rel arm_x3], rcx
    ; lea x1, facility_op_hook
    lea rax, [rel facility_op_hook]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ret
    mov rax, qword [rel arm_x0]
    ret
_kernel_init:
global kernel_init
kernel_init:
    mov qword [rel arm_x0], rdi
    mov qword [rel arm_x1], rsi
    mov qword [rel arm_x2], rdx
    mov qword [rel arm_x3], rcx
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
    ; stp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; stp     x25, x26, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [rel arm_x25]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x26]
    mov qword [r10+8], rax
    ; stp     x27, x28, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [rel arm_x27]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x28]
    mov qword [r10+8], rax
    ; lea x0, kernel_inited
    lea rax, [rel kernel_inited]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbnz    x1, _kinit_already
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    jne _kinit_already
    ; bl      _kernel_cold_common
    lea rax, [rel xret_1]
    mov qword [rel arm_x30], rax
    jmp _kernel_cold_common
    xret_1:
    ; bl      _vm_save
    lea rax, [rel xret_2]
    mov qword [rel arm_x30], rax
    jmp _vm_save
    xret_2:
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; lea x0, kernel_inited
    lea rax, [rel kernel_inited]
    mov qword [rel arm_x0], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, forth_init_str
    lea rax, [rel forth_init_str]
    mov qword [rel arm_x0], rax
    ; lea x1, forth_init_end
    lea rax, [rel forth_init_end]
    mov qword [rel arm_x1], rax
    ; sub     x1, x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; lea x2, source_base
    lea rax, [rel source_base]
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
    ; lea x2, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x2], rax
    ; add     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, bye_flag
    lea rax, [rel bye_flag]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; b       _interpret_loop
    jmp _interpret_loop
_kinit_already:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
global _kernel_cold_common
_kernel_cold_common:
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
    ; lea x22, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x22], rax
    ; add     x22, x22, #1, lsl #12
    mov rax, qword [rel arm_x22]
    add rax, 0x1000
    mov qword [rel arm_x22], rax
    ; lea x23, return_stack
    lea rax, [rel return_stack]
    mov qword [rel arm_x23], rax
    ; add     x23, x23, #1, lsl #12
    mov rax, qword [rel arm_x23]
    add rax, 0x1000
    mov qword [rel arm_x23], rax
    ; lea x24, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x24], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [rel arm_x20], rax
    ; mov     x28, #0
    mov rax, 0
    mov qword [rel arm_x28], rax
    ; mov     x0, x24
    mov rax, qword [rel arm_x24]
    mov qword [rel arm_x0], rax
    ; mov     x1, #16
    mov rax, 0x10
    mov qword [rel arm_x1], rax
_cold_clear:
    ; str     xzr, [x0], #8
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    mov rax, qword [rel arm_x0]
    add rax, 8
    mov qword [rel arm_x0], rax
    ; subs    x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; b.ne    _cold_clear
    cmp byte [rel arm_z], 0
    je _cold_clear
    ; lea x0, last_cfa
    lea rax, [rel last_cfa]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x0], rax
    ; lea x1, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, bye_flag
    lea rax, [rel bye_flag]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; bl      _boot_kernel
    lea rax, [rel xret_3]
    mov qword [rel arm_x30], rax
    jmp _boot_kernel
    xret_3:
    ; lea x24, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x24], rax
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
global _boot_kernel
_boot_kernel:
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
    ; stp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; str     x25, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [rel arm_x25]
    mov qword [r10], rax
    ; lea x19, bootptr_start
    lea rax, [rel bootptr_start]
    mov qword [rel arm_x19], rax
    ; lea x25, bootptr_end
    lea rax, [rel bootptr_end]
    mov qword [rel arm_x25], rax
_bk_loop:
    ; cmp     x19, x25
    mov rax, qword [rel arm_x19]
    mov rcx, qword [rel arm_x25]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _bk_done
    cmp byte [rel arm_c], 0
    jne _bk_done
    ; ldr     x7, [x19], #8
    mov r10, qword [rel arm_x19]
    mov rax, qword [r10]
    mov qword [rel arm_x7], rax
    mov rax, qword [rel arm_x19]
    add rax, 8
    mov qword [rel arm_x19], rax
    ; cbz     x7, _bk_loop
    mov rax, qword [rel arm_x7]
    cmp rax, 0
    je _bk_loop
    ; ldr     x20, [x7]
    mov r10, qword [rel arm_x7]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; cbz     x20, _bk_loop
    mov rax, qword [rel arm_x20]
    cmp rax, 0
    je _bk_loop
    ; ldr     x21, [x7, #8]
    mov r10, qword [rel arm_x7]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x21], rax
    ; ldr     x22, [x7, #16]
    mov r10, qword [rel arm_x7]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x22], rax
    ; ldr     x23, [x7, #24]
    mov r10, qword [rel arm_x7]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [rel arm_x23], rax
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      _strlen
    lea rax, [rel xret_4]
    mov qword [rel arm_x30], rax
    jmp _strlen
    xret_4:
    ; str     x0, [sp, #104]
    lea r10, [rsp]
    add r10, 0x68
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x0, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x0], rax
    ; bl      _strlen
    lea rax, [rel xret_5]
    mov qword [rel arm_x30], rax
    jmp _strlen
    xret_5:
    ; mov     x3, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x3], rax
    ; ldr     x1, [sp, #104]
    lea r10, [rsp]
    add r10, 0x68
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; mov     x2, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x2], rax
    ; mov     x4, x23
    mov rax, qword [rel arm_x23]
    mov qword [rel arm_x4], rax
    ; mov     x5, x22
    mov rax, qword [rel arm_x22]
    mov qword [rel arm_x5], rax
    ; bl      _header_build
    lea rax, [rel xret_6]
    mov qword [rel arm_x30], rax
    jmp _header_build
    xret_6:
    ; mov     x21, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x21], rax
    ; mov     x0, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x0], rax
    ; bl      _boot_cache_cfa
    lea rax, [rel xret_7]
    mov qword [rel arm_x30], rax
    jmp _boot_cache_cfa
    xret_7:
    ; b       _bk_loop
    jmp _bk_loop
_bk_done:
    ; ldr     x25, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r10]
    mov qword [rel arm_x25], rax
    ; ldp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
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
    ; add     sp, sp, #112
    mov rax, rsp
    add rax, 0x70
    mov rsp, rax
    ; ret
    jmp qword [rel arm_x30]
global _boot_cache_cfa
_boot_cache_cfa:
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
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x19]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x20]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
    ; mov     x20, x21
    mov rax, qword [rel arm_x21]
    mov qword [rel arm_x20], rax
    ; lea x1, boot_cmp_lit
    lea rax, [rel boot_cmp_lit]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_8]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_8:
    ; lea x1, boot_cmp_exit
    lea rax, [rel boot_cmp_exit]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_exit
    lea rax, [rel cfa_exit]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_9]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_9:
    ; lea x1, boot_cmp_branch
    lea rax, [rel boot_cmp_branch]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_branch
    lea rax, [rel cfa_branch]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_10]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_10:
    ; lea x1, boot_cmp_0branch
    lea rax, [rel boot_cmp_0branch]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_0branch
    lea rax, [rel cfa_0branch]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_11]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_11:
    ; lea x1, boot_cmp_does
    lea rax, [rel boot_cmp_does]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_does
    lea rax, [rel cfa_does]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_12]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_12:
    ; lea x1, boot_cmp_slit
    lea rax, [rel boot_cmp_slit]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_slit
    lea rax, [rel cfa_slit]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_13]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_13:
    ; lea x1, boot_cmp_cstr
    lea rax, [rel boot_cmp_cstr]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_cstr
    lea rax, [rel cfa_cstr]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_14]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_14:
    ; lea x1, boot_cmp_execute
    lea rax, [rel boot_cmp_execute]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_execute
    lea rax, [rel cfa_execute]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_15]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_15:
    ; lea x1, boot_cmp_comma
    lea rax, [rel boot_cmp_comma]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_comma
    lea rax, [rel cfa_comma]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_16]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_16:
    ; lea x1, boot_cmp_flit
    lea rax, [rel boot_cmp_flit]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_flit
    lea rax, [rel cfa_flit]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_17]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_17:
    ; lea x1, boot_cmp_linit
    lea rax, [rel boot_cmp_linit]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_local_init
    lea rax, [rel cfa_local_init]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_18]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_18:
    ; lea x1, boot_cmp_lat
    lea rax, [rel boot_cmp_lat]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_local_at
    lea rax, [rel cfa_local_at]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_19]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_19:
    ; lea x1, boot_cmp_lstore
    lea rax, [rel boot_cmp_lstore]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_local_store
    lea rax, [rel cfa_local_store]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_20]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_20:
    ; lea x1, boot_cmp_loop
    lea rax, [rel boot_cmp_loop]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_loop
    lea rax, [rel cfa_loop]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_21]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_21:
    ; lea x1, boot_cmp_ploop
    lea rax, [rel boot_cmp_ploop]
    mov qword [rel arm_x1], rax
    ; lea x2, cfa_plusloop
    lea rax, [rel cfa_plusloop]
    mov qword [rel arm_x2], rax
    ; bl      _bcc_match
    lea rax, [rel xret_22]
    mov qword [rel arm_x30], rax
    jmp _bcc_match
    xret_22:
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
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
    ; ret
    jmp qword [rel arm_x30]
_bcc_match:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; stp     x2, x19, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x2]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x19]
    mov qword [r10+8], rax
    ; mov     x0, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x0], rax
    ; bl      _zcmp
    lea rax, [rel xret_23]
    mov qword [rel arm_x30], rax
    jmp _zcmp
    xret_23:
    ; ldp     x2, x19, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x2], rax
    mov qword [rel arm_x19], rcx
    add rsp, 0x10
    ; cbnz    x0, _bcc_match_no
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _bcc_match_no
    ; str     x20, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
_bcc_match_no:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_zcmp:
    ; ldrb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; ldrb    w3, [x1], #1
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; cmp     w2, w3
    mov eax, dword [rel arm_x2]
    mov ecx, dword [rel arm_x3]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _zcmp_ne
    cmp byte [rel arm_z], 0
    je _zcmp_ne
    ; cbnz    w2, _zcmp
    mov eax, dword [rel arm_x2]
    cmp rax, 0
    jne _zcmp
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_zcmp_ne:
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_kernel_eval:
global kernel_eval
kernel_eval:
    mov qword [rel arm_x0], rdi
    mov qword [rel arm_x1], rsi
    mov qword [rel arm_x2], rdx
    mov qword [rel arm_x3], rcx
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
    ; stp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [rel arm_x23]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x24]
    mov qword [r10+8], rax
    ; stp     x25, x26, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [rel arm_x25]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x26]
    mov qword [r10+8], rax
    ; stp     x27, x28, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [rel arm_x27]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x28]
    mov qword [r10+8], rax
    ; lea x2, kernel_inited
    lea rax, [rel kernel_inited]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbnz    x2, _eval_go
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    jne _eval_go
    ; mov     x0, #2
    mov rax, 2
    mov qword [rel arm_x0], rax
    ; neg     x0, x0
    mov rax, qword [rel arm_x0]
    neg rax
    mov qword [rel arm_x0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
_eval_go:
    ; lea x2, source_base
    lea rax, [rel source_base]
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
    ; lea x2, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x2], rax
    ; add     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, bye_flag
    lea rax, [rel bye_flag]
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
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, source_sp
    lea rax, [rel source_sp]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, view_id_sp
    lea rax, [rel view_id_sp]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, eval_resume_sp
    lea rax, [rel eval_resume_sp]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; bl      _vm_load
    lea rax, [rel xret_24]
    mov qword [rel arm_x30], rax
    jmp _vm_load
    xret_24:
    ; b       _interpret_loop
    jmp _interpret_loop
_interpret_loop:
    ; lea x24, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x24], rax
    ; bl      _check_stack
    lea rax, [rel xret_25]
    mov qword [rel arm_x30], rax
    jmp _check_stack
    xret_25:
    ; bl      _file_echo_upto_cursor
    lea rax, [rel xret_26]
    mov qword [rel arm_x30], rax
    jmp _file_echo_upto_cursor
    xret_26:
    ; bl      _next_word
    lea rax, [rel xret_27]
    mov qword [rel arm_x30], rax
    jmp _next_word
    xret_27:
    ; cbz     x1, _interpret_empty
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _interpret_empty
    ; mov     x25, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x25], rax
    ; mov     x26, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x26], rax
    ; b       _try_find
    jmp _try_find
_try_find:
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbz     x2, _try_find_dict
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    je _try_find_dict
    ; mov     x0, x25
    mov rax, qword [rel arm_x25]
    mov qword [rel arm_x0], rax
    ; mov     x1, x26
    mov rax, qword [rel arm_x26]
    mov qword [rel arm_x1], rax
    ; bl      _local_lookup
    lea rax, [rel xret_28]
    mov qword [rel arm_x30], rax
    jmp _local_lookup
    xret_28:
    ; cmp     x0, #-1
    mov rax, qword [rel arm_x0]
    cmp rax, -1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _try_find_dict
    cmp byte [rel arm_z], 0
    jne _try_find_dict
    ; mov     x25, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x25], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_29]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_29:
    ; mov     x0, x25
    mov rax, qword [rel arm_x25]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_30]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_30:
    ; lea x0, cfa_local_at
    lea rax, [rel cfa_local_at]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_31]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_31:
    ; b       _interpret_loop
    jmp _interpret_loop
_try_find_dict:
    ; mov     x0, x25
    mov rax, qword [rel arm_x25]
    mov qword [rel arm_x0], rax
    ; mov     x1, x26
    mov rax, qword [rel arm_x26]
    mov qword [rel arm_x1], rax
    ; bl      _find_word
    lea rax, [rel xret_32]
    mov qword [rel arm_x30], rax
    jmp _find_word
    xret_32:
    ; cbz     x0, _try_number_after_find
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _try_number_after_find
    ; mov     x2, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x2], rax
    ; mov     x3, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x3], rax
    ; tbnz    x3, #63, _exec_found
    mov rax, qword [rel arm_x3]
    bt rax, 63
    jc _exec_found
    ; lea x6, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x6], rax
    ; ldr     x6, [x6]
    mov r10, qword [rel arm_x6]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; cbnz    x6, _compile_entry
    mov rax, qword [rel arm_x6]
    cmp rax, 0
    jne _compile_entry
_exec_found:
    ; lea x19, restart_cell
    lea rax, [rel restart_cell]
    mov qword [rel arm_x19], rax
    ; mov     x21, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x21], rax
    ; ldr     x5, [x21]
    mov r10, qword [rel arm_x21]
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; br      x5
    mov rax, qword [rel arm_x5]
    jmp rax
_compile_entry:
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_33]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_33:
    ; b       _interpret_loop
    jmp _interpret_loop
_try_number_after_find:
    ; mov     x0, x25
    mov rax, qword [rel arm_x25]
    mov qword [rel arm_x0], rax
    ; mov     x1, x26
    mov rax, qword [rel arm_x26]
    mov qword [rel arm_x1], rax
    ; bl      _parse_number
    lea rax, [rel xret_34]
    mov qword [rel arm_x30], rax
    jmp _parse_number
    xret_34:
    ; cbz     x0, _try_charlit
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _try_charlit
    ; cmp     x0, #2
    mov rax, qword [rel arm_x0]
    cmp rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _number_double
    cmp byte [rel arm_z], 0
    jne _number_double
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbnz    x2, _compile_lit
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    jne _compile_lit
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
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
    ; b       _interpret_loop
    jmp _interpret_loop
_compile_lit:
    ; mov     x25, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x25], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_35]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_35:
    ; mov     x0, x25
    mov rax, qword [rel arm_x25]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_36]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_36:
    ; b       _interpret_loop
    jmp _interpret_loop
_number_double:
    ; lea x3, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; cbnz    x3, _compile_dlit
    mov rax, qword [rel arm_x3]
    cmp rax, 0
    jne _compile_dlit
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
    ; b       _interpret_loop
    jmp _interpret_loop
_compile_dlit:
    ; stp     x1, x2, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x1]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x2]
    mov qword [r10+8], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
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
    ; ldr     x0, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_38]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_38:
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_39]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_39:
    ; ldr     x0, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_40]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_40:
    ; add     sp, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov rsp, rax
    ; b       _interpret_loop
    jmp _interpret_loop
_try_charlit:
    ; cmp     x26, #3
    mov rax, qword [rel arm_x26]
    cmp rax, 3
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _try_float
    cmp byte [rel arm_z], 0
    je _try_float
    ; ldrb    w2, [x25]
    mov r10, qword [rel arm_x25]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    ; cmp     w2, #39
    mov eax, dword [rel arm_x2]
    cmp eax, 0x27
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _try_float
    cmp byte [rel arm_z], 0
    je _try_float
    ; ldrb    w2, [x25, #2]
    mov r10, qword [rel arm_x25]
    add r10, 2
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    ; cmp     w2, #39
    mov eax, dword [rel arm_x2]
    cmp eax, 0x27
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _try_float
    cmp byte [rel arm_z], 0
    je _try_float
    ; ldrb    w1, [x25, #1]
    mov r10, qword [rel arm_x25]
    add r10, 1
    movzx eax, byte [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbnz    x2, _compile_lit
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    jne _compile_lit
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
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
    ; b       _interpret_loop
    jmp _interpret_loop
_try_float:
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
    ; mov     x0, #100
    mov rax, 0x64
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; mov     x2, x26
    mov rax, qword [rel arm_x26]
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [rel arm_x4], rax
    ; mov     x5, x25
    mov rax, qword [rel arm_x25]
    mov qword [rel arm_x5], rax
    ; add     x6, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [rel arm_x6], rax
    ; str     xzr, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov qword [r10], 0
    ; str     xzr, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov qword [r10], 0
    ; str     xzr, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov qword [r10], 0
    ; bl      host_float_op
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
    call host_float_op
    mov qword [rel arm_x0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x6, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; ldr     x7, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x7], rax
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
    ; cbz     x6, _interpret_undef
    mov rax, qword [rel arm_x6]
    cmp rax, 0
    je _interpret_undef
    ; mov     x26, x7
    mov rax, qword [rel arm_x7]
    mov qword [rel arm_x26], rax
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cbnz    x2, _compile_flit
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    jne _compile_flit
    ; mov     x1, x26
    mov rax, qword [rel arm_x26]
    mov qword [rel arm_x1], rax
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
    ; add     x6, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [rel arm_x6], rax
    ; str     xzr, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov qword [r10], 0
    ; str     xzr, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov qword [r10], 0
    ; str     xzr, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov qword [r10], 0
    ; bl      host_float_op
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
    call host_float_op
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
    ; add     sp, sp, #80
    mov rax, rsp
    add rax, 0x50
    mov rsp, rax
    ; b       _interpret_loop
    jmp _interpret_loop
_compile_flit:
    ; mov     x25, x26
    mov rax, qword [rel arm_x26]
    mov qword [rel arm_x25], rax
    ; lea x0, cfa_flit
    lea rax, [rel cfa_flit]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_41]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_41:
    ; mov     x0, x25
    mov rax, qword [rel arm_x25]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_42]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_42:
    ; b       _interpret_loop
    jmp _interpret_loop
_interpret_undef:
    ; mov     x0, x25
    mov rax, qword [rel arm_x25]
    mov qword [rel arm_x0], rax
    ; mov     x1, x26
    mov rax, qword [rel arm_x26]
    mov qword [rel arm_x1], rax
    ; bl      emit_str
    lea rax, [rel xret_43]
    mov qword [rel arm_x30], rax
    jmp emit_str
    xret_43:
    ; lea x0, msg_huh
    lea rax, [rel msg_huh]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_44]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_44:
    ; lea x7, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x7], rax
    ; ldr     x1, [x7]
    mov r10, qword [rel arm_x7]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _undef_abandon
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _undef_abandon
    ; mov     x20, #-13
    mov rax, -13
    mov qword [rel arm_x20], rax
    ; b       XTHROW
    jmp XTHROW
_undef_abandon:
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
    ; bl      _local_compile_reset
    lea rax, [rel xret_45]
    mov qword [rel arm_x30], rax
    jmp _local_compile_reset
    xret_45:
    ; lea x0, noname_xt
    lea rax, [rel noname_xt]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; b       _do_quit
    jmp _do_quit
_interpret_empty:
    ; lea x0, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _ie_whole
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _ie_whole
    ; bl      _take_line
    lea rax, [rel xret_46]
    mov qword [rel arm_x30], rax
    jmp _take_line
    xret_46:
    ; cbnz    x0, _interpret_loop
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    jne _interpret_loop
    ; b       _ie_pop
    jmp _ie_pop
_ie_whole:
    ; lea x0, source_sp
    lea rax, [rel source_sp]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _embed_finish
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _embed_finish
_ie_pop:
    ; lea x0, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x0], rax
    ; ldr     x25, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x25], rax
    ; bl      _pop_source
    lea rax, [rel xret_47]
    mov qword [rel arm_x30], rax
    jmp _pop_source
    xret_47:
    ; cbz     x0, _embed_finish
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _embed_finish
    ; cmp     x25, #0
    mov rax, qword [rel arm_x25]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.gt    _ie_view_pop
    cmp byte [rel arm_z], 0
    jne xsk_48
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _ie_view_pop
    xsk_48:
    ; cmn     x25, #2
    mov rax, qword [rel arm_x25]
    add rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    _ie_after_view
    cmp byte [rel arm_z], 0
    je _ie_after_view
_ie_view_pop:
    ; bl      _view_pop_src_id
    lea rax, [rel xret_49]
    mov qword [rel arm_x30], rax
    jmp _view_pop_src_id
    xret_49:
_ie_after_view:
    ; cmn     x25, #1
    mov rax, qword [rel arm_x25]
    add rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.eq    _ie_resume
    cmp byte [rel arm_z], 0
    jne _ie_resume
    ; cmn     x25, #2
    mov rax, qword [rel arm_x25]
    add rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    _interpret_loop
    cmp byte [rel arm_z], 0
    je _interpret_loop
_ie_resume:
    ; bl      _eval_resume_pop
    lea rax, [rel xret_50]
    mov qword [rel arm_x30], rax
    jmp _eval_resume_pop
    xret_50:
    ; cbz     x0, _interpret_loop
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _interpret_loop
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
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
_do_quit:
    ; lea x23, return_stack
    lea rax, [rel return_stack]
    mov qword [rel arm_x23], rax
    ; add     x23, x23, #1, lsl #12
    mov rax, qword [rel arm_x23]
    add rax, 0x1000
    mov qword [rel arm_x23], rax
    ; lea x0, throw_handler
    lea rax, [rel throw_handler]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, source_sp
    lea rax, [rel source_sp]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, eval_resume_sp
    lea rax, [rel eval_resume_sp]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, view_id_sp
    lea rax, [rel view_id_sp]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; lea x0, local_frame_depth
    lea rax, [rel local_frame_depth]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; bl      _vm_save
    lea rax, [rel xret_51]
    mov qword [rel arm_x30], rax
    jmp _vm_save
    xret_51:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
_embed_finish:
    ; bl      _record_words_user_base_once
    lea rax, [rel xret_52]
    mov qword [rel arm_x30], rax
    jmp _record_words_user_base_once
    xret_52:
    ; bl      _vm_save
    lea rax, [rel xret_53]
    mov qword [rel arm_x30], rax
    jmp _vm_save
    xret_53:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
_quit_exit:
    ; b       _embed_bye_return
    jmp _embed_bye_return
_embed_bye_return:
    ; bl      _vm_save
    lea rax, [rel xret_54]
    mov qword [rel arm_x30], rax
    jmp _vm_save
    xret_54:
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
_embed_ret_x0:
    ; ldp     x27, x28, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x27], rax
    mov qword [rel arm_x28], rcx
    ; ldp     x25, x26, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x25], rax
    mov qword [rel arm_x26], rcx
    ; ldp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x23], rax
    mov qword [rel arm_x24], rcx
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
    ; add     sp, sp, #128
    mov rax, rsp
    add rax, 0x80
    mov rsp, rax
    ; ret
    mov rax, qword [rel arm_x0]
    ret
_check_stack:
    ; lea x0, data_stack
    lea rax, [rel data_stack]
    mov qword [rel arm_x0], rax
    ; add     x1, x0, #1, lsl #12
    mov rax, qword [rel arm_x0]
    add rax, 0x1000
    mov qword [rel arm_x1], rax
    ; cmp     x22, x1
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _stack_underflow
    cmp byte [rel arm_c], 0
    je xsk_55
    cmp byte [rel arm_z], 0
    je _stack_underflow
    xsk_55:
    ; cmp     x22, x0
    mov rax, qword [rel arm_x22]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _stack_overflow
    cmp byte [rel arm_c], 0
    je _stack_overflow
    ; ret
    jmp qword [rel arm_x30]
_stack_underflow:
    ; lea x0, msg_underflow
    lea rax, [rel msg_underflow]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_56]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_56:
    ; b       _stack_reset_abandon
    jmp _stack_reset_abandon
_stack_overflow:
    ; lea x0, msg_overflow
    lea rax, [rel msg_overflow]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_57]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_57:
_stack_reset_abandon:
    ; b       _undef_abandon
    jmp _undef_abandon
_file_echo_upto_cursor:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, file_echo
    lea rax, [rel file_echo]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cbz     x0, _fe_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _fe_done
    ; lea x0, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cmp     x0, #0
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.gt    _fe_on
    cmp byte [rel arm_z], 0
    jne xsk_58
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _fe_on
    xsk_58:
    ; cmn     x0, #2
    mov rax, qword [rel arm_x0]
    add rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    _fe_done
    cmp byte [rel arm_z], 0
    je _fe_done
_fe_on:
    ; sub     sp, sp, #48
    mov rax, rsp
    sub rax, 0x30
    mov rsp, rax
    ; lea x4, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x4], rax
    ; ldr     x4, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; cbz     x4, _fe_src
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _fe_src
    ; lea x1, line_origin
    lea rax, [rel line_origin]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, line_limit
    lea rax, [rel line_limit]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; b       _fe_bounds
    jmp _fe_bounds
_fe_src:
    ; lea x1, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; lea x2, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
_fe_bounds:
    ; str     x1, [sp]
    lea r10, [rsp]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; str     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; lea x0, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cmp     x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _fe_clamp_hi
    cmp byte [rel arm_c], 0
    jne _fe_clamp_hi
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
_fe_clamp_hi:
    ; cmp     x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _fe_skip
    cmp byte [rel arm_c], 0
    je _fe_skip
    cmp byte [rel arm_z], 0
    jne _fe_skip
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
_fe_skip:
    ; cmp     x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _fe_eol
    cmp byte [rel arm_c], 0
    jne _fe_eol
    ; ldrb    w3, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; cbz     w3, _fe_eol
    mov eax, dword [rel arm_x3]
    cmp rax, 0
    je _fe_eol
    ; cmp     w3, #32
    mov eax, dword [rel arm_x3]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_skip1
    cmp byte [rel arm_z], 0
    jne _fe_skip1
    ; cmp     w3, #9
    mov eax, dword [rel arm_x3]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_skip1
    cmp byte [rel arm_z], 0
    jne _fe_skip1
    ; cmp     w3, #10
    mov eax, dword [rel arm_x3]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_skip1
    cmp byte [rel arm_z], 0
    jne _fe_skip1
    ; cmp     w3, #13
    mov eax, dword [rel arm_x3]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_skip1
    cmp byte [rel arm_z], 0
    jne _fe_skip1
    ; b       _fe_eol
    jmp _fe_eol
_fe_skip1:
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _fe_skip
    jmp _fe_skip
_fe_eol:
    ; mov     x3, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x3], rax
_fe_eol_scan:
    ; cmp     x3, x2
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _fe_eol_ok
    cmp byte [rel arm_c], 0
    jne _fe_eol_ok
    ; ldrb    w4, [x3]
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _fe_eol_ok
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _fe_eol_ok
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_eol_ok
    cmp byte [rel arm_z], 0
    jne _fe_eol_ok
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_eol_ok
    cmp byte [rel arm_z], 0
    jne _fe_eol_ok
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _fe_eol_scan
    jmp _fe_eol_scan
_fe_eol_ok:
    ; str     x3, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x4, file_echo_pos
    lea rax, [rel file_echo_pos]
    mov qword [rel arm_x4], rax
    ; ldr     x0, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [sp]
    lea r10, [rsp]
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
    ; b.hs    _fe_pos_hi
    cmp byte [rel arm_c], 0
    jne _fe_pos_hi
    ; mov     x0, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x0], rax
_fe_pos_hi:
    ; ldr     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
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
    ; b.ls    _fe_pos_ok
    cmp byte [rel arm_c], 0
    je _fe_pos_ok
    cmp byte [rel arm_z], 0
    jne _fe_pos_ok
    ; mov     x0, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x0], rax
_fe_pos_ok:
    ; str     x0, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldr     x3, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
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
    ; b.hs    _fe_drop
    cmp byte [rel arm_c], 0
    jne _fe_drop
_fe_line:
    ; ldr     x0, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ldr     x3, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
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
    ; b.hs    _fe_drop
    cmp byte [rel arm_c], 0
    jne _fe_drop
    ; ldr     x1, [sp]
    lea r10, [rsp]
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
    ; b.eq    _fe_num
    cmp byte [rel arm_z], 0
    jne _fe_num
    ; ldrb    w4, [x0, #-1]
    mov r10, qword [rel arm_x0]
    add r10, -1
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_num
    cmp byte [rel arm_z], 0
    jne _fe_num
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_num
    cmp byte [rel arm_z], 0
    jne _fe_num
    ; b       _fe_text
    jmp _fe_text
_fe_num:
    ; mov     x4, #1
    mov rax, 1
    mov qword [rel arm_x4], rax
    ; mov     x3, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x3], rax
_fe_count:
    ; cmp     x3, x0
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x0]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _fe_count_done
    cmp byte [rel arm_c], 0
    jne _fe_count_done
    ; ldrb    w5, [x3]
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x5], rax
    ; cmp     w5, #10
    mov eax, dword [rel arm_x5]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _fe_count_next
    cmp byte [rel arm_z], 0
    je _fe_count_next
    ; add     x4, x4, #1
    mov rax, qword [rel arm_x4]
    add rax, 1
    mov qword [rel arm_x4], rax
_fe_count_next:
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _fe_count
    jmp _fe_count
_fe_count_done:
    ; mov     x0, x4
    mov rax, qword [rel arm_x4]
    mov qword [rel arm_x0], rax
    ; bl      _fe_emit_lineno
    lea rax, [rel xret_59]
    mov qword [rel arm_x30], rax
    jmp _fe_emit_lineno
    xret_59:
_fe_text:
    ; ldr     x0, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ldr     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; mov     x3, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x3], rax
_fe_text_scan:
    ; cmp     x3, x2
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _fe_text_write
    cmp byte [rel arm_c], 0
    jne _fe_text_write
    ; ldrb    w4, [x3]
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cbz     w4, _fe_text_write
    mov eax, dword [rel arm_x4]
    cmp rax, 0
    je _fe_text_write
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_text_write
    cmp byte [rel arm_z], 0
    jne _fe_text_write
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_text_write
    cmp byte [rel arm_z], 0
    jne _fe_text_write
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _fe_text_scan
    jmp _fe_text_scan
_fe_text_write:
    ; mov     x1, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x1], rax
    ; ldr     x0, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; subs    x1, x1, x0
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    sub rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x1], rax
    ; b.eq    _fe_advance
    cmp byte [rel arm_z], 0
    jne _fe_advance
    ; str     x3, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; bl      emit_str
    lea rax, [rel xret_60]
    mov qword [rel arm_x30], rax
    jmp emit_str
    xret_60:
    ; ldr     x3, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
_fe_advance:
    ; ldr     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; mov     x1, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x1], rax
    ; cmp     x3, x2
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _fe_store
    cmp byte [rel arm_c], 0
    jne _fe_store
    ; ldrb    w0, [x3]
    mov r10, qword [rel arm_x3]
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    ; cmp     w0, #10
    mov eax, dword [rel arm_x0]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _fe_one
    cmp byte [rel arm_z], 0
    jne _fe_one
    ; cmp     w0, #13
    mov eax, dword [rel arm_x0]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _fe_store
    cmp byte [rel arm_z], 0
    je _fe_store
    ; add     x1, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; cmp     x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _fe_store
    cmp byte [rel arm_c], 0
    jne _fe_store
    ; ldrb    w0, [x1]
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x0], rax
    ; cmp     w0, #10
    mov eax, dword [rel arm_x0]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _fe_store
    cmp byte [rel arm_z], 0
    je _fe_store
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _fe_store
    jmp _fe_store
_fe_one:
    ; add     x1, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x1], rax
_fe_store:
    ; str     x1, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x4, file_echo_pos
    lea rax, [rel file_echo_pos]
    mov qword [rel arm_x4], rax
    ; str     x1, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_61]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_61:
    ; b       _fe_line
    jmp _fe_line
_fe_drop:
    ; add     sp, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov rsp, rax
_fe_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_fe_emit_lineno:
    ; stp     x29, x30, [sp, #-32]!
    add rsp, -32
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; str     x0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [rel arm_x1], rax
    ; mov     x2, #10
    mov rax, 0xa
    mov qword [rel arm_x2], rax
_fe_digits:
    ; cmp     x0, x2
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _fe_pad
    cmp byte [rel arm_c], 0
    je _fe_pad
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; mov     x3, #10
    mov rax, 0xa
    mov qword [rel arm_x3], rax
    ; mul     x2, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    imul rax, rcx
    mov qword [rel arm_x2], rax
    ; cmp     x1, #5
    mov rax, qword [rel arm_x1]
    cmp rax, 5
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _fe_digits
    cmp byte [rel arm_c], 0
    je _fe_digits
_fe_pad:
    ; mov     x2, #5
    mov rax, 5
    mov qword [rel arm_x2], rax
    ; subs    x2, x2, x1
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x2], rax
    ; b.ls    _fe_print
    cmp byte [rel arm_c], 0
    je _fe_print
    cmp byte [rel arm_z], 0
    jne _fe_print
_fe_spaces:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; str     x2, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; bl      _putchar
    lea rax, [rel xret_62]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_62:
    ; ldr     x2, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; subs    x2, x2, #1
    mov rax, qword [rel arm_x2]
    sub rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    mov qword [rel arm_x2], rax
    ; b.ne    _fe_spaces
    cmp byte [rel arm_z], 0
    je _fe_spaces
_fe_print:
    ; ldr     x0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_63]
    mov qword [rel arm_x30], rax
    jmp _print_unsigned
    xret_63:
    ; mov     x0, #124
    mov rax, 0x7c
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_64]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_64:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [rel arm_x0], rax
    ; bl      _putchar
    lea rax, [rel xret_65]
    mov qword [rel arm_x30], rax
    jmp _putchar
    xret_65:
    ; ldp     x29, x30, [sp], #32
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x20
    ; ret
    jmp qword [rel arm_x30]
_arm_lines:
    ; lea x2, file_echo_pos
    lea rax, [rel file_echo_pos]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, line_origin
    lea rax, [rel line_origin]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; add     x3, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    add rax, rcx
    mov qword [rel arm_x3], rax
    ; lea x2, line_limit
    lea rax, [rel line_limit]
    mov qword [rel arm_x2], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x2, line_next
    lea rax, [rel line_next]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x3, #1
    mov rax, 1
    mov qword [rel arm_x3], rax
    ; lea x2, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x2], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; ret
    jmp qword [rel arm_x30]
_take_line:
    ; lea x2, line_next
    lea rax, [rel line_next]
    mov qword [rel arm_x2], rax
    ; ldr     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; lea x3, line_limit
    lea rax, [rel line_limit]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
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
    ; b.hs    _tl_eof
    cmp byte [rel arm_c], 0
    jne _tl_eof
    ; mov     x1, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x1], rax
_tl_scan:
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _tl_eos
    cmp byte [rel arm_c], 0
    jne _tl_eos
    ; ldrb    w4, [x1]
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _tl_lf
    cmp byte [rel arm_z], 0
    jne _tl_lf
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _tl_cr
    cmp byte [rel arm_z], 0
    jne _tl_cr
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _tl_scan
    jmp _tl_scan
_tl_lf:
    ; mov     x5, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x5], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _tl_set
    jmp _tl_set
_tl_cr:
    ; mov     x5, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x5], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; cmp     x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _tl_set
    cmp byte [rel arm_c], 0
    jne _tl_set
    ; ldrb    w4, [x1]
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _tl_set
    cmp byte [rel arm_z], 0
    je _tl_set
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; b       _tl_set
    jmp _tl_set
_tl_eos:
    ; mov     x5, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x5], rax
_tl_set:
    ; lea x2, line_next
    lea rax, [rel line_next]
    mov qword [rel arm_x2], rax
    ; str     x1, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x2, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x2], rax
    ; str     x5, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; lea x2, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2]
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    ; lea x2, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_tl_eof:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_push_source:
    ; lea x0, source_sp
    lea rax, [rel source_sp]
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
    ; b.hs    _ps_full
    cmp byte [rel arm_c], 0
    jne _ps_full
    ; lsl     x3, x1, #6
    mov rax, qword [rel arm_x1]
    shl rax, 6
    mov qword [rel arm_x3], rax
    ; lea x2, source_stack
    lea rax, [rel source_stack]
    mov qword [rel arm_x2], rax
    ; add     x2, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    add rax, rcx
    mov qword [rel arm_x2], rax
    ; lea x3, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x3, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x3, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x3, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x3, line_origin
    lea rax, [rel line_origin]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x3, line_limit
    lea rax, [rel line_limit]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x3, line_next
    lea rax, [rel line_next]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x3, file_echo_pos
    lea rax, [rel file_echo_pos]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; lea x2, file_echo_stack
    lea rax, [rel file_echo_stack]
    mov qword [rel arm_x2], rax
    ; str     x3, [x2, x1, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    shl rax, 3
    add r10, rax
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x3, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; lea x2, blk_stack
    lea rax, [rel blk_stack]
    mov qword [rel arm_x2], rax
    ; str     x3, [x2, x1, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    shl rax, 3
    add r10, rax
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
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_ps_full:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_pop_source:
    ; lea x0, source_sp
    lea rax, [rel source_sp]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _pop_empty
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _pop_empty
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lsl     x3, x1, #6
    mov rax, qword [rel arm_x1]
    shl rax, 6
    mov qword [rel arm_x3], rax
    ; lea x2, source_stack
    lea rax, [rel source_stack]
    mov qword [rel arm_x2], rax
    ; add     x2, x2, x3
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x3]
    add rax, rcx
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x0, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; mov     x4, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x4], rax
    ; ldr     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x0, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; ldr     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x0, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; add     x4, x4, x3
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x3]
    add rax, rcx
    mov qword [rel arm_x4], rax
    ; lea x0, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x0], rax
    ; str     x4, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x4]
    mov qword [r10], rax
    ; ldr     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x0, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; ldr     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x0, line_mode
    lea rax, [rel line_mode]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; ldr     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x0, line_origin
    lea rax, [rel line_origin]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; ldr     x3, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; lea x0, line_limit
    lea rax, [rel line_limit]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; ldr     x3, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; lea x0, line_next
    lea rax, [rel line_next]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x2, file_echo_stack
    lea rax, [rel file_echo_stack]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2, x1, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; lea x0, file_echo_pos
    lea rax, [rel file_echo_pos]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; lea x2, blk_stack
    lea rax, [rel blk_stack]
    mov qword [rel arm_x2], rax
    ; ldr     x3, [x2, x1, lsl #3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x1]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; lea x0, blk_var
    lea rax, [rel blk_var]
    mov qword [rel arm_x0], rax
    ; str     x3, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    mov qword [r10], rax
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_pop_empty:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_eval_resume_push:
    ; lea x0, eval_resume_sp
    lea rax, [rel eval_resume_sp]
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
    ; b.hs    _erp_full
    cmp byte [rel arm_c], 0
    jne _erp_full
    ; lea x2, eval_resume_stack
    lea rax, [rel eval_resume_stack]
    mov qword [rel arm_x2], rax
    ; lsl     x3, x1, #3
    mov rax, qword [rel arm_x1]
    shl rax, 3
    mov qword [rel arm_x3], rax
    ; str     x19, [x2, x3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    add r10, rax
    mov rax, qword [rel arm_x19]
    mov qword [r10], rax
    ; add     x1, x1, #1
    mov rax, qword [rel arm_x1]
    add rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
_erp_full:
    ; ret
    jmp qword [rel arm_x30]
_eval_resume_pop:
    ; lea x0, eval_resume_sp
    lea rax, [rel eval_resume_sp]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _erpop_empty
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _erpop_empty
    ; sub     x1, x1, #1
    mov rax, qword [rel arm_x1]
    sub rax, 1
    mov qword [rel arm_x1], rax
    ; str     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; lea x2, eval_resume_stack
    lea rax, [rel eval_resume_stack]
    mov qword [rel arm_x2], rax
    ; lsl     x3, x1, #3
    mov rax, qword [rel arm_x1]
    shl rax, 3
    mov qword [rel arm_x3], rax
    ; ldr     x0, [x2, x3]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x3]
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_erpop_empty:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_throw_unwind_to_sp:
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
    ; str     x0, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
_tu_loop:
    ; lea x0, source_sp
    lea rax, [rel source_sp]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; cmp     x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _tu_done
    cmp byte [rel arm_c], 0
    je _tu_done
    cmp byte [rel arm_z], 0
    jne _tu_done
    ; lea x0, source_id
    lea rax, [rel source_id]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; str     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; bl      _pop_source
    lea rax, [rel xret_66]
    mov qword [rel arm_x30], rax
    jmp _pop_source
    xret_66:
    ; cbz     x0, _tu_done
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    je _tu_done
    ; ldr     x0, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; cmp     x0, #0
    mov rax, qword [rel arm_x0]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.gt    _tu_view
    cmp byte [rel arm_z], 0
    jne xsk_67
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    je _tu_view
    xsk_67:
    ; cmn     x0, #2
    mov rax, qword [rel arm_x0]
    add rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.ne    _tu_loop
    cmp byte [rel arm_z], 0
    je _tu_loop
_tu_view:
    ; bl      _view_pop_src_id
    lea rax, [rel xret_68]
    mov qword [rel arm_x30], rax
    jmp _view_pop_src_id
    xret_68:
    ; b       _tu_loop
    jmp _tu_loop
_tu_done:
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
_vm_save:
    ; lea x0, vm_tos
    lea rax, [rel vm_tos]
    mov qword [rel arm_x0], rax
    ; str     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x20]
    mov qword [r10], rax
    ; lea x0, vm_dsp
    lea rax, [rel vm_dsp]
    mov qword [rel arm_x0], rax
    ; str     x22, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x22]
    mov qword [r10], rax
    ; lea x0, vm_rsp
    lea rax, [rel vm_rsp]
    mov qword [rel arm_x0], rax
    ; str     x23, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x23]
    mov qword [r10], rax
    ; ret
    jmp qword [rel arm_x30]
_vm_load:
    ; lea x24, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x24], rax
    ; lea x0, vm_tos
    lea rax, [rel vm_tos]
    mov qword [rel arm_x0], rax
    ; ldr     x20, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x20], rax
    ; lea x0, vm_dsp
    lea rax, [rel vm_dsp]
    mov qword [rel arm_x0], rax
    ; ldr     x22, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x22], rax
    ; lea x0, vm_rsp
    lea rax, [rel vm_rsp]
    mov qword [rel arm_x0], rax
    ; ldr     x23, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x23], rax
    ; lea x0, debug_armed
    lea rax, [rel debug_armed]
    mov qword [rel arm_x0], rax
    ; ldr     x28, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x28], rax
    ; cbnz    x22, _vm_load_ok
    mov rax, qword [rel arm_x22]
    cmp rax, 0
    jne _vm_load_ok
    ; b       _vm_reset_stacks
    jmp _vm_reset_stacks
_vm_load_ok:
    ; ret
    jmp qword [rel arm_x30]
_vm_reset_stacks:
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
    ; lea x23, return_stack
    lea rax, [rel return_stack]
    mov qword [rel arm_x23], rax
    ; add     x23, x23, #1, lsl #12
    mov rax, qword [rel arm_x23]
    add rax, 0x1000
    mov qword [rel arm_x23], rax
    ; lea x24, latest_var
    lea rax, [rel latest_var]
    mov qword [rel arm_x24], rax
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x0], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
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
msg_huh:
    ; DCB     " ?", 10, 0
    db " ?", 0xa, 0
msg_underflow:
    ; DCB     "stack underflow", 10, 0
    db "stack underflow", 0xa, 0
msg_overflow:
    ; DCB     "stack overflow", 10, 0
    db "stack overflow", 0xa, 0
    ; ALIGN   8
align 8
boot_cmp_lit:
    ; DCB     "LIT", 0
    db "LIT", 0
boot_cmp_exit:
    ; DCB     "EXIT", 0
    db "EXIT", 0
boot_cmp_branch:
    ; DCB     "BRANCH", 0
    db "BRANCH", 0
boot_cmp_0branch:
    ; DCB    "0BRANCH", 0
    db "0BRANCH", 0
boot_cmp_does:
    ; DCB     "(DOES>)", 0
    db "(DOES>)", 0
boot_cmp_slit:
    ; DCB     "(S", 0x22, ")", 0
    db "(S", 0x22, ")", 0
boot_cmp_cstr:
    ; DCB     "(C", 0x22, ")", 0
    db "(C", 0x22, ")", 0
boot_cmp_execute:
    ; DCB    "EXECUTE", 0
    db "EXECUTE", 0
boot_cmp_comma:
    ; DCB     0x2C, 0
    db 0x2c, 0
boot_cmp_flit:
    ; DCB     "FLIT", 0
    db "FLIT", 0
boot_cmp_linit:
    ; DCB     "LOCAL-INIT", 0
    db "LOCAL-INIT", 0
boot_cmp_lat:
    ; DCB     "(LOCAL@)", 0
    db "(LOCAL@)", 0
boot_cmp_lstore:
    ; DCB     "(LOCAL!)", 0
    db "(LOCAL!)", 0
boot_cmp_loop:
    ; DCB     "(LOOP)", 0
    db "(LOOP)", 0
boot_cmp_ploop:
    ; DCB     "(+LOOP)", 0
    db "(+LOOP)", 0
