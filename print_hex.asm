mov dx,0x1fb6
call print_hex

jmp $	;jump forever

print_hex:
	mov bx, HEX_OUT
	call print_string
	ret

HEX_OUT:
	db '0x1fb6',0x00

%include 'print_string_callee.asm'

times 510-($-$$) db 0x00	;padding to fill the rest of 512-byte boot sector

dw 0xaa55	;magic number
