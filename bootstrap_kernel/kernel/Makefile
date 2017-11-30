all: kernel.dis

clean:
	rm -f *.o *.bin *.dis

kernel_entry.o: kernel_entry.asm
	#nasm $> -f elf -o $@
	nasm $^ -f elf -o $@

kernel.o: kernel.c
	#clang -ffreestanding -c $> -o $@
	gcc -ffreestanding -c $^ -o $@

low_level.o: low_level.c
	#clang -ffreestanding -c $> -o $@
	gcc -ffreestanding -c $^ -o $@

util.o: util.c
	#clang -ffreestanding -c $> -o $@
	gcc -ffreestanding -c $^ -o $@

drivers/screen.o: drivers/screen.c
	#clang -ffreestanding -c $> -o $@
	gcc -ffreestanding -c $^ -o $@

kernel.bin: kernel_entry.o kernel.o low_level.o util.o drivers/screen.o
	#ld -o $@ -Ttext 0x1000 $> --oformat binary
	ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel.dis: kernel.bin
	#ndisasm -b 32 $> > $@
	ndisasm -b 32 $^ > $@
