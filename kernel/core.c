#include "util.h"

void main() {
	char* video_memory = (char*)0xb8000;
	int rows = 25;
	int cols = 80;
	int message_len = 13;
	char white_on_black = 0x0f;
	int i;
	char* message = "Hello, World!";
	memset(video_memory, 0, 2* rows * cols);
	print(message, message_len, 0);
	loadIDT();
	while(1);
}
