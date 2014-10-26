import kernel.util;

void main() {
	char* video_memory = cast(char*)0xb8000;
	int rows = 25;
	int cols = 80;
	int message_len = 13;
	byte white_on_black = 0x0f;
	int i;
	char[] message;
	memset(video_memory, 0, 2 * rows * cols);
	for(i = 0; i < message_len; i++) {
		video_memory[2*i] = message[i];
		video_memory[2*i+1] = white_on_black;
	}
	while(1) {}


}
