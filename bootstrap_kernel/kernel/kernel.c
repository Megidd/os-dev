void main(){
	char*video_memory=(char*) (0xb8000+3360);
	/**
	 * 0xb8000 + 2 * (row * 80 + col)
	 * row=21, col=0 => VIDEO_MEMORY+0d3360
	 * 0d3360 = 0x0d20
	 * Video Graphics Array (VGA) colour text mode with dimmensions 80x25 characters
	 */
	*video_memory='X';
	*(video_memory+1)=0x0f;//white on black
	return;
}
