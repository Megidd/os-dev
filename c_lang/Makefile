all: array.o array.bin array.dis
#all: string.o string.bin string.dis
#all: call_fun.o call_fun.bin call_fun.dis
#all: local_var.o local_var.bin local_var.dis
#all: c_intro.o c_intro.bin c_intro.dis

clean: 
	rm -f array.o array.bin array.dis

array.o: array.c
	gcc -ffreestanding -c array.c -o array.o
#string.o: string.c
#	gcc -ffreestanding -c string.c -o string.o
#call_fun.o: call_fun.c
#	gcc -ffreestanding -c call_fun.c -o call_fun.o
#local_var.o: local_var.c
#	gcc -ffreestanding -c local_var.c -o local_var.o
#c_intro.o: c_intro.c
#	gcc -ffreestanding -c c_intro.c -o c_intro.o

array.bin: array.o
	ld -o array.bin -Ttext 0x0 --oformat binary array.o
#string.bin: string.o
#	ld -o string.bin -Ttext 0x0 --oformat binary string.o
#call_fun.bin: call_fun.o
#	ld -o call_fun.bin -Ttext 0x0 --oformat binary call_fun.o
#local_var.bin: local_var.o
#	ld -o local_var.bin -Ttext 0x0 --oformat binary local_var.o
#c_intro.bin: c_intro.o
#	ld -o c_intro.bin -Ttext 0x0 --oformat binary c_intro.o

array.dis: array.bin
	ndisasm -b 32 array.bin > array.dis
#string.dis: string.bin
#	ndisasm -b 32 string.bin > string.dis
#call_fun.dis: call_fun.bin
#	ndisasm -b 32 call_fun.bin > call_fun.dis
#local_var.dis: local_var.bin
#	ndisasm -b 32 local_var.bin > local_var.dis
#c_intro.dis: c_intro.bin
#	ndisasm -b 32 c_intro.bin > c_intro.dis 
