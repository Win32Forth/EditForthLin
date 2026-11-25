; Generated from Forth/kernel/arm64/prims_k3.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
extern DODOES
extern _compile_cell
extern _cursor_commit
extern _cursor_load
extern _dict_hash
extern _here_reserve
extern _next_word
extern _print_unsigned
extern _putchar
extern cfa_lit
extern cfa_local_init
extern cfa_loop
extern cfa_plusloop
extern cfa_slit
extern debug_break_asap
extern emit_cstr
extern emit_str
extern here_ptr
extern host_app_blit
extern host_app_cblit
extern host_app_close
extern host_app_file_choose
extern host_app_file_path
extern host_app_file_save_as
extern host_app_file_save_picture
extern host_app_file_slurp
extern host_app_file_spew
extern host_app_img_choose
extern host_app_img_load
extern host_app_img_render
extern host_app_img_size
extern host_app_key
extern host_app_keyq
extern host_app_mouse
extern host_app_name
extern host_app_open
extern host_app_pblit
extern host_app_pump
extern host_app_size
extern host_app_tone
extern host_oop_call
extern latest_var
extern local_brace_phase
extern local_declaring
extern local_frame_depth
extern local_frame_n
extern local_frame_rsp
extern local_frames
extern local_init_count
extern local_init_reverse
extern local_name_count
extern local_names
extern next_debug
extern search_order
extern search_order_n
extern slit_esc_buf
extern slit_esc_buf2
extern slit_esc_which
extern state_var
extern up_var
extern words_cfa
extern words_filter
extern words_filter_len
extern words_nk_tmp
extern words_user_base
section .text
global _local_compile_reset
global _local_add_name
global _local_lookup
global _local_finalize_compile
global _local_frame_try_exit
global XLOCAL_INIT
global XLOCAL_AT
global XLOCAL_STORE
global XLOCAL_BRACE
global XSEARCH_WORDLIST
global XSOURCE
global XLEAVE
global XTWOSTAR
global XTWOSLASH
global XLFETCH
global XLSTORE
global _record_words_user_base_once
global _words_name_ptr
global _words_cfa_cmp
global _words_filter_match
global _print_wid_name
section .bwstr align=1
nm_XLOCAL_INIT:
    ; DCB "LOCAL-INIT", 0
    db "LOCAL-INIT", 0
hl_XLOCAL_INIT:
    ; DCB "LOCAL-INIT ( n nInit rev -- ) create a locals frame", 0
    db "LOCAL-INIT ( n nInit rev -- ) create a locals frame", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_INIT:
    ; DCQ     nm_XLOCAL_INIT, hl_XLOCAL_INIT
    dq nm_XLOCAL_INIT, hl_XLOCAL_INIT
    ; DCQ     0
    dq 0
    ; DCQ     XLOCAL_INIT, XLOCAL_INIT_END
    dq XLOCAL_INIT, XLOCAL_INIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_INIT
    dq row_XLOCAL_INIT
section .text
XLOCAL_INIT:
    ; mov     x2, x20
    mov rax, qword [r15+160]
    mov qword [r15+16], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
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
    ; cmp     x0, #LOCAL_MAX
    mov rax, qword [r15+0]
    cmp rax, 0x20
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _li_n_ok
    cmp byte [r15+250], 0
    je _li_n_ok
    cmp byte [r15+249], 0
    jne _li_n_ok
    ; mov     x0, #LOCAL_MAX
    mov rax, 0x20
    mov qword [r15+0], rax
_li_n_ok:
    ; cmp     x1, x0
    mov rax, qword [r15+8]
    mov rcx, qword [r15+0]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _li_i_ok
    cmp byte [r15+250], 0
    je _li_i_ok
    cmp byte [r15+249], 0
    jne _li_i_ok
    ; mov     x1, x0
    mov rax, qword [r15+0]
    mov qword [r15+8], rax
_li_i_ok:
    ; lea x3, local_frame_depth
    lea rax, [rel local_frame_depth]
    mov qword [r15+24], rax
    ; ldr     x4, [x3]
    mov r10, qword [r15+24]
    mov rax, qword [r10]
    mov qword [r15+32], rax
    ; cmp     x4, #LOCAL_FRAME_MAX
    mov rax, qword [r15+32]
    cmp rax, 0x10
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _li_overflow
    cmp byte [r15+250], 0
    jne _li_overflow
    ; mov     x5, #LOCAL_MAX
    mov rax, 0x20
    mov qword [r15+40], rax
    ; mul     x5, x5, x4
    mov rax, qword [r15+40]
    mov rcx, qword [r15+32]
    imul rax, rcx
    mov qword [r15+40], rax
    ; lsl     x5, x5, #3
    mov rax, qword [r15+40]
    shl rax, 3
    mov qword [r15+40], rax
    ; lea x6, local_frames
    lea rax, [rel local_frames]
    mov qword [r15+48], rax
    ; add     x6, x6, x5
    mov rax, qword [r15+48]
    mov rcx, qword [r15+40]
    add rax, rcx
    mov qword [r15+48], rax
    ; mov     x7, #0
    mov rax, 0
    mov qword [r15+56], rax
_li_zero:
    ; cmp     x7, x0
    mov rax, qword [r15+56]
    mov rcx, qword [r15+0]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _li_fill
    cmp byte [r15+250], 0
    jne _li_fill
    ; lsl     x8, x7, #3
    mov rax, qword [r15+56]
    shl rax, 3
    mov qword [r15+64], rax
    ; str     xzr, [x6, x8]
    mov r10, qword [r15+48]
    mov rax, qword [r15+64]
    add r10, rax
    mov qword [r10], 0
    ; add     x7, x7, #1
    mov rax, qword [r15+56]
    add rax, 1
    mov qword [r15+56], rax
    ; b       _li_zero
    jmp _li_zero
_li_fill:
    ; cbz     x2, _li_forward
    mov rax, qword [r15+16]
    cmp rax, 0
    je _li_forward
    ; mov     x7, x1
    mov rax, qword [r15+8]
    mov qword [r15+56], rax
_li_rev:
    ; cbz     x7, _li_mark
    mov rax, qword [r15+56]
    cmp rax, 0
    je _li_mark
    ; sub     x7, x7, #1
    mov rax, qword [r15+56]
    sub rax, 1
    mov qword [r15+56], rax
    ; lsl     x8, x7, #3
    mov rax, qword [r15+56]
    shl rax, 3
    mov qword [r15+64], rax
    ; str     x20, [x6, x8]
    mov r10, qword [r15+48]
    mov rax, qword [r15+64]
    add r10, rax
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; b       _li_rev
    jmp _li_rev
_li_forward:
    ; mov     x7, #0
    mov rax, 0
    mov qword [r15+56], rax
_li_fwd:
    ; cmp     x7, x1
    mov rax, qword [r15+56]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _li_mark
    cmp byte [r15+250], 0
    jne _li_mark
    ; lsl     x8, x7, #3
    mov rax, qword [r15+56]
    shl rax, 3
    mov qword [r15+64], rax
    ; str     x20, [x6, x8]
    mov r10, qword [r15+48]
    mov rax, qword [r15+64]
    add r10, rax
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; add     x7, x7, #1
    mov rax, qword [r15+56]
    add rax, 1
    mov qword [r15+56], rax
    ; b       _li_fwd
    jmp _li_fwd
