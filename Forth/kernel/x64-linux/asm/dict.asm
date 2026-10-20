; Generated from Forth/kernel/arm64/dict.asm. Do not edit.
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
extern _local_compile_reset
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
extern source_base
extern source_cur
extern source_end
extern state_var
extern to_in
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
    mov qword [rel arm_x2], rax
    ; cbz     x1, _dict_hash_empty
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _dict_hash_empty
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
_dict_hash_1:
    ; cmp     x3, x1
    mov rax, qword [rel arm_x3]
    mov rcx, qword [rel arm_x1]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _dict_hash_2
    cmp byte [rel arm_c], 0
    jne _dict_hash_2
    ; ldrb    w4, [x0, x3]
    mov r10, qword [rel arm_x0]
    mov rax, qword [rel arm_x3]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #'a'
    mov eax, dword [rel arm_x4]
    cmp eax, 0x61
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _dict_hash_11
    cmp byte [rel arm_c], 0
    je _dict_hash_11
    ; cmp     w4, #'z'
    mov eax, dword [rel arm_x4]
    cmp eax, 0x7a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _dict_hash_11
    cmp byte [rel arm_c], 0
    je xsk_1
    cmp byte [rel arm_z], 0
    je _dict_hash_11
    xsk_1:
    ; sub     w4, w4, #32
    mov eax, dword [rel arm_x4]
    sub eax, 0x20
    mov qword [rel arm_x4], rax
_dict_hash_11:
    ; lsl     x5, x2, #5
    mov rax, qword [rel arm_x2]
    shl rax, 5
    mov qword [rel arm_x5], rax
    ; add     x2, x5, x2
    mov rax, qword [rel arm_x5]
    mov rcx, qword [rel arm_x2]
    add rax, rcx
    mov qword [rel arm_x2], rax
    ; add     x2, x2, x4
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x2], rax
    ; add     x3, x3, #1
    mov rax, qword [rel arm_x3]
    add rax, 1
    mov qword [rel arm_x3], rax
    ; b       _dict_hash_1
    jmp _dict_hash_1
_dict_hash_2:
    ; mov     x0, #16
    mov rax, 0x10
    mov qword [rel arm_x0], rax
    ; udiv    x1, x2, x0
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x0]
    cmp rcx, 0
    je xdiv0_3
    xor rdx, rdx
    div rcx
    jmp xdiv_2
    xdiv0_3:
    xor eax, eax
    xdiv_2:
    mov qword [rel arm_x1], rax
    ; msub    x0, x1, x0, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x0]
    imul rax, rcx
    mov rcx, qword [rel arm_x2]
    sub rcx, rax
    mov rax, rcx
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_dict_hash_empty:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
global _header_build
_header_build:
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
    ; str     x5, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [rel arm_x5]
    mov qword [r10], rax
    ; mov     x19, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x19], rax
    ; mov     x20, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x20], rax
    ; mov     x21, x2
    mov rax, qword [rel arm_x2]
    mov qword [rel arm_x21], rax
    ; mov     x22, x3
    mov rax, qword [rel arm_x3]
    mov qword [rel arm_x22], rax
    ; mov     x23, x4
    mov rax, qword [rel arm_x4]
    mov qword [rel arm_x23], rax
    ; lea x24, current_var
    lea rax, [rel current_var]
    mov qword [rel arm_x24], rax
    ; ldr     x24, [x24]
    mov r10, qword [rel arm_x24]
    mov rax, qword [r10]
    mov qword [rel arm_x24], rax
    ; lea x9, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x9], rax
    ; ldr     x6, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; mov     x8, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x8], rax
    ; cmp     x22, #255
    mov rax, qword [rel arm_x22]
    cmp rax, 0xff
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _hb_help_ok
    cmp byte [rel arm_c], 0
    je _hb_help_ok
    cmp byte [rel arm_z], 0
    jne _hb_help_ok
    ; mov     x22, #255
    mov rax, 0xff
    mov qword [rel arm_x22], rax
_hb_help_ok:
    ; strb    w22, [x6], #1
    mov r10, qword [rel arm_x6]
    mov eax, dword [rel arm_x22]
    mov byte [r10], al
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
_hb_help_cp:
    ; cmp     x2, x22
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x22]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _hb_help_pad
    cmp byte [rel arm_c], 0
    jne _hb_help_pad
    ; ldrb    w3, [x21, x2]
    mov r10, qword [rel arm_x21]
    mov rax, qword [rel arm_x2]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; strb    w3, [x6], #1
    mov r10, qword [rel arm_x6]
    mov eax, dword [rel arm_x3]
    mov byte [r10], al
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _hb_help_cp
    jmp _hb_help_cp
_hb_help_pad:
    ; sub     x2, x6, x8
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x8]
    sub rax, rcx
    mov qword [rel arm_x2], rax
