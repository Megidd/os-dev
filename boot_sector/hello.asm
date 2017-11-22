mov ah, 0x0e
mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10
mov al, '!'
int 0x10

jmp $	;jump to the same address: loops forever

times 510-($-$$) db 0x00

dw 0xaa55
