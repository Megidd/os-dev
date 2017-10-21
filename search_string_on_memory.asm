mov bx, MSG
call print_string

mov cx, 0x0000
mov es, cx			;clear ES, i.e. segment register indirectly 
				; => processor limitation in 16-bit real mode

next_seg_reg:
 xor di, di			;clear DI which is loop counter over memory addresses
 xor si, si			;clear SI which stores the address of 'BIOS' string if any found
 start_search_string:
  cmp byte [es:di], 'B'		;only BX/BP/DI/SI registers can be used for addressing in 16-bit real mode
				; => processor limitation at 16-bit real mode
  jne continue_search_string
  mov si, di			;store 'B' address in SI for later use
  inc di
  cmp byte [es:di], 'I'
  jne continue_search_string
  inc di
  cmp byte [es:di], 'O'
  jne continue_search_string
  inc di
  cmp byte [es:di], 'S'
  jne continue_search_string
  mov dx, si			;DX is print_hex input
  call print_hex
  mov bx, HEX_OUT
  call print_string		;print SI which is start address of 'BIOS' string
  mov bx, MSG_ADDRESS
  call print_string
  mov dx, es			;DX is print_hex input;
  call print_hex
  mov bx, HEX_OUT
  call print_string		;print ES which is extra data segment register
  mov bx, MSG_SEG_REG
  call print_string

 continue_search_string:
  inc di
  cmp di, 0xffff
  jne start_search_string
  mov cx, es			;increment ES indirectly => processor limitation at 16-bit real mode
  inc cx
  mov es, cx
  cmp cx, 0x07c1
  je end_search_string
  cmp cx, 0xffff
  jne next_seg_reg

end_search_string:
 jmp $

MSG_SEG_REG:
 db ' -> Segment register',0x00

MSG_ADDRESS:
 db ' -> Address',0x00

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
