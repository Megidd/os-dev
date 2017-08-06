all:	find_the_byte.bin find_the_byte_BOOK_EXAMPLE.bin

find_the_byte.bin: find_the_byte.asm
	nasm find_the_byte.asm -f bin -o find_the_byte.bin -l find_the_byte.list

find_the_byte_BOOK_EXAMPLE.bin:	find_the_byte_BOOK_EXAMPLE.asm
	nasm find_the_byte_BOOK_EXAMPLE.asm -f bin -o find_the_byte_BOOK_EXAMPLE.bin -l find_the_byte_BOOK_EXAMPLE.list