_li_mark:
    ; lea x5, local_frame_rsp
    lea rax, [rel local_frame_rsp]
    mov qword [r15+40], rax
    ; lsl     x8, x4, #3
    mov rax, qword [r15+32]
    shl rax, 3
    mov qword [r15+64], rax
    ; str     x23, [x5, x8]
    mov r10, qword [r15+40]
    mov rax, qword [r15+64]
    add r10, rax
    mov rax, qword [r15+184]
    mov qword [r10], rax
    ; lea x5, local_frame_n
    lea rax, [rel local_frame_n]
    mov qword [r15+40], rax
    ; str     x0, [x5, x8]
    mov r10, qword [r15+40]
    mov rax, qword [r15+64]
    add r10, rax
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; add     x4, x4, #1
    mov rax, qword [r15+32]
    add rax, 1
    mov qword [r15+32], rax
    ; str     x4, [x3]
    mov r10, qword [r15+24]
    mov rax, qword [r15+32]
    mov qword [r10], rax
    ; b       XLOCAL_INIT_END
    jmp XLOCAL_INIT_END
_li_overflow:
    ; mov     x7, x1
    mov rax, qword [r15+8]
    mov qword [r15+56], rax
_li_drain:
    ; cbz     x7, XLOCAL_INIT_END
    mov rax, qword [r15+56]
    cmp rax, 0
    je XLOCAL_INIT_END
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; sub     x7, x7, #1
    mov rax, qword [r15+56]
    sub rax, 1
    mov qword [r15+56], rax
    ; b       _li_drain
    jmp _li_drain
XLOCAL_INIT_END:
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
nm_XLOCAL_AT:
    ; DCB "(LOCAL@)", 0
    db "(LOCAL@)", 0
hl_XLOCAL_AT:
    ; DCB "(LOCAL@) ( idx -- x ) fetch a local", 0
    db "(LOCAL@) ( idx -- x ) fetch a local", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_AT:
    ; DCQ     nm_XLOCAL_AT, hl_XLOCAL_AT
    dq nm_XLOCAL_AT, hl_XLOCAL_AT
    ; DCQ     0
    dq 0
    ; DCQ     XLOCAL_AT, XLOCAL_AT_END
    dq XLOCAL_AT, XLOCAL_AT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_AT
    dq row_XLOCAL_AT
section .text
XLOCAL_AT:
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; lea x1, local_frame_depth
    lea rax, [rel local_frame_depth]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, _lat_none
    mov rax, qword [r15+8]
    cmp rax, 0
    je _lat_none
    ; sub     x1, x1, #1
    mov rax, qword [r15+8]
    sub rax, 1
    mov qword [r15+8], rax
    ; mov     x2, #LOCAL_MAX
    mov rax, 0x20
    mov qword [r15+16], rax
    ; mul     x2, x2, x1
    mov rax, qword [r15+16]
    mov rcx, qword [r15+8]
    imul rax, rcx
    mov qword [r15+16], rax
    ; lsl     x2, x2, #3
    mov rax, qword [r15+16]
    shl rax, 3
    mov qword [r15+16], rax
    ; lea x3, local_frames
    lea rax, [rel local_frames]
    mov qword [r15+24], rax
    ; add     x3, x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    add rax, rcx
    mov qword [r15+24], rax
    ; lea x2, local_frame_n
    lea rax, [rel local_frame_n]
    mov qword [r15+16], rax
    ; lsl     x4, x1, #3
    mov rax, qword [r15+8]
    shl rax, 3
    mov qword [r15+32], rax
    ; ldr     x2, [x2, x4]
    mov r10, qword [r15+16]
    mov rax, qword [r15+32]
    add r10, rax
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
    ; b.hs    _lat_none
    cmp byte [r15+250], 0
    jne _lat_none
    ; lsl     x4, x0, #3
    mov rax, qword [r15+0]
    shl rax, 3
    mov qword [r15+32], rax
    ; ldr     x20, [x3, x4]
    mov r10, qword [r15+24]
    mov rax, qword [r15+32]
    add r10, rax
    mov rax, qword [r10]
    mov qword [r15+160], rax
    ; b       XLOCAL_AT_END
    jmp XLOCAL_AT_END
_lat_none:
    ; mov     x20, #0
    mov rax, 0
    mov qword [r15+160], rax
XLOCAL_AT_END:
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
nm_XLOCAL_STORE:
    ; DCB "(LOCAL!)", 0
    db "(LOCAL!)", 0
hl_XLOCAL_STORE:
    ; DCB "(LOCAL!) ( x idx -- ) store a local", 0
    db "(LOCAL!) ( x idx -- ) store a local", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_STORE:
    ; DCQ     nm_XLOCAL_STORE, hl_XLOCAL_STORE
    dq nm_XLOCAL_STORE, hl_XLOCAL_STORE
    ; DCQ     0
    dq 0
    ; DCQ     XLOCAL_STORE, XLOCAL_STORE_END
    dq XLOCAL_STORE, XLOCAL_STORE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_STORE
    dq row_XLOCAL_STORE
section .text
XLOCAL_STORE:
    ; mov     x0, x20
    mov rax, qword [r15+160]
    mov qword [r15+0], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+8], rax
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
    ; lea x2, local_frame_depth
    lea rax, [rel local_frame_depth]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cbz     x2, XLOCAL_STORE_END
    mov rax, qword [r15+16]
    cmp rax, 0
    je XLOCAL_STORE_END
    ; sub     x2, x2, #1
    mov rax, qword [r15+16]
    sub rax, 1
    mov qword [r15+16], rax
    ; mov     x3, #LOCAL_MAX
    mov rax, 0x20
    mov qword [r15+24], rax
    ; mul     x3, x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    imul rax, rcx
    mov qword [r15+24], rax
    ; lsl     x3, x3, #3
    mov rax, qword [r15+24]
    shl rax, 3
    mov qword [r15+24], rax
    ; lea x4, local_frames
    lea rax, [rel local_frames]
    mov qword [r15+32], rax
    ; add     x4, x4, x3
    mov rax, qword [r15+32]
    mov rcx, qword [r15+24]
    add rax, rcx
    mov qword [r15+32], rax
    ; lea x3, local_frame_n
    lea rax, [rel local_frame_n]
    mov qword [r15+24], rax
    ; lsl     x5, x2, #3
    mov rax, qword [r15+16]
    shl rax, 3
    mov qword [r15+40], rax
    ; ldr     x3, [x3, x5]
    mov r10, qword [r15+24]
    mov rax, qword [r15+40]
    add r10, rax
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
    ; b.hs    XLOCAL_STORE_END
    cmp byte [r15+250], 0
    jne XLOCAL_STORE_END
    ; lsl     x5, x0, #3
    mov rax, qword [r15+0]
    shl rax, 3
    mov qword [r15+40], rax
    ; str     x1, [x4, x5]
    mov r10, qword [r15+32]
    mov rax, qword [r15+40]
    add r10, rax
    mov rax, qword [r15+8]
    mov qword [r10], rax
XLOCAL_STORE_END:
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
nm_XLOCAL_BRACE:
    ; DCB "{:", 0
    db "{:", 0
hl_XLOCAL_BRACE:
    ; DCB "declare locals until :}", 0
    db "declare locals until :}", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_BRACE:
    ; DCQ     nm_XLOCAL_BRACE, hl_XLOCAL_BRACE
    dq nm_XLOCAL_BRACE, hl_XLOCAL_BRACE
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XLOCAL_BRACE, 0
    dq XLOCAL_BRACE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_BRACE
    dq row_XLOCAL_BRACE
