; A boot sector that boots a C kernel in 32 - bit protected mode
[org 0x7c00]
KERNEL_OFFSET equ 0x1000
mov [BOOT_DRIVE], dl	; BIOS stores our boot drive in DL , so it 's
			; best to remember this for later

xor ax, ax
mov ds, ax		;zero-out DS
mov es, ax		;zero-out ES

mov bp, 0x9000		; Set-up the stack.
mov sp, bp

mov bx, MSG_REAL_MODE
call print_string_abs

call load_kernel
call switch_to_pm

jmp $			; Hang

; Include our useful , hard - earned routines
%include "routines/print_string_abs.asm"
%include "routines/disk_load_callee.asm"
%include "routines/switch_to_pm.asm"
%include "routines/gdt.asm"
%include "routines/print_string_pm.asm"

[bits 16]

load_kernel:
 mov bx, MSG_LOAD_KERNEL
 call print_string_abs

 mov bx, KERNEL_OFFSET	; Set-up parameters for our disk_load routine
 mov dh, 15		; we load the first 15 sectors ( excluding the boot sector ) from the boot disk ( i.e. our kernel code ) to address KERNEL_OFFSET in memory
 mov dl, [BOOT_DRIVE]
 call disk_load

 ret

[bits 32]
; This is where we arrive after switching to and initialising protected mode.
BEGIN_PM:
 mov ebx, MSG_PROT_MODE
 call print_string_pm

 call KERNEL_OFFSET

 jmp $			; Hang

; Global variables
BOOT_DRIVE: db 0x00
MSG_REAL_MODE: db "Starting in 16-bit real mode ...",0x00
MSG_LOAD_KERNEL: db "Loading kernel into memory ...",0x00
MSG_PROT_MODE: db "Landed on 32-bit protected mode without any error!",0x00

; Bootsector padding
times 510-($-$$) db 0x00
dw 0xaa55
