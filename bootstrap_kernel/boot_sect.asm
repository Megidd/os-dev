; A boot sector that boots a C kernel in 32 - bit protected mode
[org 0x7c00]
KERNEL_OFFSET equ 0x1000
mov [BOOT_DRIVE], dl	; BIOS stores our boot drive in DL , so it 's
			; best to remember this for later

mov bp, 0x9000		; Set -up the stack.
mov sp, bp

mov bx, MSG_REAL_MODE
call print_string_abs

jmp $

; Include our useful , hard - earned routines
%include "routines/print_string_abs.asm"

; Global variables
BOOT_DRIVE: db 0x00
MSG_REAL_MODE: db "Starting in 16-bit real mode ...",0x00

; Bootsector padding
times 510-($-$$) db 0x00
dw 0xaa55
