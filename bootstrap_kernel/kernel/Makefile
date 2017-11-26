all: kernel_entry.o kernel.o kernel.bin kernel.dis

clean:
	rm -f kernel_entry.o
	rm -f kernel.o kernel.bin kernel.dis

kernel_entry.o: kernel_entry.asm
	nasm kernel_entry.asm -f elf -o kernel_entry.o

kernel.o: kernel.c
	clang -ffreestanding -c kernel.c -o kernel.o
	#gcc -ffreestanding -c kernel.c -o kernel.o

kernel.bin: kernel.o
	ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

kernel.dis: kernel.bin
	ndisasm -b 32 kernel.bin > kernel.dis
