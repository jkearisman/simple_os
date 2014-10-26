[bits 16]

disk_load:
	push dx
	; put dx on the stack, later, we will pop it and make sure
	; we read what we wanted to read

	mov ah, 0x02	; Means to read drive on interrput
	mov al, dh 		; al is how many we want to read
	mov ch, 0x0 	; select cylinder 0
	mov dh, 0x0 	; select head 0
	mov cl, 0x02 	; 2nd sector (the one after boot sector)

	int 0x13	;BIOS interrput

	jc disk_error

	;; else, everything went well

	pop dx
	cmp dh, al ; dh is sectors expected, al is sectors actually read
	jne disk_error
	mov bx, MSG_NO_ERROR
	call print_string
	ret

disk_error:
	mov bx, MSG_ERROR
	call print_string
	jmp $

	MSG_ERROR db 'Reading from disk has failed', 0
	MSG_NO_ERROR db 'Reading from disk succeeded', 0

