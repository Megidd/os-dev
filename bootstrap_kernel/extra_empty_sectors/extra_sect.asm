; Padding to fill more than 20 sectors in addition to boot_sector and kernel code

; 512*20=10240
times 10240 db 0x00
