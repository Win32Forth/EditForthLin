; Generated from Forth/kernel/arm64/entry.asm. Do not edit.
bits 64
default rel
extern arm_load_base
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
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
extern _task_cold_init
extern _view_pop_src_id
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
extern debug_bp_go
extern debug_break_asap
extern debug_busy
extern debug_floor
extern debug_runto_ip
extern emit_cstr
extern emit_hook
extern emit_str
extern eval_frame_sp
extern facility_op_hook
extern file_echo
extern forth_init_end
extern forth_init_str
extern here_ptr
extern host_debug_paint
extern host_eval_fault_enter
extern host_eval_fault_leave
extern host_float_op
extern kernel_inited
extern key_hook
extern last_cfa
extern latest_var
extern local_frame_depth
extern next_debug
extern noname_xt
extern pause_hook
extern restart_cell
extern return_stack
extern state_var
extern throw_handler
extern up_var
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
global kernel_set_pause
global _kernel_set_pause
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
global _set_source
global _take_line
global _push_source
global _pop_source
global _eval_resume_push
global _eval_resume_pop
global _throw_unwind_to_sp
global _quit_exit
global _embed_bye_return
global _embed_ret_x0
global eval_fault_resume
_kernel_set_emit:
global kernel_set_emit
kernel_set_emit:
    push r15
    sub rsp, 40
    mov [rsp], rdi
    mov [rsp+8], rsi
    mov [rsp+16], rdx
    mov [rsp+24], rcx
    call arm_load_base
    mov r15, rax
    mov rdi, [rsp]
    mov rsi, [rsp+8]
    mov rdx, [rsp+16]
    mov rcx, [rsp+24]
    add rsp, 40
    mov qword [r15+0], rdi
    mov qword [r15+8], rsi
    mov qword [r15+16], rdx
    mov qword [r15+24], rcx
    ; lea x1, emit_hook
    lea rax, [rel emit_hook]
    mov qword [r15+8], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; ret
    mov rax, qword [r15+0]
    pop r15
    ret
_kernel_set_key:
global kernel_set_key
kernel_set_key:
    push r15
    sub rsp, 40
    mov [rsp], rdi
    mov [rsp+8], rsi
    mov [rsp+16], rdx
    mov [rsp+24], rcx
    call arm_load_base
    mov r15, rax
    mov rdi, [rsp]
    mov rsi, [rsp+8]
    mov rdx, [rsp+16]
    mov rcx, [rsp+24]
    add rsp, 40
    mov qword [r15+0], rdi
    mov qword [r15+8], rsi
    mov qword [r15+16], rdx
    mov qword [r15+24], rcx
    ; lea x1, key_hook
    lea rax, [rel key_hook]
    mov qword [r15+8], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; ret
    mov rax, qword [r15+0]
    pop r15
    ret
_kernel_set_pause:
global kernel_set_pause
kernel_set_pause:
    push r15
    sub rsp, 40
    mov [rsp], rdi
    mov [rsp+8], rsi
    mov [rsp+16], rdx
    mov [rsp+24], rcx
    call arm_load_base
    mov r15, rax
    mov rdi, [rsp]
    mov rsi, [rsp+8]
    mov rdx, [rsp+16]
    mov rcx, [rsp+24]
    add rsp, 40
    mov qword [r15+0], rdi
    mov qword [r15+8], rsi
    mov qword [r15+16], rdx
    mov qword [r15+24], rcx
    ; lea x1, pause_hook
    lea rax, [rel pause_hook]
    mov qword [r15+8], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; ret
    mov rax, qword [r15+0]
    pop r15
    ret
_kernel_set_facility_op:
global kernel_set_facility_op
kernel_set_facility_op:
    push r15
    sub rsp, 40
    mov [rsp], rdi
    mov [rsp+8], rsi
    mov [rsp+16], rdx
    mov [rsp+24], rcx
    call arm_load_base
    mov r15, rax
    mov rdi, [rsp]
    mov rsi, [rsp+8]
    mov rdx, [rsp+16]
    mov rcx, [rsp+24]
    add rsp, 40
    mov qword [r15+0], rdi
    mov qword [r15+8], rsi
    mov qword [r15+16], rdx
    mov qword [r15+24], rcx
    ; lea x1, facility_op_hook
    lea rax, [rel facility_op_hook]
    mov qword [r15+8], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; ret
    mov rax, qword [r15+0]
    pop r15
    ret
_kernel_init:
global kernel_init
kernel_init:
    push r15
    sub rsp, 40
    mov [rsp], rdi
    mov [rsp+8], rsi
    mov [rsp+16], rdx
    mov [rsp+24], rcx
    call arm_load_base
    mov r15, rax
    mov rdi, [rsp]
    mov rsi, [rsp+8]
    mov rdx, [rsp+16]
    mov rcx, [rsp+24]
    add rsp, 40
    mov qword [r15+0], rdi
    mov qword [r15+8], rsi
    mov qword [r15+16], rdx
    mov qword [r15+24], rcx
    ; sub     sp, sp, #128
    mov rax, rsp
    sub rax, 0x80
    mov rsp, rax
    ; lea x16, eval_frame_sp
    lea rax, [rel eval_frame_sp]
    mov qword [r15+128], rax
    ; mov     x17, sp
    mov rax, rsp
    mov qword [r15+136], rax
    ; str     x17, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r15+136]
    mov qword [r10], rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r15+168]
    mov qword [r10+0], rax
    mov rax, qword [r15+176]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r15+184]
    mov qword [r10+0], rax
    mov rax, qword [r15+192]
    mov qword [r10+8], rax
    ; stp     x25, x26, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r15+200]
    mov qword [r10+0], rax
    mov rax, qword [r15+208]
    mov qword [r10+8], rax
    ; stp     x27, x28, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [r15+216]
    mov qword [r10+0], rax
    mov rax, qword [r15+224]
    mov qword [r10+8], rax
    ; lea x0, kernel_inited
    lea rax, [rel kernel_inited]
    mov qword [r15+0], rax
    ; ldr     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbnz    x1, _kinit_already
    mov rax, qword [r15+8]
    cmp rax, 0
    jne _kinit_already
    ; bl      _kernel_cold_common
    lea rax, [rel xret_1]
    mov qword [r15+240], rax
    jmp _kernel_cold_common
    xret_1:
    ; bl      _vm_save
    lea rax, [rel xret_2]
    mov qword [r15+240], rax
    jmp _vm_save
    xret_2:
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; lea x0, kernel_inited
    lea rax, [rel kernel_inited]
    mov qword [r15+0], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x0, forth_init_str
    lea rax, [rel forth_init_str]
    mov qword [r15+0], rax
    ; lea x1, forth_init_end
    lea rax, [rel forth_init_end]
    mov qword [r15+8], rax
    ; sub     x1, x1, x0
    mov rax, qword [r15+8]
    mov rcx, qword [r15+0]
    sub rax, rcx
    mov qword [r15+8], rax
    ; sub     x1, x1, #1
    mov rax, qword [r15+8]
    sub rax, 1
    mov qword [r15+8], rax
    ; bl      _set_source
    lea rax, [rel xret_3]
    mov qword [r15+240], rax
    jmp _set_source
    xret_3:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_1
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_1
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_1:
    ; str     xzr, [x16, #TU_SRC_ID]
    mov r10, qword [r15+128]
    add r10, 0x80
    mov qword [r10], 0
    ; lea x2, throw_handler
    lea rax, [rel throw_handler]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; lea x2, bye_flag
    lea rax, [rel bye_flag]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; bl      host_eval_fault_enter
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
    call host_eval_fault_enter
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; b       _interpret_loop
    jmp _interpret_loop
_kinit_already:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; mov     x27, #0
    mov rax, 0
    mov qword [r15+216], rax
    ; lea x22, data_stack
    lea rax, [rel data_stack]
    mov qword [r15+176], rax
    ; add     x22, x22, #1, lsl #12
    mov rax, qword [r15+176]
    add rax, 0x1000
    mov qword [r15+176], rax
    ; lea x23, return_stack
    lea rax, [rel return_stack]
    mov qword [r15+184], rax
    ; add     x23, x23, #1, lsl #12
    mov rax, qword [r15+184]
    add rax, 0x1000
    mov qword [r15+184], rax
    ; lea x24, latest_var
    lea rax, [rel latest_var]
    mov qword [r15+192], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [r15+160], rax
    ; mov     x28, #0
    mov rax, 0
    mov qword [r15+224], rax
    ; mov     x0, x24
    mov rax, qword [r15+192]
    mov qword [r15+0], rax
    ; mov     x1, #16
    mov rax, 0x10
    mov qword [r15+8], rax
_cold_clear:
    ; str     xzr, [x0], #8
    mov r10, qword [r15+0]
    mov qword [r10], 0
    mov rax, qword [r15+0]
    add rax, 8
    mov qword [r15+0], rax
    ; subs    x1, x1, #1
    mov rax, qword [r15+8]
    sub rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    mov qword [r15+8], rax
    ; b.ne    _cold_clear
    cmp byte [r15+249], 0
    je _cold_clear
    ; lea x0, last_cfa
    lea rax, [rel last_cfa]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [r15+0], rax
    ; lea x1, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [r15+8], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, bye_flag
    lea rax, [rel bye_flag]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; bl      _boot_kernel
    lea rax, [rel xret_4]
    mov qword [r15+240], rax
    jmp _boot_kernel
    xret_4:
    ; lea x24, latest_var
    lea rax, [rel latest_var]
    mov qword [r15+192], rax
    ; bl      _task_cold_init
    lea rax, [rel xret_5]
    mov qword [r15+240], rax
    jmp _task_cold_init
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
    ; ret
    jmp qword [r15+240]
global _boot_kernel
_boot_kernel:
    ; sub     sp, sp, #112
    mov rax, rsp
    sub rax, 0x70
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r15+168]
    mov qword [r10+0], rax
    mov rax, qword [r15+176]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r15+184]
    mov qword [r10+0], rax
    mov rax, qword [r15+192]
    mov qword [r10+8], rax
    ; str     x25, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r15+200]
    mov qword [r10], rax
    ; lea x19, bootptr_start
    lea rax, [rel bootptr_start]
    mov qword [r15+152], rax
    ; lea x25, bootptr_end
    lea rax, [rel bootptr_end]
    mov qword [r15+200], rax
