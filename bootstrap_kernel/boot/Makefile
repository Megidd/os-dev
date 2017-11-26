all: boot_sect.bin

clean:
	rm -f *.bin *.list
	
boot_sect.bin: boot_sect.asm
	nasm $> -f bin -I 'routines/' -o $@ -l boot_sect.list
