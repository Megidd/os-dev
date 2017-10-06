mov ah,0x0e

mov al,[the_secret]
int 0x10		;Does this print an X?
			;No

mov bx, 0x07c0	;Can NOT set ds directly
mov ds, bx
mov al,[the_secret]
int 0x10		;Does this print an X?
			;Yes

mov al,[es:the_secret]		;Tell the CPU to use the es (not ds) segment
int 0x10		;Does this print an X?
			;No

mov bx, 0x07c0
mov es, bx
mov al,[es:the_secret]		;Tell the CPU to use the es (not ds) segment
int 0x10		;Does this print an X?
			;Yes

jmp $

the_secret:
	db 'X'

times 510-($-$$) db 0x00

;dw 0xaa55
db 0x55		;Test signature
db 0xaa		;It behaves the same as "dw 0xaa55"
