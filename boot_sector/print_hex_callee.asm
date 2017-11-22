print_hex:
	pusha

	; 5th digit
	mov cl,dl	;The least significant byte
	and cl,0x0f	;cl contains only a half-byte
	mov ch, 0x00
	xor si, si	;empty si
	mov si, cx
	add si, 0x7c00
	add si, HEX_MAP
	mov cl, [si]
	mov [0x7c00+HEX_OUT+5], cl

	; 4th digit
	mov cl,dl
	and cl,0xf0
	shr cl,0x04	;shift cl to right, 4 times
	and cl,0x0f
	mov ch, 0x00
	xor si, si	;empty si
	mov si, cx
	add si, 0x7c00
	add si, HEX_MAP
	mov cl, [si]
	mov [HEX_OUT+0x7c00+4], cl

	; 3rd digit
	mov cl,dh
	and cl,0x0f
	mov ch, 0x00
	xor si, si	;empty si
	mov si, cx
	add si, 0x7c00
	add si, HEX_MAP
	mov cl, [si]
	mov [HEX_OUT+0x7c00+3], cl

	; 2nd digit
	mov cl,dh
	and cl,0xf0
	shr cl,0x04	;shitf cl to right, 4 times
	and cl,0x0f
	mov ch, 0x00
	xor si, si	;empty si
	mov si, cx
	add si, 0x7c00
	add si, HEX_MAP
	mov cl, [si]
	mov [HEX_OUT+0x7c00+2], cl

	; 1st digit is already correct: 'x'
	; zero digit is already correct: '0'

	popa
	ret

HEX_MAP:
 db '0123456789abcdef',0x00
