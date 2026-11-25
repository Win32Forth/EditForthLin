; Generated from Forth/kernel/arm64/sa_float.asm. Do not edit.
bits 64
default rel
extern arm_excl
extern arm_excl_addr
extern arm_excl_val
extern float_op_hook
section .text
global _float_op_call
global sa_float_bss_depth
section .bwstr align=1
nm_SA_FLOAT:
    ; DCB "(SA-FLOAT)", 0
    db "(SA-FLOAT)", 0
hl_SA_FLOAT:
    ; DCB "(SA-FLOAT) ( -- ) stand-alone float runtime block", 0
    db "(SA-FLOAT) ( -- ) stand-alone float runtime block", 0
section .bootword align=8
    ; ALIGN 8
align 8
row_SA_FLOAT:
    ; DCQ     nm_SA_FLOAT, hl_SA_FLOAT
    dq nm_SA_FLOAT, hl_SA_FLOAT
    ; DCD     0, FLAG_EMM
    dd 0, 0x40000000
    ; DCQ     SA_FLOAT, SA_FLOAT_END
    dq SA_FLOAT, SA_FLOAT_END
section .bootptr align=8
    ; ALIGN 8
align 8
    ; DCQ     row_SA_FLOAT
    dq row_SA_FLOAT
section .text
SA_FLOAT:
_float_op_call:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [r15+232], rax
    ; adr     x9, sa_float_hook_ptr
    lea rax, [rel sa_float_hook_ptr]
    mov qword [r15+72], rax
    ; ldr     x9, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+72], rax
    ; cbnz    x9, _sff_deref
    mov rax, qword [r15+72]
    cmp rax, 0
    jne _sff_deref
    ; lea x9, float_op_hook
    lea rax, [rel float_op_hook]
    mov qword [r15+72], rax
_sff_deref:
    ; ldr     x9, [x9]
    mov r10, qword [r15+72]
    mov rax, qword [r10]
    mov qword [r15+72], rax
    ; cbz     x9, _sa_float_local
    mov rax, qword [r15+72]
    cmp rax, 0
    je _sa_float_local
    ; sub     sp, sp, #64
    mov rax, rsp
    sub rax, 0x40
    mov rsp, rax
    ; add     x6, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov qword [r15+48], rax
    ; add     x7, sp, #24
    mov rax, rsp
    add rax, 0x18
    mov qword [r15+56], rax
    ; add     x8, sp, #32
    mov rax, rsp
    add rax, 0x20
    mov qword [r15+64], rax
    ; str     xzr, [x6]
    mov r10, qword [r15+48]
    mov qword [r10], 0
    ; str     xzr, [x7]
    mov r10, qword [r15+56]
    mov qword [r10], 0
    ; str     xzr, [x8]
    mov r10, qword [r15+64]
    mov qword [r10], 0
    ; str     x8, [sp]
    lea r10, [rsp]
    mov rax, qword [r15+64]
    mov qword [r10], rax
    ; blr     x9
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
    mov r11, qword [r15+72]
    call r11
    mov qword [r15+0], rax
    mov rsp, rbx
    pop rbx
    ; ldr     x6, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; ldr     x7, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [r15+56], rax
    ; ldr     x8, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov qword [r15+64], rax
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_sa_fdepth_addr:
    ; adr     x10, sa_float_state_ptr
    lea rax, [rel sa_float_state_ptr]
    mov qword [r15+80], rax
    ; ldr     x10, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+80], rax
    ; cbnz    x10, _sfd_ok
    mov rax, qword [r15+80]
    cmp rax, 0
    jne _sfd_ok
    ; lea x10, sa_float_bss_depth
    lea rax, [rel sa_float_bss_depth]
    mov qword [r15+80], rax
_sfd_ok:
    ; ret
    jmp qword [r15+240]
