print_string:
	pusha	;push all registers to be polite
	
	mov ah, 0x0e	;BIOS tele - type output

	add bx,0x7c00	;boot sector is loaded at 0x7c00 address
			;therefore 0x7c00 needs to be added to the data address
			;to get the correct absolute data address
	
	mov al,[bx]	;bx is used as function parameter
	int 0x10
	
	popa	;pop all registers to be polite
	ret	;pop return address and jump to it
