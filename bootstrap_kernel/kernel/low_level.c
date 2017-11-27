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
