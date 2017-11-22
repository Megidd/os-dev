all: kernel.o kernel.bin kernel.dis

clean:
	rm -f kernel.o kernel.bin kernel.dis

kernel.o: kernel.c
	clang -ffreestanding -c kernel.c -o kernel.o

kernel.bin: kernel.o
	ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary

kernel.dis: kernel.bin
	ndisasm -b 32 kernel.bin > kernel.dis
