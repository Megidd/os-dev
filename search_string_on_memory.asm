mov bx, MSG
call print_string

xor di, di			;clear DI
start_search_string:
 cmp byte [di], 'B'		;only BX/BP/DI/SI registers can be used for addressing in 16-bit real mode
 jne continue_search_string
 inc di
 cmp byte [di], 'I'
 jne continue_search_string
 inc di
 cmp byte [di], 'O'
 jne continue_search_string
 inc di
 cmp byte [di], 'S'
 jne continue_search_string
 mov dx, di			;DX is print_hex input
 call print_hex
 mov bx, HEX_OUT		;BX is print_string input
 call print_string

 continue_search_string:
  inc di
  jmp start_search_string

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
