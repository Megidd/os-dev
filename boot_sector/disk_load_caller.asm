mov bx, MSG			;bx stores print_string input
call print_string

mov [BOOT_DRIVE], dl		;BIOS  stores  our  boot  drive  in DL, so it’s
				; best to  remember  this  for  later.
mov bp, 0x8000
mov sp, bp			;Here we set our stack safely out of the way , at 0x8000
mov bx, 0x9000			; Load to destination address 0x0000(ES):0x9000(BX)
mov dh, 0x05			; Read 5 sectors
mov dl, [BOOT_DRIVE]
call disk_load

mov dx, [0x9000]		;dx stores print_hex input
				;dx stores the first loaded word at address 0x9000
call print_hex			;print_hex modifies HEX_OUT content according to dx
mov bx,HEX_OUT
call print_string		;print 2nd sector loaded at address 0x9000

mov dx, [0x9000+511]
call print_hex
mov bx,HEX_OUT
call print_string		;print the margin between 2nd sector and 3rd sector loaded

mov dx, [0x9000+512]
call print_hex
mov bx,HEX_OUT
call print_string		;print 3rd sector loaded at address 0x9000+512

jmp $

BOOT_DRIVE:
 db 0x00

%include "disk_load_callee.asm"

%include "print_hex_callee.asm"

HEX_OUT:			;HEX_OUT stores print_hex output
 db '0x0000',0x00

%include "print_string_callee.asm"

MSG:
 db 'Reading the first n sectors following the boot sector ...',0x00

times 510-($-$$) db 0x00	;padding

dw 0xaa55			;Boot sector signature
				;at the end of 1st sector, i.e. boot sector

times 512 db 0xee		;2nd sector filled with 0xee
times 512 db 0xff		;3rd sector filled with 0xff
