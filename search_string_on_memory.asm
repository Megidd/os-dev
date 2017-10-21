mov bx, MSG
call print_string

xor di, di			;clear DI which is loop counter over memory addresses
xor si, si			;clear SI which stores the address of 'BIOS' string if any found
start_search_string:
 cmp byte [di], 'B'		;only BX/BP/DI/SI registers can be used for addressing in 16-bit real mode
 jne continue_search_string
 mov si, di			;store 'B' address in SI for later use
 inc di
 cmp byte [di], 'I'
 jne continue_search_string
 inc di
 cmp byte [di], 'O'
 jne continue_search_string
 inc di
 cmp byte [di], 'S'
 jne continue_search_string
 mov dx, si			;DX is print_hex input
 call print_hex			;print SI which is start address of 'BIOS' string
 mov bx, HEX_OUT		;BX is print_string input
 call print_string

 continue_search_string:
  inc di
  cmp di, 0xffff
  jne start_search_string

jmp $

FINDME:
 db 'BIOS',0x00

HEX_OUT:			;HEX_OUT is address at print_hex output
 db '0x0000',0x00

%include "print_hex_callee.asm"
%include "print_string_callee.asm"

MSG:
 db 'Searching for string BIOS ...',0x00

times 510-($-$$) db 0x00	;padding to fill 512 Bytes at boot sector
dw 0xaa55			;boot sector signature