_bk_loop:
    ; cmp     x19, x25
    mov rax, qword [r15+152]
    mov rcx, qword [r15+200]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _bk_done
    cmp byte [r15+250], 0
    jne _bk_done
    ; ldr     x7, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+56], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; cbz     x7, _bk_loop
    mov rax, qword [r15+56]
    cmp rax, 0
    je _bk_loop
    ; ldr     x20, [x7]
    mov r10, qword [r15+56]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    ; cbz     x20, _bk_loop
    mov rax, qword [r15+160]
    cmp rax, 0
    je _bk_loop
    ; ldr     x21, [x7, #8]
    mov r10, qword [r15+56]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+168], rax
    ; ldr     x22, [x7, #16]
    mov r10, qword [r15+56]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+176], rax
    ; ldr     x23, [x7, #24]
    mov r10, qword [r15+56]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+184], rax
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; bl      _strlen
    lea rax, [rel xret_6]
    mov qword [r15+240], rax
    jmp _strlen
    xret_6:
    ; str     x0, [sp, #104]
    lea r10, [rsp]
    add r10, 0x68
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x0, x21
    mov rax, qword [r15+168]
    mov qword [r15+0], rax
    ; bl      _strlen
    lea rax, [rel xret_7]
    mov qword [r15+240], rax
    jmp _strlen
    xret_7:
    ; mov     x3, x0
    mov rax, qword [r15+0]
    mov qword [r15+24], rax
    ; ldr     x1, [sp, #104]
    lea r10, [rsp]
    add r10, 0x68
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; mov     x2, x21
    mov rax, qword [r15+168]
    mov qword [r15+16], rax
    ; mov     x4, x23
    mov rax, qword [r15+184]
    mov qword [r15+32], rax
    ; mov     x5, x22
    mov rax, qword [r15+176]
    mov qword [r15+40], rax
    ; bl      _header_build
    lea rax, [rel xret_8]
    mov qword [r15+240], rax
    jmp _header_build
    xret_8:
    ; mov     x21, x0
    mov rax, qword [r15+0]
    mov qword [r15+168], rax
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; bl      _boot_cache_cfa
    lea rax, [rel xret_9]
    mov qword [r15+240], rax
    jmp _boot_cache_cfa
    xret_9:
    ; b       _bk_loop
    jmp _bk_loop
_bk_done:
    ; ldr     x25, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r10]
    mov qword [r15+200], rax
    ; ldp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+184], rax
    mov qword [r15+192], rcx
    ; ldp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+168], rax
    mov qword [r15+176], rcx
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #112
    mov rax, rsp
    add rax, 0x70
    mov rsp, rax
    ; ret
    jmp qword [r15+240]
global _boot_cache_cfa
_boot_cache_cfa:
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
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
    ; mov     x20, x21
    mov rax, qword [r15+168]
    mov qword [r15+160], rax
    ; lea x1, boot_cmp_lit
    lea rax, [rel boot_cmp_lit]
    mov qword [r15+8], rax
    ; lea x2, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_10]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_10:
    ; lea x1, boot_cmp_exit
    lea rax, [rel boot_cmp_exit]
    mov qword [r15+8], rax
    ; lea x2, cfa_exit
    lea rax, [rel cfa_exit]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_11]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_11:
    ; lea x1, boot_cmp_branch
    lea rax, [rel boot_cmp_branch]
    mov qword [r15+8], rax
    ; lea x2, cfa_branch
    lea rax, [rel cfa_branch]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_12]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_12:
    ; lea x1, boot_cmp_0branch
    lea rax, [rel boot_cmp_0branch]
    mov qword [r15+8], rax
    ; lea x2, cfa_0branch
    lea rax, [rel cfa_0branch]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_13]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_13:
    ; lea x1, boot_cmp_does
    lea rax, [rel boot_cmp_does]
    mov qword [r15+8], rax
    ; lea x2, cfa_does
    lea rax, [rel cfa_does]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_14]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_14:
    ; lea x1, boot_cmp_slit
    lea rax, [rel boot_cmp_slit]
    mov qword [r15+8], rax
    ; lea x2, cfa_slit
    lea rax, [rel cfa_slit]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_15]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_15:
    ; lea x1, boot_cmp_cstr
    lea rax, [rel boot_cmp_cstr]
    mov qword [r15+8], rax
    ; lea x2, cfa_cstr
    lea rax, [rel cfa_cstr]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_16]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_16:
    ; lea x1, boot_cmp_execute
    lea rax, [rel boot_cmp_execute]
    mov qword [r15+8], rax
    ; lea x2, cfa_execute
    lea rax, [rel cfa_execute]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_17]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_17:
    ; lea x1, boot_cmp_comma
    lea rax, [rel boot_cmp_comma]
    mov qword [r15+8], rax
    ; lea x2, cfa_comma
    lea rax, [rel cfa_comma]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_18]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_18:
    ; lea x1, boot_cmp_flit
    lea rax, [rel boot_cmp_flit]
    mov qword [r15+8], rax
    ; lea x2, cfa_flit
    lea rax, [rel cfa_flit]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_19]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_19:
    ; lea x1, boot_cmp_linit
    lea rax, [rel boot_cmp_linit]
    mov qword [r15+8], rax
    ; lea x2, cfa_local_init
    lea rax, [rel cfa_local_init]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_20]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_20:
    ; lea x1, boot_cmp_lat
    lea rax, [rel boot_cmp_lat]
    mov qword [r15+8], rax
    ; lea x2, cfa_local_at
    lea rax, [rel cfa_local_at]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_21]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_21:
    ; lea x1, boot_cmp_lstore
    lea rax, [rel boot_cmp_lstore]
    mov qword [r15+8], rax
    ; lea x2, cfa_local_store
    lea rax, [rel cfa_local_store]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_22]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_22:
    ; lea x1, boot_cmp_loop
    lea rax, [rel boot_cmp_loop]
    mov qword [r15+8], rax
    ; lea x2, cfa_loop
    lea rax, [rel cfa_loop]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_23]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_23:
    ; lea x1, boot_cmp_ploop
    lea rax, [rel boot_cmp_ploop]
    mov qword [r15+8], rax
    ; lea x2, cfa_plusloop
    lea rax, [rel cfa_plusloop]
    mov qword [r15+16], rax
    ; bl      _bcc_match
    lea rax, [rel xret_24]
    mov qword [r15+240], rax
    jmp _bcc_match
    xret_24:
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
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
    ; ret
    jmp qword [r15+240]
