struct IDTDescr{
	unsigned short offset_1; // offset bits 0..15
	unsigned short selector; // a code segment selector in GDT or LDT
	unsigned char zero;      // unused, set to 0
	unsigned char type_attr; // type and attributes, see below
	unsigned short offset_2; // offset bits 16..31
};

void* memset(void* dest, char c, int bytes_to_set);
void print(char* message, int length, int row);
int loadIDT();
