#ifndef LOW_LEVEL_H
#define LOW_LEVEL_H

unsigned char port_byte_in(unsigned short );
unsigned short port_word_in(unsigned short );
void port_byte_out(unsigned short , unsigned char );
void port_word_out(unsigned short , unsigned short );

#endif //LOW_LEVEL_H
