
;[org 0x7c00]

mov ah, 0x0e

mov al, '-'
int 0x10

;1st attempt
mov al, the_secret
int 0x10

mov al, '-'
int 0x10

;2nd attempt
mov al, [the_secret]
int 0x10

mov al, '-'
int 0x10

;3rd attempt
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

mov al, '-'
int 0x10

;4th attempt
mov al, [0x3a]
int 0x10

mov al, '-'
int 0x10

;5th attempt:  = 0x7c00 + offset
mov al, [0x7c3a]
int 0x10

mov al, '-'
int 0x10

jmp $

the_secret:
	db 0x58	;Hex ASCII code for "X"

times 510-($-$$) db 0x00

dw 0xaa55