section .text
XLOCAL_BRACE:
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
    ; lea x0, state_var
    lea rax, [rel state_var]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; cbz     x0, _lb_leave
    mov rax, qword [r15+0]
    cmp rax, 0
    je _lb_leave
    ; bl      _local_compile_reset
    lea rax, [rel xret_1]
    mov qword [r15+240], rax
    jmp _local_compile_reset
    xret_1:
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; lea x1, local_init_reverse
    lea rax, [rel local_init_reverse]
    mov qword [r15+8], rax
    ; str     x0, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; lea x1, local_brace_phase
    lea rax, [rel local_brace_phase]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
_lb_loop:
    ; bl      _next_word
    lea rax, [rel xret_2]
    mov qword [r15+240], rax
    jmp _next_word
    xret_2:
    ; cbz     x1, _lb_done
    mov rax, qword [r15+8]
    cmp rax, 0
    je _lb_done
    ; cmp     x1, #2
    mov rax, qword [r15+8]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _lb_bar
    cmp byte [r15+249], 0
    je _lb_bar
    ; ldrb    w2, [x0]
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; cmp     w2, #':'
    mov eax, dword [r15+16]
    cmp eax, 0x3a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _lb_bar
    cmp byte [r15+249], 0
    je _lb_bar
    ; ldrb    w2, [x0, #1]
    mov r10, qword [r15+0]
    add r10, 1
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; cmp     w2, #'}'
    mov eax, dword [r15+16]
    cmp eax, 0x7d
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _lb_done
    cmp byte [r15+249], 0
    jne _lb_done
_lb_bar:
    ; cmp     x1, #1
    mov rax, qword [r15+8]
    cmp rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _lb_dash
    cmp byte [r15+249], 0
    je _lb_dash
    ; ldrb    w2, [x0]
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; cmp     w2, #'|'
    mov eax, dword [r15+16]
    cmp eax, 0x7c
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _lb_dash
    cmp byte [r15+249], 0
    je _lb_dash
    ; mov     x2, #1
    mov rax, 1
    mov qword [r15+16], rax
    ; lea x3, local_brace_phase
    lea rax, [rel local_brace_phase]
    mov qword [r15+24], rax
    ; str     x2, [x3]
    mov r10, qword [r15+24]
    mov rax, qword [r15+16]
    mov qword [r10], rax
    ; b       _lb_loop
    jmp _lb_loop
_lb_dash:
    ; cmp     x1, #2
    mov rax, qword [r15+8]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _lb_name
    cmp byte [r15+249], 0
    je _lb_name
    ; ldrb    w2, [x0]
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; cmp     w2, #'-'
    mov eax, dword [r15+16]
    cmp eax, 0x2d
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _lb_name
    cmp byte [r15+249], 0
    je _lb_name
    ; ldrb    w2, [x0, #1]
    mov r10, qword [r15+0]
    add r10, 1
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; cmp     w2, #'-'
    mov eax, dword [r15+16]
    cmp eax, 0x2d
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _lb_name
    cmp byte [r15+249], 0
    je _lb_name
    ; mov     x2, #2
    mov rax, 2
    mov qword [r15+16], rax
    ; lea x3, local_brace_phase
    lea rax, [rel local_brace_phase]
    mov qword [r15+24], rax
    ; str     x2, [x3]
    mov r10, qword [r15+24]
    mov rax, qword [r15+16]
    mov qword [r10], rax
    ; b       _lb_loop
    jmp _lb_loop
_lb_name:
    ; lea x3, local_brace_phase
    lea rax, [rel local_brace_phase]
    mov qword [r15+24], rax
    ; ldr     x3, [x3]
    mov r10, qword [r15+24]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cmp     x3, #2
    mov rax, qword [r15+24]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _lb_loop
    cmp byte [r15+249], 0
    jne _lb_loop
    ; bl      _local_add_name
    lea rax, [rel xret_3]
    mov qword [r15+240], rax
    jmp _local_add_name
    xret_3:
    ; lea x3, local_brace_phase
    lea rax, [rel local_brace_phase]
    mov qword [r15+24], rax
    ; ldr     x3, [x3]
    mov r10, qword [r15+24]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; cbnz    x3, _lb_loop
    mov rax, qword [r15+24]
    cmp rax, 0
    jne _lb_loop
    ; lea x2, local_init_count
    lea rax, [rel local_init_count]
    mov qword [r15+16], rax
    ; ldr     x3, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; add     x3, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; str     x3, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r15+24]
    mov qword [r10], rax
    ; b       _lb_loop
    jmp _lb_loop
_lb_done:
    ; bl      _local_finalize_compile
    lea rax, [rel xret_4]
    mov qword [r15+240], rax
    jmp _local_finalize_compile
    xret_4:
_lb_leave:
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
nm_XLOCAL_COMPILE_RESET:
    ; DCB "(LOCAL-COMPILE-RESET)", 0
    db "(LOCAL-COMPILE-RESET)", 0
hl_XLOCAL_COMPILE_RESET:
    ; DCB "(LOCAL-COMPILE-RESET) ( -- ) clear locals compile state", 0
    db "(LOCAL-COMPILE-RESET) ( -- ) clear locals compile state", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_COMPILE_RESET:
    ; DCQ     nm_XLOCAL_COMPILE_RESET, hl_XLOCAL_COMPILE_RESET
    dq nm_XLOCAL_COMPILE_RESET, hl_XLOCAL_COMPILE_RESET
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     XLOCAL_COMPILE_RESET, XLOCAL_COMPILE_RESET_END
    dq XLOCAL_COMPILE_RESET, XLOCAL_COMPILE_RESET_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_COMPILE_RESET
    dq row_XLOCAL_COMPILE_RESET
section .text
XLOCAL_COMPILE_RESET:
_local_compile_reset:
    ; lea x0, local_name_count
    lea rax, [rel local_name_count]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, local_init_count
    lea rax, [rel local_init_count]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, local_init_reverse
    lea rax, [rel local_init_reverse]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; lea x0, local_declaring
    lea rax, [rel local_declaring]
    mov qword [r15+0], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; ret
    jmp qword [r15+240]
XLOCAL_COMPILE_RESET_END:
section .bwstr align=1
nm_XLOCAL_ADD_NAME:
    ; DCB "(LOCAL-ADD-NAME)", 0
    db "(LOCAL-ADD-NAME)", 0
hl_XLOCAL_ADD_NAME:
    ; DCB "(LOCAL-ADD-NAME) ( -- ) add one local name", 0
    db "(LOCAL-ADD-NAME) ( -- ) add one local name", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_ADD_NAME:
    ; DCQ     nm_XLOCAL_ADD_NAME, hl_XLOCAL_ADD_NAME
    dq nm_XLOCAL_ADD_NAME, hl_XLOCAL_ADD_NAME
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     XLOCAL_ADD_NAME, XLOCAL_ADD_NAME_END
    dq XLOCAL_ADD_NAME, XLOCAL_ADD_NAME_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_ADD_NAME
    dq row_XLOCAL_ADD_NAME
section .text
XLOCAL_ADD_NAME:
_local_add_name:
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
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
    ; mov     x20, x1
    mov rax, qword [r15+8]
    mov qword [r15+160], rax
    ; lea x0, local_name_count
    lea rax, [rel local_name_count]
    mov qword [r15+0], rax
    ; ldr     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cmp     x1, #LOCAL_MAX
    mov rax, qword [r15+8]
    cmp rax, 0x20
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _lan_done
    cmp byte [r15+250], 0
    jne _lan_done
    ; mov     x2, #LOCAL_NAME_STR
    mov rax, 0x20
    mov qword [r15+16], rax
    ; mul     x2, x2, x1
    mov rax, qword [r15+16]
    mov rcx, qword [r15+8]
    imul rax, rcx
    mov qword [r15+16], rax
    ; lea x3, local_names
    lea rax, [rel local_names]
    mov qword [r15+24], rax
    ; add     x3, x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    add rax, rcx
    mov qword [r15+24], rax
    ; cmp     x20, #31
    mov rax, qword [r15+160]
    cmp rax, 0x1f
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _lan_len
    cmp byte [r15+250], 0
    je _lan_len
    cmp byte [r15+249], 0
    jne _lan_len
    ; mov     x20, #31
    mov rax, 0x1f
    mov qword [r15+160], rax
_lan_len:
    ; strb    w20, [x3], #1
    mov r10, qword [r15+24]
    mov eax, dword [r15+160]
    mov byte [r10], al
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [r15+16], rax
_lan_cp:
    ; cmp     x2, x20
    mov rax, qword [r15+16]
    mov rcx, qword [r15+160]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _lan_count
    cmp byte [r15+250], 0
    jne _lan_count
    ; ldrb    w4, [x19, x2]
    mov r10, qword [r15+152]
    mov rax, qword [r15+16]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cmp     w4, #'a'
    mov eax, dword [r15+32]
    cmp eax, 0x61
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _lan_st
    cmp byte [r15+250], 0
    je _lan_st
    ; cmp     w4, #'z'
    mov eax, dword [r15+32]
    cmp eax, 0x7a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _lan_st
    cmp byte [r15+250], 0
    je xsk_5
    cmp byte [r15+249], 0
    je _lan_st
    xsk_5:
    ; sub     w4, w4, #32
    mov eax, dword [r15+32]
    sub eax, 0x20
    mov qword [r15+32], rax
_lan_st:
    ; strb    w4, [x3, x2]
    mov r10, qword [r15+24]
    mov rax, qword [r15+16]
    add r10, rax
    mov eax, dword [r15+32]
    mov byte [r10], al
    ; add     x2, x2, #1
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; b       _lan_cp
    jmp _lan_cp
_lan_count:
    ; lea x0, local_name_count
    lea rax, [rel local_name_count]
    mov qword [r15+0], rax
    ; ldr     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; add     x1, x1, #1
    mov rax, qword [r15+8]
    add rax, 1
    mov qword [r15+8], rax
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
_lan_done:
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
    ; ret
    jmp qword [r15+240]
XLOCAL_ADD_NAME_END:
section .bwstr align=1
nm_XLOCAL_LOOKUP:
    ; DCB "(LOCAL-LOOKUP)", 0
    db "(LOCAL-LOOKUP)", 0
hl_XLOCAL_LOOKUP:
    ; DCB "(LOCAL-LOOKUP) ( -- ) local name index or -1", 0
    db "(LOCAL-LOOKUP) ( -- ) local name index or -1", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_LOOKUP:
    ; DCQ     nm_XLOCAL_LOOKUP, hl_XLOCAL_LOOKUP
    dq nm_XLOCAL_LOOKUP, hl_XLOCAL_LOOKUP
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     XLOCAL_LOOKUP, XLOCAL_LOOKUP_END
    dq XLOCAL_LOOKUP, XLOCAL_LOOKUP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_LOOKUP
    dq row_XLOCAL_LOOKUP
section .text
XLOCAL_LOOKUP:
_local_lookup:
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
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
    ; mov     x20, x1
    mov rax, qword [r15+8]
    mov qword [r15+160], rax
    ; lea x0, local_name_count
    lea rax, [rel local_name_count]
    mov qword [r15+0], rax
    ; ldr     x21, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+168], rax
    ; mov     x22, #0
    mov rax, 0
    mov qword [r15+176], rax
