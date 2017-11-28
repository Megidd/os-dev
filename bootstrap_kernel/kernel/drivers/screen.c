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

	return;
}

int get_screen_offset(int col, int row){
	return (row*MAX_COLS+col)*2;
}

int get_cursor(){
	return 0x00;
}