_sa_fpush:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_1]
    mov qword [r15+240], rax
    jmp _sa_fdepth_addr
    xret_1:
    ; ldr     x11, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+88], rax
    ; cmp     x11, #16
    mov rax, qword [r15+88]
    cmp rax, 0x10
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.hs    _sfp_full
    cmp byte [r15+250], 0
    jne _sfp_full
    ; add     x12, x10, #16
    mov rax, qword [r15+80]
    add rax, 0x10
    mov qword [r15+96], rax
    ; str     d0, [x12, x11, lsl #3]
    mov r10, qword [r15+96]
    mov rax, qword [r15+88]
    shl rax, 3
    add r10, rax
    movsd qword [r10], xmm0
    ; add     x11, x11, #1
    mov rax, qword [r15+88]
    add rax, 1
    mov qword [r15+88], rax
    ; str     x11, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r15+88]
    mov qword [r10], rax
_sfp_full:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_sa_fpop:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [r15+232]
    mov qword [r10+0], rax
    mov rax, qword [r15+240]
    mov qword [r10+8], rax
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_2]
    mov qword [r15+240], rax
    jmp _sa_fdepth_addr
    xret_2:
    ; ldr     x11, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+88], rax
    ; cbz     x11, _sfpop_empty
    mov rax, qword [r15+88]
    cmp rax, 0
    je _sfpop_empty
    ; sub     x11, x11, #1
    mov rax, qword [r15+88]
    sub rax, 1
    mov qword [r15+88], rax
    ; str     x11, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r15+88]
    mov qword [r10], rax
    ; add     x12, x10, #16
    mov rax, qword [r15+80]
    add rax, 0x10
    mov qword [r15+96], rax
    ; ldr     d0, [x12, x11, lsl #3]
    mov r10, qword [r15+96]
    mov rax, qword [r15+88]
    shl rax, 3
    add r10, rax
    movsd xmm0, qword [r10]
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_sfpop_empty:
    ; fmov    d0, xzr
    xorpd xmm0, xmm0
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [r15+232], rax
    mov qword [r15+240], rcx
    add rsp, 0x10
    ; ret
    jmp qword [r15+240]
_sa_float_local:
    ; mov     x6, #0
    mov rax, 0
    mov qword [r15+48], rax
    ; mov     x7, #0
    mov rax, 0
    mov qword [r15+56], rax
    ; mov     x8, #0
    mov rax, 0
    mov qword [r15+64], rax
    ; cmp     x0, #1
    mov rax, qword [r15+0]
    cmp rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fdepth
    cmp byte [r15+249], 0
    jne _saf_fdepth
    ; cmp     x0, #2
    mov rax, qword [r15+0]
    cmp rax, 2
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fdrop
    cmp byte [r15+249], 0
    jne _saf_fdrop
    ; cmp     x0, #3
    mov rax, qword [r15+0]
    cmp rax, 3
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fdup
    cmp byte [r15+249], 0
    jne _saf_fdup
    ; cmp     x0, #4
    mov rax, qword [r15+0]
    cmp rax, 4
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fswap
    cmp byte [r15+249], 0
    jne _saf_fswap
    ; cmp     x0, #5
    mov rax, qword [r15+0]
    cmp rax, 5
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fover
    cmp byte [r15+249], 0
    jne _saf_fover
    ; cmp     x0, #6
    mov rax, qword [r15+0]
    cmp rax, 6
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_frot
    cmp byte [r15+249], 0
    jne _saf_frot
    ; cmp     x0, #7
    mov rax, qword [r15+0]
    cmp rax, 7
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fplus
    cmp byte [r15+249], 0
    jne _saf_fplus
    ; cmp     x0, #8
    mov rax, qword [r15+0]
    cmp rax, 8
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fminus
    cmp byte [r15+249], 0
    jne _saf_fminus
    ; cmp     x0, #9
    mov rax, qword [r15+0]
    cmp rax, 9
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fstar
    cmp byte [r15+249], 0
    jne _saf_fstar
    ; cmp     x0, #10
    mov rax, qword [r15+0]
    cmp rax, 0xa
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fslash
    cmp byte [r15+249], 0
    jne _saf_fslash
    ; cmp     x0, #11
    mov rax, qword [r15+0]
    cmp rax, 0xb
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fnegate
    cmp byte [r15+249], 0
    jne _saf_fnegate
    ; cmp     x0, #12
    mov rax, qword [r15+0]
    cmp rax, 0xc
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fabs
    cmp byte [r15+249], 0
    jne _saf_fabs
    ; cmp     x0, #13
    mov rax, qword [r15+0]
    cmp rax, 0xd
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fmax
    cmp byte [r15+249], 0
    jne _saf_fmax
    ; cmp     x0, #14
    mov rax, qword [r15+0]
    cmp rax, 0xe
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fmin
    cmp byte [r15+249], 0
    jne _saf_fmin
    ; cmp     x0, #15
    mov rax, qword [r15+0]
    cmp rax, 0xf
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_f0eq
    cmp byte [r15+249], 0
    jne _saf_f0eq
    ; cmp     x0, #16
    mov rax, qword [r15+0]
    cmp rax, 0x10
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_f0lt
    cmp byte [r15+249], 0
    jne _saf_f0lt
    ; cmp     x0, #17
    mov rax, qword [r15+0]
    cmp rax, 0x11
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_flt
    cmp byte [r15+249], 0
    jne _saf_flt
    ; cmp     x0, #18
    mov rax, qword [r15+0]
    cmp rax, 0x12
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fgt
    cmp byte [r15+249], 0
    jne _saf_fgt
    ; cmp     x0, #19
    mov rax, qword [r15+0]
    cmp rax, 0x13
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_feq
    cmp byte [r15+249], 0
    jne _saf_feq
    ; cmp     x0, #20
    mov rax, qword [r15+0]
    cmp rax, 0x14
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fne
    cmp byte [r15+249], 0
    jne _saf_fne
    ; cmp     x0, #21
    mov rax, qword [r15+0]
    cmp rax, 0x15
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_ftilde
    cmp byte [r15+249], 0
    jne _saf_ftilde
    ; cmp     x0, #22
    mov rax, qword [r15+0]
    cmp rax, 0x16
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fat
    cmp byte [r15+249], 0
    jne _saf_fat
    ; cmp     x0, #23
    mov rax, qword [r15+0]
    cmp rax, 0x17
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fstore
    cmp byte [r15+249], 0
    jne _saf_fstore
    ; cmp     x0, #24
    mov rax, qword [r15+0]
    cmp rax, 0x18
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_sfat
    cmp byte [r15+249], 0
    jne _saf_sfat
    ; cmp     x0, #25
    mov rax, qword [r15+0]
    cmp rax, 0x19
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_sfstore
    cmp byte [r15+249], 0
    jne _saf_sfstore
    ; cmp     x0, #26
    mov rax, qword [r15+0]
    cmp rax, 0x1a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fat
    cmp byte [r15+249], 0
    jne _saf_fat
    ; cmp     x0, #27
    mov rax, qword [r15+0]
    cmp rax, 0x1b
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fstore
    cmp byte [r15+249], 0
    jne _saf_fstore
    ; cmp     x0, #28
    mov rax, qword [r15+0]
    cmp rax, 0x1c
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_stf
    cmp byte [r15+249], 0
    jne _saf_stf
    ; cmp     x0, #29
    mov rax, qword [r15+0]
    cmp rax, 0x1d
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fts
    cmp byte [r15+249], 0
    jne _saf_fts
    ; cmp     x0, #30
    mov rax, qword [r15+0]
    cmp rax, 0x1e
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_dtf
    cmp byte [r15+249], 0
    jne _saf_dtf
    ; cmp     x0, #31
    mov rax, qword [r15+0]
    cmp rax, 0x1f
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_ftd
    cmp byte [r15+249], 0
    jne _saf_ftd
    ; cmp     x0, #36
    mov rax, qword [r15+0]
    cmp rax, 0x24
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_precision
    cmp byte [r15+249], 0
    jne _saf_precision
    ; cmp     x0, #37
    mov rax, qword [r15+0]
    cmp rax, 0x25
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_setprecision
    cmp byte [r15+249], 0
    jne _saf_setprecision
    ; cmp     x0, #39
    mov rax, qword [r15+0]
    cmp rax, 0x27
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_floats
    cmp byte [r15+249], 0
    jne _saf_floats
    ; cmp     x0, #40
    mov rax, qword [r15+0]
    cmp rax, 0x28
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_floatplus
    cmp byte [r15+249], 0
    jne _saf_floatplus
    ; cmp     x0, #41
    mov rax, qword [r15+0]
    cmp rax, 0x29
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_sfloats
    cmp byte [r15+249], 0
    jne _saf_sfloats
    ; cmp     x0, #42
    mov rax, qword [r15+0]
    cmp rax, 0x2a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_sfloatplus
    cmp byte [r15+249], 0
    jne _saf_sfloatplus
    ; cmp     x0, #43
    mov rax, qword [r15+0]
    cmp rax, 0x2b
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_floats
    cmp byte [r15+249], 0
    jne _saf_floats
    ; cmp     x0, #44
    mov rax, qword [r15+0]
    cmp rax, 0x2c
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_floatplus
    cmp byte [r15+249], 0
    jne _saf_floatplus
    ; cmp     x0, #45
    mov rax, qword [r15+0]
    cmp rax, 0x2d
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fsqrt
    cmp byte [r15+249], 0
    jne _saf_fsqrt
    ; cmp     x0, #70
    mov rax, qword [r15+0]
    cmp rax, 0x46
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_falign
    cmp byte [r15+249], 0
    jne _saf_falign
    ; cmp     x0, #71
    mov rax, qword [r15+0]
    cmp rax, 0x47
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_sfalign
    cmp byte [r15+249], 0
    jne _saf_sfalign
    ; cmp     x0, #72
    mov rax, qword [r15+0]
    cmp rax, 0x48
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_falign
    cmp byte [r15+249], 0
    jne _saf_falign
    ; cmp     x0, #73
    mov rax, qword [r15+0]
    cmp rax, 0x49
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_faligned
    cmp byte [r15+249], 0
    jne _saf_faligned
    ; cmp     x0, #74
    mov rax, qword [r15+0]
    cmp rax, 0x4a
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_sfaligned
    cmp byte [r15+249], 0
    jne _saf_sfaligned
    ; cmp     x0, #75
    mov rax, qword [r15+0]
    cmp rax, 0x4b
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_faligned
    cmp byte [r15+249], 0
    jne _saf_faligned
    ; cmp     x0, #101
    mov rax, qword [r15+0]
    cmp rax, 0x65
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fpushbits
    cmp byte [r15+249], 0
    jne _saf_fpushbits
    ; cmp     x0, #102
    mov rax, qword [r15+0]
    cmp rax, 0x66
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fpopbits
    cmp byte [r15+249], 0
    jne _saf_fpopbits
    ; cmp     x0, #103
    mov rax, qword [r15+0]
    cmp rax, 0x67
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_fdepth
    cmp byte [r15+249], 0
    jne _saf_fdepth
    ; mov     x0, #-1
    mov rax, -1
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
_saf_ok:
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
_saf_fdepth:
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_3]
    mov qword [r15+240], rax
    jmp _sa_fdepth_addr
    xret_3:
    ; ldr     x6, [x10]
    mov r10, qword [r15+80]
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fdrop:
    ; bl      _sa_fpop
    lea rax, [rel xret_4]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_4:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fdup:
    ; bl      _sa_fpop
    lea rax, [rel xret_5]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_5:
    ; bl      _sa_fpush
    lea rax, [rel xret_6]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_6:
    ; bl      _sa_fpush
    lea rax, [rel xret_7]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_7:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fswap:
    ; bl      _sa_fpop
    lea rax, [rel xret_8]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_8:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_9]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_9:
    ; fmov    d2, d0
    movsd xmm2, xmm0
    ; fmov    d0, d1
    movsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_10]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_10:
    ; fmov    d0, d2
    movsd xmm0, xmm2
    ; bl      _sa_fpush
    lea rax, [rel xret_11]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_11:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fover:
    ; bl      _sa_fpop
    lea rax, [rel xret_12]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_12:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_13]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_13:
    ; fmov    d2, d0
    movsd xmm2, xmm0
    ; bl      _sa_fpush
    lea rax, [rel xret_14]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_14:
    ; fmov    d0, d1
    movsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_15]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_15:
    ; fmov    d0, d2
    movsd xmm0, xmm2
    ; bl      _sa_fpush
    lea rax, [rel xret_16]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_16:
    ; b       _saf_ok
    jmp _saf_ok
