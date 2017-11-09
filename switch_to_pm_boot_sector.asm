; A boot sector that enters 32 - bit protected mode.
mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print_string

call switch_to_pm	; Note that we never return from here,
			; because it will jump to BEGIN_PM

jmp $

%include "print_string_callee.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"

[bits 32]
BEGIN_PM:
 ; This is where we arrive after switching to and initialising protected mode.
 mov ebx, MSG_PROT_MODE
 call print_string_pm	; Use our 32 - bit print routine.

 jmp $

MSG_REAL_MODE db "Starting in 16-bit real mode ...",0x00
MSG_PROT_MODE db "Landed in 32-bit protected mode!",0x00

times 510-($-$$) db 0x00
dw 0xaa55
