module kernel.util;

void* memset(void* dest, byte c, int bytes_to_set) {
	int i;
	for(i = 0; i < bytes_to_set; i++) {
		(cast(char*)dest)[i] = c;
	}
	return dest;
}
