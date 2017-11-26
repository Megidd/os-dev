[bits 32]
;Define some constants
VIDEO_MEMORY equ 0x000b8000
WHITE_ON_BLACK equ 0x0000000f

; prints a null - terminated string pointed to by EBX
print_string_pm:
 pusha
 
 mov edx, VIDEO_MEMORY ; Set edx to the start of vid mem.
 add edx, 0d3200	;0xb8000 + 2 * (row * 80 + col)
			;row=20, col=0 => VIDEO_MEMORY+0d3200
			;Video Graphics Array (VGA) colour text mode with dimmensions 80x25 characters
 
 print_string_pm_loop:
  
  mov al, [ebx]
  mov ah, WHITE_ON_BLACK
  
  cmp al, 0x00
  je print_string_pm_done	; if (al == 0) , at end of string , so
				; jump to done
  
  mov [edx], ax 	; Store char and attributes at current
			; character cell.

  inc ebx		; Increment EBX to the next char in string.
  add edx, 0x02		; Move to next character cell in vid mem.
  jmp print_string_pm_loop

print_string_pm_done:
 popa
 ret
