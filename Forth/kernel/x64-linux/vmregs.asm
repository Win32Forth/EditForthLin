; Virtual ARM64 register file for the translated linux-x64 kernel.
; SP is the real RSP. Generated code keeps x0-x30 here.
; NASM / System V. Hand-written (not produced by arm64_to_nasm_sysv.py).

bits 64
default rel

section .data

global arm_x0, arm_x1, arm_x2, arm_x3, arm_x4, arm_x5, arm_x6, arm_x7
global arm_x8, arm_x9, arm_x10, arm_x11, arm_x12, arm_x13, arm_x14, arm_x15
global arm_x16, arm_x17, arm_x18, arm_x19, arm_x20, arm_x21, arm_x22, arm_x23
global arm_x24, arm_x25, arm_x26, arm_x27, arm_x28, arm_x29, arm_x30
global arm_n, arm_z, arm_c, arm_v

arm_x0:  dq 0
arm_x1:  dq 0
arm_x2:  dq 0
arm_x3:  dq 0
arm_x4:  dq 0
arm_x5:  dq 0
arm_x6:  dq 0
arm_x7:  dq 0
arm_x8:  dq 0
arm_x9:  dq 0
arm_x10: dq 0
arm_x11: dq 0
arm_x12: dq 0
arm_x13: dq 0
arm_x14: dq 0
arm_x15: dq 0
arm_x16: dq 0
arm_x17: dq 0
arm_x18: dq 0
arm_x19: dq 0
arm_x20: dq 0
arm_x21: dq 0
arm_x22: dq 0
arm_x23: dq 0
arm_x24: dq 0
arm_x25: dq 0
arm_x26: dq 0
arm_x27: dq 0
arm_x28: dq 0
arm_x29: dq 0
arm_x30: dq 0
arm_n:   db 0
arm_z:   db 0
arm_c:   db 0
arm_v:   db 0
