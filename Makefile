all:	disk_load_caller.bin

disk_load_caller.bin:		disk_load_caller.asm	disk_load_callee.asm print_hex_callee.asm
	nasm disk_load_caller.asm -f bin -o disk_load_caller.bin -l disk_load_caller.list

#all:	seg_offset.bin

#seg_offset.bin:		seg_offset.asm
#	nasm seg_offset.asm -f bin -o seg_offset.bin -l seg_offset.list

#all:	print_hex_caller.bin

#print_hex_caller.bin:	print_hex_caller.asm	print_string_callee.asm	print_hex_callee.asm
#	nasm print_hex_caller.asm -f bin -o print_hex_caller.bin -l print_hex_caller.list

#all:	print_string_caller.bin

#print_string_caller.bin:	print_string_caller.asm		print_string_callee.asm
#	nasm print_string_caller.asm -f bin -o print_string_caller.bin -l print_string_caller.list

#all:	control_structures.bin

#control_structures.bin:		control_structures.asm
#	nasm control_structures.asm -f bin -o control_structures.bin -l control_structures.list

#all:	push_and_pop.bin

#push_and_pop.bin:	push_and_pop.asm
#	nasm push_and_pop.asm -f bin -o push_and_pop.bin -l push_and_pop.list

#all:	find_the_byte.bin find_the_byte_BOOK_EXAMPLE.bin

#find_the_byte.bin: find_the_byte.asm
#	nasm find_the_byte.asm -f bin -o find_the_byte.bin -l find_the_byte.list

#find_the_byte_BOOK_EXAMPLE.bin:	find_the_byte_BOOK_EXAMPLE.asm
#	nasm find_the_byte_BOOK_EXAMPLE.asm -f bin -o find_the_byte_BOOK_EXAMPLE.bin -l find_the_byte_BOOK_EXAMPLE.list