_bcc_match:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x2, x19, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+16]
    mov qword [r10+0], rax
    mov rax, qword [r15+152]
    mov qword [r10+8], rax
    ; mov     x0, x19
    mov rax, qword [r15+152]
    mov qword [r15+0], rax
    ; bl      _zcmp
    lea rax, [rel xret_25]
    mov qword [r15+240], rax
    jmp _zcmp
    xret_25:
    ; ldp     x2, x19, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+16], rax
    mov qword [r15+152], rcx
    add rsp, 0x10
    ; cbnz    x0, _bcc_match_no
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _bcc_match_no
    ; str     x20, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r15+160]
    mov qword [r10], rax
_bcc_match_no:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_zcmp:
    ; ldrb    w2, [x0], #1
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; ldrb    w3, [x1], #1
    mov r10, qword [r15+8]
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; cmp     w2, w3
    mov eax, dword [r15+16]
    mov ecx, dword [r15+24]
    cmp eax, ecx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _zcmp_ne
    cmp byte [r15+249], 0
    je _zcmp_ne
    ; cbnz    w2, _zcmp
    mov eax, dword [r15+16]
    cmp rax, 0
    jne _zcmp
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_zcmp_ne:
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_kernel_eval:
global kernel_eval
kernel_eval:
    push r15
    sub rsp, 40
    mov [rsp], rdi
    mov [rsp+8], rsi
    mov [rsp+16], rdx
    mov [rsp+24], rcx
    call arm_load_base
    mov r15, rax
    mov rdi, [rsp]
    mov rsi, [rsp+8]
    mov rdx, [rsp+16]
    mov rcx, [rsp+24]
    add rsp, 40
    mov qword [r15+0], rdi
    mov qword [r15+8], rsi
    mov qword [r15+16], rdx
    mov qword [r15+24], rcx
    ; sub     sp, sp, #128
    mov rax, rsp
    sub rax, 0x80
    mov rsp, rax
    ; lea x16, eval_frame_sp
    lea rax, [rel eval_frame_sp]
    mov qword [r15+128], rax
    ; mov     x17, sp
    mov rax, rsp
    mov qword [r15+136], rax
    ; str     x17, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r15+136]
    mov qword [r10], rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; stp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+152]
    mov qword [r10+0], rax
    mov rax, qword [r15+160]
    mov qword [r10+8], rax
    ; stp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r15+168]
    mov qword [r10+0], rax
    mov rax, qword [r15+176]
    mov qword [r10+8], rax
    ; stp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r15+184]
    mov qword [r10+0], rax
    mov rax, qword [r15+192]
    mov qword [r10+8], rax
    ; stp     x25, x26, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r15+200]
    mov qword [r10+0], rax
    mov rax, qword [r15+208]
    mov qword [r10+8], rax
    ; stp     x27, x28, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [r15+216]
    mov qword [r10+0], rax
    mov rax, qword [r15+224]
    mov qword [r10+8], rax
    ; lea x2, kernel_inited
    lea rax, [rel kernel_inited]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbnz    x2, _eval_go
    mov rax, qword [r15+16]
    cmp rax, 0
    jne _eval_go
    ; mov     x0, #2
    mov rax, 2
    mov qword [r15+0], rax
    ; neg     x0, x0
    mov rax, qword [r15+0]
    neg rax
    mov qword [r15+0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
_eval_go:
    ; stp     x0, x1, [sp]
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10+0], rax
    mov rax, qword [r15+8]
    mov qword [r10+8], rax
    ; bl      host_eval_fault_enter
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
    call host_eval_fault_enter
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldp     x0, x1, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+0], rax
    mov qword [r15+8], rcx
    ; lea x27, up_var
    lea rax, [rel up_var]
    mov qword [r15+216], rax
    ; ldr     x27, [x27]
    mov r10, qword [r15+216]
    mov rax, qword [r10]
    mov qword [r15+216], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_3
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_3
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_3:
    ; ldr     x2, [x16, #TU_INPUT_PTR]
    mov r10, qword [r15+128]
    add r10, 0xe8
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; mov     x3, #1023
    mov rax, 0x3ff
    mov qword [r15+24], rax
    ; cmp     x1, x3
    mov rax, qword [r15+8]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _eval_len_ok
    cmp byte [r15+250], 0
    je _eval_len_ok
    cmp byte [r15+249], 0
    jne _eval_len_ok
    ; mov     x1, x3
    mov rax, qword [r15+24]
    mov qword [r15+8], rax
_eval_len_ok:
    ; mov     x3, #0
    mov rax, 0
    mov qword [r15+24], rax
    ; cbz     x0, _eval_nul
    mov rax, qword [r15+0]
    cmp rax, 0
    je _eval_nul
_eval_copy:
    ; cmp     x3, x1
    mov rax, qword [r15+24]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _eval_nul
    cmp byte [r15+250], 0
    jne _eval_nul
    ; ldrb    w4, [x0, x3]
    mov r10, qword [r15+0]
    mov rax, qword [r15+24]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; strb    w4, [x2, x3]
    mov r10, qword [r15+16]
    mov rax, qword [r15+24]
    add r10, rax
    mov eax, dword [r15+32]
    mov byte [r10], al
    ; add     x3, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; b       _eval_copy
    jmp _eval_copy
_eval_nul:
    ; strb    wzr, [x2, x3]
    mov r10, qword [r15+16]
    mov rax, qword [r15+24]
    add r10, rax
    mov byte [r10], 0
    ; mov     x0, x2
    mov rax, qword [r15+16]
    mov qword [r15+0], rax
    ; mov     x1, x3
    mov rax, qword [r15+24]
    mov qword [r15+8], rax
    ; bl      _set_source
    lea rax, [rel xret_26]
    mov qword [r15+240], rax
    jmp _set_source
    xret_26:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_5
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_5
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_5:
    ; str     xzr, [x16, #TU_SRC_ID]
    mov r10, qword [r15+128]
    add r10, 0x80
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_7
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_7
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_7:
    ; str     xzr, [x16, #TU_SRC_SP]
    mov r10, qword [r15+128]
    add r10, 0xc0
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_9
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_9
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_9:
    ; str     xzr, [x16, #TU_EVAL_SP]
    mov r10, qword [r15+128]
    add r10, 0xd0
    mov qword [r10], 0
    ; lea x2, throw_handler
    lea rax, [rel throw_handler]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; lea x2, bye_flag
    lea rax, [rel bye_flag]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; lea x2, view_src_id
    lea rax, [rel view_src_id]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; lea x2, view_id_sp
    lea rax, [rel view_id_sp]
    mov qword [r15+16], rax
    ; str     xzr, [x2]
    mov r10, qword [r15+16]
    mov qword [r10], 0
    ; bl      _vm_load
    lea rax, [rel xret_27]
    mov qword [r15+240], rax
    jmp _vm_load
    xret_27:
    ; b       _interpret_loop
    jmp _interpret_loop
_interpret_loop:
    ; lea x24, latest_var
    lea rax, [rel latest_var]
    mov qword [r15+192], rax
    ; bl      _check_stack
    lea rax, [rel xret_28]
    mov qword [r15+240], rax
    jmp _check_stack
    xret_28:
    ; bl      _file_echo_upto_cursor
    lea rax, [rel xret_29]
    mov qword [r15+240], rax
    jmp _file_echo_upto_cursor
    xret_29:
    ; bl      _next_word
    lea rax, [rel xret_30]
    mov qword [r15+240], rax
    jmp _next_word
    xret_30:
    ; cbz     x1, _interpret_empty
    mov rax, qword [r15+8]
    cmp rax, 0
    je _interpret_empty
    ; mov     x25, x0
    mov rax, qword [r15+0]
    mov qword [r15+200], rax
    ; mov     x26, x1
    mov rax, qword [r15+8]
    mov qword [r15+208], rax
    ; b       _try_find
    jmp _try_find
_try_find:
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbz     x2, _try_find_dict
    mov rax, qword [r15+16]
    cmp rax, 0
    je _try_find_dict
    ; mov     x0, x25
    mov rax, qword [r15+200]
    mov qword [r15+0], rax
    ; mov     x1, x26
    mov rax, qword [r15+208]
    mov qword [r15+8], rax
    ; bl      _local_lookup
    lea rax, [rel xret_31]
    mov qword [r15+240], rax
    jmp _local_lookup
    xret_31:
    ; cmp     x0, #-1
    mov rax, qword [r15+0]
    cmp rax, -1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _try_find_dict
    cmp byte [r15+249], 0
    jne _try_find_dict
    ; mov     x25, x0
    mov rax, qword [r15+0]
    mov qword [r15+200], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_32]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_32:
    ; mov     x0, x25
    mov rax, qword [r15+200]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_33]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_33:
    ; lea x0, cfa_local_at
    lea rax, [rel cfa_local_at]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_34]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_34:
    ; b       _interpret_loop
    jmp _interpret_loop
_try_find_dict:
    ; mov     x0, x25
    mov rax, qword [r15+200]
    mov qword [r15+0], rax
    ; mov     x1, x26
    mov rax, qword [r15+208]
    mov qword [r15+8], rax
    ; bl      _find_word
    lea rax, [rel xret_35]
    mov qword [r15+240], rax
    jmp _find_word
    xret_35:
    ; cbz     x0, _try_number_after_find
    mov rax, qword [r15+0]
    cmp rax, 0
    je _try_number_after_find
    ; mov     x2, x0
    mov rax, qword [r15+0]
    mov qword [r15+16], rax
    ; mov     x3, x1
    mov rax, qword [r15+8]
    mov qword [r15+24], rax
    ; tbnz    x3, #63, _exec_found
    mov rax, qword [r15+24]
    bt rax, 63
    jc _exec_found
    ; lea x6, state_var
    lea rax, [rel state_var]
    mov qword [r15+48], rax
    ; ldr     x6, [x6]
    mov r10, qword [r15+48]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; cbnz    x6, _compile_entry
    mov rax, qword [r15+48]
    cmp rax, 0
    jne _compile_entry
_exec_found:
    ; lea x19, restart_cell
    lea rax, [rel restart_cell]
    mov qword [r15+152], rax
    ; mov     x21, x2
    mov rax, qword [r15+16]
    mov qword [r15+168], rax
    ; ldr     x5, [x21]
    mov r10, qword [r15+168]
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; br      x5
    mov rax, qword [r15+40]
    jmp rax
_compile_entry:
    ; mov     x0, x2
    mov rax, qword [r15+16]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_36]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_36:
    ; b       _interpret_loop
    jmp _interpret_loop
