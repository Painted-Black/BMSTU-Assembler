PUBLIC U10

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG

U10	PROC NEAR
	PUSH BP
	MOV  BP,SP
	MOV  AX, [BP + 6]   ;x
	
        MOV CX,0      ;количество цифр в числе
        MOV BX, 10

        BEGIN:
	    MOV DX,0
            DIV BX        ;остаток в DX, целая часть в AX
            ADD DX,'0'
            PUSH DX       ;порядок цифр
            INC CX
            CMP AX,0
            JNE BEGIN
            MOV AH,2
        PRINT:
            POP DX        ;достаем в обратном порядке
            INT 21h
            LOOP PRINT
		
		
	POP BP

	RET 4
U10	ENDP
CSEG	ENDS
END