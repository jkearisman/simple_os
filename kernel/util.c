#include "util.h"

void* memset(void* dest, char c, int bytes_to_set) {
	int i;
	for(i = 0; i < bytes_to_set; i++) {
		((char*)dest)[i] = c;
	}
	return dest;



}
void print(char* message, int length, int row) {
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



struct IDTDescr keyboard_idt;

int loadIDT() {
	keyboard_idt.offset_1 = 0;
	keyboard_idt.selector = 0;
	keyboard_idt.zero = 0;
	keyboard_idt.type_attr = 0;
	keyboard_idt.offset_2 = 0;

	asm("lidt (%0)":"=r"(keyboard_idt):);
	print("Loaded idt", 10, 1);
}
