all: boot_sect.bin

clean:
	rm -f boot_sect.bin
	
boot_sect.bin: boot_sect.asm routines/print_string_abs.asm
	nasm boot_sect.asm -f bin -o boot_sect.bin -l boot_sect.list
