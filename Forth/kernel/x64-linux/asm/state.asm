; Generated from Forth/kernel/arm64/state.asm. Do not edit.
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
extern XCATCH_OK
extern XRESTART
extern XTW_CONTINUE
extern host_float_op
section .data
global latest_var
global last_cfa
global noname_xt
global here_ptr
global state_var
global bye_flag
global inited
global emit_fn
global file_op_hook
global float_op_hook
global key_fn
global facility_op_hook
global vm_tos
global vm_dsp
global vm_rsp
global source_cur
global source_end
global source_base
global to_in
global throw_handler
global pad_buffer
global redef_warn
global block_file
global block_upd
global block_nr
global block_buf
global scr_var
global blk_var
global blk_stack
global forget_cut
global native_dsp_end
global jit_exec_mode
global cfa_flit
global cfa_local_init
global cfa_local_at
global cfa_local_store
global cfa_loop
global cfa_plusloop
global local_name_count
global local_init_count
global local_init_reverse
global local_declaring
global local_brace_phase
global local_names
global local_frame_depth
global local_frames
global local_frame_rsp
global local_frame_n
global slit_esc_buf
global slit_esc_buf2
global slit_esc_which
global line_mode
global line_origin
global line_limit
global line_next
global source_id
global file_echo
global file_echo_pos
global file_echo_stack
global source_sp
global source_stack
global eval_resume_sp
global eval_resume_stack
global resolve_buf
global catch_ok_cell
global tw_continue_cell
global dict_end
global base_var
global current_var
global search_order
global search_order_n
global pending_help_addr
global pending_help_len
global word_scratch
global wordlist_reg
global wordlist_reg_n
global words_user_base
global words_filter
global words_filter_len
global words_nk_tmp
global words_cfa
global cfa_branch
global cfa_0branch
global cfa_does
global cfa_slit
global cfa_cstr
global cfa_execute
global cfa_comma
global library_path_buf
global exit_cfa
global cfa_exit
global lit_cfa
global cfa_lit
global restart_cell
global restart_cfa
global kernel_inited
global emit_hook
global key_hook
global data_stack
global return_stack
global user_dict_area
global user_dict_size_cell
global grow_memory_used
global xchar_emit_buf
global numbuf
global dstack
global rstack
global dictmem
latest_var:
    ; SPACE   128
    times 128 db 0
last_cfa:
    ; DCQ     0
    dq 0
noname_xt:
    ; DCQ     0
    dq 0
here_ptr:
    ; DCQ     0
    dq 0
state_var:
    ; DCQ     0
    dq 0
base_var:
    ; DCQ     10
    dq 0xa
current_var:
    ; DCQ     latest_var
    dq latest_var
search_order:
    ; DCQ    latest_var
    dq latest_var
    ; DCQ     0, 0, 0, 0, 0, 0, 0
    dq 0, 0, 0, 0, 0, 0, 0
search_order_n:
    ; DCQ  1
    dq 1
pending_help_addr:
    ; DCQ 0
    dq 0
pending_help_len:
    ; DCQ 0
    dq 0
wordlist_reg_n:
    ; DCQ  0
    dq 0
bye_flag:
    ; DCQ     0
    dq 0
kernel_inited:
inited:
    ; DCQ     0
    dq 0
emit_hook:
emit_fn:
    ; DCQ     0
    dq 0
file_op_hook:
    ; DCQ    0
    dq 0
float_op_hook:
    ; DCQ   host_float_op
    dq host_float_op
key_hook:
key_fn:
    ; DCQ     0
    dq 0
facility_op_hook:
    ; DCQ 0
    dq 0
vm_tos:
    ; DCQ     0
    dq 0
vm_dsp:
    ; DCQ     0
    dq 0
vm_rsp:
    ; DCQ     0
    dq 0
source_base:
    ; DCQ     0
    dq 0
source_cur:
    ; DCQ     0
    dq 0
source_end:
    ; DCQ     0
    dq 0
to_in:
    ; DCQ     0
    dq 0
throw_handler:
    ; DCQ   0
    dq 0
cfa_flit:
    ; DCQ     0
    dq 0
cfa_local_init:
    ; DCQ  0
    dq 0
cfa_local_at:
    ; DCQ    0
    dq 0
cfa_local_store:
    ; DCQ 0
    dq 0
cfa_loop:
    ; DCQ     0
    dq 0
cfa_plusloop:
    ; DCQ    0
    dq 0
local_name_count:
    ; DCQ 0
    dq 0
local_init_count:
    ; DCQ 0
    dq 0
