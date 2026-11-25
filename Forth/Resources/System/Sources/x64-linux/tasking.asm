; Generated from Forth/kernel/arm64/tasking.asm. Do not edit.
bits 64
default rel
extern arm_load_base
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
extern _do_quit
extern _getchar
extern _print_string_svc
extern _set_source
extern base_var
extern data_stack
extern debug_armed
extern debug_break_asap
extern debug_busy
extern eval_resume_stack
extern forget_cut
extern here_ptr
extern host_pause
extern latest_var
extern next_debug
extern pad_buffer
extern pause_hook
extern restart_cell
extern return_stack
extern source_stack
extern state_var
extern user_dict_area
extern user_dict_size_cell
extern word_scratch
global _task_yield
global _dict_allot
global _here_reserve
global _here_reserve_exact
global _task_dp_bounds
global _task_require_dict
global _task_cold_init
global _task_forget_cut
global _task_park_fail
global _task_stop_or_abandon
global _task_is_console
global _task_other_awake
global _task_can_switch
global _core_console_only
global _core_is_worker
global _core_leave
global _core_wake
global _core_join_call
global _core_wait_self
global _core_claim_any
global _core_claim_worker
global _core_release_any
global _core_release_dict
global _core_release_worker
global _error_abandon
global kernel_task_enter
global ktr_fault_resume
global kernel_set_key_q
global kernel_set_core_schedule
global kernel_set_core_wait
global kernel_set_core_wake
global kernel_set_core_join
global console_task
global up_var
global multi_var
global cores_var
global key_q_hook
global eval_frame_sp
global input_buffer
global core_sp
global core_task
global core_pthread
global sem_graphics
global sem_console
global sem_dict
global park_thread
global wait_thread
global task_stop_thread
global mbox_put_thread
global mbox_get_thread
global qput_thread
global qget_thread
global console_pthread
global core_schedule_hook
global core_wait_hook
global core_wake_hook
global core_join_hook
global XSTOP
global str_allot_over
global str_allot_under
global str_dict_full
section .text
section .bwstr align=1
nm_XKEY:
    ; DCB "KEY", 0
    db "KEY", 0
