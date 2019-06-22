SSTACK SEGMENT PARA STACK 'STACK'
	DB 100 DUP(0)
SSTACK ENDS

DSEG SEGMENT para 'DATA'
    a   db  0,0,0,0,0
       	db  1,1,1,1,1
        db  2,2,2,2,2
	    db  3,3,3,3,3
	    db  4,4,4,4,4
	pr  db  13
		db 10
		db '$'
DSEG ENDS

CSEG SEGMENT para public 'CODE'
	assume CS:CSEG,DS:DSEG,SS:SSTACK
	
NEWSTR:
	mov dx,offset pr
	mov ah,9
	int 21h
	ret
	
PRINT_MATRIX proc
	mov si, offset a
	mov cx, 25
	xor bx, bx
row:	
	mov dl, [si]
	add dl, '0'
	mov ah,2
	int 21h
	inc si
	inc bx
	
	cmp bx, 5h
	jnz continue
	call NEWSTR
	xor bx,bx
continue:
	loop row
	
	call NEWSTR
	
	ret
PRINT_MATRIX endp

START proc far
	mov ax, DSEG
    mov ds, ax
	mov cx,4
    xor bx,bx 
full:
    mov si,1 ;установка начала цикла в диагональный элемент
	mov di,5
	push cx
exchange:
    xchg al,[bx][si]
    xchg al,[bx][di]
    xchg al,[bx][si]
	inc si
	add di, 5
	
	loop exchange
	pop cx
	add bx, 6
	loop full
	call PRINT_MATRIX
	mov     ah, 4ch
    int 21h
start endp

CSEG ENDS
END START
