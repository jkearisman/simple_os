[bits 32]

; two constants needed for printing
; V_M is the address of VGA output
; W_O_B is a value representing white text on black screen, we can modify this
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
	pusha
	mov edx, VIDEO_MEMORY

NEXT_CHAR_32:
	mov al, [ebx]
	mov ah, WHITE_ON_BLACK
	cmp al, 0x0
	je END_32
	jmp print_char_32
print_char_32:
	mov [edx], ax
	;; print next char
	add ebx, 0x1
	;; in next location
	add edx, 2
	jmp NEXT_CHAR_32

END_32:
	popa
	ret
