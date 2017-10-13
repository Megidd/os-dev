mov bx, MSG
call print_string

jmp $

%include "print_string_callee.asm"

MSG:
 db 'Reading the first n sectors following the boot sector ...',0x00

times 510-($-$$) db 0x00	;padding

dw 0xaa55			;Boot sector signature
