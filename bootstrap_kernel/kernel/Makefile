C_SOURCES=$(wildcard *.c drivers/*.c)
HEADERS=$(wildcard *.h drivers/*.h)

OBJ=${C_SOURCES:.c=.o}

all: kernel.dis

clean:
	rm -f *.o *.bin *.dis

kernel_entry.o: kernel_entry.asm
	nasm $> -f elf -o $@

kernel.o: ${OBJ}
	clang -ffreestanding -c $> -o $@

%.o: %.c ${HEADERS}
	clang -ffreestanding -c $> -o $@

kernel.bin: kernel_entry.o kernel.o
	ld -o $@ -Ttext 0x1000 $> --oformat binary

kernel.dis: kernel.bin
	ndisasm -b 32 $> > $@
