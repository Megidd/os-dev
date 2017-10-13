disk_load:
 pusha

 mov ah, 0x02		;BIOS read sector function
 mov dl, 0x00		;first floppy drive
 mov ch, 0x03		;select cylinder 3
 mov dh, 0x01		;Select the track on 2nd side of floppy
			; disk , since this count has a base of 0
 mov cl, 0x04		;Select  the 4th  sector  on the  track  - not
			; the 5th , since  this  has a base of 1.
 mov al, 0x05
 mov bx, 0xa000
 mov es,bx
 mov bx,0x1234

 int 0x13

 popa
 ret
