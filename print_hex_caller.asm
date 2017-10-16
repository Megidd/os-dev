mov dx,0x1fb6
call print_hex		;print_hex modifies HEX_OUT content according to dx
mov bx, HEX_OUT		;bx is parameter to print_string
call print_string

jmp $	;jump forever

HEX_OUT:
	db '0x0000',0x00
	;   ||||||  |
	;   012345  6	-> location of bytes at HEX_OUT

%include 'print_hex_callee.asm'
%include 'print_string_callee.asm'

times 510-($-$$) db 0x00	;padding to fill the rest of 512-byte boot sector

dw 0xaa55	;magic number