_saf_frot:
    ; bl      _sa_fpop
    lea rax, [rel xret_17]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_17:
    ; fmov    d3, d0
    movsd xmm3, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_18]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_18:
    ; fmov    d2, d0
    movsd xmm2, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_19]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_19:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; fmov    d0, d2
    movsd xmm0, xmm2
    ; bl      _sa_fpush
    lea rax, [rel xret_20]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_20:
    ; fmov    d0, d3
    movsd xmm0, xmm3
    ; bl      _sa_fpush
    lea rax, [rel xret_21]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_21:
    ; fmov    d0, d1
    movsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_22]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_22:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fplus:
    ; bl      _sa_fpop
    lea rax, [rel xret_23]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_23:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_24]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_24:
    ; fadd    d0, d0, d1
    addsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_25]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_25:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fminus:
    ; bl      _sa_fpop
    lea rax, [rel xret_26]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_26:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_27]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_27:
    ; fsub    d0, d0, d1
    subsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_28]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_28:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fstar:
    ; bl      _sa_fpop
    lea rax, [rel xret_29]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_29:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_30]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_30:
    ; fmul    d0, d0, d1
    mulsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_31]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_31:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fslash:
    ; bl      _sa_fpop
    lea rax, [rel xret_32]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_32:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_33]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_33:
    ; fdiv    d0, d0, d1
    divsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_34]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_34:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fnegate:
    ; bl      _sa_fpop
    lea rax, [rel xret_35]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_35:
    ; fneg    d0, d0
    mov rax, 8000000000000000h
    movq xmm15, rax
    xorpd xmm0, xmm15
    ; bl      _sa_fpush
    lea rax, [rel xret_36]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_36:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fabs:
    ; bl      _sa_fpop
    lea rax, [rel xret_37]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_37:
    ; fabs    d0, d0
    mov rax, 7FFFFFFFFFFFFFFFh
    movq xmm15, rax
    andpd xmm0, xmm15
    ; bl      _sa_fpush
    lea rax, [rel xret_38]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_38:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fmax:
    ; bl      _sa_fpop
    lea rax, [rel xret_39]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_39:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_40]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_40:
    ; fmax    d0, d0, d1
    maxsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_41]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_41:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fmin:
    ; bl      _sa_fpop
    lea rax, [rel xret_42]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_42:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_43]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_43:
    ; fmin    d0, d0, d1
    minsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_44]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_44:
    ; b       _saf_ok
    jmp _saf_ok
