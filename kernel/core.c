#include "util.h"

void main() {
	char* video_memory = (char*)0xb8000;
	int rows = 25;
	int cols = 80;
	int i;
	memset(video_memory, 0, 2* rows * cols);
	pr_int(0x00123abc, 3);
}
