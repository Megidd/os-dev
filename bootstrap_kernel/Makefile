all: os-image

clean:
	rm -f boot_sect.bin boot_sect.list extra_sect.bin extra_sect.list
	cd kernel/ && make clean
	
boot_sect.bin: boot_sect.asm routines/print_string_abs.asm routines/disk_load_callee.asm routines/switch_to_pm.asm routines/gdt.asm routines/print_string_pm.asm
	nasm boot_sect.asm -f bin -o boot_sect.bin -l boot_sect.list

kernel/kernel.bin:
	cd kernel/ && make

extra_sect.bin: extra_sect.asm
	nasm extra_sect.asm -f bin -o extra_sect.bin -l extra_sect.list

os-image: boot_sect.bin kernel/kernel.bin extra_sect.bin
	cat boot_sect.bin kernel/kernel.bin extra_sect.bin > os-image