_saf_f0eq:
    ; bl      _sa_fpop
    lea rax, [rel xret_45]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_45:
    ; fcmp    d0, #0.0
    xorpd xmm15, xmm15
    ucomisd xmm0, xmm15
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [r15+248], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [r15+249], r11b
    mov byte [r15+251], cl
    mov r11b, byte [r15+248]
    xor r11b, 1
    mov byte [r15+250], r11b
    ; csetm   x6, eq
    xor eax, eax
    cmp byte [r15+249], 0
    je xsk_46
    mov rax, -1
    xsk_46:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_f0lt:
    ; bl      _sa_fpop
    lea rax, [rel xret_47]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_47:
    ; fcmp    d0, #0.0
    xorpd xmm15, xmm15
    ucomisd xmm0, xmm15
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [r15+248], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [r15+249], r11b
    mov byte [r15+251], cl
    mov r11b, byte [r15+248]
    xor r11b, 1
    mov byte [r15+250], r11b
    ; csetm   x6, mi
    xor eax, eax
    cmp byte [r15+248], 0
    je xsk_48
    mov rax, -1
    xsk_48:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_flt:
    ; bl      _sa_fpop
    lea rax, [rel xret_49]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_49:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_50]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_50:
    ; fcmp    d0, d1
    ucomisd xmm0, xmm1
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [r15+248], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [r15+249], r11b
    mov byte [r15+251], cl
    mov r11b, byte [r15+248]
    xor r11b, 1
    mov byte [r15+250], r11b
    ; csetm   x6, mi
    xor eax, eax
    cmp byte [r15+248], 0
    je xsk_51
    mov rax, -1
    xsk_51:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fgt:
    ; bl      _sa_fpop
    lea rax, [rel xret_52]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_52:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_53]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_53:
    ; fcmp    d0, d1
    ucomisd xmm0, xmm1
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [r15+248], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [r15+249], r11b
    mov byte [r15+251], cl
    mov r11b, byte [r15+248]
    xor r11b, 1
    mov byte [r15+250], r11b
    ; csetm   x6, gt
    xor eax, eax
    cmp byte [r15+249], 0
    jne xsk_54
    mov r11b, byte [r15+248]
    cmp r11b, byte [r15+251]
    jne xsk_54
    mov rax, -1
    xsk_54:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_feq:
    ; bl      _sa_fpop
    lea rax, [rel xret_55]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_55:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_56]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_56:
    ; fcmp    d0, d1
    ucomisd xmm0, xmm1
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [r15+248], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [r15+249], r11b
    mov byte [r15+251], cl
    mov r11b, byte [r15+248]
    xor r11b, 1
    mov byte [r15+250], r11b
    ; csetm   x6, eq
    xor eax, eax
    cmp byte [r15+249], 0
    je xsk_57
    mov rax, -1
    xsk_57:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fne:
    ; bl      _sa_fpop
    lea rax, [rel xret_58]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_58:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_59]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_59:
    ; fcmp    d0, d1
    ucomisd xmm0, xmm1
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [r15+248], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [r15+249], r11b
    mov byte [r15+251], cl
    mov r11b, byte [r15+248]
    xor r11b, 1
    mov byte [r15+250], r11b
    ; csetm   x6, ne
    xor eax, eax
    cmp byte [r15+249], 0
    jne xsk_60
    mov rax, -1
    xsk_60:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_ftilde:
    ; bl      _sa_fpop
    lea rax, [rel xret_61]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_61:
    ; fabs    d2, d0
    movsd xmm2, xmm0
    mov rax, 7FFFFFFFFFFFFFFFh
    movq xmm15, rax
    andpd xmm2, xmm15
    ; bl      _sa_fpop
    lea rax, [rel xret_62]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_62:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_63]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_63:
    ; fsub    d0, d0, d1
    subsd xmm0, xmm1
    ; fabs    d0, d0
    mov rax, 7FFFFFFFFFFFFFFFh
    movq xmm15, rax
    andpd xmm0, xmm15
    ; fcmp    d0, d2
    ucomisd xmm0, xmm2
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [r15+248], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [r15+249], r11b
    mov byte [r15+251], cl
    mov r11b, byte [r15+248]
    xor r11b, 1
    mov byte [r15+250], r11b
    ; csetm   x6, mi
    xor eax, eax
    cmp byte [r15+248], 0
    je xsk_64
    mov rax, -1
    xsk_64:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fat:
    ; cbz     x1, _saf_ok
    mov rax, qword [r15+8]
    cmp rax, 0
    je _saf_ok
    ; ldr     d0, [x1]
    mov r10, qword [r15+8]
    movsd xmm0, qword [r10]
    ; bl      _sa_fpush
    lea rax, [rel xret_65]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_65:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fstore:
    ; bl      _sa_fpop
    lea rax, [rel xret_66]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_66:
    ; cbz     x1, _saf_ok
    mov rax, qword [r15+8]
    cmp rax, 0
    je _saf_ok
    ; str     d0, [x1]
    mov r10, qword [r15+8]
    movsd qword [r10], xmm0
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfat:
    ; cbz     x1, _saf_ok
    mov rax, qword [r15+8]
    cmp rax, 0
    je _saf_ok
    ; ldr     s0, [x1]
    mov r10, qword [r15+8]
    movss xmm0, dword [r10]
    ; fcvt    d0, s0
    cvtss2sd xmm0, xmm0
    ; bl      _sa_fpush
    lea rax, [rel xret_67]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_67:
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfstore:
    ; bl      _sa_fpop
    lea rax, [rel xret_68]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_68:
    ; cbz     x1, _saf_ok
    mov rax, qword [r15+8]
    cmp rax, 0
    je _saf_ok
    ; fcvt    s0, d0
    cvtsd2ss xmm0, xmm0
    ; str     s0, [x1]
    mov r10, qword [r15+8]
    movss dword [r10], xmm0
    ; b       _saf_ok
    jmp _saf_ok