_hb_help_al:
    ; tst     x2, #7
    mov rax, qword [rel arm_x2]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.eq    _hb_name
    cmp byte [rel arm_z], 0
    jne _hb_name
    ; strb    wzr, [x6], #1
    mov r10, qword [rel arm_x6]
    mov byte [r10], 0
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _hb_help_al
    jmp _hb_help_al
_hb_name:
    ; mov     x7, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x7], rax
    ; cmp     x20, #127
    mov rax, qword [rel arm_x20]
    cmp rax, 0x7f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _hb_nlen
    cmp byte [rel arm_c], 0
    je _hb_nlen
    cmp byte [rel arm_z], 0
    jne _hb_nlen
    ; mov     x20, #127
    mov rax, 0x7f
    mov qword [rel arm_x20], rax
_hb_nlen:
    ; and     w20, w20, #0x7F
    mov eax, dword [rel arm_x20]
    and eax, 0x7f
    mov qword [rel arm_x20], rax
    ; strb    w20, [x6], #1
    mov r10, qword [rel arm_x6]
    mov eax, dword [rel arm_x20]
    mov byte [r10], al
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; mov     x2, #0
    mov rax, 0
    mov qword [rel arm_x2], rax
_hb_name_cp:
    ; cmp     x2, x20
    mov rax, qword [rel arm_x2]
    mov rcx, qword [rel arm_x20]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _hb_name_pad
    cmp byte [rel arm_c], 0
    jne _hb_name_pad
    ; ldrb    w3, [x19, x2]
    mov r10, qword [rel arm_x19]
    mov rax, qword [rel arm_x2]
    add r10, rax
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; cmp     w3, #'a'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x61
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _hb_name_st
    cmp byte [rel arm_c], 0
    je _hb_name_st
    ; cmp     w3, #'z'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x7a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _hb_name_st
    cmp byte [rel arm_c], 0
    je xsk_4
    cmp byte [rel arm_z], 0
    je _hb_name_st
    xsk_4:
    ; sub     w3, w3, #32
    mov eax, dword [rel arm_x3]
    sub eax, 0x20
    mov qword [rel arm_x3], rax
_hb_name_st:
    ; strb    w3, [x6], #1
    mov r10, qword [rel arm_x6]
    mov eax, dword [rel arm_x3]
    mov byte [r10], al
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _hb_name_cp
    jmp _hb_name_cp
_hb_name_pad:
    ; sub     x2, x6, x7
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x7]
    sub rax, rcx
    mov qword [rel arm_x2], rax
_hb_name_al:
    ; tst     x2, #7
    mov rax, qword [rel arm_x2]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.eq    _hb_link
    cmp byte [rel arm_z], 0
    jne _hb_link
    ; strb    wzr, [x6], #1
    mov r10, qword [rel arm_x6]
    mov byte [r10], 0
    mov rax, qword [rel arm_x6]
    add rax, 1
    mov qword [rel arm_x6], rax
    ; add     x2, x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    mov qword [rel arm_x2], rax
    ; b       _hb_name_al
    jmp _hb_name_al
_hb_link:
    ; mov     x0, x19
    mov rax, qword [rel arm_x19]
    mov qword [rel arm_x0], rax
    ; mov     x1, x20
    mov rax, qword [rel arm_x20]
    mov qword [rel arm_x1], rax
    ; bl      _dict_hash
    lea rax, [rel xret_5]
    mov qword [rel arm_x30], rax
    jmp _dict_hash
    xret_5:
    ; add     x10, x24, x0, lsl #3
    mov rax, qword [rel arm_x24]
    mov rcx, qword [rel arm_x0]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x10], rax
    ; ldr     x1, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; str     x1, [x6], #8
    mov r10, qword [rel arm_x6]
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    mov rax, qword [rel arm_x6]
    add rax, 8
    mov qword [rel arm_x6], rax
    ; str     xzr, [x6], #8
    mov r10, qword [rel arm_x6]
    mov qword [r10], 0
    mov rax, qword [rel arm_x6]
    add rax, 8
    mov qword [rel arm_x6], rax
    ; mov     x0, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x0], rax
    ; str     x23, [x6], #8
    mov r10, qword [rel arm_x6]
    mov rax, qword [rel arm_x23]
    mov qword [r10], rax
    mov rax, qword [rel arm_x6]
    add rax, 8
    mov qword [rel arm_x6], rax
    ; sub     x1, x0, x7
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x7]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [rel arm_x1]
    and rax, 0xffff
    mov qword [rel arm_x1], rax
    ; sub     x2, x0, x8
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x8]
    sub rax, rcx
    mov qword [rel arm_x2], rax
    ; and     x2, x2, #0xFFFF
    mov rax, qword [rel arm_x2]
    and rax, 0xffff
    mov qword [rel arm_x2], rax
    ; lsl     x2, x2, #16
    mov rax, qword [rel arm_x2]
    shl rax, 16
    mov qword [rel arm_x2], rax
    ; orr     x1, x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    or rax, rcx
    mov qword [rel arm_x1], rax
    ; stp     x0, x1, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _view_line_now
    lea rax, [rel xret_6]
    mov qword [rel arm_x30], rax
    jmp _view_line_now
    xret_6:
    ; mov     x3, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x3], rax
    ; lea x2, view_src_id
    lea rax, [rel view_src_id]
    mov qword [rel arm_x2], rax
    ; ldr     x2, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; ldp     x0, x1, [sp, #96]
    lea r10, [rsp]
    add r10, 0x60
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; and     x3, x3, #0xFFFF
    mov rax, qword [rel arm_x3]
    and rax, 0xffff
    mov qword [rel arm_x3], rax
    ; lsl     x3, x3, #32
    mov rax, qword [rel arm_x3]
    shl rax, 32
    mov qword [rel arm_x3], rax
    ; orr     x1, x1, x3
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x3]
    or rax, rcx
    mov qword [rel arm_x1], rax
    ; mov     x4, #0x1FFF
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
    ; orr     x1, x1, x2
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x2]
    or rax, rcx
    mov qword [rel arm_x1], rax
    ; ldr     x5, [sp, #112]
    lea r10, [rsp]
    add r10, 0x70
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; orr     x1, x1, x5
    mov rax, qword [rel arm_x1]
    mov rcx, qword [rel arm_x5]
    or rax, rcx
    mov qword [rel arm_x1], rax
    ; str     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; str     x6, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [rel arm_x6]
    mov qword [r10], rax
    ; str     x0, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x2, last_cfa
    lea rax, [rel last_cfa]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2]
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
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
    jmp qword [rel arm_x30]
