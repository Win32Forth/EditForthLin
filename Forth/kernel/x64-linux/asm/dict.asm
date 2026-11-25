; Generated from Forth/kernel/arm64/dict.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
extern DOCOL
extern _core_console_only
extern _here_reserve_exact
extern _local_compile_reset
extern _print_string_svc
extern _task_dp_bounds
extern _task_require_dict
extern _task_stop_or_abandon
extern _view_line_now
extern base_var
extern current_var
extern debug_break_asap
extern emit_cstr
extern exit_cfa
extern here_ptr
extern last_cfa
extern next_debug
extern noname_xt
extern pending_help_addr
extern pending_help_len
extern search_order
extern search_order_n
extern state_var
extern str_dict_full
extern up_var
extern view_src_id
section .text
global _dict_hash
global _header_build
global _nfa_from_cfa
global _nfa_smudge_cfa
global _nfa_reveal_cfa
global _find_word
global _parse_number
global _next_word
global _cursor_load
global _cursor_commit
global _compile_cell
global _strlen
global _take_pending_help
global XCOLON
global XSEMI
_dict_hash:
    ; mov     x2, #5381
    mov rax, 0x1505
    mov qword [r15+16], rax
    ; cbz     x1, _dict_hash_empty
    mov rax, qword [r15+8]
    cmp rax, 0
    je _dict_hash_empty
    ; mov     x3, #0
    mov rax, 0
    mov qword [r15+24], rax
_dict_hash_1:
    ; cmp     x3, x1
    mov rax, qword [r15+24]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _dict_hash_2
    cmp byte [r15+250], 0
    jne _dict_hash_2
    ; ldrb    w4, [x0, x3]
    mov r10, qword [r15+0]
    mov rax, qword [r15+24]
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
    ; b.lo    _dict_hash_11
    cmp byte [r15+250], 0
    je _dict_hash_11
    ; cmp     w4, #'z'
    mov eax, dword [r15+32]
    cmp eax, 0x7a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _dict_hash_11
    cmp byte [r15+250], 0
    je xsk_1
    cmp byte [r15+249], 0
    je _dict_hash_11
    xsk_1:
    ; sub     w4, w4, #32
    mov eax, dword [r15+32]
    sub eax, 0x20
    mov qword [r15+32], rax
_dict_hash_11:
    ; lsl     x5, x2, #5
    mov rax, qword [r15+16]
    shl rax, 5
    mov qword [r15+40], rax
    ; add     x2, x5, x2
    mov rax, qword [r15+40]
    mov rcx, qword [r15+16]
    add rax, rcx
    mov qword [r15+16], rax
    ; add     x2, x2, x4
    mov rax, qword [r15+16]
    mov rcx, qword [r15+32]
    add rax, rcx
    mov qword [r15+16], rax
    ; add     x3, x3, #1
    mov rax, qword [r15+24]
    add rax, 1
    mov qword [r15+24], rax
    ; b       _dict_hash_1
    jmp _dict_hash_1
_dict_hash_2:
    ; mov     x0, #16
    mov rax, 0x10
    mov qword [r15+0], rax
    ; udiv    x1, x2, x0
    mov rax, qword [r15+16]
    mov rcx, qword [r15+0]
    cmp rcx, 0
    je xdiv0_3
    xor rdx, rdx
    div rcx
    jmp xdiv_2
    xdiv0_3:
    xor eax, eax
    xdiv_2:
    mov qword [r15+8], rax
    ; msub    x0, x1, x0, x2
    mov rax, qword [r15+8]
    mov rcx, qword [r15+0]
    imul rax, rcx
    mov rcx, qword [r15+16]
    sub rcx, rax
    mov rax, rcx
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_dict_hash_empty:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
global _header_build
_header_build:
    ; sub     sp, sp, #128
    mov rax, rsp
    sub rax, 0x80
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
    ; str     x5, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [r15+40]
    mov qword [r10], rax
    ; mov     x19, x0
    mov rax, qword [r15+0]
    mov qword [r15+152], rax
    ; mov     x20, x1
    mov rax, qword [r15+8]
    mov qword [r15+160], rax
    ; mov     x21, x2
    mov rax, qword [r15+16]
    mov qword [r15+168], rax
    ; mov     x22, x3
    mov rax, qword [r15+24]
    mov qword [r15+176], rax
    ; mov     x23, x4
    mov rax, qword [r15+32]
    mov qword [r15+184], rax
    ; bl      _task_require_dict
    lea rax, [rel xret_4]
    mov qword [r15+240], rax
    jmp _task_require_dict
    xret_4:
    ; bl      _task_dp_bounds
    lea rax, [rel xret_5]
    mov qword [r15+240], rax
    jmp _task_dp_bounds
    xret_5:
    ; mov     x9, x0
    mov rax, qword [r15+0]
    mov qword [r15+72], rax
    ; lea x6, here_ptr
    lea rax, [rel here_ptr]
    mov qword [r15+48], rax
    ; cmp     x9, x6
    mov rax, qword [r15+72]
    mov rcx, qword [r15+48]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _hb_here
    cmp byte [r15+249], 0
    jne _hb_here
    ; ldr     x8, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+64], rax
    ; add     x7, x8, #512
    mov rax, qword [r15+64]
    add rax, 0x200
    mov qword [r15+56], rax
    ; cmp     x7, x8
    mov rax, qword [r15+56]
    mov rcx, qword [r15+64]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _hb_full
    cmp byte [r15+250], 0
    je _hb_full
    ; cmp     x7, x1
    mov rax, qword [r15+56]
    mov rcx, qword [r15+8]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _hb_full
    cmp byte [r15+250], 0
    je xsk_6
    cmp byte [r15+249], 0
    je _hb_full
    xsk_6:
_hb_here:
    ; lea x24, current_var
    lea rax, [rel current_var]
    mov qword [r15+192], rax
    ; ldr     x24, [x24]
    mov r10, qword [r15+192]
    mov rax, qword [r10]
    mov qword [r15+192], rax
    ; ldr     x6, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; mov     x8, x6
    mov rax, qword [r15+48]
    mov qword [r15+64], rax
    ; cmp     x22, #255
    mov rax, qword [r15+176]
    cmp rax, 0xff
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _hb_help_ok
    cmp byte [r15+250], 0
    je _hb_help_ok
    cmp byte [r15+249], 0
    jne _hb_help_ok
    ; mov     x22, #255
    mov rax, 0xff
    mov qword [r15+176], rax