_ll_loop:
    ; cmp     x22, x21
    mov rax, qword [r15+176]
    mov rcx, qword [r15+168]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _ll_miss
    cmp byte [r15+250], 0
    jne _ll_miss
    ; mov     x2, #LOCAL_NAME_STR
    mov rax, 0x20
    mov qword [r15+16], rax
    ; mul     x2, x2, x22
    mov rax, qword [r15+16]
    mov rcx, qword [r15+176]
    imul rax, rcx
    mov qword [r15+16], rax
    ; lea x3, local_names
    lea rax, [rel local_names]
    mov qword [r15+24], rax
    ; add     x3, x3, x2
    mov rax, qword [r15+24]
    mov rcx, qword [r15+16]
    add rax, rcx
    mov qword [r15+24], rax
    ; ldrb    w2, [x3], #1
    mov r10, qword [r15+24]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; cmp     x2, x20
    mov rax, qword [r15+16]
    mov rcx, qword [r15+160]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _ll_next
    cmp byte [r15+249], 0
    je _ll_next
    ; mov     x4, #0
    mov rax, 0
    mov qword [r15+32], rax
_ll_cmp:
    ; cmp     x4, x20
    mov rax, qword [r15+32]
    mov rcx, qword [r15+160]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _ll_hit
    cmp byte [r15+250], 0
    jne _ll_hit
    ; ldrb    w5, [x3, x4]
    mov r10, qword [r15+24]
    mov rax, qword [r15+32]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+40], rax
    ; ldrb    w6, [x19, x4]
    mov r10, qword [r15+152]
    mov rax, qword [r15+32]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+48], rax
    ; cmp     w6, #'a'
    mov eax, dword [r15+48]
    cmp eax, 0x61
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _ll_fold
    cmp byte [r15+250], 0
    je _ll_fold
    ; cmp     w6, #'z'
    mov eax, dword [r15+48]
    cmp eax, 0x7a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _ll_fold
    cmp byte [r15+250], 0
    je xsk_6
    cmp byte [r15+249], 0
    je _ll_fold
    xsk_6:
    ; sub     w6, w6, #32
    mov eax, dword [r15+48]
    sub eax, 0x20
    mov qword [r15+48], rax
_ll_fold:
    ; cmp     w5, w6
    mov eax, dword [r15+40]
    mov ecx, dword [r15+48]
    cmp eax, ecx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _ll_next
    cmp byte [r15+249], 0
    je _ll_next
    ; add     x4, x4, #1
    mov rax, qword [r15+32]
    add rax, 1
    mov qword [r15+32], rax
    ; b       _ll_cmp
    jmp _ll_cmp
_ll_next:
    ; add     x22, x22, #1
    mov rax, qword [r15+176]
    add rax, 1
    mov qword [r15+176], rax
    ; b       _ll_loop
    jmp _ll_loop
_ll_miss:
    ; mov     x0, #-1
    mov rax, -1
    mov qword [r15+0], rax
    ; b       _ll_out
    jmp _ll_out
_ll_hit:
    ; mov     x0, x22
    mov rax, qword [r15+176]
    mov qword [r15+0], rax
_ll_out:
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
    ; ret
    jmp qword [r15+240]
XLOCAL_LOOKUP_END:
section .bwstr align=1
nm_XLOCAL_FINALIZE:
    ; DCB "(LOCAL-FINALIZE)", 0
    db "(LOCAL-FINALIZE)", 0
hl_XLOCAL_FINALIZE:
    ; DCB "(LOCAL-FINALIZE) ( -- ) compile LOCAL-INIT", 0
    db "(LOCAL-FINALIZE) ( -- ) compile LOCAL-INIT", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_FINALIZE:
    ; DCQ     nm_XLOCAL_FINALIZE, hl_XLOCAL_FINALIZE
    dq nm_XLOCAL_FINALIZE, hl_XLOCAL_FINALIZE
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     XLOCAL_FINALIZE, XLOCAL_FINALIZE_END
    dq XLOCAL_FINALIZE, XLOCAL_FINALIZE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_FINALIZE
    dq row_XLOCAL_FINALIZE
