all: c_intro.o c_intro.bin c_intro.dis

c_intro.o: c_intro.c
	gcc -ffreestanding -c c_intro.c -o c_intro.o

c_intro.bin: c_intro.o
	ld -o c_intro.bin -Ttext 0x0 --oformat binary c_intro.o

c_intro.dis: c_intro.bin
	ndisasm -b 32 c_intro.bin > c_intro.dis 
