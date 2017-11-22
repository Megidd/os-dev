mov bx,HELLO_MSG	;bx is used as function parameter
call print_string	;push return address and jump to function address

mov bx,GOODBYE_MSG	;bx is used as function parameter
call print_string	;push return address and jump to function address

jmp $	;jump forever

HELLO_MSG:
	db 'Hello, world',0x00
GOODBYE_MSG:
	db 'Goodbye',0x00

%include "print_string_callee.asm"

times 510-($-$$) db 0x00	;padding to fill 512-byte boot sector

dw 0xaa55	;magic number
