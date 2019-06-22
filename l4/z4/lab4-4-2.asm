EXTRN X: byte
PUBLIC exit

SD2 SEGMENT para 'DATA'
	Y db 'Y'
SD2 ENDS

SC2 SEGMENT para public 'CODE'
	assume CS:SC2, DS:SD2

exit:
	mov ax, SEG X
	mov es, ax
	
	mov ax, SD2
	mov ds, ax
	
	mov ah, Y
	mov al, ES:X
	xchg ah, al
	mov ES:X, al
	mov Y, ah
	
	mov ah, 2
	mov dl, Y
	int 21h
	
	mov ax, 4c00h
	int 21h

SC2 ENDS

END