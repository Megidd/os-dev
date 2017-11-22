disk_load:
 pusha

 push dx		; Store  DX on  stack  so  later  we can  recall
			; how  many  sectors  were  request  to be read ,
			; even if it is  altered  in the  meantime
 
 mov al, dh		; DX is input, DH stores how many sectors to read

 mov ah, 0x02		; BIOS read sector function

; mov dl, 0x00		; first floppy drive
			; DL stores boot_drive, set by the caller

; DL is already set by the caller as BOOT_DRIVE

; mov ch, 0x03		; select cylinder 3

 mov ch, 0x00		; cylinder 0

; mov dh, 0x01		; Select the track on 2nd side of floppy
			; disk , since this count has a base of 0

 mov dh, 0x00		; Select head 0

; mov cl, 0x04		; Select  the 4th  sector  on the  track  - not
			; the 5th , since  this  has a base of 1.

 mov cl, 0x02		; Start  reading  from  second  sector (i.e.
			; after  the  boot  sector)

; BX is already set by the caller as the destination address

 int 0x13
 jc disk_error

 pop dx
 cmp dh, al		; if AL (sectors read) != DH (sectors expected)
 jne disk_error
 
 popa
 ret

 disk_error:
 	mov bx, DISK_ERROR_MSG
 	call print_string
	jmp $		; jump forever to the same line

 DISK_ERROR_MSG:
 	db 'Disk read error',0x00
