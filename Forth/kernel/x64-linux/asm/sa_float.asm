; Generated from Forth/kernel/arm64/sa_float.asm. Do not edit.
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
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; mov     x29, sp
    mov rax, rsp
    mov qword [rel arm_x29], rax
    ; adr     x9, sa_float_hook_ptr
    lea rax, [rel sa_float_hook_ptr]
    mov qword [rel arm_x9], rax
    ; ldr     x9, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
    ; cbnz    x9, _sff_deref
    mov rax, qword [rel arm_x9]
    cmp rax, 0
    jne _sff_deref
    ; lea x9, float_op_hook
    lea rax, [rel float_op_hook]
    mov qword [rel arm_x9], rax
_sff_deref:
    ; ldr     x9, [x9]
    mov r10, qword [rel arm_x9]
    mov rax, qword [r10]
    mov qword [rel arm_x9], rax
    ; cbz     x9, _sa_float_local
    mov rax, qword [rel arm_x9]
    cmp rax, 0
    je _sa_float_local
    ; sub     sp, sp, #64
    mov rax, rsp
    sub rax, 0x40
    mov rsp, rax
    ; add     x6, sp, #16
    mov rax, rsp
    add rax, 0x10
    mov qword [rel arm_x6], rax
    ; add     x7, sp, #24
    mov rax, rsp
    add rax, 0x18
    mov qword [rel arm_x7], rax
    ; add     x8, sp, #32
    mov rax, rsp
    add rax, 0x20
    mov qword [rel arm_x8], rax
    ; str     xzr, [x6]
    mov r10, qword [rel arm_x6]
    mov qword [r10], 0
    ; str     xzr, [x7]
    mov r10, qword [rel arm_x7]
    mov qword [r10], 0
    ; str     xzr, [x8]
    mov r10, qword [rel arm_x8]
    mov qword [r10], 0
    ; str     x8, [sp]
    lea r10, [rsp]
    mov rax, qword [rel arm_x8]
    mov qword [r10], rax
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
    ; ldr     x6, [sp, #16]
    lea r10, [rsp]
    add r10, 0x10
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; ldr     x7, [sp, #24]
    lea r10, [rsp]
    add r10, 0x18
    mov rax, qword [r10]
    mov qword [rel arm_x7], rax
    ; ldr     x8, [sp, #32]
    lea r10, [rsp]
    add r10, 0x20
    mov rax, qword [r10]
    mov qword [rel arm_x8], rax
    ; add     sp, sp, #64
    mov rax, rsp
    add rax, 0x40
    mov rsp, rax
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_sa_fdepth_addr:
    ; adr     x10, sa_float_state_ptr
    lea rax, [rel sa_float_state_ptr]
    mov qword [rel arm_x10], rax
    ; ldr     x10, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x10], rax
    ; cbnz    x10, _sfd_ok
    mov rax, qword [rel arm_x10]
    cmp rax, 0
    jne _sfd_ok
    ; lea x10, sa_float_bss_depth
    lea rax, [rel sa_float_bss_depth]
    mov qword [rel arm_x10], rax
_sfd_ok:
    ; ret
    jmp qword [rel arm_x30]
_sa_fpush:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_1]
    mov qword [rel arm_x30], rax
    jmp _sa_fdepth_addr
    xret_1:
    ; ldr     x11, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x11], rax
    ; cmp     x11, #16
    mov rax, qword [rel arm_x11]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.hs    _sfp_full
    cmp byte [rel arm_c], 0
    jne _sfp_full
    ; add     x12, x10, #16
    mov rax, qword [rel arm_x10]
    add rax, 0x10
    mov qword [rel arm_x12], rax
    ; str     d0, [x12, x11, lsl #3]
    mov r10, qword [rel arm_x12]
    mov rax, qword [rel arm_x11]
    shl rax, 3
    add r10, rax
    movsd qword [r10], xmm0
    ; add     x11, x11, #1
    mov rax, qword [rel arm_x11]
    add rax, 1
    mov qword [rel arm_x11], rax
    ; str     x11, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [rel arm_x11]
    mov qword [r10], rax
_sfp_full:
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_sa_fpop:
    ; stp     x29, x30, [sp, #-16]!
    add rsp, -16
    lea r10, [rsp]
    mov rax, qword [rel arm_x29]
    mov qword [r10+0], rax
    mov rax, qword [rel arm_x30]
    mov qword [r10+8], rax
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_2]
    mov qword [rel arm_x30], rax
    jmp _sa_fdepth_addr
    xret_2:
    ; ldr     x11, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x11], rax
    ; cbz     x11, _sfpop_empty
    mov rax, qword [rel arm_x11]
    cmp rax, 0
    je _sfpop_empty
    ; sub     x11, x11, #1
    mov rax, qword [rel arm_x11]
    sub rax, 1
    mov qword [rel arm_x11], rax
    ; str     x11, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [rel arm_x11]
    mov qword [r10], rax
    ; add     x12, x10, #16
    mov rax, qword [rel arm_x10]
    add rax, 0x10
    mov qword [rel arm_x12], rax
    ; ldr     d0, [x12, x11, lsl #3]
    mov r10, qword [rel arm_x12]
    mov rax, qword [rel arm_x11]
    shl rax, 3
    add r10, rax
    movsd xmm0, qword [r10]
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_sfpop_empty:
    ; fmov    d0, xzr
    xorpd xmm0, xmm0
    ; ldp     x29, x30, [sp], #16
    lea r10, [rsp]
    mov rax, qword [r10]
    mov rcx, qword [r10+8]
    mov qword [rel arm_x29], rax
    mov qword [rel arm_x30], rcx
    add rsp, 0x10
    ; ret
    jmp qword [rel arm_x30]
_sa_float_local:
    ; mov     x6, #0
    mov rax, 0
    mov qword [rel arm_x6], rax
    ; mov     x7, #0
    mov rax, 0
    mov qword [rel arm_x7], rax
    ; mov     x8, #0
    mov rax, 0
    mov qword [rel arm_x8], rax
    ; cmp     x0, #1
    mov rax, qword [rel arm_x0]
    cmp rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fdepth
    cmp byte [rel arm_z], 0
    jne _saf_fdepth
    ; cmp     x0, #2
    mov rax, qword [rel arm_x0]
    cmp rax, 2
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fdrop
    cmp byte [rel arm_z], 0
    jne _saf_fdrop
    ; cmp     x0, #3
    mov rax, qword [rel arm_x0]
    cmp rax, 3
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fdup
    cmp byte [rel arm_z], 0
    jne _saf_fdup
    ; cmp     x0, #4
    mov rax, qword [rel arm_x0]
    cmp rax, 4
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fswap
    cmp byte [rel arm_z], 0
    jne _saf_fswap
    ; cmp     x0, #5
    mov rax, qword [rel arm_x0]
    cmp rax, 5
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fover
    cmp byte [rel arm_z], 0
    jne _saf_fover
    ; cmp     x0, #6
    mov rax, qword [rel arm_x0]
    cmp rax, 6
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_frot
    cmp byte [rel arm_z], 0
    jne _saf_frot
    ; cmp     x0, #7
    mov rax, qword [rel arm_x0]
    cmp rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fplus
    cmp byte [rel arm_z], 0
    jne _saf_fplus
    ; cmp     x0, #8
    mov rax, qword [rel arm_x0]
    cmp rax, 8
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fminus
    cmp byte [rel arm_z], 0
    jne _saf_fminus
    ; cmp     x0, #9
    mov rax, qword [rel arm_x0]
    cmp rax, 9
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fstar
    cmp byte [rel arm_z], 0
    jne _saf_fstar
    ; cmp     x0, #10
    mov rax, qword [rel arm_x0]
    cmp rax, 0xa
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fslash
    cmp byte [rel arm_z], 0
    jne _saf_fslash
    ; cmp     x0, #11
    mov rax, qword [rel arm_x0]
    cmp rax, 0xb
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fnegate
    cmp byte [rel arm_z], 0
    jne _saf_fnegate
    ; cmp     x0, #12
    mov rax, qword [rel arm_x0]
    cmp rax, 0xc
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fabs
    cmp byte [rel arm_z], 0
    jne _saf_fabs
    ; cmp     x0, #13
    mov rax, qword [rel arm_x0]
    cmp rax, 0xd
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fmax
    cmp byte [rel arm_z], 0
    jne _saf_fmax
    ; cmp     x0, #14
    mov rax, qword [rel arm_x0]
    cmp rax, 0xe
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fmin
    cmp byte [rel arm_z], 0
    jne _saf_fmin
    ; cmp     x0, #15
    mov rax, qword [rel arm_x0]
    cmp rax, 0xf
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_f0eq
    cmp byte [rel arm_z], 0
    jne _saf_f0eq
    ; cmp     x0, #16
    mov rax, qword [rel arm_x0]
    cmp rax, 0x10
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_f0lt
    cmp byte [rel arm_z], 0
    jne _saf_f0lt
    ; cmp     x0, #17
    mov rax, qword [rel arm_x0]
    cmp rax, 0x11
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_flt
    cmp byte [rel arm_z], 0
    jne _saf_flt
    ; cmp     x0, #18
    mov rax, qword [rel arm_x0]
    cmp rax, 0x12
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fgt
    cmp byte [rel arm_z], 0
    jne _saf_fgt
    ; cmp     x0, #19
    mov rax, qword [rel arm_x0]
    cmp rax, 0x13
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_feq
    cmp byte [rel arm_z], 0
    jne _saf_feq
    ; cmp     x0, #20
    mov rax, qword [rel arm_x0]
    cmp rax, 0x14
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fne
    cmp byte [rel arm_z], 0
    jne _saf_fne
    ; cmp     x0, #21
    mov rax, qword [rel arm_x0]
    cmp rax, 0x15
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_ftilde
    cmp byte [rel arm_z], 0
    jne _saf_ftilde
    ; cmp     x0, #22
    mov rax, qword [rel arm_x0]
    cmp rax, 0x16
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fat
    cmp byte [rel arm_z], 0
    jne _saf_fat
    ; cmp     x0, #23
    mov rax, qword [rel arm_x0]
    cmp rax, 0x17
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fstore
    cmp byte [rel arm_z], 0
    jne _saf_fstore
    ; cmp     x0, #24
    mov rax, qword [rel arm_x0]
    cmp rax, 0x18
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_sfat
    cmp byte [rel arm_z], 0
    jne _saf_sfat
    ; cmp     x0, #25
    mov rax, qword [rel arm_x0]
    cmp rax, 0x19
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_sfstore
    cmp byte [rel arm_z], 0
    jne _saf_sfstore
    ; cmp     x0, #26
    mov rax, qword [rel arm_x0]
    cmp rax, 0x1a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fat
    cmp byte [rel arm_z], 0
    jne _saf_fat
    ; cmp     x0, #27
    mov rax, qword [rel arm_x0]
    cmp rax, 0x1b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fstore
    cmp byte [rel arm_z], 0
    jne _saf_fstore
    ; cmp     x0, #28
    mov rax, qword [rel arm_x0]
    cmp rax, 0x1c
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_stf
    cmp byte [rel arm_z], 0
    jne _saf_stf
    ; cmp     x0, #29
    mov rax, qword [rel arm_x0]
    cmp rax, 0x1d
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fts
    cmp byte [rel arm_z], 0
    jne _saf_fts
    ; cmp     x0, #30
    mov rax, qword [rel arm_x0]
    cmp rax, 0x1e
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_dtf
    cmp byte [rel arm_z], 0
    jne _saf_dtf
    ; cmp     x0, #31
    mov rax, qword [rel arm_x0]
    cmp rax, 0x1f
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_ftd
    cmp byte [rel arm_z], 0
    jne _saf_ftd
    ; cmp     x0, #36
    mov rax, qword [rel arm_x0]
    cmp rax, 0x24
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_precision
    cmp byte [rel arm_z], 0
    jne _saf_precision
    ; cmp     x0, #37
    mov rax, qword [rel arm_x0]
    cmp rax, 0x25
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_setprecision
    cmp byte [rel arm_z], 0
    jne _saf_setprecision
    ; cmp     x0, #39
    mov rax, qword [rel arm_x0]
    cmp rax, 0x27
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_floats
    cmp byte [rel arm_z], 0
    jne _saf_floats
    ; cmp     x0, #40
    mov rax, qword [rel arm_x0]
    cmp rax, 0x28
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_floatplus
    cmp byte [rel arm_z], 0
    jne _saf_floatplus
    ; cmp     x0, #41
    mov rax, qword [rel arm_x0]
    cmp rax, 0x29
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_sfloats
    cmp byte [rel arm_z], 0
    jne _saf_sfloats
    ; cmp     x0, #42
    mov rax, qword [rel arm_x0]
    cmp rax, 0x2a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_sfloatplus
    cmp byte [rel arm_z], 0
    jne _saf_sfloatplus
    ; cmp     x0, #43
    mov rax, qword [rel arm_x0]
    cmp rax, 0x2b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_floats
    cmp byte [rel arm_z], 0
    jne _saf_floats
    ; cmp     x0, #44
    mov rax, qword [rel arm_x0]
    cmp rax, 0x2c
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_floatplus
    cmp byte [rel arm_z], 0
    jne _saf_floatplus
    ; cmp     x0, #45
    mov rax, qword [rel arm_x0]
    cmp rax, 0x2d
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fsqrt
    cmp byte [rel arm_z], 0
    jne _saf_fsqrt
    ; cmp     x0, #70
    mov rax, qword [rel arm_x0]
    cmp rax, 0x46
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_falign
    cmp byte [rel arm_z], 0
    jne _saf_falign
    ; cmp     x0, #71
    mov rax, qword [rel arm_x0]
    cmp rax, 0x47
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_sfalign
    cmp byte [rel arm_z], 0
    jne _saf_sfalign
    ; cmp     x0, #72
    mov rax, qword [rel arm_x0]
    cmp rax, 0x48
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_falign
    cmp byte [rel arm_z], 0
    jne _saf_falign
    ; cmp     x0, #73
    mov rax, qword [rel arm_x0]
    cmp rax, 0x49
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_faligned
    cmp byte [rel arm_z], 0
    jne _saf_faligned
    ; cmp     x0, #74
    mov rax, qword [rel arm_x0]
    cmp rax, 0x4a
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_sfaligned
    cmp byte [rel arm_z], 0
    jne _saf_sfaligned
    ; cmp     x0, #75
    mov rax, qword [rel arm_x0]
    cmp rax, 0x4b
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_faligned
    cmp byte [rel arm_z], 0
    jne _saf_faligned
    ; cmp     x0, #101
    mov rax, qword [rel arm_x0]
    cmp rax, 0x65
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fpushbits
    cmp byte [rel arm_z], 0
    jne _saf_fpushbits
    ; cmp     x0, #102
    mov rax, qword [rel arm_x0]
    cmp rax, 0x66
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fpopbits
    cmp byte [rel arm_z], 0
    jne _saf_fpopbits
    ; cmp     x0, #103
    mov rax, qword [rel arm_x0]
    cmp rax, 0x67
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_fdepth
    cmp byte [rel arm_z], 0
    jne _saf_fdepth
    ; mov     x0, #-1
    mov rax, -1
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
_saf_ok:
    ; mov     x0, #0
    mov rax, 0
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
_saf_fdepth:
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_3]
    mov qword [rel arm_x30], rax
    jmp _sa_fdepth_addr
    xret_3:
    ; ldr     x6, [x10]
    mov r10, qword [rel arm_x10]
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fdrop:
    ; bl      _sa_fpop
    lea rax, [rel xret_4]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_4:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fdup:
    ; bl      _sa_fpop
    lea rax, [rel xret_5]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_5:
    ; bl      _sa_fpush
    lea rax, [rel xret_6]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_6:
    ; bl      _sa_fpush
    lea rax, [rel xret_7]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_7:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fswap:
    ; bl      _sa_fpop
    lea rax, [rel xret_8]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_8:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_9]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_9:
    ; fmov    d2, d0
    movsd xmm2, xmm0
    ; fmov    d0, d1
    movsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_10]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_10:
    ; fmov    d0, d2
    movsd xmm0, xmm2
    ; bl      _sa_fpush
    lea rax, [rel xret_11]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_11:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fover:
    ; bl      _sa_fpop
    lea rax, [rel xret_12]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_12:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_13]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_13:
    ; fmov    d2, d0
    movsd xmm2, xmm0
    ; bl      _sa_fpush
    lea rax, [rel xret_14]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_14:
    ; fmov    d0, d1
    movsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_15]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_15:
    ; fmov    d0, d2
    movsd xmm0, xmm2
    ; bl      _sa_fpush
    lea rax, [rel xret_16]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_16:
    ; b       _saf_ok
    jmp _saf_ok
