mov bx,30

cmp	bx,4
jle	less_equal_4
cmp 	bx,40
jl	less_40
jmp	other

less_equal_4:
	mov al,'A'
	jmp end
less_40:
	mov al,'B'
	jmp end
other:
	mov al,'C'
	jmp end

end:
	mov ah,0x0e
	int 0x10

	jmp $	;jump forever

	times 510-($-$$) db 0x00	;padding

	dw 0xaa55	;magic number for boot sector