hl_XKEY:
    ; DCB "KEY ( -- c ) wait for and return next character (skips K-* function-key events)", 0
    db "KEY ( -- c ) wait for and return next character (skips K-* function-key events)", 0
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
xkey_poll:
    ; bl      _task_can_switch
    lea rax, [rel xret_1]
    mov qword [r15+240], rax
    jmp _task_can_switch
    xret_1:
    ; cbz     x0, xkey_block
    mov rax, qword [r15+0]
    cmp rax, 0
    je xkey_block
    ; lea x1, key_q_hook
    lea rax, [rel key_q_hook]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, xkey_block
    mov rax, qword [r15+8]
    cmp rax, 0
    je xkey_block
    ; bl      _key_poll_ready
    lea rax, [rel xret_2]
    mov qword [r15+240], rax
    jmp _key_poll_ready
    xret_2:
    ; cbnz    x0, xkey_block
    mov rax, qword [r15+0]
    cmp rax, 0
    jne xkey_block
    ; lea x5, up_var
    lea rax, [rel up_var]
    mov qword [r15+40], rax
    ; ldr     x5, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; str     x19, [x5, #TU_RESUME]
    mov r10, qword [r15+40]
    add r10, 0x50
    mov rax, qword [r15+152]
    mov qword [r10], rax
    ; add     x19, x5, #TU_RETRY_LIST
    mov rax, qword [r15+40]
    add rax, 0x60
    mov qword [r15+152], rax
    ; bl      _task_yield
    lea rax, [rel xret_3]
    mov qword [r15+240], rax
    jmp _task_yield
    xret_3:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cmp     x0, x5
    mov rax, qword [r15+0]
    mov rcx, qword [r15+40]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    xkey_stay
    cmp byte [r15+249], 0
    jne xkey_stay
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
xkey_stay:
    ; ldr     x19, [x5, #TU_RESUME]
    mov r10, qword [r15+40]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [r15+152], rax
xkey_block:
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
    ; bl      _getchar
    lea rax, [rel xret_4]
    mov qword [r15+240], rax
    jmp _getchar
    xret_4:
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
    ; mov     x1, #-2
    mov rax, -2
    mov qword [r15+8], rax
    ; cmp     x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    xkey_char
    cmp byte [r15+249], 0
    je xkey_char
    ; sub     x19, x19, #8
    mov rax, qword [r15+152]
    sub rax, 8
    mov qword [r15+152], rax
    ; b       next_debug_gate
    jmp next_debug_gate
xkey_char:
    ; mov     x1, x0
    mov rax, qword [r15+0]
    mov qword [r15+8], rax
    ; lsr     x2, x1, #24
    mov rax, qword [r15+8]
    shr rax, 24
    mov qword [r15+16], rax
    ; and     x2, x2, #0xFF
    mov rax, qword [r15+16]
    and rax, 0xff
    mov qword [r15+16], rax
    ; cmp     x2, #2
    mov rax, qword [r15+16]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    xkey_poll
    cmp byte [r15+249], 0
    jne xkey_poll
    ; cmp     x2, #1
    mov rax, qword [r15+16]
    cmp rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    xkey_push
    cmp byte [r15+249], 0
    je xkey_push
    ; mov     x3, #0x1FFFFF
    mov rax, 0x1fffff
    mov qword [r15+24], rax
    ; and     x0, x1, x3
    mov rax, qword [r15+8]
    mov rcx, qword [r15+24]
    and rax, rcx
    mov qword [r15+0], rax
xkey_push:
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
XKEY_END:
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
nm_XKEYQ:
    ; DCB "KEY?", 0
    db "KEY?", 0
hl_XKEYQ:
    ; DCB "KEY? ( -- flag ) true if a key is available (does not consume)", 0
    db "KEY? ( -- flag ) true if a key is available (does not consume)", 0
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
    ; lea x1, key_q_hook
    lea rax, [rel key_q_hook]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, xkeyq_none
    mov rax, qword [r15+8]
    cmp rax, 0
    je xkeyq_none
    ; blr     x1
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
    mov r11, qword [r15+8]
    call r11
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; b       xkeyq_flag
    jmp xkeyq_flag
xkeyq_none:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
xkeyq_flag:
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
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; cmp     x0, #0
    mov rax, qword [r15+0]
    cmp rax, 0
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; csinv   x20, xzr, xzr, eq
    cmp byte [r15+249], 0
    jne xsk_5
    xor eax, eax
    not rax
    jmp xsk_6
    xsk_5:
    xor eax, eax
    xsk_6:
    mov qword [r15+160], rax
XKEYQ_END:
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
nm_XPAUSE:
    ; DCB "(PAUSE-HOOK)", 0
    db "(PAUSE-HOOK)", 0
hl_XPAUSE:
    ; DCB "(PAUSE-HOOK) ( -- ) show pending console output, then wait 1 ms", 0
    db "(PAUSE-HOOK) ( -- ) show pending console output, then wait 1 ms", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XPAUSE:
    ; DCQ     nm_XPAUSE, hl_XPAUSE
    dq nm_XPAUSE, hl_XPAUSE
    ; DCQ     0
    dq 0
    ; DCQ     XPAUSE, XPAUSE_END
    dq XPAUSE, XPAUSE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XPAUSE
    dq row_XPAUSE
section .text
XPAUSE:
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
    ; lea x1, pause_hook
    lea rax, [rel pause_hook]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, xpause_host
    mov rax, qword [r15+8]
    cmp rax, 0
    je xpause_host
    ; blr     x1
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
    mov r11, qword [r15+8]
    call r11
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; b       xpause_restore
    jmp xpause_restore
xpause_host:
    ; bl      host_pause
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
    call host_pause
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
xpause_restore:
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
    ; bl      _core_is_worker
    lea rax, [rel xret_7]
    mov qword [r15+240], rax
    jmp _core_is_worker
    xret_7:
    ; cbz     x0, XPAUSE_END
    mov rax, qword [r15+0]
    cmp rax, 0
    je XPAUSE_END
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; b       _core_leave
    jmp _core_leave
XPAUSE_END:
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
nm_XTASK_PAUSE:
    ; DCB "PAUSE", 0
    db "PAUSE", 0
hl_XTASK_PAUSE:
    ; DCB "PAUSE ( -- ) yield when MULTI, then show pending output and wait 1 ms", 0
    db "PAUSE ( -- ) yield when MULTI, then show pending output and wait 1 ms", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTASK_PAUSE:
    ; DCQ     nm_XTASK_PAUSE, hl_XTASK_PAUSE
    dq nm_XTASK_PAUSE, hl_XTASK_PAUSE
    ; DCQ     0
    dq 0
    ; DCQ     XTASK_PAUSE, XTASK_PAUSE_END
    dq XTASK_PAUSE, XTASK_PAUSE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTASK_PAUSE
    dq row_XTASK_PAUSE
section .text
XTASK_PAUSE:
    ; bl      _task_can_switch
    lea rax, [rel xret_8]
    mov qword [r15+240], rax
    jmp _task_can_switch
    xret_8:
    ; cbz     x0, XPAUSE
    mov rax, qword [r15+0]
    cmp rax, 0
    je XPAUSE
    ; bl      _task_yield
    lea rax, [rel xret_9]
    mov qword [r15+240], rax
    jmp _task_yield
    xret_9:
    ; b       XPAUSE
    jmp XPAUSE
XTASK_PAUSE_END:
_task_other_awake:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _toa_no
    mov rax, qword [r15+0]
    cmp rax, 0
    je _toa_no
    ; mov     x1, x0
    mov rax, qword [r15+0]
    mov qword [r15+8], rax
    ; ldr     x2, [x0, #TU_LINK]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+16], rax
_toa_loop:
    ; cbz     x2, _toa_no
    mov rax, qword [r15+16]
    cmp rax, 0
    je _toa_no
    ; cmp     x2, x1
    mov rax, qword [r15+16]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _toa_no
    cmp byte [r15+249], 0
    jne _toa_no
    ; ldr     x3, [x2, #TU_STATUS]
    mov r10, qword [r15+16]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cbnz    x3, _toa_yes
    mov rax, qword [r15+24]
    cmp rax, 0
    jne _toa_yes
    ; ldr     x2, [x2, #TU_LINK]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; b       _toa_loop
    jmp _toa_loop
_toa_yes:
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_toa_no:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_task_can_switch:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; lea x0, cores_var
    lea rax, [rel cores_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbnz    x0, _tcs_no
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _tcs_no
    ; lea x0, multi_var
    lea rax, [rel multi_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _tcs_no
    mov rax, qword [r15+0]
    cmp rax, 0
    je _tcs_no
    ; lea x0, debug_armed
    lea rax, [rel debug_armed]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbnz    x0, _tcs_no
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _tcs_no
    ; lea x0, debug_busy
    lea rax, [rel debug_busy]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbnz    x0, _tcs_no
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _tcs_no
    ; lea x0, debug_break_asap
    lea rax, [rel debug_break_asap]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbnz    x0, _tcs_no
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _tcs_no
    ; bl      _task_other_awake
    lea rax, [rel xret_10]
    mov qword [r15+240], rax
    jmp _task_other_awake
    xret_10:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_tcs_no:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_key_poll_ready:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; lea x1, key_q_hook
    lea rax, [rel key_q_hook]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, _kpr_no
    mov rax, qword [r15+8]
    cmp rax, 0
    je _kpr_no
    ; blr     x1
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
    mov r11, qword [r15+8]
    call r11
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
    ; ret
    jmp qword [r15+240]
_kpr_no:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_task_is_console:
    ; mov     x0, x27
    mov rax, qword [r15+216]
    mov qword [r15+0], rax
    ; cbnz    x0, _tic_cmp
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _tic_cmp
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
_tic_cmp:
    ; lea x1, console_task
    lea rax, [rel console_task]
    mov qword [r15+8], rax
    ; cmp     x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; csinc   x0, xzr, xzr, ne
    cmp byte [r15+249], 0
    je xsk_11
    xor eax, eax
    add rax, 1
    jmp xsk_12
    xsk_11:
    xor eax, eax
    xsk_12:
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_task_yield:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _ty_done
    mov rax, qword [r15+0]
    cmp rax, 0
    je _ty_done
    ; str     x19, [x0, #TU_IP]
    mov r10, qword [r15+0]
    add r10, 0x10
    mov rax, qword [r15+152]
    mov qword [r10], rax
    ; str     x20, [x0, #TU_TOS]
    mov r10, qword [r15+0]
    add r10, 0x18
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; str     x22, [x0, #TU_DSP]
    mov r10, qword [r15+0]
    add r10, 0x20
    mov rax, qword [r15+176]
    mov qword [r10], rax
    ; str     x23, [x0, #TU_RSP]
    mov r10, qword [r15+0]
    add r10, 0x28
    mov rax, qword [r15+184]
    mov qword [r10], rax
    ; lea x9, base_var
    lea rax, [rel base_var]
    mov qword [r15+72], rax
    ; ldr     x10, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+80], rax
    ; str     x10, [x0, #TU_BASE]
    mov r10, qword [r15+0]
    add r10, 0x40
    mov rax, qword [r15+80]
    mov qword [r10], rax
    ; lea x9, state_var
    lea rax, [rel state_var]
    mov qword [r15+72], rax
    ; ldr     x10, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+80], rax
    ; str     x10, [x0, #TU_STATE]
    mov r10, qword [r15+0]
    add r10, 0x48
    mov rax, qword [r15+80]
    mov qword [r10], rax
    ; mov     x11, x0
    mov rax, qword [r15+0]
    mov qword [r15+88], rax
    ; ldr     x12, [x0, #TU_LINK]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+96], rax
_ty_loop:
    ; cbz     x12, _ty_stay
    mov rax, qword [r15+96]
    cmp rax, 0
    je _ty_stay
    ; cmp     x12, x11
    mov rax, qword [r15+96]
    mov rcx, qword [r15+88]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _ty_stay
    cmp byte [r15+249], 0
    jne _ty_stay
    ; ldr     x13, [x12, #TU_STATUS]
    mov r10, qword [r15+96]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+104], rax
    ; cbnz    x13, _ty_take
    mov rax, qword [r15+104]
    cmp rax, 0
    jne _ty_take
    ; ldr     x12, [x12, #TU_LINK]
    mov r10, qword [r15+96]
    mov rax, qword [r10]
    mov qword [r15+96], rax
    ; b       _ty_loop
    jmp _ty_loop
_ty_take:
    ; ldr     x19, [x12, #TU_IP]
    mov r10, qword [r15+96]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+152], rax
    ; ldr     x20, [x12, #TU_TOS]
    mov r10, qword [r15+96]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+160], rax
    ; ldr     x22, [x12, #TU_DSP]
    mov r10, qword [r15+96]
    add r10, 0x20
    mov rax, qword [r10]
    mov qword [r15+176], rax
    ; ldr     x23, [x12, #TU_RSP]
    mov r10, qword [r15+96]
    add r10, 0x28
    mov rax, qword [r10]
    mov qword [r15+184], rax
    ; ldr     x10, [x12, #TU_BASE]
    mov r10, qword [r15+96]
    add r10, 0x40
    mov rax, qword [r10]
    mov qword [r15+80], rax
    ; lea x9, base_var
    lea rax, [rel base_var]
    mov qword [r15+72], rax
    ; str     x10, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r15+80]
    mov qword [r10], rax
    ; ldr     x10, [x12, #TU_STATE]
    mov r10, qword [r15+96]
    add r10, 0x48
    mov rax, qword [r10]
    mov qword [r15+80], rax
    ; lea x9, state_var
    lea rax, [rel state_var]
    mov qword [r15+72], rax
    ; str     x10, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r15+80]
    mov qword [r10], rax
    ; lea x9, up_var
    lea rax, [rel up_var]
    mov qword [r15+72], rax
    ; str     x12, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r15+96]
    mov qword [r10], rax
    ; mov     x27, x12
    mov rax, qword [r15+96]
    mov qword [r15+216], rax
    ; lea x9, console_task
    lea rax, [rel console_task]
    mov qword [r15+72], rax
    ; cmp     x12, x9
    mov rax, qword [r15+96]
    mov rcx, qword [r15+72]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _ty_leaving_console
    cmp byte [r15+249], 0
    je _ty_leaving_console
    ; lea x10, console_hw_sp
    lea rax, [rel console_hw_sp]
    mov qword [r15+80], rax
    ; ldr     x10, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+80], rax
    ; cbz     x10, _ty_done
    mov rax, qword [r15+80]
    cmp rax, 0
    je _ty_done
    ; mov     sp, x10
    mov rax, qword [r15+80]
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
_ty_leaving_console:
    ; cmp     x11, x9
    mov rax, qword [r15+88]
    mov rcx, qword [r15+72]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _ty_done
    cmp byte [r15+249], 0
    je _ty_done
    ; lea x10, console_hw_sp
    lea rax, [rel console_hw_sp]
    mov qword [r15+80], rax
    ; add     x13, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov qword [r15+104], rax
    ; str     x13, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r15+104]
    mov qword [r10], rax
    ; b       _ty_done
    jmp _ty_done
_ty_stay:
    ; ldr     x19, [x11, #TU_IP]
    mov r10, qword [r15+88]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+152], rax
    ; ldr     x20, [x11, #TU_TOS]
    mov r10, qword [r15+88]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+160], rax
    ; ldr     x22, [x11, #TU_DSP]
    mov r10, qword [r15+88]
    add r10, 0x20
    mov rax, qword [r10]
    mov qword [r15+176], rax
    ; ldr     x23, [x11, #TU_RSP]
    mov r10, qword [r15+88]
    add r10, 0x28
    mov rax, qword [r10]
    mov qword [r15+184], rax
_ty_done:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
XKEY_RETRY:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x19, [x0, #TU_RESUME]
    mov r10, qword [r15+0]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [r15+152], rax
    ; b       XKEY
    jmp XKEY
XPARK:
    ; lea x5, up_var
    lea rax, [rel up_var]
    mov qword [r15+40], rax
    ; ldr     x5, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; str     xzr, [x5, #TU_STATUS]
    mov r10, qword [r15+40]
    add r10, 8
    mov qword [r10], 0
    ; lea x19, park_thread
    lea rax, [rel park_thread]
    mov qword [r15+152], rax
    ; bl      _task_yield
    lea rax, [rel xret_13]
    mov qword [r15+240], rax
    jmp _task_yield
    xret_13:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cmp     x0, x5
    mov rax, qword [r15+0]
    mov rcx, qword [r15+40]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _xpark_alone
    cmp byte [r15+249], 0
    jne _xpark_alone
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
_xpark_alone:
    ; mov     x1, #-1
    mov rax, -1
    mov qword [r15+8], rax
    ; str     x1, [x5, #TU_STATUS]
    mov r10, qword [r15+40]
    add r10, 8
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; bl      host_pause
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
    call host_pause
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; b       XPARK
    jmp XPARK
section .bwstr align=1
nm_XYIELD:
    ; DCB "(YIELD)", 0
    db "(YIELD)", 0
hl_XYIELD:
    ; DCB "(YIELD) ( -- ) switch to the next awake task when MULTI", 0
    db "(YIELD) ( -- ) switch to the next awake task when MULTI", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XYIELD:
    ; DCQ     nm_XYIELD, hl_XYIELD
    dq nm_XYIELD, hl_XYIELD
    ; DCQ     0
    dq 0
    ; DCQ     XYIELD, XYIELD_END
    dq XYIELD, XYIELD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XYIELD
    dq row_XYIELD
section .text
XYIELD:
    ; bl      _task_can_switch
    lea rax, [rel xret_14]
    mov qword [r15+240], rax
    jmp _task_can_switch
    xret_14:
    ; cbz     x0, XYIELD_END
    mov rax, qword [r15+0]
    cmp rax, 0
    je XYIELD_END
    ; bl      _task_yield
    lea rax, [rel xret_15]
    mov qword [r15+240], rax
    jmp _task_yield
    xret_15:
XYIELD_END:
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
nm_XMULTI:
    ; DCB "MULTI", 0
    db "MULTI", 0
hl_XMULTI:
    ; DCB "MULTI ( -- ) arm cooperative task switching", 0
    db "MULTI ( -- ) arm cooperative task switching", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMULTI:
    ; DCQ     nm_XMULTI, hl_XMULTI
    dq nm_XMULTI, hl_XMULTI
    ; DCQ     0
    dq 0
    ; DCQ     XMULTI, XMULTI_END
    dq XMULTI, XMULTI_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMULTI
    dq row_XMULTI
section .text
XMULTI:
    ; lea x0, multi_var
    lea rax, [rel multi_var]
    mov qword [r15+0], rax
    ; mov     x1, #-1
    mov rax, -1
    mov qword [r15+8], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
XMULTI_END:
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
nm_XSINGLE:
    ; DCB "SINGLE", 0
    db "SINGLE", 0
hl_XSINGLE:
    ; DCB "SINGLE ( -- ) cooperative PAUSE does not switch", 0
    db "SINGLE ( -- ) cooperative PAUSE does not switch", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSINGLE:
    ; DCQ     nm_XSINGLE, hl_XSINGLE
    dq nm_XSINGLE, hl_XSINGLE
    ; DCQ     0
    dq 0
    ; DCQ     XSINGLE, XSINGLE_END
    dq XSINGLE, XSINGLE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSINGLE
    dq row_XSINGLE
section .text
XSINGLE:
    ; lea x0, multi_var
    lea rax, [rel multi_var]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
XSINGLE_END:
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
nm_XCORES:
    ; DCB "CORES", 0
    db "CORES", 0
hl_XCORES:
    ; DCB "CORES ( -- ) run tasks on up to ten worker queues", 0
    db "CORES ( -- ) run tasks on up to ten worker queues", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCORES:
    ; DCQ     nm_XCORES, hl_XCORES
    dq nm_XCORES, hl_XCORES
    ; DCQ     0
    dq 0
    ; DCQ     XCORES, XCORES_END
    dq XCORES, XCORES_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCORES
    dq row_XCORES
section .text
XCORES:
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
    ; b.eq    _xcores_ok
    cmp byte [r15+249], 0
    jne _xcores_ok
    ; lea x0, str_cores_console
    lea rax, [rel str_cores_console]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_16]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_16:
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
_xcores_ok:
    ; lea x0, cores_var
    lea rax, [rel cores_var]
    mov qword [r15+0], rax
    ; mov     x1, #-1
    mov rax, -1
    mov qword [r15+8], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
XCORES_END:
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
nm_XCOOP:
    ; DCB "COOP", 0
    db "COOP", 0
hl_XCOOP:
    ; DCB "COOP ( -- ) wait for worker tasks, then use the cooperative scheduler", 0
    db "COOP ( -- ) wait for worker tasks, then use the cooperative scheduler", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCOOP:
    ; DCQ     nm_XCOOP, hl_XCOOP
    dq nm_XCOOP, hl_XCOOP
    ; DCQ     0
    dq 0
    ; DCQ     XCOOP, XCOOP_END
    dq XCOOP, XCOOP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCOOP
    dq row_XCOOP
section .text
XCOOP:
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
    ; b.eq    _xcoop_ok
    cmp byte [r15+249], 0
    jne _xcoop_ok
    ; lea x0, str_cores_console
    lea rax, [rel str_cores_console]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_17]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_17:
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
_xcoop_ok:
    ; bl      _core_join_call
    lea rax, [rel xret_18]
    mov qword [r15+240], rax
    jmp _core_join_call
    xret_18:
    ; lea x0, cores_var
    lea rax, [rel cores_var]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
XCOOP_END:
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
nm_XCORES_JOIN:
    ; DCB "CORES-JOIN", 0
    db "CORES-JOIN", 0
hl_XCORES_JOIN:
    ; DCB "CORES-JOIN ( -- ) wait until worker tasks have stopped", 0
    db "CORES-JOIN ( -- ) wait until worker tasks have stopped", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCORES_JOIN:
    ; DCQ     nm_XCORES_JOIN, hl_XCORES_JOIN
    dq nm_XCORES_JOIN, hl_XCORES_JOIN
    ; DCQ     0
    dq 0
    ; DCQ     XCORES_JOIN, XCORES_JOIN_END
    dq XCORES_JOIN, XCORES_JOIN_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCORES_JOIN
    dq row_XCORES_JOIN
section .text
XCORES_JOIN:
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
    ; b.eq    _xjoin_ok
    cmp byte [r15+249], 0
    jne _xjoin_ok
    ; lea x0, str_cores_console
    lea rax, [rel str_cores_console]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_19]
    mov qword [r15+240], rax
    jmp _print_string_svc
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
_xjoin_ok:
    ; bl      _core_join_call
    lea rax, [rel xret_20]
    mov qword [r15+240], rax
    jmp _core_join_call
    xret_20:
XCORES_JOIN_END:
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
nm_XCLAIM:
    ; DCB "CLAIM", 0
    db "CLAIM", 0
hl_XCLAIM:
    ; DCB "CLAIM ( addr -- flag ) take a free semaphore; true if this task stored 0", 0
    db "CLAIM ( addr -- flag ) take a free semaphore; true if this task stored 0", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCLAIM:
    ; DCQ     nm_XCLAIM, hl_XCLAIM
    dq nm_XCLAIM, hl_XCLAIM
    ; DCQ     0
    dq 0
    ; DCQ     XCLAIM, XCLAIM_END
    dq XCLAIM, XCLAIM_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCLAIM
    dq row_XCLAIM
section .text
XCLAIM:
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
_claim_try:
    ; ldaxr   x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    mov qword [rel arm_excl_addr], r10
    mov qword [rel arm_excl_val], rax
    mov qword [rel arm_excl], 1
    ; cbz     x1, _claim_busy
    mov rax, qword [r15+8]
    cmp rax, 0
    je _claim_busy
    ; stlxr   w2, xzr, [x0]
    mov r10, qword [r15+0]
    cmp qword [rel arm_excl], 0
    je xxl_21
    cmp r10, qword [rel arm_excl_addr]
    jne xxl_21
    mov rax, qword [rel arm_excl_val]
    xor ecx, ecx
    lock cmpxchg qword [r10], rcx
    mov qword [rel arm_excl], 0
    jne xxl_21
    xor eax, eax
    jmp xxl_22
    xxl_21:
    mov qword [rel arm_excl], 0
    mov eax, 1
    xxl_22:
    mov qword [r15+16], rax
    ; cbnz    w2, _claim_try
    mov eax, dword [r15+16]
    cmp rax, 0
    jne _claim_try
    ; mov     x20, #-1
    mov rax, -1
    mov qword [r15+160], rax
    ; b       XCLAIM_END
    jmp XCLAIM_END
_claim_busy:
    ; clrex
    mov qword [rel arm_excl], 0
    ; mov     x20, #0
    mov rax, 0
    mov qword [r15+160], rax
XCLAIM_END:
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
nm_XRELEASE:
    ; DCB "RELEASE", 0
    db "RELEASE", 0
hl_XRELEASE:
    ; DCB "RELEASE ( addr -- ) store 1 into a semaphore with a release store", 0
    db "RELEASE ( addr -- ) store 1 into a semaphore with a release store", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XRELEASE:
    ; DCQ     nm_XRELEASE, hl_XRELEASE
    dq nm_XRELEASE, hl_XRELEASE
    ; DCQ     0
    dq 0
    ; DCQ     XRELEASE_, XRELEASE_END
    dq XRELEASE_, XRELEASE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XRELEASE
    dq row_XRELEASE
section .text
XRELEASE_:
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; stlr    x1, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; bl      _core_wake
    lea rax, [rel xret_23]
    mov qword [r15+240], rax
    jmp _core_wake
    xret_23:
XRELEASE_END:
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
nm_XWAIT:
    ; DCB "WAIT", 0
    db "WAIT", 0
hl_XWAIT:
    ; DCB "WAIT ( addr -- ) CLAIM until it succeeds, yielding while the semaphore is taken", 0
    db "WAIT ( addr -- ) CLAIM until it succeeds, yielding while the semaphore is taken", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XWAIT:
    ; DCQ     nm_XWAIT, hl_XWAIT
    dq nm_XWAIT, hl_XWAIT
    ; DCQ     0
    dq 0
    ; DCQ     XWAIT, XWAIT_END
    dq XWAIT, XWAIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XWAIT
    dq row_XWAIT
section .text
XWAIT_RETRY:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x19, [x0, #TU_RESUME]
    mov r10, qword [r15+0]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [r15+152], rax
    ; b       XWAIT
    jmp XWAIT
XWAIT:
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
_wait_try:
    ; ldaxr   x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    mov qword [rel arm_excl_addr], r10
    mov qword [rel arm_excl_val], rax
    mov qword [rel arm_excl], 1
    ; cbz     x1, _wait_busy
    mov rax, qword [r15+8]
    cmp rax, 0
    je _wait_busy
    ; stlxr   w2, xzr, [x0]
    mov r10, qword [r15+0]
    cmp qword [rel arm_excl], 0
    je xxl_24
    cmp r10, qword [rel arm_excl_addr]
    jne xxl_24
    mov rax, qword [rel arm_excl_val]
    xor ecx, ecx
    lock cmpxchg qword [r10], rcx
    mov qword [rel arm_excl], 0
    jne xxl_24
    xor eax, eax
    jmp xxl_25
    xxl_24:
    mov qword [rel arm_excl], 0
    mov eax, 1
    xxl_25:
    mov qword [r15+16], rax
    ; cbnz    w2, _wait_try
    mov eax, dword [r15+16]
    cmp rax, 0
    jne _wait_try
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; b       XWAIT_END
    jmp XWAIT_END
_wait_busy:
    ; clrex
    mov qword [rel arm_excl], 0
    ; bl      _core_wait_self
    lea rax, [rel xret_26]
    mov qword [r15+240], rax
    jmp _core_wait_self
    xret_26:
    ; cbz     x0, _wait_coop
    mov rax, qword [r15+0]
    cmp rax, 0
    je _wait_coop
    ; b       XWAIT
    jmp XWAIT
_wait_coop:
    ; bl      _task_can_switch
    lea rax, [rel xret_27]
    mov qword [r15+240], rax
    jmp _task_can_switch
    xret_27:
    ; cbz     x0, _wait_stuck
    mov rax, qword [r15+0]
    cmp rax, 0
    je _wait_stuck
    ; lea x5, up_var
    lea rax, [rel up_var]
    mov qword [r15+40], rax
    ; ldr     x5, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; str     x19, [x5, #TU_RESUME]
    mov r10, qword [r15+40]
    add r10, 0x50
    mov rax, qword [r15+152]
    mov qword [r10], rax
    ; lea x19, wait_thread
    lea rax, [rel wait_thread]
    mov qword [r15+152], rax
    ; bl      _task_yield
    lea rax, [rel xret_28]
    mov qword [r15+240], rax
    jmp _task_yield
    xret_28:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cmp     x0, x5
    mov rax, qword [r15+0]
    mov rcx, qword [r15+40]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    XWAIT_END
    cmp byte [r15+249], 0
    je XWAIT_END
    ; ldr     x19, [x5, #TU_RESUME]
    mov r10, qword [r15+40]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [r15+152], rax
_wait_stuck:
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; lea x0, str_wait_stuck
    lea rax, [rel str_wait_stuck]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_29]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_29:
XWAIT_END:
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
nm_XSIGNAL:
    ; DCB "SIGNAL", 0
    db "SIGNAL", 0
hl_XSIGNAL:
    ; DCB "SIGNAL ( addr -- ) RELEASE, then yield so a waiting task can CLAIM", 0
    db "SIGNAL ( addr -- ) RELEASE, then yield so a waiting task can CLAIM", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSIGNAL:
    ; DCQ     nm_XSIGNAL, hl_XSIGNAL
    dq nm_XSIGNAL, hl_XSIGNAL
    ; DCQ     0
    dq 0
    ; DCQ     XSIGNAL, XSIGNAL_END
    dq XSIGNAL, XSIGNAL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSIGNAL
    dq row_XSIGNAL
section .text
XSIGNAL:
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; stlr    x1, [x20]
    mov r10, qword [r15+160]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; bl      _core_wake
    lea rax, [rel xret_30]
    mov qword [r15+240], rax
    jmp _core_wake
    xret_30:
    ; bl      _task_can_switch
    lea rax, [rel xret_31]
    mov qword [r15+240], rax
    jmp _task_can_switch
    xret_31:
    ; cbz     x0, XSIGNAL_END
    mov rax, qword [r15+0]
    cmp rax, 0
    je XSIGNAL_END
    ; bl      _task_yield
    lea rax, [rel xret_32]
    mov qword [r15+240], rax
    jmp _task_yield
    xret_32:
XSIGNAL_END:
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
nm_XGRAPHICS_SEM:
    ; DCB "GRAPHICS-SEM", 0
    db "GRAPHICS-SEM", 0
hl_XGRAPHICS_SEM:
    ; DCB "GRAPHICS-SEM ( -- addr ) semaphore for the graphics map (1 = free)", 0
    db "GRAPHICS-SEM ( -- addr ) semaphore for the graphics map (1 = free)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XGRAPHICS_SEM:
    ; DCQ     nm_XGRAPHICS_SEM, hl_XGRAPHICS_SEM
    dq nm_XGRAPHICS_SEM, hl_XGRAPHICS_SEM
    ; DCQ     0
    dq 0
    ; DCQ     XGRAPHICS_SEM, 0
    dq XGRAPHICS_SEM, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XGRAPHICS_SEM
    dq row_XGRAPHICS_SEM
section .text
XGRAPHICS_SEM:
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, sem_graphics
    lea rax, [rel sem_graphics]
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
nm_XCONSOLE_SEM:
    ; DCB "CONSOLE-SEM", 0
    db "CONSOLE-SEM", 0
hl_XCONSOLE_SEM:
    ; DCB "CONSOLE-SEM ( -- addr ) semaphore for the console emit buffer (1 = free)", 0
    db "CONSOLE-SEM ( -- addr ) semaphore for the console emit buffer (1 = free)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCONSOLE_SEM:
    ; DCQ     nm_XCONSOLE_SEM, hl_XCONSOLE_SEM
    dq nm_XCONSOLE_SEM, hl_XCONSOLE_SEM
    ; DCQ     0
    dq 0
    ; DCQ     XCONSOLE_SEM, 0
    dq XCONSOLE_SEM, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCONSOLE_SEM
    dq row_XCONSOLE_SEM
section .text
XCONSOLE_SEM:
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, sem_console
    lea rax, [rel sem_console]
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
nm_XDICT_SEM:
    ; DCB "DICT-SEM", 0
    db "DICT-SEM", 0
hl_XDICT_SEM:
    ; DCB "DICT-SEM ( -- addr ) semaphore for dictionary mutation (1 = free)", 0
    db "DICT-SEM ( -- addr ) semaphore for dictionary mutation (1 = free)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XDICT_SEM:
    ; DCQ     nm_XDICT_SEM, hl_XDICT_SEM
    dq nm_XDICT_SEM, hl_XDICT_SEM
    ; DCQ     0
    dq 0
    ; DCQ     XDICT_SEM, 0
    dq XDICT_SEM, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XDICT_SEM
    dq row_XDICT_SEM
section .text
XDICT_SEM:
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; lea x20, sem_dict
    lea rax, [rel sem_dict]
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
_task_dp_bounds:
    ; mov     x10, x27
    mov rax, qword [r15+216]
    mov qword [r15+80], rax
    ; cbnz    x10, _tdb_up
    mov rax, qword [r15+80]
    cmp rax, 0
    jne _tdb_up
    ; lea x10, up_var
    lea rax, [rel up_var]
    mov qword [r15+80], rax
    ; ldr     x10, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+80], rax
_tdb_up:
    ; cbz     x10, _tdb_global
    mov rax, qword [r15+80]
    cmp rax, 0
    je _tdb_global
    ; ldr     x9, [x10, #TU_DP]
    mov r10, qword [r15+80]
    add r10, 0x108
    mov rax, qword [r10]
    mov qword [r15+72], rax
    ; cbz     x9, _tdb_global
    mov rax, qword [r15+72]
    cmp rax, 0
    je _tdb_global
    ; add     x0, x10, #TU_DP
    mov rax, qword [r15+80]
    add rax, 0x108
    mov qword [r15+0], rax
    ; ldr     x1, [x10, #TU_DLIM]
    mov r10, qword [r15+80]
    add r10, 0x110
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; ldr     x2, [x10, #TU_DBASE]
    mov r10, qword [r15+80]
    add r10, 0x100
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; ret
    jmp qword [r15+240]
_tdb_global:
    ; lea x0, here_ptr
    lea rax, [rel here_ptr]
    mov qword [r15+0], rax
    ; lea x2, user_dict_area
    lea rax, [rel user_dict_area]
    mov qword [r15+16], rax
    ; lea x1, user_dict_size_cell
    lea rax, [rel user_dict_size_cell]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; add     x1, x2, x1
    mov rax, qword [r15+16]
    mov rcx, qword [r15+8]
    add rax, rcx
    mov qword [r15+8], rax
    ; ret
    jmp qword [r15+240]
_task_stop_or_abandon:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _task_is_console
    lea rax, [rel xret_33]
    mov qword [r15+240], rax
    jmp _task_is_console
    xret_33:
    ; cbnz    x0, _tsoa_abandon
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _tsoa_abandon
    ; bl      _core_is_worker
    lea rax, [rel xret_34]
    mov qword [r15+240], rax
    jmp _core_is_worker
    xret_34:
    ; cbnz    x0, _tsoa_worker
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _tsoa_worker
    ; mov     x5, x27
    mov rax, qword [r15+216]
    mov qword [r15+40], rax
    ; cbnz    x5, _tsoa_mark
    mov rax, qword [r15+40]
    cmp rax, 0
    jne _tsoa_mark
    ; lea x5, up_var
    lea rax, [rel up_var]
    mov qword [r15+40], rax
    ; ldr     x5, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r10]
    mov qword [r15+40], rax
_tsoa_mark:
    ; str     xzr, [x5, #TU_STATUS]
    mov r10, qword [r15+40]
    add r10, 8
    mov qword [r10], 0
    ; mov     x6, x19
    mov rax, qword [r15+152]
    mov qword [r15+48], rax
    ; bl      _task_yield
    lea rax, [rel xret_35]
    mov qword [r15+240], rax
    jmp _task_yield
    xret_35:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cmp     x0, x5
    mov rax, qword [r15+0]
    mov rcx, qword [r15+40]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _tsoa_switched
    cmp byte [r15+249], 0
    je _tsoa_switched
    ; mov     x1, #-1
    mov rax, -1
    mov qword [r15+8], rax
    ; str     x1, [x5, #TU_STATUS]
    mov r10, qword [r15+40]
    add r10, 8
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x19, x6
    mov rax, qword [r15+48]
    mov qword [r15+152], rax
_tsoa_abandon:
    ; b       _error_abandon
    jmp _error_abandon
_tsoa_switched:
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
_tsoa_worker:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; str     xzr, [x27, #TU_STATUS]
    mov r10, qword [r15+216]
    add r10, 8
    mov qword [r10], 0
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; b       _core_leave
    jmp _core_leave
_task_require_dict:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _task_is_console
    lea rax, [rel xret_36]
    mov qword [r15+240], rax
    jmp _task_is_console
    xret_36:
    ; cbnz    x0, _trd_ok
    mov rax, qword [r15+0]
    cmp rax, 0
    jne _trd_ok
    ; mov     x10, x27
    mov rax, qword [r15+216]
    mov qword [r15+80], rax
    ; cbnz    x10, _trd_have
    mov rax, qword [r15+80]
    cmp rax, 0
    jne _trd_have
    ; lea x10, up_var
    lea rax, [rel up_var]
    mov qword [r15+80], rax
    ; ldr     x10, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+80], rax
_trd_have:
    ; cbz     x10, _trd_ok
    mov rax, qword [r15+80]
    cmp rax, 0
    je _trd_ok
    ; ldr     x9, [x10, #TU_DP]
    mov r10, qword [r15+80]
    add r10, 0x108
    mov rax, qword [r10]
    mov qword [r15+72], rax
    ; cbnz    x9, _trd_ok
    mov rax, qword [r15+72]
    cmp rax, 0
    jne _trd_ok
_trd_none:
    ; lea x0, str_slice_none
    lea rax, [rel str_slice_none]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_37]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_37:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; b       _task_stop_or_abandon
    jmp _task_stop_or_abandon
_trd_ok:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_here_reserve:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; str     x0, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; bl      _task_require_dict
    lea rax, [rel xret_38]
    mov qword [r15+240], rax
    jmp _task_require_dict
    xret_38:
    ; bl      _task_dp_bounds
    lea rax, [rel xret_39]
    mov qword [r15+240], rax
    jmp _task_dp_bounds
    xret_39:
    ; ldr     x6, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    add rsp, 0x10
    ; mov     x5, x0
    mov rax, qword [r15+0]
    mov qword [r15+40], rax
    ; ldr     x3, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; add     x4, x3, x6
    mov rax, qword [r15+24]
    mov rcx, qword [r15+48]
    add rax, rcx
    mov qword [r15+32], rax
    ; cmp     x4, x3
    mov rax, qword [r15+32]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _hr_full
    cmp byte [r15+250], 0
    je _hr_full
    ; add     x7, x4, #7
    mov rax, qword [r15+32]
    add rax, 7
    mov qword [r15+56], rax
    ; cmp     x7, x4
    mov rax, qword [r15+56]
    mov rcx, qword [r15+32]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _hr_full
    cmp byte [r15+250], 0
    je _hr_full
    ; bic     x4, x7, #7
    mov rax, qword [r15+56]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [r15+32], rax
    ; cmp     x4, x1
    mov rax, qword [r15+32]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _hr_full
    cmp byte [r15+250], 0
    je xsk_40
    cmp byte [r15+249], 0
    je _hr_full
    xsk_40:
    ; cmp     x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _hr_full
    cmp byte [r15+250], 0
    je _hr_full
    ; str     x4, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r15+32]
    mov qword [r10], rax
    ; mov     x0, x3
    mov rax, qword [r15+24]
    mov qword [r15+0], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_here_reserve_exact:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; str     x0, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; bl      _task_require_dict
    lea rax, [rel xret_41]
    mov qword [r15+240], rax
    jmp _task_require_dict
    xret_41:
    ; bl      _task_dp_bounds
    lea rax, [rel xret_42]
    mov qword [r15+240], rax
    jmp _task_dp_bounds
    xret_42:
    ; ldr     x6, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    add rsp, 0x10
    ; mov     x5, x0
    mov rax, qword [r15+0]
    mov qword [r15+40], rax
    ; ldr     x3, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; add     x4, x3, x6
    mov rax, qword [r15+24]
    mov rcx, qword [r15+48]
    add rax, rcx
    mov qword [r15+32], rax
    ; cmp     x4, x3
    mov rax, qword [r15+32]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _hr_full
    cmp byte [r15+250], 0
    je _hr_full
    ; cmp     x4, x1
    mov rax, qword [r15+32]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _hr_full
    cmp byte [r15+250], 0
    je xsk_43
    cmp byte [r15+249], 0
    je _hr_full
    xsk_43:
    ; cmp     x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _hr_full
    cmp byte [r15+250], 0
    je _hr_full
    ; str     x4, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r15+32]
    mov qword [r10], rax
    ; mov     x0, x3
    mov rax, qword [r15+24]
    mov qword [r15+0], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_hr_full:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; lea x0, str_dict_full
    lea rax, [rel str_dict_full]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_44]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_44:
    ; b       _task_stop_or_abandon
    jmp _task_stop_or_abandon
_dict_allot:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; str     x0, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; bl      _task_require_dict
    lea rax, [rel xret_45]
    mov qword [r15+240], rax
    jmp _task_require_dict
    xret_45:
    ; bl      _task_dp_bounds
    lea rax, [rel xret_46]
    mov qword [r15+240], rax
    jmp _task_dp_bounds
    xret_46:
    ; ldr     x6, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; lea x9, here_ptr
    lea rax, [rel here_ptr]
    mov qword [r15+72], rax
    ; cmp     x0, x9
    mov rax, qword [r15+0]
    mov rcx, qword [r15+72]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _da_lock
    cmp byte [r15+249], 0
    jne _da_lock
    ; mov     x7, #0
    mov rax, 0
    mov qword [r15+56], rax
    ; b       _da_have_lock
    jmp _da_have_lock
_da_lock:
    ; stp     x0, x6, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10+0], rax
    mov rax, qword [r15+48]
    mov qword [r10+8], rax
    ; stp     x1, x2, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+8]
    mov qword [r10+0], rax
    mov rax, qword [r15+16]
    mov qword [r10+8], rax
    ; lea x0, sem_dict
    lea rax, [rel sem_dict]
    mov qword [r15+0], rax
    ; bl      _core_claim_any
    lea rax, [rel xret_47]
    mov qword [r15+240], rax
    jmp _core_claim_any
    xret_47:
    ; ldp     x1, x2, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+8], rax
    mov qword [r15+16], rcx
    add rsp, 0x10
    ; ldp     x0, x6, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+0], rax
    mov qword [r15+48], rcx
    add rsp, 0x10
    ; mov     x7, #1
    mov rax, 1
    mov qword [r15+56], rax
_da_have_lock:
    ; add     sp, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov rsp, rax
    ; ldr     x3, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; add     x3, x3, #7
    mov rax, qword [r15+24]
    add rax, 7
    mov qword [r15+24], rax
    ; bic     x3, x3, #7
    mov rax, qword [r15+24]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [r15+24], rax
    ; add     x4, x3, x6
    mov rax, qword [r15+24]
    mov rcx, qword [r15+48]
    add rax, rcx
    mov qword [r15+32], rax
    ; cmp     x4, x3
    mov rax, qword [r15+32]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _da_fail
    cmp byte [r15+250], 0
    je _da_fail
    ; cmp     x4, x1
    mov rax, qword [r15+32]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _da_fail
    cmp byte [r15+250], 0
    je xsk_48
    cmp byte [r15+249], 0
    je _da_fail
    xsk_48:
    ; cmp     x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _da_fail
    cmp byte [r15+250], 0
    je _da_fail
    ; mov     x5, x3
    mov rax, qword [r15+24]
    mov qword [r15+40], rax
_da_zero:
    ; str     xzr, [x5], #8
    mov r10, qword [r15+40]
    mov qword [r10], 0
    mov rax, qword [r15+40]
    add rax, 8
    mov qword [r15+40], rax
    ; subs    x6, x6, #8
    mov rax, qword [r15+48]
    sub rax, 8
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    mov qword [r15+48], rax
    ; b.ne    _da_zero
    cmp byte [r15+249], 0
    je _da_zero
    ; str     x4, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+32]
    mov qword [r10], rax
    ; mov     x0, x3
    mov rax, qword [r15+24]
    mov qword [r15+0], rax
    ; cbz     x7, _da_ret
    mov rax, qword [r15+56]
    cmp rax, 0
    je _da_ret
    ; str     x0, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; bl      _core_release_dict
    lea rax, [rel xret_49]
    mov qword [r15+240], rax
    jmp _core_release_dict
    xret_49:
    ; ldr     x0, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    add rsp, 0x10
_da_ret:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_da_fail:
    ; cbz     x7, _da_fail_msg
    mov rax, qword [r15+56]
    cmp rax, 0
    je _da_fail_msg
    ; bl      _core_release_dict
    lea rax, [rel xret_50]
    mov qword [r15+240], rax
    jmp _core_release_dict
    xret_50:
_da_fail_msg:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; lea x0, str_allot_over
    lea rax, [rel str_allot_over]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_51]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_51:
    ; b       _task_stop_or_abandon
    jmp _task_stop_or_abandon
_task_park_fail:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; mov     x21, x6
    mov rax, qword [r15+48]
    mov qword [r15+168], rax
    ; bl      _core_wait_self
    lea rax, [rel xret_52]
    mov qword [r15+240], rax
    jmp _core_wait_self
    xret_52:
    ; cbz     x0, _tpf_coop
    mov rax, qword [r15+0]
    cmp rax, 0
    je _tpf_coop
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_tpf_coop:
    ; bl      _task_can_switch
    lea rax, [rel xret_53]
    mov qword [r15+240], rax
    jmp _task_can_switch
    xret_53:
    ; cbz     x0, _tpf_noswitch
    mov rax, qword [r15+0]
    cmp rax, 0
    je _tpf_noswitch
    ; lea x5, up_var
    lea rax, [rel up_var]
    mov qword [r15+40], rax
    ; ldr     x5, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; str     x19, [x5, #TU_RESUME]
    mov r10, qword [r15+40]
    add r10, 0x50
    mov rax, qword [r15+152]
    mov qword [r10], rax
    ; mov     x19, x21
    mov rax, qword [r15+168]
    mov qword [r15+152], rax
    ; bl      _task_yield
    lea rax, [rel xret_54]
    mov qword [r15+240], rax
    jmp _task_yield
    xret_54:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cmp     x0, x5
    mov rax, qword [r15+0]
    mov rcx, qword [r15+40]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _tpf_stayed
    cmp byte [r15+249], 0
    jne _tpf_stayed
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
_tpf_stayed:
    ; ldr     x19, [x5, #TU_RESUME]
    mov r10, qword [r15+40]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [r15+152], rax
_tpf_noswitch:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
section .bwstr align=1
nm_XMAILBOX:
    ; DCB "MAILBOX", 0
    db "MAILBOX", 0
hl_XMAILBOX:
    ; DCB "MAILBOX ( -- addr ) allot a value and a full/empty pair", 0
    db "MAILBOX ( -- addr ) allot a value and a full/empty pair", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMAILBOX:
    ; DCQ     nm_XMAILBOX, hl_XMAILBOX
    dq nm_XMAILBOX, hl_XMAILBOX
    ; DCQ     0
    dq 0
    ; DCQ     XMAILBOX, XMAILBOX_END
    dq XMAILBOX, XMAILBOX_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMAILBOX
    dq row_XMAILBOX
section .text
XMAILBOX:
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; mov     x0, #MB_BYTES
    mov rax, 0x18
    mov qword [r15+0], rax
    ; bl      _dict_allot
    lea rax, [rel xret_55]
    mov qword [r15+240], rax
    jmp _dict_allot
    xret_55:
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; str     x1, [x0, #MB_EMPTY]
    mov r10, qword [r15+0]
    add r10, 0x10
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
XMAILBOX_END:
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
nm_XMBOX_PUT:
    ; DCB ">MBOX", 0
    db ">MBOX", 0
hl_XMBOX_PUT:
    ; DCB ">MBOX ( n addr -- ) store n when the mailbox is empty, then signal full", 0
    db ">MBOX ( n addr -- ) store n when the mailbox is empty, then signal full", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMBOX_PUT:
    ; DCQ     nm_XMBOX_PUT, hl_XMBOX_PUT
    dq nm_XMBOX_PUT, hl_XMBOX_PUT
    ; DCQ     0
    dq 0
    ; DCQ     XMBOX_PUT, XMBOX_PUT_END
    dq XMBOX_PUT, XMBOX_PUT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMBOX_PUT
    dq row_XMBOX_PUT
section .text
XMBOX_PUT_RETRY:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x19, [x0, #TU_RESUME]
    mov r10, qword [r15+0]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [r15+152], rax
    ; b       XMBOX_PUT
    jmp XMBOX_PUT
XMBOX_PUT:
    ; add     x0, x20, #MB_EMPTY
    mov rax, qword [r15+160]
    add rax, 0x10
    mov qword [r15+0], rax
_mb_put_try:
    ; ldaxr   x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    mov qword [rel arm_excl_addr], r10
    mov qword [rel arm_excl_val], rax
    mov qword [rel arm_excl], 1
    ; cbz     x1, _mb_put_busy
    mov rax, qword [r15+8]
    cmp rax, 0
    je _mb_put_busy
    ; stlxr   w2, xzr, [x0]
    mov r10, qword [r15+0]
    cmp qword [rel arm_excl], 0
    je xxl_56
    cmp r10, qword [rel arm_excl_addr]
    jne xxl_56
    mov rax, qword [rel arm_excl_val]
    xor ecx, ecx
    lock cmpxchg qword [r10], rcx
    mov qword [rel arm_excl], 0
    jne xxl_56
    xor eax, eax
    jmp xxl_57
    xxl_56:
    mov qword [rel arm_excl], 0
    mov eax, 1
    xxl_57:
    mov qword [r15+16], rax
    ; cbnz    w2, _mb_put_try
    mov eax, dword [r15+16]
    cmp rax, 0
    jne _mb_put_try
    ; ldr     x1, [x22]
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; str     x1, [x20, #MB_VALUE]
    mov r10, qword [r15+160]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; mov     x1, #1
    mov rax, 1
    mov qword [r15+8], rax
    ; add     x0, x20, #MB_FULL
    mov rax, qword [r15+160]
    add rax, 8
    mov qword [r15+0], rax
    ; stlr    x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; add     x22, x22, #8
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
    ; bl      _core_wake
    lea rax, [rel xret_58]
    mov qword [r15+240], rax
    jmp _core_wake
    xret_58:
    ; b       XMBOX_PUT_END
    jmp XMBOX_PUT_END
_mb_put_busy:
    ; clrex
    mov qword [rel arm_excl], 0
    ; lea x6, mbox_put_thread
    lea rax, [rel mbox_put_thread]
    mov qword [r15+48], rax
    ; bl      _task_park_fail
    lea rax, [rel xret_59]
    mov qword [r15+240], rax
    jmp _task_park_fail
    xret_59:
    ; cbnz    x0, XMBOX_PUT
    mov rax, qword [r15+0]
    cmp rax, 0
    jne XMBOX_PUT
    ; add     x22, x22, #8
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
    ; lea x0, str_mbox_put_stuck
    lea rax, [rel str_mbox_put_stuck]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_60]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_60:
XMBOX_PUT_END:
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
nm_XMBOX_GET:
    ; DCB "MBOX>", 0
    db "MBOX>", 0
hl_XMBOX_GET:
    ; DCB "MBOX> ( addr -- n ) wait until full, read n, then signal empty", 0
    db "MBOX> ( addr -- n ) wait until full, read n, then signal empty", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XMBOX_GET:
    ; DCQ     nm_XMBOX_GET, hl_XMBOX_GET
    dq nm_XMBOX_GET, hl_XMBOX_GET
    ; DCQ     0
    dq 0
    ; DCQ     XMBOX_GET, XMBOX_GET_END
    dq XMBOX_GET, XMBOX_GET_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XMBOX_GET
    dq row_XMBOX_GET
section .text
XMBOX_GET_RETRY:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x19, [x0, #TU_RESUME]
    mov r10, qword [r15+0]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [r15+152], rax
    ; b       XMBOX_GET
    jmp XMBOX_GET
XMBOX_GET:
    ; add     x0, x20, #MB_FULL
    mov rax, qword [r15+160]
    add rax, 8
    mov qword [r15+0], rax
_mb_get_try:
    ; ldaxr   x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    mov qword [rel arm_excl_addr], r10
    mov qword [rel arm_excl_val], rax
    mov qword [rel arm_excl], 1
    ; cbz     x1, _mb_get_busy
    mov rax, qword [r15+8]
    cmp rax, 0
    je _mb_get_busy
    ; stlxr   w2, xzr, [x0]
    mov r10, qword [r15+0]
    cmp qword [rel arm_excl], 0
    je xxl_61
    cmp r10, qword [rel arm_excl_addr]
    jne xxl_61
    mov rax, qword [rel arm_excl_val]
    xor ecx, ecx
    lock cmpxchg qword [r10], rcx
    mov qword [rel arm_excl], 0
    jne xxl_61
    xor eax, eax
    jmp xxl_62
    xxl_61:
    mov qword [rel arm_excl], 0
    mov eax, 1
    xxl_62:
    mov qword [r15+16], rax
    ; cbnz    w2, _mb_get_try
    mov eax, dword [r15+16]
    cmp rax, 0
    jne _mb_get_try
    ; ldr     x1, [x20, #MB_VALUE]
    mov r10, qword [r15+160]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; mov     x3, #1
    mov rax, 1
    mov qword [r15+24], rax
    ; add     x0, x20, #MB_EMPTY
    mov rax, qword [r15+160]
    add rax, 0x10
    mov qword [r15+0], rax
    ; stlr    x3, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+24]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [r15+8]
    mov qword [r15+160], rax
    ; bl      _core_wake
    lea rax, [rel xret_63]
    mov qword [r15+240], rax
    jmp _core_wake
    xret_63:
    ; b       XMBOX_GET_END
    jmp XMBOX_GET_END
_mb_get_busy:
    ; clrex
    mov qword [rel arm_excl], 0
    ; lea x6, mbox_get_thread
    lea rax, [rel mbox_get_thread]
    mov qword [r15+48], rax
    ; bl      _task_park_fail
    lea rax, [rel xret_64]
    mov qword [r15+240], rax
    jmp _task_park_fail
    xret_64:
    ; cbnz    x0, XMBOX_GET
    mov rax, qword [r15+0]
    cmp rax, 0
    jne XMBOX_GET
    ; mov     x20, #0
    mov rax, 0
    mov qword [r15+160], rax
    ; lea x0, str_mbox_get_stuck
    lea rax, [rel str_mbox_get_stuck]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_65]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_65:
XMBOX_GET_END:
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
nm_XQUEUE:
    ; DCB "QUEUE", 0
    db "QUEUE", 0
hl_XQUEUE:
    ; DCB "QUEUE ( n -- addr ) allot a fixed ring of n slots (n >= 2)", 0
    db "QUEUE ( n -- addr ) allot a fixed ring of n slots (n >= 2)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XQUEUE:
    ; DCQ     nm_XQUEUE, hl_XQUEUE
    dq nm_XQUEUE, hl_XQUEUE
    ; DCQ     0
    dq 0
    ; DCQ     XQUEUE, XQUEUE_END
    dq XQUEUE, XQUEUE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XQUEUE
    dq row_XQUEUE
section .text
XQUEUE:
    ; cmp     x20, #2
    mov rax, qword [r15+160]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lt    _queue_bad_n
    mov r11b, byte [r15+248]
    cmp r11b, byte [r15+251]
    jne _queue_bad_n
    ; lsr     x1, x20, #61
    mov rax, qword [r15+160]
    shr rax, 61
    mov qword [r15+8], rax
    ; cbnz    x1, _queue_overflow
    mov rax, qword [r15+8]
    cmp rax, 0
    jne _queue_overflow
    ; lsl     x0, x20, #3
    mov rax, qword [r15+160]
    shl rax, 3
    mov qword [r15+0], rax
    ; adds    x0, x0, #Q_SLOTS
    mov rax, qword [r15+0]
    add rax, 0x18
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    mov qword [r15+0], rax
    ; b.cs    _queue_overflow
    cmp byte [r15+250], 0
    jne _queue_overflow
    ; mov     x21, x20
    mov rax, qword [r15+160]
    mov qword [r15+168], rax
    ; bl      _dict_allot
    lea rax, [rel xret_66]
    mov qword [r15+240], rax
    jmp _dict_allot
    xret_66:
    ; str     x21, [x0, #Q_CAP]
    mov r10, qword [r15+0]
    mov rax, qword [r15+168]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
    ; b       XQUEUE_END
    jmp XQUEUE_END
_queue_bad_n:
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; lea x0, str_queue_n
    lea rax, [rel str_queue_n]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_67]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_67:
    ; b       XQUEUE_END
    jmp XQUEUE_END
_queue_overflow:
    ; lea x0, str_allot_over
    lea rax, [rel str_allot_over]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_68]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_68:
    ; b       _error_abandon
    jmp _error_abandon
XQUEUE_END:
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
nm_XQPUT:
    ; DCB ">Q", 0
    db ">Q", 0
hl_XQPUT:
    ; DCB ">Q ( n addr -- ) write n into the ring, then publish the tail", 0
    db ">Q ( n addr -- ) write n into the ring, then publish the tail", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XQPUT:
    ; DCQ     nm_XQPUT, hl_XQPUT
    dq nm_XQPUT, hl_XQPUT
    ; DCQ     0
    dq 0
    ; DCQ     XQPUT, XQPUT_END
    dq XQPUT, XQPUT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XQPUT
    dq row_XQPUT
section .text
XQPUT_RETRY:
    ; lea x0, up_var
    lea rax, [rel up_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x19, [x0, #TU_RESUME]
    mov r10, qword [r15+0]
    add r10, 0x50
    mov rax, qword [r10]
    mov qword [r15+152], rax
    ; b       XQPUT
    jmp XQPUT
XQPUT:
    ; ldr     x1, [x20, #Q_CAP]
    mov r10, qword [r15+160]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; ldr     x3, [x20, #Q_TAIL]
    mov r10, qword [r15+160]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; add     x0, x20, #Q_HEAD
    mov rax, qword [r15+160]
    add rax, 8
    mov qword [r15+0], rax
    ; ldar    x4, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+32], rax
    ; add     x5, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+40], rax
    ; cmp     x5, x1
    mov rax, qword [r15+40]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _qput_nowrap
    cmp byte [r15+250], 0
    je _qput_nowrap
    ; mov     x5, #0
    mov rax, 0
    mov qword [r15+40], rax
_qput_nowrap:
    ; cmp     x5, x4
    mov rax, qword [r15+40]
    mov rcx, qword [r15+32]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _qput_full
    cmp byte [r15+249], 0
    jne _qput_full
    ; add     x0, x20, #Q_SLOTS
    mov rax, qword [r15+160]
    add rax, 0x18
    mov qword [r15+0], rax
    ; lsl     x4, x3, #3
    mov rax, qword [r15+24]
    shl rax, 3
    mov qword [r15+32], rax
    ; ldr     x1, [x22]
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; str     x1, [x0, x4]
    mov r10, qword [r15+0]
    mov rax, qword [r15+32]
    add r10, rax
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; add     x0, x20, #Q_TAIL
    mov rax, qword [r15+160]
