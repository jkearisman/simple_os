C_SOURCES = $(wildcard kernel/*.c)
OBJS = $(C_SOURCES:.c=.o)
all: os-image

run: os-image
	qemu-system-x86_64 -fda os-image

os-image: boot.bin kernel.bin
	cat $^ > os-image

boot.bin: boot.asm
	nasm $^ -f bin -o boot.bin

kernel.bin: kernel_entry.o ${OBJS}
	ld -o $@ -Ttext 0x1000 $^ -melf_i386 --oformat binary

kernel_entry.o: kernel/kernel_entry.asm
	nasm $^ -f elf -o $@

%.o: %.c
	gcc -m32 -ffreestanding -c $^ -o $@

clean:
	rm *.bin
	rm *.o
	rm os-image 
	rm kernel/*.o