_saf_stf:
    ; scvtf   d0, x1
    mov rax, qword [r15+8]
    cvtsi2sd xmm0, rax
    ; bl      _sa_fpush
    lea rax, [rel xret_69]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_69:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fts:
    ; bl      _sa_fpop
    lea rax, [rel xret_70]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_70:
    ; fcvtzs  x6, d0
    cvttsd2si rax, xmm0
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_dtf:
    ; cmp     x2, #0
    mov rax, qword [r15+16]
    cmp rax, 0
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setnc byte [r15+250]
    ; b.eq    _saf_dtf_lo
    cmp byte [r15+249], 0
    jne _saf_dtf_lo
    ; cmn     x2, #1
    mov rax, qword [r15+16]
    add rax, 1
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; b.eq    _saf_dtf_lo
    cmp byte [r15+249], 0
    jne _saf_dtf_lo
    ; scvtf   d0, x2
    mov rax, qword [r15+16]
    cvtsi2sd xmm0, rax
    ; movz    x10, #0
    mov rax, 0
    mov qword [r15+80], rax
    ; movk    x10, #0x43F0, lsl #48
    mov rax, qword [r15+80]
    mov rcx, 0xffffffffffff
    and rax, rcx
    mov rcx, 0x43f0000000000000
    or rax, rcx
    mov qword [r15+80], rax
    ; fmov    d1, x10
    mov rax, qword [r15+80]
    movq xmm1, rax
    ; fmul    d0, d0, d1
    mulsd xmm0, xmm1
    ; mov     x11, x1
    mov rax, qword [r15+8]
    mov qword [r15+88], rax
    ; ucvtf   d1, x11
    mov rax, qword [r15+88]
    cvtsi2sd xmm1, rax
    test rax, rax
    jns xucv_71
    mov rcx, 43F0000000000000h
    movq xmm15, rcx
    addsd xmm1, xmm15
    xucv_71:
    ; fadd    d0, d0, d1
    addsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_72]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_72:
    ; b       _saf_ok
    jmp _saf_ok
