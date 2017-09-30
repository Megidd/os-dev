all:	control_structures.bin

control_structures.bin:		control_structures.asm
	nasm control_structures.asm -f bin -o control_structures.bin -l control_structures.list

#all:	push_and_pop.bin

#push_and_pop.bin:	push_and_pop.asm
#	nasm push_and_pop.asm -f bin -o push_and_pop.bin -l push_and_pop.list

#all:	find_the_byte.bin find_the_byte_BOOK_EXAMPLE.bin

#find_the_byte.bin: find_the_byte.asm
#	nasm find_the_byte.asm -f bin -o find_the_byte.bin -l find_the_byte.list

#find_the_byte_BOOK_EXAMPLE.bin:	find_the_byte_BOOK_EXAMPLE.asm
#	nasm find_the_byte_BOOK_EXAMPLE.asm -f bin -o find_the_byte_BOOK_EXAMPLE.bin -l find_the_byte_BOOK_EXAMPLE.list