_try_number_after_find:
    ; mov     x0, x25
    mov rax, qword [r15+200]
    mov qword [r15+0], rax
    ; mov     x1, x26
    mov rax, qword [r15+208]
    mov qword [r15+8], rax
    ; bl      _parse_number
    lea rax, [rel xret_37]
    mov qword [r15+240], rax
    jmp _parse_number
    xret_37:
    ; cbz     x0, _try_charlit
    mov rax, qword [r15+0]
    cmp rax, 0
    je _try_charlit
    ; cmp     x0, #2
    mov rax, qword [r15+0]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _number_double
    cmp byte [r15+249], 0
    jne _number_double
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbnz    x2, _compile_lit
    mov rax, qword [r15+16]
    cmp rax, 0
    jne _compile_lit
    ; mov     x0, x1
    mov rax, qword [r15+8]
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
    ; b       _interpret_loop
    jmp _interpret_loop
_compile_lit:
    ; mov     x25, x1
    mov rax, qword [r15+8]
    mov qword [r15+200], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_38]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_38:
    ; mov     x0, x25
    mov rax, qword [r15+200]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_39]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_39:
    ; b       _interpret_loop
    jmp _interpret_loop
_number_double:
    ; lea x3, state_var
    lea rax, [rel state_var]
    mov qword [r15+24], rax
    ; ldr     x3, [x3]
    mov r10, qword [r15+24]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cbnz    x3, _compile_dlit
    mov rax, qword [r15+24]
    cmp rax, 0
    jne _compile_dlit
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; str     x1, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x20, x2
    mov rax, qword [r15+16]
    mov qword [r15+160], rax
    ; b       _interpret_loop
    jmp _interpret_loop
_compile_dlit:
    ; stp     x1, x2, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+8]
    mov qword [r10+0], rax
    mov rax, qword [r15+16]
    mov qword [r10+8], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_40]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_40:
    ; ldr     x0, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_41]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_41:
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_42]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_42:
    ; ldr     x0, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_43]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_43:
    ; add     sp, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov rsp, rax
    ; b       _interpret_loop
    jmp _interpret_loop