_nfa_from_cfa:
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [rel arm_x1]
    and rax, 0xffff
    mov qword [rel arm_x1], rax
    ; sub     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_nfa_smudge_cfa:
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [rel arm_x1]
    and rax, 0xffff
    mov qword [rel arm_x1], rax
    ; sub     x1, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; ldrb    w2, [x1]
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    ; orr     w2, w2, #0x80
    mov eax, dword [rel arm_x2]
    or eax, 0x80
    mov qword [rel arm_x2], rax
    ; strb    w2, [x1]
    mov r10, qword [rel arm_x1]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    ; ret
    jmp qword [rel arm_x30]
_nfa_reveal_cfa:
    ; ldr     x1, [x0, #-8]
    mov r10, qword [rel arm_x0]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; and     x1, x1, #0xFFFF
    mov rax, qword [rel arm_x1]
    and rax, 0xffff
    mov qword [rel arm_x1], rax
    ; sub     x1, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; ldrb    w2, [x1]
    mov r10, qword [rel arm_x1]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    ; and     w2, w2, #0x7F
    mov eax, dword [rel arm_x2]
    and eax, 0x7f
    mov qword [rel arm_x2], rax
    ; strb    w2, [x1]
    mov r10, qword [rel arm_x1]
    mov eax, dword [rel arm_x2]
    mov byte [r10], al
    ; ret
    jmp qword [rel arm_x30]
_find_word:
    ; mov     x6, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x6], rax
    ; mov     x7, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x7], rax
    ; mov     x12, x30
    mov rax, qword [rel arm_x30]
    mov qword [rel arm_x12], rax
    ; bl      _dict_hash
    lea rax, [rel xret_7]
    mov qword [rel arm_x30], rax
    jmp _dict_hash
    xret_7:
    ; mov     x30, x12
    mov rax, qword [rel arm_x12]
    mov qword [rel arm_x30], rax
    ; mov     x14, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x14], rax
    ; lea x10, search_order_n
    lea rax, [rel search_order_n]
    mov qword [rel arm_x10], rax
    ; ldr     x11, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x11], rax
    ; mov     x13, #0
    mov rax, 0
    mov qword [rel arm_x13], rax
