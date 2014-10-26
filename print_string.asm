print_string:
mov ah, 0x0e


NEXT_CHAR:
mov al, [bx]
cmp al, 0x0
je END
jmp print_char
print_char:
int 0x10
add bx, 0x1
jmp NEXT_CHAR

END:

ret