section .text
XLOCAL_FINALIZE:
_local_finalize_compile:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_7]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_7:
    ; lea x0, local_name_count
    lea rax, [rel local_name_count]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_8]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_8:
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_9]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_9:
    ; lea x0, local_init_count
    lea rax, [rel local_init_count]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_10]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_10:
    ; lea x0, cfa_lit
    lea rax, [rel cfa_lit]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_11]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_11:
    ; lea x0, local_init_reverse
    lea rax, [rel local_init_reverse]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_12]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_12:
    ; lea x0, cfa_local_init
    lea rax, [rel cfa_local_init]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_13]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_13:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
XLOCAL_FINALIZE_END:
section .bwstr align=1
nm_XLOCAL_FRAME_TRY_EXIT:
    ; DCB "(LOCAL-FRAME-EXIT)", 0
    db "(LOCAL-FRAME-EXIT)", 0
hl_XLOCAL_FRAME_TRY_EXIT:
    ; DCB "(LOCAL-FRAME-EXIT) ( -- ) pop locals frame when RSP matches", 0
    db "(LOCAL-FRAME-EXIT) ( -- ) pop locals frame when RSP matches", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLOCAL_FRAME_TRY_EXIT:
    ; DCQ     nm_XLOCAL_FRAME_TRY_EXIT, hl_XLOCAL_FRAME_TRY_EXIT
    dq nm_XLOCAL_FRAME_TRY_EXIT, hl_XLOCAL_FRAME_TRY_EXIT
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     XLOCAL_FRAME_TRY_EXIT, XLOCAL_FRAME_TRY_EXIT_END
    dq XLOCAL_FRAME_TRY_EXIT, XLOCAL_FRAME_TRY_EXIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLOCAL_FRAME_TRY_EXIT
    dq row_XLOCAL_FRAME_TRY_EXIT
section .text
XLOCAL_FRAME_TRY_EXIT:
_local_frame_try_exit:
    ; lea x0, local_frame_depth
    lea rax, [rel local_frame_depth]
    mov qword [r15+0], rax
    ; ldr     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, _lfe_done
    mov rax, qword [r15+8]
    cmp rax, 0
    je _lfe_done
    ; sub     x1, x1, #1
    mov rax, qword [r15+8]
    sub rax, 1
    mov qword [r15+8], rax
    ; lea x2, local_frame_rsp
    lea rax, [rel local_frame_rsp]
    mov qword [r15+16], rax
    ; lsl     x3, x1, #3
    mov rax, qword [r15+8]
    shl rax, 3
    mov qword [r15+24], rax
    ; ldr     x2, [x2, x3]
    mov r10, qword [r15+16]
    mov rax, qword [r15+24]
    add r10, rax
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; cmp     x2, x23
    mov rax, qword [r15+16]
    mov rcx, qword [r15+184]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _lfe_done
    cmp byte [r15+249], 0
    je _lfe_done
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
_lfe_done:
    ; ret
    jmp qword [r15+240]
XLOCAL_FRAME_TRY_EXIT_END:
section .bwstr align=1
nm_XSEARCH_WORDLIST:
    ; DCB "SEARCH-WORDLIST", 0
    db "SEARCH-WORDLIST", 0
hl_XSEARCH_WORDLIST:
    ; DCB "SEARCH-WORDLIST ( c-addr u wid -- 0 | xt 1 | xt -1 ) find in one wordlist", 0
    db "SEARCH-WORDLIST ( c-addr u wid -- 0 | xt 1 | xt -1 ) find in one wordlist", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSEARCH_WORDLIST:
    ; DCQ     nm_XSEARCH_WORDLIST, hl_XSEARCH_WORDLIST
    dq nm_XSEARCH_WORDLIST, hl_XSEARCH_WORDLIST
    ; DCQ     0
    dq 0
    ; DCQ     XSEARCH_WORDLIST, 0
    dq XSEARCH_WORDLIST, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSEARCH_WORDLIST
    dq row_XSEARCH_WORDLIST
section .text
XSEARCH_WORDLIST:
    ; mov     x9, x20
    mov rax, qword [r15+160]
    mov qword [r15+72], rax
    ; ldr     x8, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+64], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; ldr     x7, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+56], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; cbz     x9, _swl_zero
    mov rax, qword [r15+72]
    cmp rax, 0
    je _swl_zero
    ; cbz     x8, _swl_zero
    mov rax, qword [r15+64]
    cmp rax, 0
    je _swl_zero
    ; stp     x7, x8, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+56]
    mov qword [r10+0], rax
    mov rax, qword [r15+64]
    mov qword [r10+8], rax
    ; str     x9, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+72]
    mov qword [r10], rax
    ; mov     x0, x7
    mov rax, qword [r15+56]
    mov qword [r15+0], rax
    ; mov     x1, x8
    mov rax, qword [r15+64]
    mov qword [r15+8], rax
    ; mov     x12, x30
    mov rax, qword [r15+240]
    mov qword [r15+96], rax
    ; bl      _dict_hash
    lea rax, [rel xret_14]
    mov qword [r15+240], rax
    jmp _dict_hash
    xret_14:
    ; mov     x30, x12
    mov rax, qword [r15+96]
    mov qword [r15+240], rax
    ; mov     x10, x0
    mov rax, qword [r15+0]
    mov qword [r15+80], rax
    ; ldr     x9, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+72], rax
    add rsp, 0x10
    ; ldp     x7, x8, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+56], rax
    mov qword [r15+64], rcx
    add rsp, 0x10
    ; add     x9, x9, x10, lsl #3
    mov rax, qword [r15+72]
    mov rcx, qword [r15+80]
    shl rcx, 3
    add rax, rcx
    mov qword [r15+72], rax
    ; ldr     x11, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+88], rax
_swl_loop:
    ; cbz     x11, _swl_zero
    mov rax, qword [r15+88]
    cmp rax, 0
    je _swl_zero
    ; ldr     x2, [x11, #-8]
    mov r10, qword [r15+88]
    add r10, -8
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; and     x3, x2, #0xFFFF
    mov rax, qword [r15+16]
    and rax, 0xffff
    mov qword [r15+24], rax
    ; sub     x4, x11, x3
    mov rax, qword [r15+88]
    mov rcx, qword [r15+24]
    sub rax, rcx
    mov qword [r15+32], rax
    ; ldrb    w3, [x4], #1
    mov r10, qword [r15+32]
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    mov rax, qword [r15+32]
    add rax, 1
    mov qword [r15+32], rax
    ; tbnz    w3, #7, _swl_next
    mov eax, dword [r15+24]
    bt rax, 7
    jc _swl_next
    ; and     w3, w3, #0x7F
    mov eax, dword [r15+24]
    and eax, 0x7f
    mov qword [r15+24], rax
    ; cmp     x3, x8
    mov rax, qword [r15+24]
    mov rcx, qword [r15+64]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _swl_next
    cmp byte [r15+249], 0
    je _swl_next
    ; mov     x5, #0
    mov rax, 0
    mov qword [r15+40], rax
_swl_cmp:
    ; cmp     x5, x8
    mov rax, qword [r15+40]
    mov rcx, qword [r15+64]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _swl_hit
    cmp byte [r15+250], 0
    jne _swl_hit
    ; ldrb    w6, [x4, x5]
    mov r10, qword [r15+32]
    mov rax, qword [r15+40]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+48], rax
    ; ldrb    w10, [x7, x5]
    mov r10, qword [r15+56]
    mov rax, qword [r15+40]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+80], rax
    ; cmp     w10, #'a'
    mov eax, dword [r15+80]
    cmp eax, 0x61
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _swl_fold
    cmp byte [r15+250], 0
    je _swl_fold
    ; cmp     w10, #'z'
    mov eax, dword [r15+80]
    cmp eax, 0x7a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _swl_fold
    cmp byte [r15+250], 0
    je xsk_15
    cmp byte [r15+249], 0
    je _swl_fold
    xsk_15:
    ; sub     w10, w10, #32
    mov eax, dword [r15+80]
    sub eax, 0x20
    mov qword [r15+80], rax
