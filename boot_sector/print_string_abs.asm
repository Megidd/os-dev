print_string_abs:
	pusha	;push all registers to be polite
	
	mov ah, 0x0e	;BIOS tele - type output

	;add bx,0x7c00	;boot sector is loaded at 0x7c00 address
			;therefore 0x7c00 needs to be added to the data address
			;to get the correct absolute data address
	
print_next_byte_abs:
	mov al,[es:bx]	;bx is used as function parameter
	cmp al,0x00
	je null_terminated_abs
	int 0x10
	inc bx
	jmp print_next_byte_abs
	
null_terminated_abs:
	mov al,0x0a	;new line character
	int 0x10	;print a new line
	popa	;pop all registers to be polite
	ret	;pop return address and jump to it
