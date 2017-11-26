all: boot_sect.bin

clean:
	rm -f boot_sect.bin boot_sect.list
	
boot_sect.bin: boot_sect.asm
	nasm $> -f bin -I 'routines/' -o $@ -l boot_sect.list
