[bits 16]
;switch to protected mode

switch_to_pm:

 cli 	; We must switch of interrupts until we have
	; set -up the protected mode interrupt vector
	; otherwise interrupts will run riot.

 lgdt [gdt_descriptor]	; Load our global descriptor table , which defines
			; the protected mode segments ( e.g. for code and data )

 mov eax, cr0
 or eax, 0x00000001
 mov cr0, eax		; To make the switch to protected mode , we set
			; the first bit of CR0 , a control register

 jmp CODE_SEG:init_pm	; Make a far jump ( i.e. to a new segment ) to our 32 - bit
			; code. This also forces the CPU to flush its cache of
			; pre - fetched and real - mode decoded instructions , which can
			; cause problems.

 [bits 32]

 init_pm:
  ; Initialise registers and the stack once in PM.
  mov ax, DATA_SEG
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  mov ebp, 0x00090000
  mov esp, ebp

  call BEGIN_PM