_hb_help_ok:
    ; strb    w22, [x6], #1
    mov r10, qword [r15+48]
    mov eax, dword [r15+176]
    mov byte [r10], al
    mov rax, qword [r15+48]
    add rax, 1
    mov qword [r15+48], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [r15+16], rax
_hb_help_cp:
    ; cmp     x2, x22
    mov rax, qword [r15+16]
    mov rcx, qword [r15+176]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _hb_help_pad
    cmp byte [r15+250], 0
    jne _hb_help_pad
    ; ldrb    w3, [x21, x2]
    mov r10, qword [r15+168]
    mov rax, qword [r15+16]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    ; strb    w3, [x6], #1
    mov r10, qword [r15+48]
    mov eax, dword [r15+24]
    mov byte [r10], al
    mov rax, qword [r15+48]
    add rax, 1
    mov qword [r15+48], rax
    ; add     x2, x2, #1
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; b       _hb_help_cp
    jmp _hb_help_cp
_hb_help_pad:
    ; sub     x2, x6, x8
    mov rax, qword [r15+48]
    mov rcx, qword [r15+64]
    sub rax, rcx
    mov qword [r15+16], rax
_hb_help_al:
    ; tst     x2, #7
    mov rax, qword [r15+16]
    test rax, 7
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.eq    _hb_name
    cmp byte [r15+249], 0
    jne _hb_name
    ; strb    wzr, [x6], #1
    mov r10, qword [r15+48]
    mov byte [r10], 0
    mov rax, qword [r15+48]
    add rax, 1
    mov qword [r15+48], rax
    ; add     x2, x2, #1
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; b       _hb_help_al
    jmp _hb_help_al
_hb_name:
    ; mov     x7, x6
    mov rax, qword [r15+48]
    mov qword [r15+56], rax
    ; cmp     x20, #127
    mov rax, qword [r15+160]
    cmp rax, 0x7f
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _hb_nlen
    cmp byte [r15+250], 0
    je _hb_nlen
    cmp byte [r15+249], 0
    jne _hb_nlen
    ; mov     x20, #127
    mov rax, 0x7f
    mov qword [r15+160], rax
_hb_nlen:
    ; and     w20, w20, #0x7F
    mov eax, dword [r15+160]
    and eax, 0x7f
    mov qword [r15+160], rax
    ; strb    w20, [x6], #1
    mov r10, qword [r15+48]
    mov eax, dword [r15+160]
    mov byte [r10], al
    mov rax, qword [r15+48]
    add rax, 1
    mov qword [r15+48], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [r15+16], rax
_hb_name_cp:
    ; cmp     x2, x20
    mov rax, qword [r15+16]
    mov rcx, qword [r15+160]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _hb_name_pad
    cmp byte [r15+250], 0
    jne _hb_name_pad
    ; ldrb    w3, [x19, x2]
    mov r10, qword [r15+152]
    mov rax, qword [r15+16]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    ; cmp     w3, #'a'
    mov eax, dword [r15+24]
    cmp eax, 0x61
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _hb_name_st
    cmp byte [r15+250], 0
    je _hb_name_st
    ; cmp     w3, #'z'
    mov eax, dword [r15+24]
    cmp eax, 0x7a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _hb_name_st
    cmp byte [r15+250], 0
    je xsk_7
    cmp byte [r15+249], 0
    je _hb_name_st
    xsk_7:
    ; sub     w3, w3, #32
    mov eax, dword [r15+24]
    sub eax, 0x20
    mov qword [r15+24], rax
_hb_name_st:
    ; strb    w3, [x6], #1
    mov r10, qword [r15+48]
    mov eax, dword [r15+24]
    mov byte [r10], al
    mov rax, qword [r15+48]
    add rax, 1
    mov qword [r15+48], rax
    ; add     x2, x2, #1
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; b       _hb_name_cp
    jmp _hb_name_cp
_hb_name_pad:
    ; sub     x2, x6, x7
    mov rax, qword [r15+48]
    mov rcx, qword [r15+56]
    sub rax, rcx
    mov qword [r15+16], rax
_hb_name_al:
    ; tst     x2, #7
    mov rax, qword [r15+16]
    test rax, 7
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.eq    _hb_link
    cmp byte [r15+249], 0
    jne _hb_link
    ; strb    wzr, [x6], #1
    mov r10, qword [r15+48]
    mov byte [r10], 0
    mov rax, qword [r15+48]
    add rax, 1
    mov qword [r15+48], rax
    ; add     x2, x2, #1
    mov rax, qword [r15+16]
    add rax, 1
    mov qword [r15+16], rax
    ; b       _hb_name_al
    jmp _hb_name_al
