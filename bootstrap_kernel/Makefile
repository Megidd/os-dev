all: os-image

run: all bochsrc
	bochs

clean:
	cd boot/ && make clean 
	cd kernel/ && make clean

boot/boot_sect.bin:
	cd boot/ && make

kernel/kernel.bin:
	cd kernel/ && make

os-image: boot/boot_sect.bin kernel/kernel.bin
	cat $> > $@