_find_wids:
    ; cmp     x13, x11
    mov rax, qword [rel arm_x13]
    mov rcx, qword [rel arm_x11]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _find_miss
    cmp byte [rel arm_c], 0
    jne _find_miss
    ; lea x10, search_order
    lea rax, [rel search_order]
    mov qword [rel arm_x10], rax
    ; ldr     x10, [x10, x13, lsl #3]
    mov r10, qword [rel arm_x10]
    mov rax, qword [rel arm_x13]
    shl rax, 3
    add r10, rax
    mov rax, qword [r10]
    mov qword [rel arm_x10], rax
    ; cbz     x10, _find_next_wid
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    je _find_next_wid
    ; add     x4, x10, x14, lsl #3
    mov rax, qword [rel arm_x10]
    mov rcx, qword [rel arm_x14]
    shl rcx, 3
    add rax, rcx
    mov qword [rel arm_x4], rax
    ; ldr     x4, [x4]
    mov r10, qword [rel arm_x4]
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
_find_loop:
    ; cbz     x4, _find_next_wid
    mov rax, qword [rel arm_x4]
    cmp rax, 0
    je _find_next_wid
    ; ldr     x5, [x4, #-8]
    mov r10, qword [rel arm_x4]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x5], rax
    ; and     x8, x5, #0xFFFF
    mov rax, qword [rel arm_x5]
    and rax, 0xffff
    mov qword [rel arm_x8], rax
    ; sub     x8, x4, x8
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x8]
    sub rax, rcx
    mov qword [rel arm_x8], rax
    ; ldrb    w9, [x8]
    mov r10, qword [rel arm_x8]
    movzx eax, byte [r10]
    mov qword [rel arm_x9], rax
    ; tbnz    w9, #7, _find_link
    mov eax, dword [rel arm_x9]
    bt rax, 7
    jc _find_link
    ; and     w9, w9, #0x7F
    mov eax, dword [rel arm_x9]
    and eax, 0x7f
    mov qword [rel arm_x9], rax
    ; cmp     w9, w7
    mov eax, dword [rel arm_x9]
    mov ecx, dword [rel arm_x7]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _find_link
    cmp byte [rel arm_z], 0
    je _find_link
    ; mov     x9, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x9], rax
    ; add     x10, x8, #1
    mov rax, qword [rel arm_x8]
    add rax, 1
    mov qword [rel arm_x10], rax
    ; mov     x15, x7
    mov rax, qword [rel arm_x7]
    mov qword [rel arm_x15], rax
_find_cmp:
    ; cbz     x15, _find_hit
    mov rax, qword [rel arm_x15]
    cmp rax, 0
    je _find_hit
    ; ldrb    w12, [x9], #1
    mov r10, qword [rel arm_x9]
    movzx eax, byte [r10]
    mov qword [rel arm_x12], rax
    mov rax, qword [rel arm_x9]
    add rax, 1
    mov qword [rel arm_x9], rax
    ; ldrb    w16, [x10], #1
    mov r10, qword [rel arm_x10]
    movzx eax, byte [r10]
    mov qword [rel arm_x16], rax
    mov rax, qword [rel arm_x10]
    add rax, 1
    mov qword [rel arm_x10], rax
    ; cmp     w12, #'a'
    mov eax, dword [rel arm_x12]
    cmp eax, 0x61
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _find_fold
    cmp byte [rel arm_c], 0
    je _find_fold
    ; cmp     w12, #'z'
    mov eax, dword [rel arm_x12]
    cmp eax, 0x7a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _find_fold
    cmp byte [rel arm_c], 0
    je xsk_8
    cmp byte [rel arm_z], 0
    je _find_fold
    xsk_8:
    ; sub     w12, w12, #32
    mov eax, dword [rel arm_x12]
    sub eax, 0x20
    mov qword [rel arm_x12], rax
_find_fold:
    ; cmp     w12, w16
    mov eax, dword [rel arm_x12]
    mov ecx, dword [rel arm_x16]
    cmp eax, ecx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _find_link
    cmp byte [rel arm_z], 0
    je _find_link
    ; sub     x15, x15, #1
    mov rax, qword [rel arm_x15]
    sub rax, 1
    mov qword [rel arm_x15], rax
    ; b       _find_cmp
    jmp _find_cmp