_hb_link:
    ; mov     x0, x19
    mov rax, qword [r15+152]
    mov qword [r15+0], rax
    ; mov     x1, x20
    mov rax, qword [r15+160]
    mov qword [r15+8], rax
    ; bl      _dict_hash
    lea rax, [rel xret_8]
    mov qword [r15+240], rax
    jmp _dict_hash
    xret_8:
    ; add     x10, x24, x0, lsl #3
    mov rax, qword [r15+192]
    mov rcx, qword [r15+0]
    shl rcx, 3
    add rax, rcx
    mov qword [r15+80], rax
    ; ldr     x1, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; str     x1, [x6], #8
    mov r10, qword [r15+48]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    mov rax, qword [r15+48]
    add rax, 8
    mov qword [r15+48], rax
    ; str     xzr, [x6], #8
    mov r10, qword [r15+48]
    mov qword [r10], 0
    mov rax, qword [r15+48]
    add rax, 8
    mov qword [r15+48], rax
    ; mov     x0, x6
    mov rax, qword [r15+48]
    mov qword [r15+0], rax
    ; str     x23, [x6], #8
    mov r10, qword [r15+48]
    mov rax, qword [r15+184]
    mov qword [r10], rax
    mov rax, qword [r15+48]
    add rax, 8
    mov qword [r15+48], rax
    ; sub     x1, x0, x7
    mov rax, qword [r15+0]
    mov rcx, qword [r15+56]
    sub rax, rcx
    mov qword [r15+8], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [r15+8]
    and rax, 0xffff
    mov qword [r15+8], rax
    ; sub     x2, x0, x8
    mov rax, qword [r15+0]
    mov rcx, qword [r15+64]
    sub rax, rcx
    mov qword [r15+16], rax
    ; and     x2, x2, #0xFFFF
    mov rax, qword [r15+16]
    and rax, 0xffff
    mov qword [r15+16], rax
    ; lsl     x2, x2, #16
    mov rax, qword [r15+16]
    shl rax, 16
    mov qword [r15+16], rax
    ; orr     x1, x1, x2
    mov rax, qword [r15+8]
    mov rcx, qword [r15+16]
    or rax, rcx
    mov qword [r15+8], rax
    ; stp     x0, x1, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r15+0]
    mov qword [r10+0], rax
    mov rax, qword [r15+8]
    mov qword [r10+8], rax
    ; bl      _view_line_now
    lea rax, [rel xret_9]
    mov qword [r15+240], rax
    jmp _view_line_now
    xret_9:
    ; mov     x3, x0
    mov rax, qword [r15+0]
    mov qword [r15+24], rax
    ; lea x2, view_src_id
    lea rax, [rel view_src_id]
    mov qword [r15+16], rax
    ; ldr     x2, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; ldp     x0, x1, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+0], rax
    mov qword [r15+8], rcx
    ; and     x3, x3, #0xFFFF
    mov rax, qword [r15+24]
    and rax, 0xffff
    mov qword [r15+24], rax
    ; lsl     x3, x3, #32
    mov rax, qword [r15+24]
    shl rax, 32
    mov qword [r15+24], rax
    ; orr     x1, x1, x3
    mov rax, qword [r15+8]
    mov rcx, qword [r15+24]
    or rax, rcx
    mov qword [r15+8], rax
    ; mov     x4, #0x1FFF
    mov rax, 0x1fff
    mov qword [r15+32], rax
    ; and     x2, x2, x4
    mov rax, qword [r15+16]
    mov rcx, qword [r15+32]
    and rax, rcx
    mov qword [r15+16], rax
    ; lsl     x2, x2, #48
    mov rax, qword [r15+16]
    shl rax, 48
    mov qword [r15+16], rax
    ; orr     x1, x1, x2
    mov rax, qword [r15+8]
    mov rcx, qword [r15+16]
    or rax, rcx
    mov qword [r15+8], rax
    ; ldr     x5, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; orr     x1, x1, x5
    mov rax, qword [r15+8]
    mov rcx, qword [r15+40]
    or rax, rcx
    mov qword [r15+8], rax
    ; str     x1, [x0, #-8]
    mov r10, qword [r15+0]
    add r10, -8
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; str     x6, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r15+48]
    mov qword [r10], rax
    ; str     x0, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; lea x2, last_cfa
    lea rax, [rel last_cfa]
    mov qword [r15+16], rax
    ; str     x0, [x2]
    mov r10, qword [r15+16]
    mov rax, qword [r15+0]
    mov qword [r10], rax
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
    jmp qword [r15+240]
_hb_full:
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
    ; lea x0, str_dict_full
    lea rax, [rel str_dict_full]
    mov qword [r15+0], rax
    ; bl      _print_string_svc
    lea rax, [rel xret_10]
    mov qword [r15+240], rax
    jmp _print_string_svc
    xret_10:
    ; b       _task_stop_or_abandon
    jmp _task_stop_or_abandon
