print_hex:
	pusha

	; 5th digit
	mov cl,dl	;The least significant byte
	and cl,0x0f	;cl contains only a half-byte
	mov ch,0x05	;ch contains location of half-byte at HEX_OUT
	call assign_hex_digit	;cl and ch are parameters to assign_hex_digit

	; 4th digit
	mov cl,dl
	and cl,0xf0
	shr cl,0x04	;shift cl to right, 4 times
	and cl,0x0f
	mov ch,0x04
	call assign_hex_digit

	; 3rd digit
	mov cl,dh
	and cl,0x0f
	mov ch,0x03
	call assign_hex_digit

	; 2nd digit
	mov cl,dh
	and cl,0xf0
	shr cl,0x04	;shitf cl to right, 4 times
	and cl,0x0f
	mov ch,0x02
	call assign_hex_digit

	; 1st digit is already correct: 'x'
	; zero digit is already correct: '0'

	popa
	ret