_saf_frot:
    ; bl      _sa_fpop
    lea rax, [rel xret_17]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_17:
    ; fmov    d3, d0
    movsd xmm3, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_18]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_18:
    ; fmov    d2, d0
    movsd xmm2, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_19]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_19:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; fmov    d0, d2
    movsd xmm0, xmm2
    ; bl      _sa_fpush
    lea rax, [rel xret_20]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_20:
    ; fmov    d0, d3
    movsd xmm0, xmm3
    ; bl      _sa_fpush
    lea rax, [rel xret_21]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_21:
    ; fmov    d0, d1
    movsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_22]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_22:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fplus:
    ; bl      _sa_fpop
    lea rax, [rel xret_23]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_23:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_24]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_24:
    ; fadd    d0, d0, d1
    addsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_25]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_25:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fminus:
    ; bl      _sa_fpop
    lea rax, [rel xret_26]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_26:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_27]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_27:
    ; fsub    d0, d0, d1
    subsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_28]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_28:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fstar:
    ; bl      _sa_fpop
    lea rax, [rel xret_29]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_29:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_30]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_30:
    ; fmul    d0, d0, d1
    mulsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_31]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_31:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fslash:
    ; bl      _sa_fpop
    lea rax, [rel xret_32]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_32:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_33]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_33:
    ; fdiv    d0, d0, d1
    divsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_34]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_34:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fnegate:
    ; bl      _sa_fpop
    lea rax, [rel xret_35]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_35:
    ; fneg    d0, d0
    mov rax, 8000000000000000h
    movq xmm15, rax
    xorpd xmm0, xmm15
    ; bl      _sa_fpush
    lea rax, [rel xret_36]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_36:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fabs:
    ; bl      _sa_fpop
    lea rax, [rel xret_37]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_37:
    ; fabs    d0, d0
    mov rax, 7FFFFFFFFFFFFFFFh
    movq xmm15, rax
    andpd xmm0, xmm15
    ; bl      _sa_fpush
    lea rax, [rel xret_38]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_38:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fmax:
    ; bl      _sa_fpop
    lea rax, [rel xret_39]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_39:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_40]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_40:
    ; fmax    d0, d0, d1
    maxsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_41]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_41:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fmin:
    ; bl      _sa_fpop
    lea rax, [rel xret_42]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_42:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_43]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_43:
    ; fmin    d0, d0, d1
    minsd xmm0, xmm1
    ; bl      _sa_fpush
    lea rax, [rel xret_44]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_44:
    ; b       _saf_ok
    jmp _saf_ok
