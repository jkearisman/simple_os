#include "util.h"

void* memset(void* dest, char c, int bytes_to_set) 
{
	int i;
	for(i = 0; i < bytes_to_set; i++) {
		((char*)dest)[i] = c;
	}
	return dest;
}

void print(char* message, int length, int row) 
{
	if(length < 0) {
		return;
	}
	if(length > 80) {
		length = 80;
	}
	if(row < 0 || row > 25) {
		row = 0;
	}
	char* video_memory = (char*)0xb8000;
	const int rowsize = 2 * 80 * sizeof(char);
	const char white_on_black = (char)0x07;
	int i;
	for(i = 0; i < length; i++) {
		(video_memory + rowsize * row)[2*i] = message[i];
		(video_memory + rowsize * row)[2*i+1] = white_on_black;
	}
	return;
}

void pr_int(unsigned to_print, int row) {
	char message[8];
	memset(message, 0, 8);
	int place = 7;
	char* video_memory = (char*)0xb8000;
	char white_on_black = (char)0x7;
	unsigned div_by = 0x10000000;

	while(div_by > 0 ) {
		int this_place = to_print / div_by;
		if(this_place >= 0 && this_place <= 9) {
			*(video_memory++) = (char)(0x30 + this_place);
		} else if(this_place >= 0xa && this_place <= 0xf) {
			*(video_memory++) = (char)(0x61 + this_place - 0xa);
		} else {
			*(video_memory++) = '!';
		}
		*(video_memory++) = white_on_black;
		to_print %= div_by;
		div_by /= 0x10;
	}
}