_nfa_from_cfa:
    ; ldr     x1, [x0, #-8]
    mov r10, qword [r15+0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [r15+8]
    and rax, 0xffff
    mov qword [r15+8], rax
    ; sub     x0, x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    sub rax, rcx
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_nfa_smudge_cfa:
    ; ldr     x1, [x0, #-8]
    mov r10, qword [r15+0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [r15+8]
    and rax, 0xffff
    mov qword [r15+8], rax
    ; sub     x1, x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    sub rax, rcx
    mov qword [r15+8], rax
    ; ldrb    w2, [x1]
    mov r10, qword [r15+8]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; orr     w2, w2, #0x80
    mov eax, dword [r15+16]
    or eax, 0x80
    mov qword [r15+16], rax
    ; strb    w2, [x1]
    mov r10, qword [r15+8]
    mov eax, dword [r15+16]
    mov byte [r10], al
    ; ret
    jmp qword [r15+240]
_nfa_reveal_cfa:
    ; ldr     x1, [x0, #-8]
    mov r10, qword [r15+0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [r15+8]
    and rax, 0xffff
    mov qword [r15+8], rax
    ; sub     x1, x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    sub rax, rcx
    mov qword [r15+8], rax
    ; ldrb    w2, [x1]
    mov r10, qword [r15+8]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    ; and     w2, w2, #0x7F
    mov eax, dword [r15+16]
    and eax, 0x7f
    mov qword [r15+16], rax
    ; strb    w2, [x1]
    mov r10, qword [r15+8]
    mov eax, dword [r15+16]
    mov byte [r10], al
    ; ret
    jmp qword [r15+240]
_find_word:
    ; mov     x6, x0
    mov rax, qword [r15+0]
    mov qword [r15+48], rax
    ; mov     x7, x1
    mov rax, qword [r15+8]
    mov qword [r15+56], rax
    ; mov     x12, x30
    mov rax, qword [r15+240]
    mov qword [r15+96], rax
    ; bl      _dict_hash
    lea rax, [rel xret_11]
    mov qword [r15+240], rax
    jmp _dict_hash
    xret_11:
    ; mov     x30, x12
    mov rax, qword [r15+96]
    mov qword [r15+240], rax
    ; mov     x14, x0
    mov rax, qword [r15+0]
    mov qword [r15+112], rax
    ; lea x10, search_order_n
    lea rax, [rel search_order_n]
    mov qword [r15+80], rax
    ; ldr     x11, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+88], rax
    ; mov     x13, #0
    mov rax, 0
    mov qword [r15+104], rax
_find_wids:
    ; cmp     x13, x11
    mov rax, qword [r15+104]
    mov rcx, qword [r15+88]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _find_miss
    cmp byte [r15+250], 0
    jne _find_miss
    ; lea x10, search_order
    lea rax, [rel search_order]
    mov qword [r15+80], rax
    ; ldr     x10, [x10, x13, lsl #3]
    mov r10, qword [r15+80]
    mov rax, qword [r15+104]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [r15+80], rax
    ; cbz     x10, _find_next_wid
    mov rax, qword [r15+80]
    cmp rax, 0
    je _find_next_wid
    ; add     x4, x10, x14, lsl #3
    mov rax, qword [r15+80]
    mov rcx, qword [r15+112]
    shl rcx, 3
    add rax, rcx
    mov qword [r15+32], rax
    ; ldr     x4, [x4]
    mov r10, qword [r15+32]
    mov rax, qword [r10]
    mov qword [r15+32], rax
_find_loop:
    ; cbz     x4, _find_next_wid
    mov rax, qword [r15+32]
    cmp rax, 0
    je _find_next_wid
    ; ldr     x5, [x4, #-8]
    mov r10, qword [r15+32]
    add r10, -8
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; and     x8, x5, #0xFFFF
    mov rax, qword [r15+40]
    and rax, 0xffff
    mov qword [r15+64], rax
    ; sub     x8, x4, x8
    mov rax, qword [r15+32]
    mov rcx, qword [r15+64]
    sub rax, rcx
    mov qword [r15+64], rax
    ; ldrb    w9, [x8]
    mov r10, qword [r15+64]
    movzx eax, byte [r10]
    mov qword [r15+72], rax
    ; tbnz    w9, #7, _find_link
    mov eax, dword [r15+72]
    bt rax, 7
    jc _find_link
    ; and     w9, w9, #0x7F
    mov eax, dword [r15+72]
    and eax, 0x7f
    mov qword [r15+72], rax
    ; cmp     w9, w7
    mov eax, dword [r15+72]
    mov ecx, dword [r15+56]
    cmp eax, ecx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _find_link
    cmp byte [r15+249], 0
    je _find_link
    ; mov     x9, x6
    mov rax, qword [r15+48]
    mov qword [r15+72], rax
    ; add     x10, x8, #1
    mov rax, qword [r15+64]
    add rax, 1
    mov qword [r15+80], rax
    ; mov     x15, x7
    mov rax, qword [r15+56]
    mov qword [r15+120], rax
_find_cmp:
    ; cbz     x15, _find_hit
    mov rax, qword [r15+120]
    cmp rax, 0
    je _find_hit
    ; ldrb    w12, [x9], #1
    mov r10, qword [r15+72]
    movzx eax, byte [r10]
    mov qword [r15+96], rax
    mov rax, qword [r15+72]
    add rax, 1
    mov qword [r15+72], rax
    ; ldrb    w16, [x10], #1
    mov r10, qword [r15+80]
    movzx eax, byte [r10]
    mov qword [r15+128], rax
    mov rax, qword [r15+80]
    add rax, 1
    mov qword [r15+80], rax
    ; cmp     w12, #'a'
    mov eax, dword [r15+96]
    cmp eax, 0x61
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _find_fold
    cmp byte [r15+250], 0
    je _find_fold
    ; cmp     w12, #'z'
    mov eax, dword [r15+96]
    cmp eax, 0x7a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _find_fold
    cmp byte [r15+250], 0
    je xsk_12
    cmp byte [r15+249], 0
    je _find_fold
    xsk_12:
    ; sub     w12, w12, #32
    mov eax, dword [r15+96]
    sub eax, 0x20
    mov qword [r15+96], rax
_find_fold:
    ; cmp     w12, w16
    mov eax, dword [r15+96]
    mov ecx, dword [r15+128]
    cmp eax, ecx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _find_link
    cmp byte [r15+249], 0
    je _find_link
    ; sub     x15, x15, #1
    mov rax, qword [r15+120]
    sub rax, 1
    mov qword [r15+120], rax
    ; b       _find_cmp
    jmp _find_cmp
_find_hit:
    ; ldr     x1, [x4, #-8]
    mov r10, qword [r15+32]
    add r10, -8
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; mov     x0, x4
    mov rax, qword [r15+32]
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_find_link:
    ; ldr     x4, [x4, #-16]
    mov r10, qword [r15+32]
    add r10, -16
    mov rax, qword [r10]
    mov qword [r15+32], rax
    ; b       _find_loop
    jmp _find_loop
_find_next_wid:
    ; add     x13, x13, #1
    mov rax, qword [r15+104]
    add rax, 1
    mov qword [r15+104], rax
    ; b       _find_wids
    jmp _find_wids
_find_miss:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [r15+8], rax
    ; ret
    jmp qword [r15+240]
_parse_number:
    ; cbz     x1, _pnum_no
    mov rax, qword [r15+8]
    cmp rax, 0
    je _pnum_no
    ; mov     x9, x0
    mov rax, qword [r15+0]
    mov qword [r15+72], rax
    ; mov     x10, x1
    mov rax, qword [r15+8]
    mov qword [r15+80], rax
    ; mov     x11, #0
    mov rax, 0
    mov qword [r15+88], rax
    ; mov     x12, #0
    mov rax, 0
    mov qword [r15+96], rax
    ; add     x3, x9, x10
    mov rax, qword [r15+72]
    mov rcx, qword [r15+80]
    add rax, rcx
    mov qword [r15+24], rax
    ; ldrb    w4, [x3, #-1]
    mov r10, qword [r15+24]
    add r10, -1
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cmp     w4, #46
    mov eax, dword [r15+32]
    cmp eax, 0x2e
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _pnum_base
    cmp byte [r15+249], 0
    je _pnum_base
    ; mov     x12, #1
    mov rax, 1
    mov qword [r15+96], rax
    ; sub     x10, x10, #1
    mov rax, qword [r15+80]
    sub rax, 1
    mov qword [r15+80], rax
    ; cbz     x10, _pnum_no
    mov rax, qword [r15+80]
    cmp rax, 0
    je _pnum_no
_pnum_base:
    ; lea x5, base_var
    lea rax, [rel base_var]
    mov qword [r15+40], rax
    ; ldr     x5, [x5]
    mov r10, qword [r15+40]
    mov rax, qword [r10]
    mov qword [r15+40], rax
    ; cmp     x5, #2
    mov rax, qword [r15+40]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _pnum_b10
    cmp byte [r15+250], 0
    je _pnum_b10
    ; cmp     x5, #36
    mov rax, qword [r15+40]
    cmp rax, 0x24
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _pnum_bok
    cmp byte [r15+250], 0
    je _pnum_bok
    cmp byte [r15+249], 0
    jne _pnum_bok
_pnum_b10:
    ; mov     x5, #10
    mov rax, 0xa
    mov qword [r15+40], rax
_pnum_bok:
    ; ldrb    w3, [x9]
    mov r10, qword [r15+72]
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    ; cmp     w3, #'-'
    mov eax, dword [r15+24]
    cmp eax, 0x2d
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _pnum_pref
    cmp byte [r15+249], 0
    je _pnum_pref
    ; mov     x11, #1
    mov rax, 1
    mov qword [r15+88], rax
    ; add     x9, x9, #1
    mov rax, qword [r15+72]
    add rax, 1
    mov qword [r15+72], rax
    ; sub     x10, x10, #1
    mov rax, qword [r15+80]
    sub rax, 1
    mov qword [r15+80], rax
    ; cbz     x10, _pnum_no
    mov rax, qword [r15+80]
    cmp rax, 0
    je _pnum_no
    ; ldrb    w3, [x9]
    mov r10, qword [r15+72]
    movzx eax, byte [r10]
    mov qword [r15+24], rax
_pnum_pref:
    ; cmp     w3, #'#'
    mov eax, dword [r15+24]
    cmp eax, 0x23
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _pnum_hex
    cmp byte [r15+249], 0
    je _pnum_hex
    ; mov     x5, #10
    mov rax, 0xa
    mov qword [r15+40], rax
    ; b       _pnum_ate
    jmp _pnum_ate
_pnum_hex:
    ; cmp     w3, #'$'
    mov eax, dword [r15+24]
    cmp eax, 0x24
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _pnum_bin
    cmp byte [r15+249], 0
    je _pnum_bin
    ; mov     x5, #16
    mov rax, 0x10
    mov qword [r15+40], rax
    ; b       _pnum_ate
    jmp _pnum_ate
_pnum_bin:
    ; cmp     w3, #'%'
    mov eax, dword [r15+24]
    cmp eax, 0x25
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _pnum_digs
    cmp byte [r15+249], 0
    je _pnum_digs
    ; mov     x5, #2
    mov rax, 2
    mov qword [r15+40], rax
_pnum_ate:
    ; add     x9, x9, #1
    mov rax, qword [r15+72]
    add rax, 1
    mov qword [r15+72], rax
    ; sub     x10, x10, #1
    mov rax, qword [r15+80]
    sub rax, 1
    mov qword [r15+80], rax
    ; cbz     x10, _pnum_no
    mov rax, qword [r15+80]
    cmp rax, 0
    je _pnum_no
    ; cbnz    x11, _pnum_digs
    mov rax, qword [r15+88]
    cmp rax, 0
    jne _pnum_digs
    ; ldrb    w3, [x9]
    mov r10, qword [r15+72]
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    ; cmp     w3, #'-'
    mov eax, dword [r15+24]
    cmp eax, 0x2d
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ne    _pnum_digs
    cmp byte [r15+249], 0
    je _pnum_digs
    ; mov     x11, #1
    mov rax, 1
    mov qword [r15+88], rax
    ; add     x9, x9, #1
    mov rax, qword [r15+72]
    add rax, 1
    mov qword [r15+72], rax
    ; sub     x10, x10, #1
    mov rax, qword [r15+80]
    sub rax, 1
    mov qword [r15+80], rax
_pnum_digs:
    ; cbz     x10, _pnum_no
    mov rax, qword [r15+80]
    cmp rax, 0
    je _pnum_no
    ; mov     x6, #0
    mov rax, 0
    mov qword [r15+48], rax
    ; mov     x7, #0
    mov rax, 0
    mov qword [r15+56], rax
_pnum_loop:
    ; cbz     x10, _pnum_done
    mov rax, qword [r15+80]
    cmp rax, 0
    je _pnum_done
    ; ldrb    w3, [x9], #1
    mov r10, qword [r15+72]
    movzx eax, byte [r10]
    mov qword [r15+24], rax
    mov rax, qword [r15+72]
    add rax, 1
    mov qword [r15+72], rax
    ; sub     x10, x10, #1
    mov rax, qword [r15+80]
    sub rax, 1
    mov qword [r15+80], rax
    ; sub     w4, w3, #'0'
    mov eax, dword [r15+24]
    sub eax, 0x30
    mov qword [r15+32], rax
    ; cmp     w4, #9
    mov eax, dword [r15+32]
    cmp eax, 9
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.ls    _pnum_digit
    cmp byte [r15+250], 0
    je _pnum_digit
    cmp byte [r15+249], 0
    jne _pnum_digit
    ; cmp     w3, #'a'
    mov eax, dword [r15+24]
    cmp eax, 0x61
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _pnum_upper
    cmp byte [r15+250], 0
    je _pnum_upper
    ; cmp     w3, #'z'
    mov eax, dword [r15+24]
    cmp eax, 0x7a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _pnum_no
    cmp byte [r15+250], 0
    je xsk_13
    cmp byte [r15+249], 0
    je _pnum_no
    xsk_13:
    ; sub     w4, w3, #'a'
    mov eax, dword [r15+24]
    sub eax, 0x61
    mov qword [r15+32], rax
    ; add     w4, w4, #10
    mov eax, dword [r15+32]
    add eax, 0xa
    mov qword [r15+32], rax
    ; b       _pnum_digit
    jmp _pnum_digit
_pnum_upper:
    ; cmp     w3, #'A'
    mov eax, dword [r15+24]
    cmp eax, 0x41
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.lo    _pnum_no
    cmp byte [r15+250], 0
    je _pnum_no
    ; cmp     w3, #'Z'
    mov eax, dword [r15+24]
    cmp eax, 0x5a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hi    _pnum_no
    cmp byte [r15+250], 0
    je xsk_14
    cmp byte [r15+249], 0
    je _pnum_no
    xsk_14:
    ; sub     w4, w3, #'A'
    mov eax, dword [r15+24]
    sub eax, 0x41
    mov qword [r15+32], rax
    ; add     w4, w4, #10
    mov eax, dword [r15+32]
    add eax, 0xa
    mov qword [r15+32], rax
_pnum_digit:
    ; cmp     x4, x5
    mov rax, qword [r15+32]
    mov rcx, qword [r15+40]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _pnum_no
    cmp byte [r15+250], 0
    jne _pnum_no
    ; mul     x6, x6, x5
    mov rax, qword [r15+48]
    mov rcx, qword [r15+40]
    imul rax, rcx
    mov qword [r15+48], rax
    ; add     x6, x6, x4
    mov rax, qword [r15+48]
    mov rcx, qword [r15+32]
    add rax, rcx
    mov qword [r15+48], rax
    ; add     x7, x7, #1
    mov rax, qword [r15+56]
    add rax, 1
    mov qword [r15+56], rax
    ; b       _pnum_loop
    jmp _pnum_loop
_pnum_done:
    ; cbz     x7, _pnum_no
    mov rax, qword [r15+56]
    cmp rax, 0
    je _pnum_no
    ; cbz     x11, _pnum_pos
    mov rax, qword [r15+88]
    cmp rax, 0
    je _pnum_pos
    ; neg     x6, x6
    mov rax, qword [r15+48]
    neg rax
    mov qword [r15+48], rax
_pnum_pos:
    ; cbz     x12, _pnum_yes
    mov rax, qword [r15+96]
    cmp rax, 0
    je _pnum_yes
    ; asr     x2, x6, #63
    mov rax, qword [r15+48]
    sar rax, 63
    mov qword [r15+16], rax
    ; mov     x1, x6
    mov rax, qword [r15+48]
    mov qword [r15+8], rax
    ; mov     x0, #2
    mov rax, 2
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_pnum_yes:
    ; mov     x1, x6
    mov rax, qword [r15+48]
    mov qword [r15+8], rax
    ; mov     x0, #1
    mov rax, 1
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_pnum_no:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_cursor_load:
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
    ; ldr     x0, [x16, #TU_SRC_ADDR]
    mov r10, qword [r15+128]
    add r10, 0x68
    mov rax, qword [r10]
    mov qword [r15+0], rax
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
    ; ldr     x1, [x16, #TU_TO_IN]
    mov r10, qword [r15+128]
    add r10, 0x78
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; add     x0, x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    add rax, rcx
    mov qword [r15+0], rax
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
    ; str     x0, [x16, #TU_WORD_CURSOR]
    mov r10, qword [r15+128]
    add r10, 0xb8
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; ret
    jmp qword [r15+240]
_cursor_commit:
    ; stp     x0, x1, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+0]
    mov qword [r10+0], rax
    mov rax, qword [r15+8]
    mov qword [r10+8], rax
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
    ; str     x0, [x16, #TU_WORD_CURSOR]
    mov r10, qword [r15+128]
    add r10, 0xb8
    mov rax, qword [r15+0]
    mov qword [r10], rax
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
    ; ldr     x1, [x16, #TU_SRC_ADDR]
    mov r10, qword [r15+128]
    add r10, 0x68
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; sub     x0, x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    sub rax, rcx
    mov qword [r15+0], rax
    ; mov     x16, x27
    mov rax, qword [r15+216]
    mov qword [r15+128], rax
    ; cbnz    x16, L91_11
    mov rax, qword [r15+128]
    cmp rax, 0
    jne L91_11
    ; lea x16, up_var
    lea rax, [rel up_var]
    mov qword [r15+128], rax
    ; ldr     x16, [x16]
    mov r10, qword [r15+128]
    mov rax, qword [r10]
    mov qword [r15+128], rax
L91_11:
    ; str     x0, [x16, #TU_TO_IN]
    mov r10, qword [r15+128]
    add r10, 0x78
    mov rax, qword [r15+0]
    mov qword [r10], rax
    ; ldp     x0, x1, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+0], rax
    mov qword [r15+8], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_next_word:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _cursor_load
    lea rax, [rel xret_15]
    mov qword [r15+240], rax
    jmp _cursor_load
    xret_15:
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
    ; ldr     x3, [x16, #TU_SRC_ADDR]
    mov r10, qword [r15+128]
    add r10, 0x68
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; ldr     x17, [x16, #TU_SRC_LEN]
    mov r10, qword [r15+128]
    add r10, 0x70
    mov rax, qword [r10]
    mov qword [r15+136], rax
    ; add     x3, x3, x17
    mov rax, qword [r15+24]
    mov rcx, qword [r15+136]
    add rax, rcx
    mov qword [r15+24], rax
_nw_skip:
    ; cmp     x0, x3
    mov rax, qword [r15+0]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _nw_none
    cmp byte [r15+250], 0
    jne _nw_none
    ; ldrb    w4, [x0]
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cmp     w4, #32
    mov eax, dword [r15+32]
    cmp eax, 0x20
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_adv
    cmp byte [r15+249], 0
    jne _nw_adv
    ; cmp     w4, #9
    mov eax, dword [r15+32]
    cmp eax, 9
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_adv
    cmp byte [r15+249], 0
    jne _nw_adv
    ; cmp     w4, #10
    mov eax, dword [r15+32]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_adv
    cmp byte [r15+249], 0
    jne _nw_adv
    ; cmp     w4, #13
    mov eax, dword [r15+32]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_adv
    cmp byte [r15+249], 0
    jne _nw_adv
    ; b       _nw_tok
    jmp _nw_tok
_nw_adv:
    ; add     x0, x0, #1
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; b       _nw_skip
    jmp _nw_skip
_nw_tok:
    ; mov     x1, x0
    mov rax, qword [r15+0]
    mov qword [r15+8], rax
_nw_scan:
    ; cmp     x0, x3
    mov rax, qword [r15+0]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _nw_have
    cmp byte [r15+250], 0
    jne _nw_have
    ; ldrb    w4, [x0]
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+32], rax
    ; cmp     w4, #32
    mov eax, dword [r15+32]
    cmp eax, 0x20
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_have
    cmp byte [r15+249], 0
    jne _nw_have
    ; cmp     w4, #9
    mov eax, dword [r15+32]
    cmp eax, 9
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_have
    cmp byte [r15+249], 0
    jne _nw_have
    ; cmp     w4, #10
    mov eax, dword [r15+32]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_have
    cmp byte [r15+249], 0
    jne _nw_have
    ; cmp     w4, #13
    mov eax, dword [r15+32]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_have
    cmp byte [r15+249], 0
    jne _nw_have
    ; add     x0, x0, #1
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; b       _nw_scan
    jmp _nw_scan
_nw_have:
    ; mov     x4, x0
    mov rax, qword [r15+0]
    mov qword [r15+32], rax
    ; cmp     x0, x3
    mov rax, qword [r15+0]
    mov rcx, qword [r15+24]
    cmp rax, rcx
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _nw_store
    cmp byte [r15+250], 0
    jne _nw_store
    ; ldrb    w5, [x0]
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+40], rax
    ; cmp     w5, #32
    mov eax, dword [r15+40]
    cmp eax, 0x20
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_eat
    cmp byte [r15+249], 0
    jne _nw_eat
    ; cmp     w5, #9
    mov eax, dword [r15+40]
    cmp eax, 9
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_eat
    cmp byte [r15+249], 0
    jne _nw_eat
    ; cmp     w5, #10
    mov eax, dword [r15+40]
    cmp eax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_eat
    cmp byte [r15+249], 0
    jne _nw_eat
    ; cmp     w5, #13
    mov eax, dword [r15+40]
    cmp eax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _nw_eat
    cmp byte [r15+249], 0
    jne _nw_eat
    ; b       _nw_store
    jmp _nw_store
_nw_eat:
    ; add     x0, x0, #1
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
_nw_store:
    ; bl      _cursor_commit
    lea rax, [rel xret_16]
    mov qword [r15+240], rax
    jmp _cursor_commit
    xret_16:
    ; sub     x1, x4, x1
    mov rax, qword [r15+32]
    mov rcx, qword [r15+8]
    sub rax, rcx
    mov qword [r15+8], rax
    ; sub     x0, x4, x1
    mov rax, qword [r15+32]
    mov rcx, qword [r15+8]
    sub rax, rcx
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
_nw_none:
    ; bl      _cursor_commit
    lea rax, [rel xret_17]
    mov qword [r15+240], rax
    jmp _cursor_commit
    xret_17:
    ; mov     x1, #0
    mov rax, 0
    mov qword [r15+8], rax
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
nm_XCOMPILE_CELL:
    ; DCB "(COMPILE-CELL)", 0
    db "(COMPILE-CELL)", 0
hl_XCOMPILE_CELL:
    ; DCB "(COMPILE-CELL) ( -- ) compile cell at HERE (bounds-checked)", 0
    db "(COMPILE-CELL) ( -- ) compile cell at HERE (bounds-checked)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCOMPILE_CELL:
    ; DCQ     nm_XCOMPILE_CELL, hl_XCOMPILE_CELL
    dq nm_XCOMPILE_CELL, hl_XCOMPILE_CELL
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     XCOMPILE_CELL, XCOMPILE_CELL_END
    dq XCOMPILE_CELL, XCOMPILE_CELL_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCOMPILE_CELL
    dq row_XCOMPILE_CELL
section .text
XCOMPILE_CELL:
_compile_cell:
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
    ; mov     x0, #8
    mov rax, 8
    mov qword [r15+0], rax
    ; bl      _here_reserve_exact
    lea rax, [rel xret_18]
    mov qword [r15+240], rax
    jmp _here_reserve_exact
    xret_18:
    ; ldr     x1, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    add rsp, 0x10
    ; str     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
XCOMPILE_CELL_END:
_strlen:
    ; mov     x1, x0
    mov rax, qword [r15+0]
    mov qword [r15+8], rax
_strlen_loop:
    ; ldrb    w2, [x0], #1
    mov r10, qword [r15+0]
    movzx eax, byte [r10]
    mov qword [r15+16], rax
    mov rax, qword [r15+0]
    add rax, 1
    mov qword [r15+0], rax
    ; cbnz    w2, _strlen_loop
    mov eax, dword [r15+16]
    cmp rax, 0
    jne _strlen_loop
    ; sub     x0, x0, x1
    mov rax, qword [r15+0]
    mov rcx, qword [r15+8]
    sub rax, rcx
    mov qword [r15+0], rax
    ; sub     x0, x0, #1
    mov rax, qword [r15+0]
    sub rax, 1
    mov qword [r15+0], rax
    ; ret
    jmp qword [r15+240]
_take_pending_help:
    ; lea x0, pending_help_addr
    lea rax, [rel pending_help_addr]
    mov qword [r15+0], rax
    ; ldr     x2, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; lea x1, pending_help_len
    lea rax, [rel pending_help_len]
    mov qword [r15+8], rax
    ; ldr     x3, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+24], rax
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; cbnz    x2, _tph_ok
    mov rax, qword [r15+16]
    cmp rax, 0
    jne _tph_ok
    ; lea x2, boot_h_empty
    lea rax, [rel boot_h_empty]
    mov qword [r15+16], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [r15+24], rax
_tph_ok:
    ; ret
    jmp qword [r15+240]
section .bwstr align=1
nm_XCOLON:
    ; DCB ":", 0
    db ":", 0
hl_XCOLON:
    ; DCB "( 'name' -- ) start colon definition", 0
    db "( 'name' -- ) start colon definition", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XCOLON:
    ; DCQ     nm_XCOLON, hl_XCOLON
    dq nm_XCOLON, hl_XCOLON
    ; DCQ     0
    dq 0
    ; DCQ     XCOLON, 0
    dq XCOLON, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XCOLON
    dq row_XCOLON
section .text
XCOLON:
    ; bl      _core_console_only
    lea rax, [rel xret_19]
    mov qword [r15+240], rax
    jmp _core_console_only
    xret_19:
    ; sub     sp, sp, #96
    mov rax, rsp
    sub rax, 0x60
    mov rsp, rax
    ; stp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _local_compile_reset
    lea rax, [rel xret_20]
    mov qword [r15+240], rax
    jmp _local_compile_reset
    xret_20:
    ; bl      _next_word
    lea rax, [rel xret_21]
    mov qword [r15+240], rax
    jmp _next_word
    xret_21:
    ; cbz     x1, _colon_fail
    mov rax, qword [r15+8]
    cmp rax, 0
    je _colon_fail
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r15+0]
    mov qword [r10+0], rax
    mov rax, qword [r15+8]
    mov qword [r10+8], rax
    ; bl      _take_pending_help
    lea rax, [rel xret_22]
    mov qword [r15+240], rax
    jmp _take_pending_help
    xret_22:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+0], rax
    mov qword [r15+8], rcx
    ; lea x4, DOCOL
    lea rax, [rel DOCOL]
    mov qword [r15+32], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [r15+40], rax
    ; bl      _header_build
    lea rax, [rel xret_23]
    mov qword [r15+240], rax
    jmp _header_build
    xret_23:
    ; bl      _nfa_smudge_cfa
    lea rax, [rel xret_24]
    mov qword [r15+240], rax
    jmp _nfa_smudge_cfa
    xret_24:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_25]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_25:
    ; lea x1, state_var
    lea rax, [rel state_var]
    mov qword [r15+8], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [r15+16], rax
    ; str     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+16]
    mov qword [r10], rax
    ; lea x1, noname_xt
    lea rax, [rel noname_xt]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #96
    mov rax, rsp
    add rax, 0x60
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
_colon_fail:
    ; lea x0, msg_huh
    lea rax, [rel msg_huh]
    mov qword [r15+0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_26]
    mov qword [r15+240], rax
    jmp emit_cstr
    xret_26:
    ; ldp     x29, x30, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    ; add     sp, sp, #96
    mov rax, rsp
    add rax, 0x60
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
nm_XSEMI:
    ; DCB 0x3B, 0
    db 0x3b, 0
hl_XSEMI:
    ; DCB 0x3B, "( -- ) end colon definition (immediate)", 0
    db 0x3b, "( -- ) end colon definition (immediate)", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XSEMI:
    ; DCQ     nm_XSEMI, hl_XSEMI
    dq nm_XSEMI, hl_XSEMI
    ; DCD     0, FLAG_IMM
    dd 0, 0x80000000
    ; DCQ     XSEMI, 0
    dq XSEMI, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XSEMI
    dq row_XSEMI
section .text
XSEMI:
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
    ; lea x0, exit_cfa
    lea rax, [rel exit_cfa]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_27]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_27:
    ; lea x0, last_cfa
    lea rax, [rel last_cfa]
    mov qword [r15+0], rax
    ; ldr     x0, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+0], rax
    ; bl      _nfa_reveal_cfa
    lea rax, [rel xret_28]
    mov qword [r15+240], rax
    jmp _nfa_reveal_cfa
    xret_28:
    ; lea x1, state_var
    lea rax, [rel state_var]
    mov qword [r15+8], rax
    ; str     xzr, [x1]
    mov r10, qword [r15+8]
    mov qword [r10], 0
    ; bl      _local_compile_reset
    lea rax, [rel xret_29]
    mov qword [r15+240], rax
    jmp _local_compile_reset
    xret_29:
    ; lea x0, noname_xt
    lea rax, [rel noname_xt]
    mov qword [r15+0], rax
    ; ldr     x1, [x0]
    mov r10, qword [r15+0]
    mov rax, qword [r10]
    mov qword [r15+8], rax
    ; cbz     x1, _semi_done
    mov rax, qword [r15+8]
    cmp rax, 0
    je _semi_done
    ; str     xzr, [x0]
    mov r10, qword [r15+0]
    mov qword [r10], 0
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
_semi_done:
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
nm_XNONAME:
    ; DCB ":NONAME", 0
    db ":NONAME", 0
hl_XNONAME:
    ; DCB ":NONAME ( -- xt ) anonymous colon definition. semicolon leaves the xt", 0
    db ":NONAME ( -- xt ) anonymous colon definition. semicolon leaves the xt", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_XNONAME:
    ; DCQ     nm_XNONAME, hl_XNONAME
    dq nm_XNONAME, hl_XNONAME
    ; DCQ     0
    dq 0
    ; DCQ     XNONAME, 0
    dq XNONAME, 0
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_XNONAME
    dq row_XNONAME
section .text
XNONAME:
    ; bl      _core_console_only
    lea rax, [rel xret_30]
    mov qword [r15+240], rax
    jmp _core_console_only
    xret_30:
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
    ; bl      _local_compile_reset
    lea rax, [rel xret_31]
    mov qword [r15+240], rax
    jmp _local_compile_reset
    xret_31:
    ; bl      _take_pending_help
    lea rax, [rel xret_32]
    mov qword [r15+240], rax
    jmp _take_pending_help
    xret_32:
    ; lea x0, boot_h_empty
    lea rax, [rel boot_h_empty]
    mov qword [r15+0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [r15+8], rax
    ; lea x4, DOCOL
    lea rax, [rel DOCOL]
    mov qword [r15+32], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [r15+40], rax
    ; bl      _header_build
    lea rax, [rel xret_33]
    mov qword [r15+240], rax
    jmp _header_build
    xret_33:
    ; bl      _nfa_smudge_cfa
    lea rax, [rel xret_34]
    mov qword [r15+240], rax
    jmp _nfa_smudge_cfa
    xret_34:
    ; mov     x0, #0
    mov rax, 0
    mov qword [r15+0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_35]
    mov qword [r15+240], rax
    jmp _compile_cell
    xret_35:
    ; lea x1, last_cfa
    lea rax, [rel last_cfa]
    mov qword [r15+8], rax
    ; ldr     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r10]
    mov qword [r15+16], rax
    ; lea x1, noname_xt
    lea rax, [rel noname_xt]
    mov qword [r15+8], rax
    ; str     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+16]
    mov qword [r10], rax
    ; lea x1, state_var
    lea rax, [rel state_var]
    mov qword [r15+8], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [r15+16], rax
    ; str     x2, [x1]
    mov r10, qword [r15+8]
    mov rax, qword [r15+16]
    mov qword [r10], rax
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
next_debug_gate:
    ; lea x16, next_debug
    lea rax, [rel next_debug]
    mov qword [r15+128], rax
    ; br      x16
    mov rax, qword [r15+128]
    jmp rax
section .rodata
boot_h_empty:
    ; DCB    0
    db 0
msg_huh:
    ; DCB     " ?", 10, 0
    db " ?", 0xa, 0