_find_hit:
    ; ldr     x1, [x4, #-8]
    mov r10, qword [rel arm_x4]
    add r10, -8
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; mov     x0, x4
    mov rax, qword [rel arm_x4]
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_find_link:
    ; ldr     x4, [x4, #-16]
    mov r10, qword [rel arm_x4]
    add r10, -16
    mov rax, qword [r10]
    mov qword [rel arm_x4], rax
    ; b       _find_loop
    jmp _find_loop
_find_next_wid:
    ; add     x13, x13, #1
    mov rax, qword [rel arm_x13]
    add rax, 1
    mov qword [rel arm_x13], rax
    ; b       _find_wids
    jmp _find_wids
_find_miss:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; ret
    jmp qword [rel arm_x30]
_parse_number:
    ; cbz     x1, _pnum_no
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _pnum_no
    ; mov     x9, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x9], rax
    ; mov     x10, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x10], rax
    ; mov     x11, #0
    mov rax, 0
    mov qword [rel arm_x11], rax
    ; mov     x12, #0
    mov rax, 0
    mov qword [rel arm_x12], rax
    ; add     x3, x9, x10
    mov rax, qword [rel arm_x9]
    mov rcx, qword [rel arm_x10]
    add rax, rcx
    mov qword [rel arm_x3], rax
    ; ldrb    w4, [x3, #-1]
    mov r10, qword [rel arm_x3]
    add r10, -1
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #46
    mov eax, dword [rel arm_x4]
    cmp eax, 0x2e
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pnum_base
    cmp byte [rel arm_z], 0
    je _pnum_base
    ; mov     x12, #1
    mov rax, 1
    mov qword [rel arm_x12], rax
    ; sub     x10, x10, #1
    mov rax, qword [rel arm_x10]
    sub rax, 1
    mov qword [rel arm_x10], rax
    ; cbz     x10, _pnum_no
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    je _pnum_no
_pnum_base:
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
    ; b.lo    _pnum_b10
    cmp byte [rel arm_c], 0
    je _pnum_b10
    ; cmp     x5, #36
    mov rax, qword [rel arm_x5]
    cmp rax, 0x24
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _pnum_bok
    cmp byte [rel arm_c], 0
    je _pnum_bok
    cmp byte [rel arm_z], 0
    jne _pnum_bok
_pnum_b10:
    ; mov     x5, #10
    mov rax, 0xa
    mov qword [rel arm_x5], rax
_pnum_bok:
    ; ldrb    w3, [x9]
    mov r10, qword [rel arm_x9]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; cmp     w3, #'-'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x2d
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pnum_pref
    cmp byte [rel arm_z], 0
    je _pnum_pref
    ; mov     x11, #1
    mov rax, 1
    mov qword [rel arm_x11], rax
    ; add     x9, x9, #1
    mov rax, qword [rel arm_x9]
    add rax, 1
    mov qword [rel arm_x9], rax
    ; sub     x10, x10, #1
    mov rax, qword [rel arm_x10]
    sub rax, 1
    mov qword [rel arm_x10], rax
    ; cbz     x10, _pnum_no
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    je _pnum_no
    ; ldrb    w3, [x9]
    mov r10, qword [rel arm_x9]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
_pnum_pref:
    ; cmp     w3, #'#'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x23
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pnum_hex
    cmp byte [rel arm_z], 0
    je _pnum_hex
    ; mov     x5, #10
    mov rax, 0xa
    mov qword [rel arm_x5], rax
    ; b       _pnum_ate
    jmp _pnum_ate
_pnum_hex:
    ; cmp     w3, #'$'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x24
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pnum_bin
    cmp byte [rel arm_z], 0
    je _pnum_bin
    ; mov     x5, #16
    mov rax, 0x10
    mov qword [rel arm_x5], rax
    ; b       _pnum_ate
    jmp _pnum_ate
_pnum_bin:
    ; cmp     w3, #'%'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x25
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pnum_digs
    cmp byte [rel arm_z], 0
    je _pnum_digs
    ; mov     x5, #2
    mov rax, 2
    mov qword [rel arm_x5], rax
_pnum_ate:
    ; add     x9, x9, #1
    mov rax, qword [rel arm_x9]
    add rax, 1
    mov qword [rel arm_x9], rax
    ; sub     x10, x10, #1
    mov rax, qword [rel arm_x10]
    sub rax, 1
    mov qword [rel arm_x10], rax
    ; cbz     x10, _pnum_no
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    je _pnum_no
    ; cbnz    x11, _pnum_digs
    mov rax, qword [rel arm_x11]
    cmp rax, 0
    jne _pnum_digs
    ; ldrb    w3, [x9]
    mov r10, qword [rel arm_x9]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    ; cmp     w3, #'-'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x2d
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ne    _pnum_digs
    cmp byte [rel arm_z], 0
    je _pnum_digs
    ; mov     x11, #1
    mov rax, 1
    mov qword [rel arm_x11], rax
    ; add     x9, x9, #1
    mov rax, qword [rel arm_x9]
    add rax, 1
    mov qword [rel arm_x9], rax
    ; sub     x10, x10, #1
    mov rax, qword [rel arm_x10]
    sub rax, 1
    mov qword [rel arm_x10], rax
_pnum_digs:
    ; cbz     x10, _pnum_no
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    je _pnum_no
    ; mov     x6, #0
    mov rax, 0
    mov qword [rel arm_x6], rax
    ; mov     x7, #0
    mov rax, 0
    mov qword [rel arm_x7], rax
_pnum_loop:
    ; cbz     x10, _pnum_done
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    je _pnum_done
    ; ldrb    w3, [x9], #1
    mov r10, qword [rel arm_x9]
    movzx eax, byte [r10]
    mov qword [rel arm_x3], rax
    mov rax, qword [rel arm_x9]
    add rax, 1
    mov qword [rel arm_x9], rax
    ; sub     x10, x10, #1
    mov rax, qword [rel arm_x10]
    sub rax, 1
    mov qword [rel arm_x10], rax
    ; sub     w4, w3, #'0'
    mov eax, dword [rel arm_x3]
    sub eax, 0x30
    mov qword [rel arm_x4], rax
    ; cmp     w4, #9
    mov eax, dword [rel arm_x4]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.ls    _pnum_digit
    cmp byte [rel arm_c], 0
    je _pnum_digit
    cmp byte [rel arm_z], 0
    jne _pnum_digit
    ; cmp     w3, #'a'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x61
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _pnum_upper
    cmp byte [rel arm_c], 0
    je _pnum_upper
    ; cmp     w3, #'z'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x7a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _pnum_no
    cmp byte [rel arm_c], 0
    je xsk_9
    cmp byte [rel arm_z], 0
    je _pnum_no
    xsk_9:
    ; sub     w4, w3, #'a'
    mov eax, dword [rel arm_x3]
    sub eax, 0x61
    mov qword [rel arm_x4], rax
    ; add     w4, w4, #10
    mov eax, dword [rel arm_x4]
    add eax, 0xa
    mov qword [rel arm_x4], rax
    ; b       _pnum_digit
    jmp _pnum_digit
_pnum_upper:
    ; cmp     w3, #'A'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x41
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.lo    _pnum_no
    cmp byte [rel arm_c], 0
    je _pnum_no
    ; cmp     w3, #'Z'
    mov eax, dword [rel arm_x3]
    cmp eax, 0x5a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hi    _pnum_no
    cmp byte [rel arm_c], 0
    je xsk_10
    cmp byte [rel arm_z], 0
    je _pnum_no
    xsk_10:
    ; sub     w4, w3, #'A'
    mov eax, dword [rel arm_x3]
    sub eax, 0x41
    mov qword [rel arm_x4], rax
    ; add     w4, w4, #10
    mov eax, dword [rel arm_x4]
    add eax, 0xa
    mov qword [rel arm_x4], rax
_pnum_digit:
    ; cmp     x4, x5
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x5]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _pnum_no
    cmp byte [rel arm_c], 0
    jne _pnum_no
    ; mul     x6, x6, x5
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x5]
    imul rax, rcx
    mov qword [rel arm_x6], rax
    ; add     x6, x6, x4
    mov rax, qword [rel arm_x6]
    mov rcx, qword [rel arm_x4]
    add rax, rcx
    mov qword [rel arm_x6], rax
    ; add     x7, x7, #1
    mov rax, qword [rel arm_x7]
    add rax, 1
    mov qword [rel arm_x7], rax
    ; b       _pnum_loop
    jmp _pnum_loop