_saf_f0eq:
    ; bl      _sa_fpop
    lea rax, [rel xret_45]
    mov qword [rel arm_x30], rax
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
    mov byte [rel arm_n], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_z], r11b
    mov byte [rel arm_v], cl
    mov r11b, byte [rel arm_n]
    xor r11b, 1
    mov byte [rel arm_c], r11b
    ; csetm   x6, eq
    xor eax, eax
    cmp byte [rel arm_z], 0
    je xsk_46
    mov rax, -1
    xsk_46:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_f0lt:
    ; bl      _sa_fpop
    lea rax, [rel xret_47]
    mov qword [rel arm_x30], rax
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
    mov byte [rel arm_n], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_z], r11b
    mov byte [rel arm_v], cl
    mov r11b, byte [rel arm_n]
    xor r11b, 1
    mov byte [rel arm_c], r11b
    ; csetm   x6, mi
    xor eax, eax
    cmp byte [rel arm_n], 0
    je xsk_48
    mov rax, -1
    xsk_48:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_flt:
    ; bl      _sa_fpop
    lea rax, [rel xret_49]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_49:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_50]
    mov qword [rel arm_x30], rax
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
    mov byte [rel arm_n], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_z], r11b
    mov byte [rel arm_v], cl
    mov r11b, byte [rel arm_n]
    xor r11b, 1
    mov byte [rel arm_c], r11b
    ; csetm   x6, mi
    xor eax, eax
    cmp byte [rel arm_n], 0
    je xsk_51
    mov rax, -1
    xsk_51:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fgt:
    ; bl      _sa_fpop
    lea rax, [rel xret_52]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_52:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_53]
    mov qword [rel arm_x30], rax
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
    mov byte [rel arm_n], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_z], r11b
    mov byte [rel arm_v], cl
    mov r11b, byte [rel arm_n]
    xor r11b, 1
    mov byte [rel arm_c], r11b
    ; csetm   x6, gt
    xor eax, eax
    cmp byte [rel arm_z], 0
    jne xsk_54
    mov r11b, byte [rel arm_n]
    cmp r11b, byte [rel arm_v]
    jne xsk_54
    mov rax, -1
    xsk_54:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_feq:
    ; bl      _sa_fpop
    lea rax, [rel xret_55]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_55:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_56]
    mov qword [rel arm_x30], rax
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
    mov byte [rel arm_n], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_z], r11b
    mov byte [rel arm_v], cl
    mov r11b, byte [rel arm_n]
    xor r11b, 1
    mov byte [rel arm_c], r11b
    ; csetm   x6, eq
    xor eax, eax
    cmp byte [rel arm_z], 0
    je xsk_57
    mov rax, -1
    xsk_57:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fne:
    ; bl      _sa_fpop
    lea rax, [rel xret_58]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_58:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_59]
    mov qword [rel arm_x30], rax
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
    mov byte [rel arm_n], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_z], r11b
    mov byte [rel arm_v], cl
    mov r11b, byte [rel arm_n]
    xor r11b, 1
    mov byte [rel arm_c], r11b
    ; csetm   x6, ne
    xor eax, eax
    cmp byte [rel arm_z], 0
    jne xsk_60
    mov rax, -1
    xsk_60:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_ftilde:
    ; bl      _sa_fpop
    lea rax, [rel xret_61]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_61:
    ; fabs    d2, d0
    movsd xmm2, xmm0
    mov rax, 7FFFFFFFFFFFFFFFh
    movq xmm15, rax
    andpd xmm2, xmm15
    ; bl      _sa_fpop
    lea rax, [rel xret_62]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_62:
    ; fmov    d1, d0
    movsd xmm1, xmm0
    ; bl      _sa_fpop
    lea rax, [rel xret_63]
    mov qword [rel arm_x30], rax
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
    mov byte [rel arm_n], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_z], r11b
    mov byte [rel arm_v], cl
    mov r11b, byte [rel arm_n]
    xor r11b, 1
    mov byte [rel arm_c], r11b
    ; csetm   x6, mi
    xor eax, eax
    cmp byte [rel arm_n], 0
    je xsk_64
    mov rax, -1
    xsk_64:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fat:
    ; cbz     x1, _saf_ok
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _saf_ok
    ; ldr     d0, [x1]
    mov r10, qword [rel arm_x1]
    movsd xmm0, qword [r10]
    ; bl      _sa_fpush
    lea rax, [rel xret_65]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_65:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fstore:
    ; bl      _sa_fpop
    lea rax, [rel xret_66]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_66:
    ; cbz     x1, _saf_ok
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _saf_ok
    ; str     d0, [x1]
    mov r10, qword [rel arm_x1]
    movsd qword [r10], xmm0
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfat:
    ; cbz     x1, _saf_ok
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _saf_ok
    ; ldr     s0, [x1]
    mov r10, qword [rel arm_x1]
    movss xmm0, dword [r10]
    ; fcvt    d0, s0
    cvtss2sd xmm0, xmm0
    ; bl      _sa_fpush
    lea rax, [rel xret_67]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_67:
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfstore:
    ; bl      _sa_fpop
    lea rax, [rel xret_68]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_68:
    ; cbz     x1, _saf_ok
    mov rax, qword [rel arm_x1]
    cmp rax, 0
    je _saf_ok
    ; fcvt    s0, d0
    cvtsd2ss xmm0, xmm0
    ; str     s0, [x1]
    mov r10, qword [rel arm_x1]
    movss dword [r10], xmm0
    ; b       _saf_ok
    jmp _saf_ok
