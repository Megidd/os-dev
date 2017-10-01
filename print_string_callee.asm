print_string:
	pusha	;push all registers to be polite
	
	mov ah, 0x0e	;BIOS tele - type output

	add bx,0x7c00	;boot sector is loaded at 0x7c00 address
			;therefore 0x7c00 needs to be added to the data address
			;to get the correct absolute data address
	
print_next_byte:
	mov al,[bx]	;bx is used as function parameter
	cmp al,0x00
	je null_terminated
	int 0x10
	inc bx
	jmp print_next_byte
	
null_terminated:
	popa	;pop all registers to be polite
	ret	;pop return address and jump to it
