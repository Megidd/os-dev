mov bx, MSG			;bx stores print_string input
call print_string

call disk_load
jc disk_error

mov dx, 0x1ffe			;dx stores print_hex input
call print_hex			;print_hex modifies HEX_OUT content according to dx
mov bx,HEX_OUT
call print_string

disk_error:
 mov bx, DISK_ERROR_MSG
 call print_string

jmp $

DISK_ERROR_MSG:
 db 'Disk read error',0x00

%include "disk_load_callee.asm"

%include "print_hex_callee.asm"
%include "assign_hex_digit.asm"

HEX_OUT:			;HEX_OUT stores print_hex output
 db '0x0000',0x00

%include "print_string_callee.asm"

MSG:
 db 'Reading the first n sectors following the boot sector ...',0x00

times 510-($-$$) db 0x00	;padding

dw 0xaa55			;Boot sector signature