local_init_reverse:
    ; DCQ 0
    dq 0
local_declaring:
    ; DCQ 0
    dq 0
local_brace_phase:
    ; DCQ 0
    dq 0
local_frame_depth:
    ; DCQ 0
    dq 0
local_names:
    ; SPACE   1024
    times 1024 db 0
local_frames:
    ; SPACE  4096
    times 4096 db 0
local_frame_rsp:
    ; SPACE 128
    times 128 db 0
local_frame_n:
    ; SPACE 128
    times 128 db 0
slit_esc_buf:
    ; SPACE  256
    times 256 db 0
slit_esc_buf2:
    ; SPACE 256
    times 256 db 0
slit_esc_which:
    ; DCQ  0
    dq 0
line_mode:
    ; DCQ     0
    dq 0
line_origin:
    ; DCQ     0
    dq 0
line_limit:
    ; DCQ     0
    dq 0
line_next:
    ; DCQ     0
    dq 0
source_id:
    ; DCQ     0
    dq 0
file_echo:
    ; DCQ     0
    dq 0
file_echo_pos:
    ; DCQ   0
    dq 0
file_echo_stack:
    ; SPACE 64
    times 64 db 0
source_sp:
    ; DCQ     0
    dq 0
eval_resume_sp:
    ; DCQ  0
    dq 0
source_stack:
    ; SPACE  512
    times 512 db 0
eval_resume_stack:
    ; SPACE 64
    times 64 db 0
resolve_buf:
    ; SPACE   256
    times 256 db 0
pad_buffer:
    ; SPACE   1024
    times 1024 db 0
library_path_buf:
    ; SPACE 1024
    times 1024 db 0
redef_warn:
    ; DCQ     0
    dq 0
block_file:
    ; DCQ     0
    dq 0
block_upd:
    ; DCQ     0
    dq 0
block_nr:
    ; DCQ     -1
    dq -1
scr_var:
    ; DCQ     0
    dq 0
blk_var:
    ; DCQ     0
    dq 0
blk_stack:
    ; SPACE   64
    times 64 db 0
forget_cut:
    ; DCQ     0
    dq 0
jit_exec_mode:
    ; DCQ   0
    dq 0
native_dsp_mem:
    ; SPACE 8192
    times 8192 db 0
native_dsp_end:
block_buf:
    ; SPACE   1024
    times 1024 db 0
catch_ok_cell:
    ; DCQ   catch_ok_cfa
    dq catch_ok_cfa
tw_continue_cell:
    ; DCQ tw_continue_cfa
    dq tw_continue_cfa
cfa_exit:
exit_cfa:
    ; DCQ     0
    dq 0
cfa_lit:
lit_cfa:
    ; DCQ     0
    dq 0
cfa_branch:
    ; DCQ     0
    dq 0
cfa_0branch:
    ; DCQ     0
    dq 0
cfa_does:
    ; DCQ     0
    dq 0
cfa_slit:
    ; DCQ     0
    dq 0
cfa_cstr:
    ; DCQ     0
    dq 0
cfa_execute:
    ; DCQ     0
    dq 0
cfa_comma:
    ; DCQ     0
    dq 0
restart_cell:
    ; DCQ    restart_cfa
    dq restart_cfa
numbuf:
    ; SPACE   32
    times 32 db 0
word_scratch:
    ; SPACE  80
    times 80 db 0
wordlist_reg:
    ; SPACE  256
    times 256 db 0
words_user_base:
    ; DCQ 0
    dq 0
words_filter_len:
    ; DCQ 0
    dq 0
words_nk_tmp:
    ; DCQ    0
    dq 0
words_filter:
    ; SPACE  64
    times 64 db 0
words_cfa:
    ; SPACE   8192
    times 8192 db 0
data_stack:
dstack:
    ; SPACE   4096
    times 4096 db 0
return_stack:
rstack:
    ; SPACE   4096
    times 4096 db 0
user_dict_size_cell:
    ; DCQ 8388608
    dq 0x800000
grow_memory_used:
    ; DCQ 0
    dq 0
xchar_emit_buf:
    ; SPACE 8
    times 8 db 0
section .bss
user_dict_area:
dictmem:
    ; SPACE   268435456
    resb 268435456
dict_end:
section .data
restart_cfa:
    ; DCQ     XRESTART
    dq XRESTART
catch_ok_cfa:
    ; DCQ    XCATCH_OK
    dq XCATCH_OK
global tw_continue_cfa
tw_continue_cfa:
    ; DCQ XTW_CONTINUE
    dq XTW_CONTINUE