_try_charlit:
    ; cmp     x26, #3
    mov rax, qword [r15+208]
    cmp rax, 3
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _try_float
    cmp byte [r15+249], 0
    je _try_float
    ; ldrb    w2, [x25]
    mov r10, qword [r15+200]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; cmp     w2, #39
    mov eax, dword [r15+16]
    cmp eax, 0x27
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _try_float
    cmp byte [r15+249], 0
    je _try_float
    ; ldrb    w2, [x25, #2]
    mov r10, qword [r15+200]
    add r10, 2
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; cmp     w2, #39
    mov eax, dword [r15+16]
    cmp eax, 0x27
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _try_float
    cmp byte [r15+249], 0
    je _try_float
    ; ldrb    w1, [x25, #1]
    mov r10, qword [r15+200]
    add r10, 1
    movzx eax, byte [r10]
    mov qword [r15+8], rax
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbnz    x2, _compile_lit
    mov rax, qword [r15+16]
    cmp rax, 0
    jne _compile_lit
    ; mov     x0, x1
    mov rax, qword [r15+8]
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
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; mov     x0, #100
    mov rax, 0x64
    mov qword [r15+0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [r15+8], rax
    ; mov     x2, x26
    mov rax, qword [r15+208]
    mov qword [r15+16], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [r15+24], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [r15+32], rax
    ; mov     x5, x25
    mov rax, qword [r15+200]
    mov qword [r15+40], rax
    ; add     x6, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [r15+48], rax
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
    call host_float_op
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x6, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; ldr     x7, [sp, #56]
    lea r10, [rsp]
    add r10, 0x38
    mov rax, qword [r10]
    mov qword [r15+56], rax
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
    ; cbz     x6, _interpret_undef
    mov rax, qword [r15+48]
    cmp rax, 0
    je _interpret_undef
    ; mov     x26, x7
    mov rax, qword [r15+56]
    mov qword [r15+208], rax
    ; lea x2, state_var
    lea rax, [rel state_var]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbnz    x2, _compile_flit
    mov rax, qword [r15+16]
    cmp rax, 0
    jne _compile_flit
    ; mov     x1, x26
    mov rax, qword [r15+208]
    mov qword [r15+8], rax
    ; mov     x0, #101
    mov rax, 0x65
    mov qword [r15+0], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [r15+16], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [r15+24], rax
    ; mov     x4, #0
    mov rax, 0
    mov qword [r15+32], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [r15+40], rax
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
    ; add     x6, sp, #48
    mov rax, rsp
    add rax, 0x30
    mov qword [r15+48], rax
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
    call host_float_op
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
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
    ; b       _interpret_loop
    jmp _interpret_loop
_compile_flit:
    ; mov     x25, x26
    mov rax, qword [r15+208]
    mov qword [r15+200], rax
    ; lea x0, cfa_flit
    lea rax, [rel cfa_flit]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_44]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_44:
    ; mov     x0, x25
    mov rax, qword [r15+200]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_45]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_45:
    ; b       _interpret_loop
    jmp _interpret_loop
_interpret_undef:
    ; mov     x0, x25
    mov rax, qword [r15+200]
    mov qword [r15+0], rax
    ; mov     x1, x26
    mov rax, qword [r15+208]
    mov qword [r15+8], rax
    ; bl      emit_str
    lea rax, [rel xret_46]
    mov qword [r15+240], rax
    jmp emit_str
    xret_46:
    ; lea x0, msg_huh
    lea rax, [rel msg_huh]
    mov qword [r15+0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_47]
    mov qword [r15+240], rax
    jmp emit_cstr
    xret_47:
    ; lea x7, throw_handler
    lea rax, [rel throw_handler]
    mov qword [r15+56], rax
    ; ldr     x1, [x7]
    mov r10, qword [r15+56]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, _undef_abandon
    mov rax, qword [r15+8]
    cmp rax, 0
    je _undef_abandon
    ; mov     x20, #-13
    mov rax, -13
    mov qword [r15+160], rax
    ; b       XTHROW
    jmp XTHROW
_undef_abandon:
    ; lea x22, data_stack
    lea rax, [rel data_stack]
    mov qword [r15+176], rax
    ; add     x22, x22, #1, lsl #12
    mov rax, qword [r15+176]
    add rax, 0x1000
    mov qword [r15+176], rax
    ; mov     x20, #0
    mov rax, 0
    mov qword [r15+160], rax
    ; bl      _local_compile_reset
    lea rax, [rel xret_48]
    mov qword [r15+240], rax
    jmp _local_compile_reset
    xret_48:
    ; lea x0, noname_xt
    lea rax, [rel noname_xt]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; b       _do_quit
    jmp _do_quit
_interpret_empty:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_13
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_13
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_13:
    ; ldr     x0, [x16, #TU_LINE_MODE]
    mov r10, qword [r15+128]
    add r10, 0x90
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _ie_whole
    mov rax, qword [r15+0]
    cmp rax, 0
    je _ie_whole
    ; bl      _take_line
    lea rax, [rel xret_49]
    mov qword [r15+240], rax
    jmp _take_line
    xret_49:
    ; cbnz    x0, _interpret_loop
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _interpret_loop
    ; b       _ie_pop
    jmp _ie_pop
_ie_whole:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_15
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_15
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_15:
    ; ldr     x0, [x16, #TU_SRC_SP]
    mov r10, qword [r15+128]
    add r10, 0xc0
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _embed_finish
    mov rax, qword [r15+0]
    cmp rax, 0
    je _embed_finish
_ie_pop:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_17
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_17
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_17:
    ; ldr     x25, [x16, #TU_SRC_ID]
    mov r10, qword [r15+128]
    add r10, 0x80
    mov rax, qword [r10]
    mov qword [r15+200], rax
    ; bl      _pop_source
    lea rax, [rel xret_50]
    mov qword [r15+240], rax
    jmp _pop_source
    xret_50:
    ; cbz     x0, _embed_finish
    mov rax, qword [r15+0]
    cmp rax, 0
    je _embed_finish
    ; cmp     x25, #0
    mov rax, qword [r15+200]
    cmp rax, 0
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.gt    _ie_view_pop
    cmp byte [r15+249], 0
    jne xsk_51
    mov r11b, byte [r15+248]
    cmp r11b, byte [r15+251]
    je _ie_view_pop
    xsk_51:
    ; cmn     x25, #2
    mov rax, qword [r15+200]
    add rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.ne    _ie_after_view
    cmp byte [r15+249], 0
    je _ie_after_view
_ie_view_pop:
    ; bl      _view_pop_src_id
    lea rax, [rel xret_52]
    mov qword [r15+240], rax
    jmp _view_pop_src_id
    xret_52:
_ie_after_view:
    ; cmn     x25, #1
    mov rax, qword [r15+200]
    add rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.eq    _ie_resume
    cmp byte [r15+249], 0
    jne _ie_resume
    ; cmn     x25, #2
    mov rax, qword [r15+200]
    add rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.ne    _interpret_loop
    cmp byte [r15+249], 0
    je _interpret_loop
_ie_resume:
    ; bl      _eval_resume_pop
    lea rax, [rel xret_53]
    mov qword [r15+240], rax
    jmp _eval_resume_pop
    xret_53:
    ; cbz     x0, _interpret_loop
    mov rax, qword [r15+0]
    cmp rax, 0
    je _interpret_loop
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
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
_do_quit:
    ; lea x23, return_stack
    lea rax, [rel return_stack]
    mov qword [r15+184], rax
    ; add     x23, x23, #1, lsl #12
    mov rax, qword [r15+184]
    add rax, 0x1000
    mov qword [r15+184], rax
    ; lea x0, throw_handler
    lea rax, [rel throw_handler]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_20
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_20
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_20:
    ; str     xzr, [x16, #TU_SRC_SP]
    mov r10, qword [r15+128]
    add r10, 0xc0
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_22
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_22
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_22:
    ; str     xzr, [x16, #TU_EVAL_SP]
    mov r10, qword [r15+128]
    add r10, 0xd0
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_24
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_24
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_24:
    ; str     xzr, [x16, #TU_SRC_ID]
    mov r10, qword [r15+128]
    add r10, 0x80
    mov qword [r10], 0
    ; lea x0, view_src_id
    lea rax, [rel view_src_id]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, view_id_sp
    lea rax, [rel view_id_sp]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_26
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_26
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_26:
    ; str     xzr, [x16, #TU_LINE_MODE]
    mov r10, qword [r15+128]
    add r10, 0x90
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_28
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_28
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_28:
    ; str     xzr, [x16, #TU_BLK]
    mov r10, qword [r15+128]
    add r10, 0x88
    mov qword [r10], 0
    ; lea x0, local_frame_depth
    lea rax, [rel local_frame_depth]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; bl      _vm_save
    lea rax, [rel xret_54]
    mov qword [r15+240], rax
    jmp _vm_save
    xret_54:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
_embed_finish:
    ; bl      _record_words_user_base_once
    lea rax, [rel xret_55]
    mov qword [r15+240], rax
    jmp _record_words_user_base_once
    xret_55:
    ; bl      _vm_save
    lea rax, [rel xret_56]
    mov qword [r15+240], rax
    jmp _vm_save
    xret_56:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
_quit_exit:
    ; b       _embed_bye_return
    jmp _embed_bye_return
_embed_bye_return:
    ; bl      _vm_save
    lea rax, [rel xret_57]
    mov qword [r15+240], rax
    jmp _vm_save
    xret_57:
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
eval_fault_resume:
    ; lea x16, eval_frame_sp
    lea rax, [rel eval_frame_sp]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
    ; mov     sp, x16
    mov rax, qword [r15+128]
    mov rsp, rax
    ; bl      host_eval_fault_leave
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
    call host_eval_fault_leave
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; bl      _vm_reset_stacks
    lea rax, [rel xret_58]
    mov qword [r15+240], rax
    jmp _vm_reset_stacks
    xret_58:
    ; mov     x28, #0
    mov rax, 0
    mov qword [r15+224], rax
    ; lea x1, debug_armed
    lea rax, [rel debug_armed]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, debug_busy
    lea rax, [rel debug_busy]
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
    ; lea x1, debug_floor
    lea rax, [rel debug_floor]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x1, throw_handler
    lea rax, [rel throw_handler]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; lea x0, msg_memfault
    lea rax, [rel msg_memfault]
    mov qword [r15+0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_59]
    mov qword [r15+240], rax
    jmp emit_cstr
    xret_59:
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
    ; bl      _vm_save
    lea rax, [rel xret_60]
    mov qword [r15+240], rax
    jmp _vm_save
    xret_60:
    ; mov     x0, #-1
    mov rax, -1
    mov qword [r15+0], rax
    ; b       _embed_ret_x0
    jmp _embed_ret_x0
_embed_ret_x0:
    ; str     x0, [sp]
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; bl      host_eval_fault_leave
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
    call host_eval_fault_leave
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x0, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldp     x27, x28, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+216], rax
    mov qword [r15+224], rcx
    ; ldp     x25, x26, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+200], rax
    mov qword [r15+208], rcx
    ; ldp     x23, x24, [sp, #80]
    lea r10, [rsp]
    add r10, 0x50
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+184], rax
    mov qword [r15+192], rcx
    ; ldp     x21, x22, [sp, #64]
    lea r10, [rsp]
    add r10, 0x40
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+168], rax
    mov qword [r15+176], rcx
    ; ldp     x19, x20, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+152], rax
    mov qword [r15+160], rcx
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #128
    mov rax, rsp
    add rax, 0x80
    mov rsp, rax
    ; ret
    mov rax, qword [r15+0]
    pop r15
    ret
_check_stack:
    ; mov     x0, x27
    mov rax, qword [r15+216]
    mov qword [r15+0], rax
    ; cbnz    x0, _cs_have
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _cs_have
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
_cs_have:
    ; cbz     x0, _cs_bss
    mov rax, qword [r15+0]
    cmp rax, 0
    je _cs_bss
    ; ldr     x1, [x0, #48]
    mov r10, qword [r15+0]
    add r10, 0x30
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; sub     x0, x1, #1, lsl #12
    mov rax, qword [r15+8]
    sub rax, 0x1000
    mov qword [r15+0], rax
    ; cmp     x22, x1
    mov rax, qword [r15+176]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _stack_underflow
    cmp byte [r15+250], 0
    je xsk_61
    cmp byte [r15+249], 0
    je _stack_underflow
    xsk_61:
    ; cmp     x22, x0
    mov rax, qword [r15+176]
    mov rcx, qword [r15+0]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _stack_overflow
    cmp byte [r15+250], 0
    je _stack_overflow
    ; ret
    jmp qword [r15+240]
_cs_bss:
    ; lea x0, data_stack
    lea rax, [rel data_stack]
    mov qword [r15+0], rax
    ; add     x1, x0, #1, lsl #12
    mov rax, qword [r15+0]
    add rax, 0x1000
    mov qword [r15+8], rax
    ; cmp     x22, x1
    mov rax, qword [r15+176]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _stack_underflow
    cmp byte [r15+250], 0
    je xsk_62
    cmp byte [r15+249], 0
    je _stack_underflow
    xsk_62:
    ; cmp     x22, x0
    mov rax, qword [r15+176]
    mov rcx, qword [r15+0]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _stack_overflow
    cmp byte [r15+250], 0
    je _stack_overflow
    ; ret
    jmp qword [r15+240]
_stack_underflow:
    ; lea x0, msg_underflow
    lea rax, [rel msg_underflow]
    mov qword [r15+0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_63]
    mov qword [r15+240], rax
    jmp emit_cstr
    xret_63:
    ; b       _stack_reset_abandon
    jmp _stack_reset_abandon
_stack_overflow:
    ; lea x0, msg_overflow
    lea rax, [rel msg_overflow]
    mov qword [r15+0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_64]
    mov qword [r15+240], rax
    jmp emit_cstr
    xret_64:
_stack_reset_abandon:
    ; b       _undef_abandon
    jmp _undef_abandon
_file_echo_upto_cursor:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; lea x0, file_echo
    lea rax, [rel file_echo]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _fe_done
    mov rax, qword [r15+0]
    cmp rax, 0
    je _fe_done
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_30
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_30
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_30:
    ; ldr     x0, [x16, #TU_SRC_ID]
    mov r10, qword [r15+128]
    add r10, 0x80
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cmp     x0, #0
    mov rax, qword [r15+0]
    cmp rax, 0
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.gt    _fe_on
    cmp byte [r15+249], 0
    jne xsk_65
    mov r11b, byte [r15+248]
    cmp r11b, byte [r15+251]
    je _fe_on
    xsk_65:
    ; cmn     x0, #2
    mov rax, qword [r15+0]
    add rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.ne    _fe_done
    cmp byte [r15+249], 0
    je _fe_done
_fe_on:
    ; sub     sp, sp, #48
    mov rax, rsp
    sub rax, 0x30
    mov rsp, rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_32
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_32
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_32:
    ; ldr     x0, [x16, #TU_LINE_MODE]
    mov r10, qword [r15+128]
    add r10, 0x90
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _fe_plain
    mov rax, qword [r15+0]
    cmp rax, 0
    je _fe_plain
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_34
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_34
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_34:
    ; ldr     x1, [x16, #TU_LINE_ORIGIN]
    mov r10, qword [r15+128]
    add r10, 0x98
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_36
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_36
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_36:
    ; ldr     x2, [x16, #TU_LINE_LIMIT]
    mov r10, qword [r15+128]
    add r10, 0xa0
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; b       _fe_bounds
    jmp _fe_bounds
_fe_plain:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_38
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_38
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_38:
    ; ldr     x1, [x16, #TU_SRC_ADDR]
    mov r10, qword [r15+128]
    add r10, 0x68
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_40
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_40
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_40:
    ; ldr     x2, [x16, #TU_SRC_ADDR]
    mov r10, qword [r15+128]
    add r10, 0x68
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; ldr     x17, [x16, #TU_SRC_LEN]
    mov r10, qword [r15+128]
    add r10, 0x70
    mov rax, qword [r10]
    mov qword [r15+136], rax
    ; add     x2, x2, x17
    mov rax, qword [r15+16]
    mov rcx, qword [r15+136]
    add rax, rcx
    mov qword [r15+16], rax
_fe_bounds:
    ; stp     x1, x2, [sp]
    lea r10, [rsp]
    mov rax, qword [r15+8]
    mov qword [r10+0], rax
    mov rax, qword [r15+16]
    mov qword [r10+8], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_42
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_42
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_42:
    ; ldr     x0, [x16, #TU_WORD_CURSOR]
    mov r10, qword [r15+128]
    add r10, 0xb8
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cmp     x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_clamp_hi
    cmp byte [r15+250], 0
    jne _fe_clamp_hi
    ; mov     x0, x1
    mov rax, qword [r15+8]
    mov qword [r15+0], rax
_fe_clamp_hi:
    ; cmp     x0, x2
    mov rax, qword [r15+0]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _fe_skip
    cmp byte [r15+250], 0
    je _fe_skip
    cmp byte [r15+249], 0
    jne _fe_skip
    ; mov     x0, x2
    mov rax, qword [r15+16]
    mov qword [r15+0], rax
_fe_skip:
    ; cmp     x0, x2
    mov rax, qword [r15+0]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_eol
    cmp byte [r15+250], 0
    jne _fe_eol
    ; ldrb    w3, [x0]
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    ; cbz     w3, _fe_eol
    mov eax, dword [r15+24]
    cmp rax, 0
    je _fe_eol
    ; cmp     w3, #32
    mov eax, dword [r15+24]
    cmp eax, 0x20
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_skip1
    cmp byte [r15+249], 0
    jne _fe_skip1
    ; cmp     w3, #9
    mov eax, dword [r15+24]
    cmp eax, 9
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_skip1
    cmp byte [r15+249], 0
    jne _fe_skip1
    ; cmp     w3, #10
    mov eax, dword [r15+24]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_skip1
    cmp byte [r15+249], 0
    jne _fe_skip1
    ; cmp     w3, #13
    mov eax, dword [r15+24]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_skip1
    cmp byte [r15+249], 0
    jne _fe_skip1
    ; b       _fe_eol
    jmp _fe_eol
_fe_skip1:
    ; add     x0, x0, #1
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; b       _fe_skip
    jmp _fe_skip
_fe_eol:
    ; mov     x3, x0
    mov rax, qword [r15+0]
    mov qword [r15+24], rax
_fe_eol_scan:
    ; cmp     x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_eol_ok
    cmp byte [r15+250], 0
    jne _fe_eol_ok
    ; ldrb    w4, [x3]
    mov r10, qword [r15+24]
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cbz     w4, _fe_eol_ok
    mov eax, dword [r15+32]
    cmp rax, 0
    je _fe_eol_ok
    ; cmp     w4, #10
    mov eax, dword [r15+32]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_eol_ok
    cmp byte [r15+249], 0
    jne _fe_eol_ok
    ; cmp     w4, #13
    mov eax, dword [r15+32]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_eol_ok
    cmp byte [r15+249], 0
    jne _fe_eol_ok
    ; add     x3, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; b       _fe_eol_scan
    jmp _fe_eol_scan
_fe_eol_ok:
    ; str     x3, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r15+24]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_44
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_44
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_44:
    ; ldr     x0, [x16, #TU_ECHO_POS]
    mov r10, qword [r15+128]
    add r10, 0xb0
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x1, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cmp     x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_pos_hi
    cmp byte [r15+250], 0
    jne _fe_pos_hi
    ; mov     x0, x1
    mov rax, qword [r15+8]
    mov qword [r15+0], rax
_fe_pos_hi:
    ; ldr     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cmp     x0, x2
    mov rax, qword [r15+0]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _fe_pos_ok
    cmp byte [r15+250], 0
    je _fe_pos_ok
    cmp byte [r15+249], 0
    jne _fe_pos_ok
    ; mov     x0, x2
    mov rax, qword [r15+16]
    mov qword [r15+0], rax
_fe_pos_ok:
    ; str     x0, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; ldr     x3, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cmp     x0, x3
    mov rax, qword [r15+0]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_drop
    cmp byte [r15+250], 0
    jne _fe_drop
_fe_line:
    ; ldr     x0, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x3, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cmp     x0, x3
    mov rax, qword [r15+0]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_drop
    cmp byte [r15+250], 0
    jne _fe_drop
    ; ldr     x1, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cmp     x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_num
    cmp byte [r15+249], 0
    jne _fe_num
    ; ldrb    w4, [x0, #-1]
    mov r10, qword [r15+0]
    add r10, -1
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cmp     w4, #10
    mov eax, dword [r15+32]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_num
    cmp byte [r15+249], 0
    jne _fe_num
    ; cmp     w4, #13
    mov eax, dword [r15+32]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_num
    cmp byte [r15+249], 0
    jne _fe_num
    ; b       _fe_text
    jmp _fe_text
_fe_num:
    ; mov     x4, #1
    mov rax, 1
    mov qword [r15+32], rax
    ; mov     x3, x1
    mov rax, qword [r15+8]
    mov qword [r15+24], rax
_fe_count:
    ; cmp     x3, x0
    mov rax, qword [r15+24]
    mov rcx, qword [r15+0]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_count_done
    cmp byte [r15+250], 0
    jne _fe_count_done
    ; ldrb    w5, [x3]
    mov r10, qword [r15+24]
    movzx eax, byte [r10]
    mov qword [r15+40], rax
    ; cmp     w5, #10
    mov eax, dword [r15+40]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _fe_count_next
    cmp byte [r15+249], 0
    je _fe_count_next
    ; add     x4, x4, #1
    mov rax, qword [r15+32]
    add rax, 1
    mov qword [r15+32], rax
_fe_count_next:
    ; add     x3, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; b       _fe_count
    jmp _fe_count
_fe_count_done:
    ; mov     x0, x4
    mov rax, qword [r15+32]
    mov qword [r15+0], rax
    ; bl      _fe_emit_lineno
    lea rax, [rel xret_66]
    mov qword [r15+240], rax
    jmp _fe_emit_lineno
    xret_66:
_fe_text:
    ; ldr     x0, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; mov     x3, x0
    mov rax, qword [r15+0]
    mov qword [r15+24], rax
_fe_text_scan:
    ; cmp     x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_text_write
    cmp byte [r15+250], 0
    jne _fe_text_write
    ; ldrb    w4, [x3]
    mov r10, qword [r15+24]
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cbz     w4, _fe_text_write
    mov eax, dword [r15+32]
    cmp rax, 0
    je _fe_text_write
    ; cmp     w4, #10
    mov eax, dword [r15+32]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_text_write
    cmp byte [r15+249], 0
    jne _fe_text_write
    ; cmp     w4, #13
    mov eax, dword [r15+32]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_text_write
    cmp byte [r15+249], 0
    jne _fe_text_write
    ; add     x3, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; b       _fe_text_scan
    jmp _fe_text_scan
_fe_text_write:
    ; mov     x1, x3
    mov rax, qword [r15+24]
    mov qword [r15+8], rax
    ; ldr     x0, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; subs    x1, x1, x0
    mov rax, qword [r15+8]
    mov rcx, qword [r15+0]
    sub rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    mov qword [r15+8], rax
    ; b.eq    _fe_advance
    cmp byte [r15+249], 0
    jne _fe_advance
    ; str     x3, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+24]
    mov qword [r10], rax
    ; bl      emit_str
    lea rax, [rel xret_67]
    mov qword [r15+240], rax
    jmp emit_str
    xret_67:
    ; ldr     x3, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov qword [r15+24], rax
_fe_advance:
    ; ldr     x2, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; mov     x1, x3
    mov rax, qword [r15+24]
    mov qword [r15+8], rax
    ; cmp     x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_store
    cmp byte [r15+250], 0
    jne _fe_store
    ; ldrb    w0, [x3]
    mov r10, qword [r15+24]
    movzx eax, byte [r10]
    mov qword [r15+0], rax
    ; cmp     w0, #10
    mov eax, dword [r15+0]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _fe_one
    cmp byte [r15+249], 0
    jne _fe_one
    ; cmp     w0, #13
    mov eax, dword [r15+0]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _fe_store
    cmp byte [r15+249], 0
    je _fe_store
    ; add     x1, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+8], rax
    ; cmp     x1, x2
    mov rax, qword [r15+8]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _fe_store
    cmp byte [r15+250], 0
    jne _fe_store
    ; ldrb    w0, [x1]
    mov r10, qword [r15+8]
    movzx eax, byte [r10]
    mov qword [r15+0], rax
    ; cmp     w0, #10
    mov eax, dword [r15+0]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _fe_store
    cmp byte [r15+249], 0
    je _fe_store
    ; add     x1, x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; b       _fe_store
    jmp _fe_store
_fe_one:
    ; add     x1, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+8], rax
_fe_store:
    ; str     x1, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_46
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_46
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_46:
    ; str     x1, [x16, #TU_ECHO_POS]
    mov r10, qword [r15+128]
    add r10, 0xb0
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x0, #10
    mov rax, 0xa
    mov qword [r15+0], rax
    ; bl      _putchar
    lea rax, [rel xret_68]
    mov qword [r15+240], rax
    jmp _putchar
    xret_68:
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
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_fe_emit_lineno:
    ; stp     x29, x30, [sp, #-32]!
    add rsp, -32
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; str     x0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; mov     x2, #10
    mov rax, 0xa
    mov qword [r15+16], rax
_fe_digits:
    ; cmp     x0, x2
    mov rax, qword [r15+0]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _fe_pad
    cmp byte [r15+250], 0
    je _fe_pad
    ; add     x1, x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; mov     x3, #10
    mov rax, 0xa
    mov qword [r15+24], rax
    ; mul     x2, x2, x3
    mov rax, qword [r15+16]
    mov rcx, qword [r15+24]
    imul rax, rcx
    mov qword [r15+16], rax
    ; cmp     x1, #5
    mov rax, qword [r15+8]
    cmp rax, 5
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _fe_digits
    cmp byte [r15+250], 0
    je _fe_digits
_fe_pad:
    ; mov     x2, #5
    mov rax, 5
    mov qword [r15+16], rax
    ; subs    x2, x2, x1
    mov rax, qword [r15+16]
    mov rcx, qword [r15+8]
    sub rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    mov qword [r15+16], rax
    ; b.ls    _fe_print
    cmp byte [r15+250], 0
    je _fe_print
    cmp byte [r15+249], 0
    jne _fe_print
_fe_spaces:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [r15+0], rax
    ; str     x2, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r15+16]
    mov qword [r10], rax
    ; bl      _putchar
    lea rax, [rel xret_69]
    mov qword [r15+240], rax
    jmp _putchar
    xret_69:
    ; ldr     x2, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; subs    x2, x2, #1
    mov rax, qword [r15+16]
    sub rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    mov qword [r15+16], rax
    ; b.ne    _fe_spaces
    cmp byte [r15+249], 0
    je _fe_spaces
_fe_print:
    ; ldr     x0, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _print_unsigned
    lea rax, [rel xret_70]
    mov qword [r15+240], rax
    jmp _print_unsigned
    xret_70:
    ; mov     x0, #124
    mov rax, 0x7c
    mov qword [r15+0], rax
    ; bl      _putchar
    lea rax, [rel xret_71]
    mov qword [r15+240], rax
    jmp _putchar
    xret_71:
    ; mov     x0, #32
    mov rax, 0x20
    mov qword [r15+0], rax
    ; bl      _putchar
    lea rax, [rel xret_72]
    mov qword [r15+240], rax
    jmp _putchar
    xret_72:
    ; ldp     x29, x30, [sp], #32
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x20
    ; ret
    jmp qword [r15+240]
_set_source:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_48
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_48
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_48:
    ; str     x0, [x16, #TU_SRC_ADDR]
    mov r10, qword [r15+128]
    add r10, 0x68
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_50
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_50
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_50:
    ; str     x1, [x16, #TU_SRC_LEN]
    mov r10, qword [r15+128]
    add r10, 0x70
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_52
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_52
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_52:
    ; str     xzr, [x16, #TU_TO_IN]
    mov r10, qword [r15+128]
    add r10, 0x78
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_54
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_54
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_54:
    ; str     x0, [x16, #TU_WORD_CURSOR]
    mov r10, qword [r15+128]
    add r10, 0xb8
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_56
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_56
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_56:
    ; str     x0, [x16, #TU_ECHO_POS]
    mov r10, qword [r15+128]
    add r10, 0xb0
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_58
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_58
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_58:
    ; str     xzr, [x16, #TU_LINE_MODE]
    mov r10, qword [r15+128]
    add r10, 0x90
    mov qword [r10], 0
    ; ret
    jmp qword [r15+240]
_arm_lines:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_60
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_60
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_60:
    ; str     x0, [x16, #TU_ECHO_POS]
    mov r10, qword [r15+128]
    add r10, 0xb0
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_62
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_62
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_62:
    ; str     x0, [x16, #TU_LINE_ORIGIN]
    mov r10, qword [r15+128]
    add r10, 0x98
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; add     x3, x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    add rax, rcx
    mov qword [r15+24], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_64
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_64
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_64:
    ; str     x3, [x16, #TU_LINE_LIMIT]
    mov r10, qword [r15+128]
    add r10, 0xa0
    mov rax, qword [r15+24]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_66
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_66
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_66:
    ; str     x0, [x16, #TU_LINE_NEXT]
    mov r10, qword [r15+128]
    add r10, 0xa8
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x3, #1
    mov rax, 1
    mov qword [r15+24], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_68
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_68
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_68:
    ; str     x3, [x16, #TU_LINE_MODE]
    mov r10, qword [r15+128]
    add r10, 0x90
    mov rax, qword [r15+24]
    mov qword [r10], rax
    ; ret
    jmp qword [r15+240]
_take_line:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_70
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_70
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_70:
    ; ldr     x0, [x16, #TU_LINE_NEXT]
    mov r10, qword [r15+128]
    add r10, 0xa8
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_72
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_72
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_72:
    ; ldr     x3, [x16, #TU_LINE_LIMIT]
    mov r10, qword [r15+128]
    add r10, 0xa0
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cmp     x0, x3
    mov rax, qword [r15+0]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _tl_eof
    cmp byte [r15+250], 0
    jne _tl_eof
    ; mov     x1, x0
    mov rax, qword [r15+0]
    mov qword [r15+8], rax
_tl_scan:
    ; cmp     x1, x3
    mov rax, qword [r15+8]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _tl_eos
    cmp byte [r15+250], 0
    jne _tl_eos
    ; ldrb    w4, [x1]
    mov r10, qword [r15+8]
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cmp     w4, #10
    mov eax, dword [r15+32]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _tl_lf
    cmp byte [r15+249], 0
    jne _tl_lf
    ; cmp     w4, #13
    mov eax, dword [r15+32]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _tl_cr
    cmp byte [r15+249], 0
    jne _tl_cr
    ; add     x1, x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; b       _tl_scan
    jmp _tl_scan
_tl_lf:
    ; mov     x5, x1
    mov rax, qword [r15+8]
    mov qword [r15+40], rax
    ; add     x1, x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; b       _tl_set
    jmp _tl_set
_tl_cr:
    ; mov     x5, x1
    mov rax, qword [r15+8]
    mov qword [r15+40], rax
    ; add     x1, x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; cmp     x1, x3
    mov rax, qword [r15+8]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _tl_set
    cmp byte [r15+250], 0
    jne _tl_set
    ; ldrb    w4, [x1]
    mov r10, qword [r15+8]
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cmp     w4, #10
    mov eax, dword [r15+32]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _tl_set
    cmp byte [r15+249], 0
    je _tl_set
    ; add     x1, x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; b       _tl_set
    jmp _tl_set
_tl_eos:
    ; mov     x5, x1
    mov rax, qword [r15+8]
    mov qword [r15+40], rax
_tl_set:
    ; sub     x6, x5, x0
    mov rax, qword [r15+40]
    mov rcx, qword [r15+0]
    sub rax, rcx
    mov qword [r15+48], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_74
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_74
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_74:
    ; str     x1, [x16, #TU_LINE_NEXT]
    mov r10, qword [r15+128]
    add r10, 0xa8
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_76
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_76
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_76:
    ; str     x0, [x16, #TU_SRC_ADDR]
    mov r10, qword [r15+128]
    add r10, 0x68
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_78
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_78
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_78:
    ; str     x6, [x16, #TU_SRC_LEN]
    mov r10, qword [r15+128]
    add r10, 0x70
    mov rax, qword [r15+48]
    mov qword [r10], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_80
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_80
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_80:
    ; str     xzr, [x16, #TU_TO_IN]
    mov r10, qword [r15+128]
    add r10, 0x78
    mov qword [r10], 0
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_82
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_82
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_82:
    ; str     x0, [x16, #TU_WORD_CURSOR]
    mov r10, qword [r15+128]
    add r10, 0xb8
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_tl_eof:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_push_source:
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_84
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_84
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_84:
    ; add     x0, x16, #TU_SRC_SP
    mov rax, qword [r15+128]
    add rax, 0xc0
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
    ; b.hs    _ps_full
    cmp byte [r15+250], 0
    jne _ps_full
    ; mov     x2, #80
    mov rax, 0x50
    mov qword [r15+16], rax
    ; mul     x3, x1, x2
