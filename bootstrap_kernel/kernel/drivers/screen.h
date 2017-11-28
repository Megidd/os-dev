#ifndef SCREEN_H
#define SCREEN_H

#define VIDEO_ADDRESS 0x0b8000
#define MAX_ROWS 25
#define MAX_COLS 80
#define WHITE_ON_BLACK 0x0f

//screen device I/O ports
#define REG_SCREEN_CTRL 0x03d4
#define REG_SCREEN_DATA 0x03d5

void print_char(char , int , int , char );

#endif //SCREEN_H