_saf_stf:
    ; scvtf   d0, x1
    mov rax, qword [rel arm_x1]
    cvtsi2sd xmm0, rax
    ; bl      _sa_fpush
    lea rax, [rel xret_69]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_69:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fts:
    ; bl      _sa_fpop
    lea rax, [rel xret_70]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_70:
    ; fcvtzs  x6, d0
    cvttsd2si rax, xmm0
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_dtf:
    ; cmp     x2, #0
    mov rax, qword [rel arm_x2]
    cmp rax, 0
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setnc byte [rel arm_c]
    ; b.eq    _saf_dtf_lo
    cmp byte [rel arm_z], 0
    jne _saf_dtf_lo
    ; cmn     x2, #1
    mov rax, qword [rel arm_x2]
    add rax, 1
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; b.eq    _saf_dtf_lo
    cmp byte [rel arm_z], 0
    jne _saf_dtf_lo
    ; scvtf   d0, x2
    mov rax, qword [rel arm_x2]
    cvtsi2sd xmm0, rax
    ; movz    x10, #0
    mov rax, 0
    mov qword [rel arm_x10], rax
    ; movk    x10, #0x43F0, lsl #48
    mov rax, qword [rel arm_x10]
    mov rcx, 0xffffffffffff
    and rax, rcx
    mov rcx, 0x43f0000000000000
    or rax, rcx
    mov qword [rel arm_x10], rax
    ; fmov    d1, x10
    mov rax, qword [rel arm_x10]
    movq xmm1, rax
    ; fmul    d0, d0, d1
    mulsd xmm0, xmm1
    ; mov     x11, x1
    mov rax, qword [rel arm_x1]
    mov qword [rel arm_x11], rax
    ; ucvtf   d1, x11
    mov rax, qword [rel arm_x11]
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
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_72:
    ; b       _saf_ok
    jmp _saf_ok