_pnum_done:
    ; cbz     x7, _pnum_no
    mov rax, qword [rel arm_x7]
    cmp rax, 0
    je _pnum_no
    ; cbz     x11, _pnum_pos
    mov rax, qword [rel arm_x11]
    cmp rax, 0
    je _pnum_pos
    ; neg     x6, x6
    mov rax, qword [rel arm_x6]
    neg rax
    mov qword [rel arm_x6], rax
_pnum_pos:
    ; cbz     x12, _pnum_yes
    mov rax, qword [rel arm_x12]
    cmp rax, 0
    je _pnum_yes
    ; asr     x2, x6, #63
    mov rax, qword [rel arm_x6]
    sar rax, 63
    mov qword [rel arm_x2], rax
    ; mov     x1, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x1], rax
    ; mov     x0, #2
    mov rax, 2
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_pnum_yes:
    ; mov     x1, x6
    mov rax, qword [rel arm_x6]
    mov qword [rel arm_x1], rax
    ; mov     x0, #1
    mov rax, 1
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_pnum_no:
    ; mov     x0, #0
    mov rax, 0
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_cursor_load:
    ; lea x0, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; lea x1, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; add     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    add rax, rcx
    mov qword [rel arm_x0], rax
    ; lea x1, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ret
    jmp qword [rel arm_x30]
_cursor_commit:
    ; stp     x0, x1, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; lea x1, source_cur
    lea rax, [rel source_cur]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; lea x1, source_base
    lea rax, [rel source_base]
    mov qword [rel arm_x1], rax
    ; ldr     x1, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; sub     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x0], rax
    ; lea x1, to_in
    lea rax, [rel to_in]
    mov qword [rel arm_x1], rax
    ; str     x0, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    ; ldp     x0, x1, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_next_word:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _cursor_load
    lea rax, [rel xret_11]
    mov qword [rel arm_x30], rax
    jmp _cursor_load
    xret_11:
    ; lea x3, source_end
    lea rax, [rel source_end]
    mov qword [rel arm_x3], rax
    ; ldr     x3, [x3]
    mov r10, qword [rel arm_x3]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
_nw_skip:
    ; cmp     x0, x3
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _nw_none
    cmp byte [rel arm_c], 0
    jne _nw_none
    ; ldrb    w4, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #32
    mov eax, dword [rel arm_x4]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_adv
    cmp byte [rel arm_z], 0
    jne _nw_adv
    ; cmp     w4, #9
    mov eax, dword [rel arm_x4]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_adv
    cmp byte [rel arm_z], 0
    jne _nw_adv
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_adv
    cmp byte [rel arm_z], 0
    jne _nw_adv
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_adv
    cmp byte [rel arm_z], 0
    jne _nw_adv
    ; b       _nw_tok
    jmp _nw_tok
