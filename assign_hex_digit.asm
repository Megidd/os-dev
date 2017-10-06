assign_hex_digit:
	pusha	;push all registers to be polite
	
	;cl is a parameter to print_hex_digit
	;ch is a parameter to print_hex_digit
	
	and cl,0x0f	;cl contains the hex digit (half-byte) to be printed
			;bit-wise and operation, note that 0x0f is 0b0000_1111
			;to make sure cl contains only a half-byte

	mov [LOCATION], word 0x0000
	add [LOCATION], word 0x7c00	;address at which boot sector is loaded
	add [LOCATION], word HEX_OUT
	add [LOCATION], ch		;ch contains the hex digit location at HEX_OUT
	mov di,[LOCATION]

cont_0:
	cmp cl,0x00
	je byte_0
cont_1:
	cmp cl,0x01
	je byte_1
cont_2:
	cmp cl,0x02
	je byte_2
cont_3:
	cmp cl,0x03
	je byte_3
cont_4:
	cmp cl,0x04
	je byte_4
cont_5:
	cmp cl,0x05
	je byte_5
cont_6:
	cmp cl,0x06
	je byte_6
cont_7:
	cmp cl,0x07
	je byte_7
cont_8:
	cmp cl,0x08
	je byte_8
cont_9:
	cmp cl,0x09
	je byte_9
cont_a:
	cmp cl,0x0a
	je byte_a
cont_b:
	cmp cl,0x0b
	je byte_b
cont_c:
	cmp cl,0x0c
	je byte_c
cont_d:
	cmp cl,0x0d
	je byte_d
cont_e:
	cmp cl,0x0e
	je byte_e
cont_f:
	cmp cl,0x0f
	je byte_f
cont_end:
	popa	;pop all registers to be polite
	ret

LOCATION:
	dw 0x0000

byte_0:
	mov [di], byte '0'
	jmp cont_1
byte_1:
	mov [di], byte '1'
	jmp cont_2
byte_2:
	mov [di], byte '2'
	jmp cont_3
byte_3:
	mov [di], byte '3'
	jmp cont_4
byte_4:
	mov [di], byte '4'
	jmp cont_5
byte_5:
	mov [di], byte '5'
	jmp cont_6
byte_6:
	mov [di], byte '6'
	jmp cont_7
byte_7:
	mov [di], byte '7'
	jmp cont_8
byte_8:
	mov [di], byte '8'
	jmp cont_9
byte_9:
	mov [di], byte '9'
	jmp cont_a
byte_a:
	mov [di], byte 'a'
	jmp cont_b
byte_b:
	mov [di], byte 'b'
	jmp cont_c
byte_c:
	mov [di], byte 'c'
	jmp cont_d
byte_d:
	mov [di], byte 'd'
	jmp cont_e
byte_e:
	mov [di], byte 'e'
	jmp cont_f
byte_f:
	mov [di], byte 'f'
	jmp cont_end
