all: extra_sect.bin

clean:
	rm -f extra_sect.bin extra_sect.list

extra_sect.bin: extra_sect.asm
	nasm extra_sect.asm -f bin -o extra_sect.bin -l extra_sect.list