_nw_adv:
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _nw_skip
    jmp _nw_skip
_nw_tok:
    ; mov     x1, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x1], rax
_nw_scan:
    ; cmp     x0, x3
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _nw_have
    cmp byte [rel arm_c], 0
    jne _nw_have
    ; ldrb    w4, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x4], rax
    ; cmp     w4, #32
    mov eax, dword [rel arm_x4]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_have
    cmp byte [rel arm_z], 0
    jne _nw_have
    ; cmp     w4, #9
    mov eax, dword [rel arm_x4]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_have
    cmp byte [rel arm_z], 0
    jne _nw_have
    ; cmp     w4, #10
    mov eax, dword [rel arm_x4]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_have
    cmp byte [rel arm_z], 0
    jne _nw_have
    ; cmp     w4, #13
    mov eax, dword [rel arm_x4]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_have
    cmp byte [rel arm_z], 0
    jne _nw_have
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; b       _nw_scan
    jmp _nw_scan
_nw_have:
    ; mov     x4, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x4], rax
    ; cmp     x0, x3
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x3]
    cmp rax, rcx
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _nw_store
    cmp byte [rel arm_c], 0
    jne _nw_store
    ; ldrb    w5, [x0]
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x5], rax
    ; cmp     w5, #32
    mov eax, dword [rel arm_x5]
    cmp eax, 0x20
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_eat
    cmp byte [rel arm_z], 0
    jne _nw_eat
    ; cmp     w5, #9
    mov eax, dword [rel arm_x5]
    cmp eax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_eat
    cmp byte [rel arm_z], 0
    jne _nw_eat
    ; cmp     w5, #10
    mov eax, dword [rel arm_x5]
    cmp eax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_eat
    cmp byte [rel arm_z], 0
    jne _nw_eat
    ; cmp     w5, #13
    mov eax, dword [rel arm_x5]
    cmp eax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _nw_eat
    cmp byte [rel arm_z], 0
    jne _nw_eat
    ; b       _nw_store
    jmp _nw_store
_nw_eat:
    ; add     x0, x0, #1
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
_nw_store:
    ; bl      _cursor_commit
    lea rax, [rel xret_12]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_12:
    ; sub     x1, x4, x1
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x1], rax
    ; sub     x0, x4, x1
    mov rax, qword [rel arm_x4]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x0], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_nw_none:
    ; bl      _cursor_commit
    lea rax, [rel xret_13]
    mov qword [rel arm_x30], rax
    jmp _cursor_commit
    xret_13:
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_compile_cell:
    ; lea x1, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; str     x0, [x2], #8
    mov r10, qword [rel arm_x2]
    mov rax, qword [rel arm_x0]
    mov qword [r10], rax
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; ret
    jmp qword [rel arm_x30]
_strlen:
    ; mov     x1, x0
    mov rax, qword [rel arm_x0]
    mov qword [rel arm_x1], rax
_strlen_loop:
    ; ldrb    w2, [x0], #1
    mov r10, qword [rel arm_x0]
    movzx eax, byte [r10]
    mov qword [rel arm_x2], rax
    mov rax, qword [rel arm_x0]
    add rax, 1
    mov qword [rel arm_x0], rax
    ; cbnz    w2, _strlen_loop
    mov eax, dword [rel arm_x2]
    cmp rax, 0
    jne _strlen_loop
    ; sub     x0, x0, x1
    mov rax, qword [rel arm_x0]
    mov rcx, qword [rel arm_x1]
    sub rax, rcx
    mov qword [rel arm_x0], rax
    ; sub     x0, x0, #1
    mov rax, qword [rel arm_x0]
    sub rax, 1
    mov qword [rel arm_x0], rax
    ; ret
    jmp qword [rel arm_x30]
_take_pending_help:
    ; lea x0, pending_help_addr
    lea rax, [rel pending_help_addr]
    mov qword [rel arm_x0], rax
    ; ldr     x2, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; lea x1, pending_help_len
    lea rax, [rel pending_help_len]
    mov qword [rel arm_x1], rax
    ; ldr     x3, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x3], rax
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; cbnz    x2, _tph_ok
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    jne _tph_ok
    ; lea x2, boot_h_empty
    lea rax, [rel boot_h_empty]
    mov qword [rel arm_x2], rax
    ; mov     x3, #0
    mov rax, 0
    mov qword [rel arm_x3], rax
