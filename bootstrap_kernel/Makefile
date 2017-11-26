all: os-image

run: all bochsrc
	bochs

clean:
	rm -f boot_sect.bin boot_sect.list
	cd kernel/ && make clean
	cd extra_empty_sectors/ && make clean
	
boot_sect.bin: boot_sect.asm
	nasm boot_sect.asm -f bin -I 'routines/' -o boot_sect.bin -l boot_sect.list

os-image: boot_sect.bin
	cd kernel/ && make
	cd extra_empty_sectors/ && make
	cat boot_sect.bin kernel/kernel.bin extra_empty_sectors/extra_sect.bin > os-image
