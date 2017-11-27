unsigned char port_byte_in(unsigned short port){
	unsigned char result;
	/**
	 * Intel syntax throws an error:
	 * error: unknown use of instruction mnemonic without a size suffix
	 */
	//asm(".intel_syntax noprefix");
	asm("in %%dx, %%al"
			: "=a" (result)
			: "d" (port)
			);
	return result;
}

unsigned short port_word_in(unsigned short port){
	unsigned short result;
	asm("in %%dx, %%ax"
			: "=a" (result)
			: "d" (port)
			);
	return result;
}

void port_byte_out(unsigned short port, unsigned char data){
	asm("out %%al, %%dx"
			:
			: "a" (data), "d" (port)
			);
	return;
}

void port_word_out(unsigned short port, unsigned short data){
	asm("out %%ax, %%dx"
			:
			: "a" (data), "d" (port)
			);
	return;
}

void main(){
	char*video_memory=(char*) (0xb8000+3360);
	/**
	 * 0xb8000 + 2 * (row * 80 + col)
	 * row=21, col=0 => VIDEO_MEMORY+0d3360
	 * 0d3360 = 0x0d20
	 * Video Graphics Array (VGA) colour text mode with dimmensions 80x25 characters
	 */
	char*msg="Kernel is running ... enjoy!";
	char cont_msg=0x01;
	int i=0;
	int j=0;
	while(cont_msg==0x01){
		*(video_memory+j)=*(msg+i);	//char hex code
		*(video_memory+j+1)=i+1;	//char color
		i++;
		if(*(msg+i)==0x00){
			cont_msg=0x00;
		}
		j=j+2;
	}
	/*
	*video_memory='K';
	*(video_memory+1)=0x0f;//white on black
	*(video_memory+2)='e';
	*(video_memory+4)='r';
	*(video_memory+6)='n';
	*(video_memory+8)='e';
	*(video_memory+10)='l';
	*(video_memory+12)=' ';
	*(video_memory+14)='i';
	*(video_memory+15)=0x05;//Magenta
	*(video_memory+16)='s';
	*(video_memory+18)=' ';
	*(video_memory+20)='r';
	*(video_memory+21)=0x0d;//Light Magenta
	*(video_memory+22)='u';
	*(video_memory+24)='n';
	*(video_memory+26)='n';
	*(video_memory+28)='i';
	*(video_memory+30)='n';
	*(video_memory+32)='g';
	*/

	return;
}