_saf_dtf_lo:
    ; scvtf   d0, x1
    mov rax, qword [rel arm_x1]
    cvtsi2sd xmm0, rax
    ; bl      _sa_fpush
    lea rax, [rel xret_73]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_73:
    ; b       _saf_ok
    jmp _saf_ok
_saf_ftd:
    ; bl      _sa_fpop
    lea rax, [rel xret_74]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_74:
    ; fcvtzs  x6, d0
    cvttsd2si rax, xmm0
    mov qword [rel arm_x6], rax
    ; fcmp    d0, #0.0
    xorpd xmm15, xmm15
    ucomisd xmm0, xmm15
    setb al
    setp cl
    setz dl
    mov r11b, al
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_n], r11b
    mov r11b, dl
    or r11b, cl
    xor r11b, cl
    mov byte [rel arm_z], r11b
    mov byte [rel arm_v], cl
    mov r11b, byte [rel arm_n]
    xor r11b, 1
    mov byte [rel arm_c], r11b
    ; csetm   x7, mi
    xor eax, eax
    cmp byte [rel arm_n], 0
    je xsk_75
    mov rax, -1
    xsk_75:
    mov qword [rel arm_x7], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_precision:
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_76]
    mov qword [rel arm_x30], rax
    jmp _sa_fdepth_addr
    xret_76:
    ; ldr     x6, [x10, #8]
    mov r10, qword [rel arm_x10]
    add r10, 8
    mov rax, qword [r10]
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_setprecision:
    ; bl      _sa_fdepth_addr
    lea rax, [rel xret_77]
    mov qword [rel arm_x30], rax
    jmp _sa_fdepth_addr
    xret_77:
    ; str     x1, [x10, #8]
    mov r10, qword [rel arm_x10]
    add r10, 8
    mov rax, qword [rel arm_x1]
    mov qword [r10], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_floats:
    ; lsl     x6, x1, #3
    mov rax, qword [rel arm_x1]
    shl rax, 3
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_floatplus:
    ; add     x6, x1, #8
    mov rax, qword [rel arm_x1]
    add rax, 8
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfloats:
    ; lsl     x6, x1, #2
    mov rax, qword [rel arm_x1]
    shl rax, 2
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfloatplus:
    ; add     x6, x1, #4
    mov rax, qword [rel arm_x1]
    add rax, 4
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fsqrt:
    ; bl      _sa_fpop
    lea rax, [rel xret_78]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_78:
    ; fsqrt   d0, d0
    sqrtsd xmm0, xmm0
    ; bl      _sa_fpush
    lea rax, [rel xret_79]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_79:
    ; b       _saf_ok
    jmp _saf_ok
_saf_falign:
    ; add     x6, x1, #7
    mov rax, qword [rel arm_x1]
    add rax, 7
    mov qword [rel arm_x6], rax
    ; bic     x6, x6, #7
    mov rax, qword [rel arm_x6]
    mov rcx, 7
    not rcx
    and rax, rcx
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfalign:
    ; add     x6, x1, #3
    mov rax, qword [rel arm_x1]
    add rax, 3
    mov qword [rel arm_x6], rax
    ; bic     x6, x6, #3
    mov rax, qword [rel arm_x6]
    mov rcx, 3
    not rcx
    and rax, rcx
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_faligned:
    ; tst     x1, #7
    mov rax, qword [rel arm_x1]
    test rax, 7
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; csetm   x6, eq
    xor eax, eax
    cmp byte [rel arm_z], 0
    je xsk_80
    mov rax, -1
    xsk_80:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_sfaligned:
    ; tst     x1, #3
    mov rax, qword [rel arm_x1]
    test rax, 3
    seto byte [rel arm_v]
    sets byte [rel arm_n]
    setz byte [rel arm_z]
    setc byte [rel arm_c]
    ; csetm   x6, eq
    xor eax, eax
    cmp byte [rel arm_z], 0
    je xsk_81
    mov rax, -1
    xsk_81:
    mov qword [rel arm_x6], rax
    ; b       _saf_ok
    jmp _saf_ok
_saf_fpushbits:
    ; fmov    d0, x1
    mov rax, qword [rel arm_x1]
    movq xmm0, rax
    ; bl      _sa_fpush
    lea rax, [rel xret_82]
    mov qword [rel arm_x30], rax
    jmp _sa_fpush
    xret_82:
    ; b       _saf_ok
    jmp _saf_ok
_saf_fpopbits:
    ; bl      _sa_fpop
    lea rax, [rel xret_83]
    mov qword [rel arm_x30], rax
    jmp _sa_fpop
    xret_83:
    ; fmov    x6, d0
    movq rax, xmm0
    mov qword [rel arm_x6], rax
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
