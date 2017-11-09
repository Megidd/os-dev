gdt_start:

gdt_null:
 dd 0x00000000
 dd 0x00000000

gdt_code:	;the code segment descriptor
 ; base =0x0 , limit =0 xfffff ,
 ; 1st flags : ( present )1 ( privilege )00 ( descriptor type )1 -> 1001 b
 ; type flags : ( code )1 ( conforming )0 ( readable )1 ( accessed )0 -> 1010 b
 ; 2nd flags : ( granularity )1 (32 - bit default )1 (64 - bit seg )0 ( AVL )0 -> 1100 b
 dw 0xffff	;limit=0xffff (bit 0 to 15)
 dw 0x0000	;base=0x0000 (bit 16 to 31)
 db 0x00	;base=0x00 (bit 0 to 7) (start the second 32-bit)
 db 0b10011010	;present=1 privilege=00 descriptor-type=1 code=1 conforming=0 readable=1 accessed=0
 db 0b11001111	;granularity=1 32-bit-default=1 64-bit=0 available=0 limit=0xf=0b1111 (bit 16 to 19)
 db 0x00	;base=0x00 (bit 24 to 31)

gdt_data:	;the data segment descriptor
 ; Same as code segment except for the type flags :
 ; type flags : ( code )0 ( expand down )0 ( writable )1 ( accessed )0 -> 0010 b
 dw 0xffff      ;limit=0xffff (bit 0 to 15)
 dw 0x0000      ;base=0x0000 (bit 16 to 31)
 db 0x00        ;base=0x00 (bit 0 to 7) (start the second 32-bit)
 db 0b10010010  ;present=1 privilege=00 descriptor-type=1 code=0 expand-down=0 writable=1 accessed=0
 db 0b11001111  ;granularity=1 32-bit-default=1 64-bit=0 available=0 limit=0xf=0b1111 (bit 16 to 19)
 db 0x00        ;base=0x00 (bit 24 to 31)

gdt_end:
 ; The reason for putting a label at the end of the
 ; GDT is so we can have the assembler calculate
 ; the size of the GDT for the GDT decriptor ( below )

;GDT descriptor
gdt_descriptor:
 dw gdt_end - gdt_start -1 	; Size of our GDT , always less one
				; of the true size
				; should be 3*8-byte=24-byte: 0d24=0x0018 ?
				; should be 0x0018-1=0x0017
 dd gdt_start

; Define some handy constants for the GDT segment descriptor offsets , which
; are what segment registers must contain when in protected mode. For example ,
; when we set DS = 0 x10 in PM , the CPU knows that we mean it to use the
; segment described at offset 0 x10 ( i.e. 16 bytes ) in our GDT , which in our
; case is the DATA segment (0 x0 -> NULL ; 0x08 -> CODE ; 0 x10 -> DATA )
CODE_SEG equ gdt_code - gdt_start ; shoule be 0x08 ?
DATA_SEG equ gdt_data - gdt_start ; should be 0x10 ?
