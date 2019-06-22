PUBLIC U16

DSEG	SEGMENT PARA PUBLIC 'DATA'
        SYMBOLS DB '0123456789ABCDEF'
	DELITEL db 2

DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG
		
U16	PROC NEAR
	PUSH BP
	PUSH SI
	MOV  BP,SP
    MOV  BX,[BP + 8]
    MOV  CL,4 ;цикл
	mov cx, 4
	BEGIN:
		xor ax, ax
		mov al, 1111b
		
		push cx
		mov cl, 4
		rol bx, cl
		pop cx
		
		AND AL, bl
		mov si, al
		
		MOV  AH,2
		MOV  DX,OFFSET SYMBOLS[si]
		INT  21H
		
		xor ax, ax
		mov al, 1111b
		loop BEGIN
		
		
		
		
		
		
		;MOV  SI,15 ;начальное максимальное значение
		;MOV  DX,0
		;PUSH CX
		;MOV  CX,4
		;MOV  Dx,8  ;степень 2-ки(3)
		;SDVIG:
			;ROL  BX,1 ;циклический сдвиг влево
			;JC   NO_1     ;если 1
			;SUB  si,Dx   ;отнимаем степень
		   ;NO_1:
			;SHR  DX,1 ;Логический сдвиг вправо
			;LOOP SDVIG  ;внутренний цикл по 4 бита
		;CMP  SI,0 
		;JE   PRINT
		;MOV  DI,1 ;первая 1-ца

	   ;PRINT:
		;CMP  DI,0
		;e   FIRST_0  ;не выводим незначащие нули 

		;MOV  AH,2
		;MOV  DX,OFFSET SYMBOLS[SI]
		;INT  21H
	   ;FIRST_0:
		;POP  CX
		;LOOP BEGIN
	;CMP BX,0
	;JNE EXIT
	;MOV  AH,2
	;MOV  DX,'0'
	;INT  21H
EXIT:
    POP SI
	POP BP
	RET 4
U16		ENDP
		
CSEG	ENDS
END