_saf_dtf_lo:
    ; scvtf   d0, x1
    mov rax, qword [r15+8]
    cvtsi2sd xmm0, rax
    ; bl      _sa_fpush
    lea rax, [rel xret_73]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_73:
    ; b       _saf_ok
    jmp _saf_ok
_saf_ftd:
    ; bl      _sa_fpop
    lea rax, [rel xret_74]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_74:
    ; fcvtzs  x6, d0
    cvttsd2si rax, xmm0
    mov qword [r15+48], rax
    ; fcmp    d0, #0.0
    xorpd xmm15, xmm15
    ucomisd xmm0, xmm15
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [r15+248], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [r15+249], r11b
    mov byte [r15+251], cl
    mov r11b, byte [r15+248]
    xor r11b, 1
    mov byte [r15+250], r11b
    ; csetm   x7, mi
    xor eax, eax
    cmp byte [r15+248], 0
    je xsk_75
    mov rax, -1
    xsk_75:
    mov qword [r15+56], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_precision:
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_76]
    mov qword [r15+240], rax
    jmp _sa_fdepth_addr
    xret_76:
    ; ldr     x6, [x10, #8]
    mov r10, qword [r15+80]
    add r10, 8
    mov rax, qword [r10]
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_setprecision:
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_77]
    mov qword [r15+240], rax
    jmp _sa_fdepth_addr
    xret_77:
    ; str     x1, [x10, #8]
    mov r10, qword [r15+80]
    add r10, 8
    mov rax, qword [r15+8]
    mov qword [r10], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_floats:
    ; lsl     x6, x1, #3
    mov rax, qword [r15+8]
    shl rax, 3
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_floatplus:
    ; add     x6, x1, #8
    mov rax, qword [r15+8]
    add rax, 8
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfloats:
    ; lsl     x6, x1, #2
    mov rax, qword [r15+8]
    shl rax, 2
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfloatplus:
    ; add     x6, x1, #4
    mov rax, qword [r15+8]
    add rax, 4
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fsqrt:
    ; bl      _sa_fpop
    lea rax, [rel xret_78]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_78:
    ; fsqrt   d0, d0
    sqrtsd xmm0, xmm0
    ; bl      _sa_fpush
    lea rax, [rel xret_79]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_79:
    ; b       _saf_ok
    jmp _saf_ok
_saf_falign:
    ; add     x6, x1, #7
    mov rax, qword [r15+8]
    add rax, 7
    mov qword [r15+48], rax
    ; bic     x6, x6, #7
    mov rax, qword [r15+48]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfalign:
    ; add     x6, x1, #3
    mov rax, qword [r15+8]
    add rax, 3
    mov qword [r15+48], rax
    ; bic     x6, x6, #3
    mov rax, qword [r15+48]
    mov rcx, 3
    not rcx
    and rax, rcx
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_faligned:
    ; tst     x1, #7
    mov rax, qword [r15+8]
    test rax, 7
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; csetm   x6, eq
    xor eax, eax
    cmp byte [r15+249], 0
    je xsk_80
    mov rax, -1
    xsk_80:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfaligned:
    ; tst     x1, #3
    mov rax, qword [r15+8]
    test rax, 3
    seto byte [r15+251]
    sets byte [r15+248]
    setz byte [r15+249]
    setc byte [r15+250]
    ; csetm   x6, eq
    xor eax, eax
    cmp byte [r15+249], 0
    je xsk_81
    mov rax, -1
    xsk_81:
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fpushbits:
    ; fmov    d0, x1
    mov rax, qword [r15+8]
    movq xmm0, rax
    ; bl      _sa_fpush
    lea rax, [rel xret_82]
    mov qword [r15+240], rax
    jmp _sa_fpush
    xret_82:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fpopbits:
    ; bl      _sa_fpop
    lea rax, [rel xret_83]
    mov qword [r15+240], rax
    jmp _sa_fpop
    xret_83:
    ; fmov    x6, d0
    movq rax, xmm0
    mov qword [r15+48], rax
    ; b       _saf_ok
    jmp _saf_ok
    ; ALIGN 8
align 8
sa_float_hook_ptr:
    ; DCQ     0
    dq 0
sa_float_zero_cell:
    ; DCQ     0
    dq 0
sa_float_state_ptr:
    ; DCQ     0
    dq 0
sa_float_pool_pad:
    ; DCQ     0
    dq 0
SA_FLOAT_END:
section .data
sa_float_bss_depth:
    ; DCQ     0
    dq 0
sa_float_bss_precision:
    ; DCQ     6
    dq 6
sa_float_bss_stack:
    ; SPACE   128
    times 128 db 0