_tph_ok:
    ; ret
    jmp qword [rel arm_x30]
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
    ; bl      _local_compile_reset
    lea rax, [rel xret_14]
    mov qword [rel arm_x30], rax
    jmp _local_compile_reset
    xret_14:
    ; bl      _next_word
    lea rax, [rel xret_15]
    mov qword [rel arm_x30], rax
    jmp _next_word
    xret_15:
    ; cbz     x1, _colon_fail
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _colon_fail
    ; stp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [rel arm_x0]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x1]
    mov qword [r10+8], rax
    ; bl      _take_pending_help
    lea rax, [rel xret_16]
    mov qword [rel arm_x30], rax
    jmp _take_pending_help
    xret_16:
    ; ldp     x0, x1, [sp, #48]
    lea r10, [rsp]
    add r10, 0x30
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x0], rax
    mov qword [rel arm_x1], rcx
    ; lea x4, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _header_build
    lea rax, [rel xret_17]
    mov qword [rel arm_x30], rax
    jmp _header_build
    xret_17:
    ; bl      _nfa_smudge_cfa
    lea rax, [rel xret_18]
    mov qword [rel arm_x30], rax
    jmp _nfa_smudge_cfa
    xret_18:
    ; lea x1, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2], #8
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; lea x1, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x1], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; lea x1, noname_xt
    lea rax, [rel noname_xt]
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
_colon_fail:
    ; lea x0, msg_huh
    lea rax, [rel msg_huh]
    mov qword [rel arm_x0], rax
    ; bl      emit_cstr
    lea rax, [rel xret_19]
    mov qword [rel arm_x30], rax
    jmp emit_cstr
    xret_19:
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
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; lea x0, exit_cfa
    lea rax, [rel exit_cfa]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _compile_cell
    lea rax, [rel xret_20]
    mov qword [rel arm_x30], rax
    jmp _compile_cell
    xret_20:
    ; lea x0, last_cfa
    lea rax, [rel last_cfa]
    mov qword [rel arm_x0], rax
    ; ldr     x0, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x0], rax
    ; bl      _nfa_reveal_cfa
    lea rax, [rel xret_21]
    mov qword [rel arm_x30], rax
    jmp _nfa_reveal_cfa
    xret_21:
    ; lea x1, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x1], rax
    ; str     xzr, [x1]
    mov r10, qword [rel arm_x1]
    mov qword [r10], 0
    ; bl      _local_compile_reset
    lea rax, [rel xret_22]
    mov qword [rel arm_x30], rax
    jmp _local_compile_reset
    xret_22:
    ; lea x0, noname_xt
    lea rax, [rel noname_xt]
    mov qword [rel arm_x0], rax
    ; ldr     x1, [x0]
    mov r10, qword [rel arm_x0]
    mov rax, qword [r10]
    mov qword [rel arm_x1], rax
    ; cbz     x1, _semi_done
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _semi_done
    ; str     xzr, [x0]
    mov r10, qword [rel arm_x0]
    mov qword [r10], 0
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
_semi_done:
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
    ; bl      _local_compile_reset
    lea rax, [rel xret_23]
    mov qword [rel arm_x30], rax
    jmp _local_compile_reset
    xret_23:
    ; bl      _take_pending_help
    lea rax, [rel xret_24]
    mov qword [rel arm_x30], rax
    jmp _take_pending_help
    xret_24:
    ; lea x0, boot_h_empty
    lea rax, [rel boot_h_empty]
    mov qword [rel arm_x0], rax
    ; mov     x1, #0
    mov rax, 0
    mov qword [rel arm_x1], rax
    ; lea x4, DOCOL
    lea rax, [rel DOCOL]
    mov qword [rel arm_x4], rax
    ; mov     x5, #0
    mov rax, 0
    mov qword [rel arm_x5], rax
    ; bl      _header_build
    lea rax, [rel xret_25]
    mov qword [rel arm_x30], rax
    jmp _header_build
    xret_25:
    ; bl      _nfa_smudge_cfa
    lea rax, [rel xret_26]
    mov qword [rel arm_x30], rax
    jmp _nfa_smudge_cfa
    xret_26:
    ; lea x1, here_ptr
    lea rax, [rel here_ptr]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; str     xzr, [x2], #8
    mov r10, qword [rel arm_x2]
    mov qword [r10], 0
    mov rax, qword [rel arm_x2]
    add rax, 8
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; lea x1, last_cfa
    lea rax, [rel last_cfa]
    mov qword [rel arm_x1], rax
    ; ldr     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [r10]
    mov qword [rel arm_x2], rax
    ; lea x1, noname_xt
    lea rax, [rel noname_xt]
    mov qword [rel arm_x1], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
    ; lea x1, state_var
    lea rax, [rel state_var]
    mov qword [rel arm_x1], rax
    ; mov     x2, #1
    mov rax, 1
    mov qword [rel arm_x2], rax
    ; str     x2, [x1]
    mov r10, qword [rel arm_x1]
    mov rax, qword [rel arm_x2]
    mov qword [r10], rax
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
next_debug_gate:
    ; lea x16, next_debug
    lea rax, [rel next_debug]
    mov qword [rel arm_x16], rax
    ; br      x16
    mov rax, qword [rel arm_x16]
    jmp rax
section .rodata
boot_h_empty:
    ; DCB    0
    db 0
msg_huh:
    ; DCB     " ?", 10, 0
    db " ?", 0xa, 0
