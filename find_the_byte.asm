
;[org 0x7c00]

mov ah, 0x0e

;1st attempt
mov al, the_secret
int 0x10

;2nd attempt
mov al, [the_secret]
int 0x10

;3rd attempt
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

;4th attempt
mov al, [0x0200]
int 0x10

;5th attempt: 0x7e00 = 0x7c00 + 0x0200
mov al, [0x7e00]
int 0x10

jmp $

times 510-($-$$) db 0x00

dw 0xaa55

the_secret:
	db 0x58


