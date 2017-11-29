#include "screen.h"

void print_char(char character, int col, int row, char attribute_byte){
	/**
	 * Create a byte (char) pointer to the start of video memory
	 */
	unsigned char* vidmem=(unsigned char*)VIDEO_ADDRESS;

	/**
	 * If attribute byte is zero, assume the default style.
	 */
	if(!attribute_byte){
		attribute_byte=WHITE_ON_BLACK;
	}

	/**
	 * Get the video memory offset for the screen location 
	 */
	int offset;
	/* If col and row are non-negative, use them for offset. */
	if(col>=0 && row>=0){
		offset=get_screen_offset(col,row);
	}else{
		/* Otherwise, use the current cursor position. */
		offset=get_cursor();
	}

	/**
	 * If we see a newline character, set offset to the end of current row,
	 * so it will be advanced to the first col of the next row.
	 */
	if(character=='\n'){
		int rows=offset/(2*MAX_COLS);
		offset=get_screen_offset(79,rows);
	}else{
		/**
		 * Otherwise, write the character and its attribute byte
		 * to video memory at our calculated offset.
		 */
		vidmem[offset]=character;
		vidmem[offset+1]=attribute_byte;
	}

	/**
	 *  Update the offset to the next character cell,
	 *  which is two bytes ahead of the current cell.
	 */
	offset+=2;

	/**
	 * Make scrolling adjustment,
	 * for when we reach the bottom of the screen.
	 */
	offset=handle_scrolling(offset);

	/**
	 * Update the cursor position on the screen device.
	 */
	set_cursor(offset);

	return;
}

int get_screen_offset(int col, int row){
	return (row*MAX_COLS+col)*2;
}

int get_cursor(){
	/**
	 * The device uses its control register
	 * as an index to select its internal registers,
	 * of which we are interested in:
	 * reg 14: which is the high byte of the cursor’s offset
	 * reg 15: which is the low byte of the cursor’s offset
	 * Once the internal register has been selected,
	 * we may read or write a byte on the data register.
	 */
	port_byte_out(REG_SCREEN_CTRL, 14);
	int offset=port_byte_in(REG_SCREEN_DATA) << 8;
	port_byte_out(REG_SCREEN_CTRL, 15);
	offset+=port_byte_in(REG_SCREEN_DATA);

	/**
	 *  Since the cursor offset reported by the VGA hardware
	 *  is the number of characters, we multiply by two to convert
	 *  it to a character cell offset.
	 */
	return offset*2;
}

void set_cursor(int offset){
	return;
}

int handle_scrolling(int offset){
	return 0x00;
}