_swl_fold:
    ; cmp     w6, w10
    mov eax, dword [r15+48]
    mov ecx, dword [r15+80]
    cmp eax, ecx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _swl_next
    cmp byte [r15+249], 0
    je _swl_next
    ; add     x5, x5, #1
    mov rax, qword [r15+40]
    add rax, 1
    mov qword [r15+40], rax
    ; b       _swl_cmp
    jmp _swl_cmp
_swl_hit:
    ; ldr     x1, [x11, #-8]
    mov r10, qword [r15+88]
    add r10, -8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; tbnz    x1, #63, _swl_imm
    mov rax, qword [r15+8]
    bt rax, 63
    jc _swl_imm
    ; mov     x4, #-1
    mov rax, -1
    mov qword [r15+32], rax
    ; b       _swl_push
    jmp _swl_push
_swl_imm:
    ; mov     x4, #1
    mov rax, 1
    mov qword [r15+32], rax
_swl_push:
    ; str     x11, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+88]
    mov qword [r10], rax
    ; mov     x20, x4
    mov rax, qword [r15+32]
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
_swl_next:
    ; ldr     x11, [x11, #-16]
    mov r10, qword [r15+88]
    add r10, -16
    mov rax, qword [r10]
    mov qword [r15+88], rax
    ; b       _swl_loop
    jmp _swl_loop
_swl_zero:
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
nm_XSOURCE:
    ; DCB "SOURCE", 0
    db "SOURCE", 0
hl_XSOURCE:
    ; DCB "SOURCE ( -- c-addr u ) current input buffer and length", 0
    db "SOURCE ( -- c-addr u ) current input buffer and length", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSOURCE:
    ; DCQ     nm_XSOURCE, hl_XSOURCE
    dq nm_XSOURCE, hl_XSOURCE
    ; DCQ     0
    dq 0
    ; DCQ     XSOURCE, 0
    dq XSOURCE, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSOURCE
    dq row_XSOURCE
section .text
XSOURCE:
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
    ; ldr     x0, [x16, #TU_SRC_ADDR]
    mov r10, qword [r15+128]
    add r10, 0x68
    mov rax, qword [r10]
    mov qword [r15+0], rax
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
    ; ldr     x1, [x16, #TU_SRC_LEN]
    mov r10, qword [r15+128]
    add r10, 0x70
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; str     x20, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+160]
    mov qword [r10], rax
    ; str     x0, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; mov     x20, x1
    mov rax, qword [r15+8]
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
nm_XLEAVE:
    ; DCB "LEAVE", 0
    db "LEAVE", 0
hl_XLEAVE:
    ; DCB "LEAVE ( -- ) exit the current DO loop", 0
    db "LEAVE ( -- ) exit the current DO loop", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLEAVE:
    ; DCQ     nm_XLEAVE, hl_XLEAVE
    dq nm_XLEAVE, hl_XLEAVE
    ; DCQ     0
    dq 0
    ; DCQ     XLEAVE, XLEAVE_END
    dq XLEAVE, XLEAVE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLEAVE
    dq row_XLEAVE
section .text
XLEAVE:
    ; add     x23, x23, #16
    mov rax, qword [r15+184]
    add rax, 0x10
    mov qword [r15+184], rax
    ; lea x1, cfa_loop
    lea rax, [rel cfa_loop]
    mov qword [r15+8], rax
    ; ldr     x1, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; lea x2, cfa_plusloop
    lea rax, [rel cfa_plusloop]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
_leave_scan:
    ; ldr     x0, [x19], #8
    mov r10, qword [r15+152]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
    ; cmp     x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _leave_skip
    cmp byte [r15+249], 0
    jne _leave_skip
    ; cmp     x0, x2
    mov rax, qword [r15+0]
    mov rcx, qword [r15+16]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _leave_scan
    cmp byte [r15+249], 0
    je _leave_scan
_leave_skip:
    ; add     x19, x19, #8
    mov rax, qword [r15+152]
    add rax, 8
    mov qword [r15+152], rax
XLEAVE_END:
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
nm_XTWOSTAR:
    ; DCB "2*", 0
    db "2*", 0
hl_XTWOSTAR:
    ; DCB "2* ( x1 -- x2 ) shift left one bit", 0
    db "2* ( x1 -- x2 ) shift left one bit", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTWOSTAR:
    ; DCQ     nm_XTWOSTAR, hl_XTWOSTAR
    dq nm_XTWOSTAR, hl_XTWOSTAR
    ; DCQ     0
    dq 0
    ; DCQ     XTWOSTAR, XTWOSTAR_END
    dq XTWOSTAR, XTWOSTAR_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTWOSTAR
    dq row_XTWOSTAR
section .text
XTWOSTAR:
    ; lsl     x20, x20, #1
    mov rax, qword [r15+160]
    shl rax, 1
    mov qword [r15+160], rax
XTWOSTAR_END:
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
nm_XTWOSLASH:
    ; DCB "2/", 0
    db "2/", 0
hl_XTWOSLASH:
    ; DCB "2/ ( x1 -- x2 ) arithmetic shift right one bit", 0
    db "2/ ( x1 -- x2 ) arithmetic shift right one bit", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XTWOSLASH:
    ; DCQ     nm_XTWOSLASH, hl_XTWOSLASH
    dq nm_XTWOSLASH, hl_XTWOSLASH
    ; DCQ     0
    dq 0
    ; DCQ     XTWOSLASH, XTWOSLASH_END
    dq XTWOSLASH, XTWOSLASH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XTWOSLASH
    dq row_XTWOSLASH
section .text
XTWOSLASH:
    ; asr     x20, x20, #1
    mov rax, qword [r15+160]
    sar rax, 1
    mov qword [r15+160], rax
XTWOSLASH_END:
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
nm_XLFETCH:
    ; DCB "L@", 0
    db "L@", 0
hl_XLFETCH:
    ; DCB "L@ ( addr -- u ) fetch 32 bits zero-extended", 0
    db "L@ ( addr -- u ) fetch 32 bits zero-extended", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLFETCH:
    ; DCQ     nm_XLFETCH, hl_XLFETCH
    dq nm_XLFETCH, hl_XLFETCH
    ; DCQ     0
    dq 0
    ; DCQ     XLFETCH, XLFETCH_END
    dq XLFETCH, XLFETCH_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLFETCH
    dq row_XLFETCH
section .text
XLFETCH:
    ; ldr     w20, [x20]
    mov r10, qword [r15+160]
    mov eax, dword [r10]
    mov qword [r15+160], rax
XLFETCH_END:
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
nm_XLSTORE:
    ; DCB "L!", 0
    db "L!", 0
hl_XLSTORE:
    ; DCB "L! ( u addr -- ) store 32 bits", 0
    db "L! ( u addr -- ) store 32 bits", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XLSTORE:
    ; DCQ     nm_XLSTORE, hl_XLSTORE
    dq nm_XLSTORE, hl_XLSTORE
    ; DCQ     0
    dq 0
    ; DCQ     XLSTORE, XLSTORE_END
    dq XLSTORE, XLSTORE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XLSTORE
    dq row_XLSTORE
section .text
XLSTORE:
    ; ldr     x0, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; str     w0, [x20]
    mov r10, qword [r15+160]
    mov eax, dword [r15+0]
    mov dword [r10], eax
    ; ldr     x20, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+160], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
XLSTORE_END:
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
nm_XAPP_OPEN:
    ; DCB "(APP-OPEN)", 0
    db "(APP-OPEN)", 0
hl_XAPP_OPEN:
    ; DCB "(APP-OPEN) ( cols rows -- ior ) open a character graphics window", 0
    db "(APP-OPEN) ( cols rows -- ior ) open a character graphics window", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_OPEN:
    ; DCQ     nm_XAPP_OPEN, hl_XAPP_OPEN
    dq nm_XAPP_OPEN, hl_XAPP_OPEN
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_OPEN, XAPP_OPEN_END
    dq XAPP_OPEN, XAPP_OPEN_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_OPEN
    dq row_XAPP_OPEN
section .text
XAPP_OPEN:
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
    ; bl      host_app_open
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
    call host_app_open
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
XAPP_OPEN_END:
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
nm_XOOP_CALL:
    ; DCB "(OOP-CALL)", 0
    db "(OOP-CALL)", 0
hl_XOOP_CALL:
    ; DCB "(OOP-CALL) ( a b c d op -- n ) OOP window host", 0
    db "(OOP-CALL) ( a b c d op -- n ) OOP window host", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XOOP_CALL:
    ; DCQ     nm_XOOP_CALL, hl_XOOP_CALL
    dq nm_XOOP_CALL, hl_XOOP_CALL
    ; DCQ     0
    dq 0
    ; DCQ     XOOP_CALL, XOOP_CALL_END
    dq XOOP_CALL, XOOP_CALL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XOOP_CALL
    dq row_XOOP_CALL
section .text
XOOP_CALL:
    ; mov     x4, x20
    mov rax, qword [r15+160]
    mov qword [r15+32], rax
    ; ldr     x3, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; ldr     x2, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
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
    ; bl      host_oop_call
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
    call host_oop_call
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
XOOP_CALL_END:
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
nm_XAPP_CLOSE:
    ; DCB "(APP-CLOSE)", 0
    db "(APP-CLOSE)", 0
hl_XAPP_CLOSE:
    ; DCB "(APP-CLOSE) ( -- ) close the character graphics window", 0
    db "(APP-CLOSE) ( -- ) close the character graphics window", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_CLOSE:
    ; DCQ     nm_XAPP_CLOSE, hl_XAPP_CLOSE
    dq nm_XAPP_CLOSE, hl_XAPP_CLOSE
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_CLOSE, XAPP_CLOSE_END
    dq XAPP_CLOSE, XAPP_CLOSE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_CLOSE
    dq row_XAPP_CLOSE
section .text
XAPP_CLOSE:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      host_app_close
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
    call host_app_close
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
XAPP_CLOSE_END:
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
nm_XAPP_BLIT:
    ; DCB "(APP-BLIT)", 0
    db "(APP-BLIT)", 0
hl_XAPP_BLIT:
    ; DCB "(APP-BLIT) ( c-addr u -- ) blit the character buffer to the window", 0
    db "(APP-BLIT) ( c-addr u -- ) blit the character buffer to the window", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_BLIT:
    ; DCQ     nm_XAPP_BLIT, hl_XAPP_BLIT
    dq nm_XAPP_BLIT, hl_XAPP_BLIT
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_BLIT, XAPP_BLIT_END
    dq XAPP_BLIT, XAPP_BLIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_BLIT
    dq row_XAPP_BLIT
section .text
XAPP_BLIT:
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
    ; bl      host_app_blit
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
    call host_app_blit
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
XAPP_BLIT_END:
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
nm_XAPP_PBLIT:
    ; DCB "(APP-PBLIT)", 0
    db "(APP-PBLIT)", 0
hl_XAPP_PBLIT:
    ; DCB "(APP-PBLIT) ( c-addr u -- ) blit a 1-bit pixel map to the window", 0
    db "(APP-PBLIT) ( c-addr u -- ) blit a 1-bit pixel map to the window", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_PBLIT:
    ; DCQ     nm_XAPP_PBLIT, hl_XAPP_PBLIT
    dq nm_XAPP_PBLIT, hl_XAPP_PBLIT
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_PBLIT, XAPP_PBLIT_END
    dq XAPP_PBLIT, XAPP_PBLIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_PBLIT
    dq row_XAPP_PBLIT
section .text
XAPP_PBLIT:
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
    ; bl      host_app_pblit
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
    call host_app_pblit
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
XAPP_PBLIT_END:
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
nm_XAPP_CBLIT:
    ; DCB "(APP-CBLIT)", 0
    db "(APP-CBLIT)", 0
hl_XAPP_CBLIT:
    ; DCB "(APP-CBLIT) ( c-addr u depth -- ) blit pixels of depth 1 8 or 32", 0
    db "(APP-CBLIT) ( c-addr u depth -- ) blit pixels of depth 1 8 or 32", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_CBLIT:
    ; DCQ     nm_XAPP_CBLIT, hl_XAPP_CBLIT
    dq nm_XAPP_CBLIT, hl_XAPP_CBLIT
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_CBLIT, XAPP_CBLIT_END
    dq XAPP_CBLIT, XAPP_CBLIT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_CBLIT
    dq row_XAPP_CBLIT
section .text
XAPP_CBLIT:
    ; mov     x2, x20
    mov rax, qword [r15+160]
    mov qword [r15+16], rax
    ; ldr     x1, [x22], #8
    mov r10, qword [r15+176]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    mov rax, qword [r15+176]
    add rax, 8
    mov qword [r15+176], rax
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
    ; bl      host_app_cblit
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
    call host_app_cblit
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
XAPP_CBLIT_END:
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
nm_XAPP_KEYQ:
    ; DCB "(APP-KEY?)", 0
    db "(APP-KEY?)", 0
hl_XAPP_KEYQ:
    ; DCB "(APP-KEY?) ( -- flag ) true when a graphics key is waiting", 0
    db "(APP-KEY?) ( -- flag ) true when a graphics key is waiting", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_KEYQ:
    ; DCQ     nm_XAPP_KEYQ, hl_XAPP_KEYQ
    dq nm_XAPP_KEYQ, hl_XAPP_KEYQ
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_KEYQ, XAPP_KEYQ_END
    dq XAPP_KEYQ, XAPP_KEYQ_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_KEYQ
    dq row_XAPP_KEYQ
section .text
XAPP_KEYQ:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      host_app_keyq
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
    call host_app_keyq
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
XAPP_KEYQ_END:
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
nm_XAPP_KEY:
    ; DCB "(APP-KEY)", 0
    db "(APP-KEY)", 0
hl_XAPP_KEY:
    ; DCB "(APP-KEY) ( -- c ) next graphics key or -1 on timeout", 0
    db "(APP-KEY) ( -- c ) next graphics key or -1 on timeout", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_KEY:
    ; DCQ     nm_XAPP_KEY, hl_XAPP_KEY
    dq nm_XAPP_KEY, hl_XAPP_KEY
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_KEY, XAPP_KEY_END
    dq XAPP_KEY, XAPP_KEY_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_KEY
    dq row_XAPP_KEY
section .text
XAPP_KEY:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      host_app_key
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
    call host_app_key
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
XAPP_KEY_END:
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
nm_XAPP_NAME:
    ; DCB "(APP-NAME)", 0
    db "(APP-NAME)", 0
hl_XAPP_NAME:
    ; DCB "(APP-NAME) ( c-addr u -- ) set the graphics window title", 0
    db "(APP-NAME) ( c-addr u -- ) set the graphics window title", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_NAME:
    ; DCQ     nm_XAPP_NAME, hl_XAPP_NAME
    dq nm_XAPP_NAME, hl_XAPP_NAME
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_NAME, XAPP_NAME_END
    dq XAPP_NAME, XAPP_NAME_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_NAME
    dq row_XAPP_NAME
section .text
XAPP_NAME:
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
    ; bl      host_app_name
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
    call host_app_name
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
XAPP_NAME_END:
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
nm_XAPP_TONE:
    ; DCB "(APP-TONE)", 0
    db "(APP-TONE)", 0
hl_XAPP_TONE:
    ; DCB "(APP-TONE) ( freq dur -- ) play a tone for dur tenths of a second", 0
    db "(APP-TONE) ( freq dur -- ) play a tone for dur tenths of a second", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_TONE:
    ; DCQ     nm_XAPP_TONE, hl_XAPP_TONE
    dq nm_XAPP_TONE, hl_XAPP_TONE
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_TONE, XAPP_TONE_END
    dq XAPP_TONE, XAPP_TONE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_TONE
    dq row_XAPP_TONE
section .text
XAPP_TONE:
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
    ; bl      host_app_tone
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
    call host_app_tone
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
XAPP_TONE_END:
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
nm_XAPP_PUMP:
    ; DCB "(APP-PUMP)", 0
    db "(APP-PUMP)", 0
hl_XAPP_PUMP:
    ; DCB "(APP-PUMP) ( -- ) yield so the graphics window can run", 0
    db "(APP-PUMP) ( -- ) yield so the graphics window can run", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_PUMP:
    ; DCQ     nm_XAPP_PUMP, hl_XAPP_PUMP
    dq nm_XAPP_PUMP, hl_XAPP_PUMP
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_PUMP, XAPP_PUMP_END
    dq XAPP_PUMP, XAPP_PUMP_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_PUMP
    dq row_XAPP_PUMP
section .text
XAPP_PUMP:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      host_app_pump
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
    call host_app_pump
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
XAPP_PUMP_END:
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
nm_XAPP_MOUSE:
    ; DCB "(APP-MOUSE)", 0
    db "(APP-MOUSE)", 0
hl_XAPP_MOUSE:
    ; DCB "(APP-MOUSE) ( -- x y buttons ) graphics mouse in plot coordinates", 0
    db "(APP-MOUSE) ( -- x y buttons ) graphics mouse in plot coordinates", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_MOUSE:
    ; DCQ     nm_XAPP_MOUSE, hl_XAPP_MOUSE
    dq nm_XAPP_MOUSE, hl_XAPP_MOUSE
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_MOUSE, XAPP_MOUSE_END
    dq XAPP_MOUSE, XAPP_MOUSE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_MOUSE
    dq row_XAPP_MOUSE
section .text
XAPP_MOUSE:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; sub     sp, sp, #32
    mov rax, rsp
    sub rax, 0x20
    mov rsp, rax
    ; mov     x0, sp
    mov rax, rsp
    mov qword [r15+0], rax
    ; add     x1, sp, #8
    mov rax, rsp
    add rax, 8
    mov qword [r15+8], rax
    ; add     x2, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov qword [r15+16], rax
    ; str     xzr, [sp]
    lea r10, [rsp]
    mov qword [r10], 0
    ; str     xzr, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov qword [r10], 0
    ; str     xzr, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov qword [r10], 0
    ; bl      host_app_mouse
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
    call host_app_mouse
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x0, [sp]
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; ldr     x1, [sp, #8]
    lea r10, [rsp]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; ldr     x2, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; add     sp, sp, #32
    mov rax, rsp
    add rax, 0x20
    mov rsp, rax
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
    ; str     x0, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+0]
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
XAPP_MOUSE_END:
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
nm_XAPP_SIZE:
    ; DCB "(APP-SIZE?)", 0
    db "(APP-SIZE?)", 0
hl_XAPP_SIZE:
    ; DCB "(APP-SIZE?) ( -- cols rows flag ) pending grid after a resize", 0
    db "(APP-SIZE?) ( -- cols rows flag ) pending grid after a resize", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_SIZE:
    ; DCQ     nm_XAPP_SIZE, hl_XAPP_SIZE
    dq nm_XAPP_SIZE, hl_XAPP_SIZE
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_SIZE, XAPP_SIZE_END
    dq XAPP_SIZE, XAPP_SIZE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_SIZE
    dq row_XAPP_SIZE
section .text
XAPP_SIZE:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; sub     sp, sp, #32
    mov rax, rsp
    sub rax, 0x20
    mov rsp, rax
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
    ; bl      host_app_size
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
    call host_app_size
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
    ; add     sp, sp, #32
    mov rax, rsp
    add rax, 0x20
    mov rsp, rax
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
    ; str     x1, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; str     x2, [x22, #-8]!
    mov rax, qword [r15+176]
    add rax, -8
    mov qword [r15+176], rax
    mov r10, qword [r15+176]
    mov rax, qword [r15+16]
    mov qword [r10], rax
    ; mov     x20, x0
    mov rax, qword [r15+0]
    mov qword [r15+160], rax
XAPP_SIZE_END:
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
nm_XAPP_IMG_CHOOSE:
    ; DCB "(APP-IMG-CHOOSE)", 0
    db "(APP-IMG-CHOOSE)", 0
hl_XAPP_IMG_CHOOSE:
    ; DCB "(APP-IMG-CHOOSE) ( -- ior ) choose an image file", 0
    db "(APP-IMG-CHOOSE) ( -- ior ) choose an image file", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_IMG_CHOOSE:
    ; DCQ     nm_XAPP_IMG_CHOOSE, hl_XAPP_IMG_CHOOSE
    dq nm_XAPP_IMG_CHOOSE, hl_XAPP_IMG_CHOOSE
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_IMG_CHOOSE, XAPP_IMG_CHOOSE_END
    dq XAPP_IMG_CHOOSE, XAPP_IMG_CHOOSE_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_IMG_CHOOSE
    dq row_XAPP_IMG_CHOOSE
section .text
XAPP_IMG_CHOOSE:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      host_app_img_choose
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
    call host_app_img_choose
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
XAPP_IMG_CHOOSE_END:
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
nm_XAPP_IMG_LOAD:
    ; DCB "(APP-IMG-LOAD)", 0
    db "(APP-IMG-LOAD)", 0
hl_XAPP_IMG_LOAD:
    ; DCB "(APP-IMG-LOAD) ( c-addr u -- ior ) load an image from a path", 0
    db "(APP-IMG-LOAD) ( c-addr u -- ior ) load an image from a path", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XAPP_IMG_LOAD:
    ; DCQ     nm_XAPP_IMG_LOAD, hl_XAPP_IMG_LOAD
    dq nm_XAPP_IMG_LOAD, hl_XAPP_IMG_LOAD
    ; DCQ     0
    dq 0
    ; DCQ     XAPP_IMG_LOAD, XAPP_IMG_LOAD_END
    dq XAPP_IMG_LOAD, XAPP_IMG_LOAD_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XAPP_IMG_LOAD
    dq row_XAPP_IMG_LOAD
section .text
XAPP_IMG_LOAD:
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
