all: os-image

clean:
	rm -f boot_sect.bin boot_sect.list
	cd kernel/ && make clean
	cd extra_empty_sectors/ && make clean
	
boot_sect.bin: boot_sect.asm routines/print_string_abs.asm routines/disk_load_callee.asm routines/switch_to_pm.asm routines/gdt.asm routines/print_string_pm.asm
	nasm boot_sect.asm -f bin -o boot_sect.bin -l boot_sect.list

os-image: boot_sect.bin
	cd kernel/ && make
	cd extra_empty_sectors/ && make
	cat boot_sect.bin kernel/kernel.bin extra_empty_sectors/extra_sect.bin > os-image
