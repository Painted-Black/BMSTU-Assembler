PUBLIC U10

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG

U10	PROC NEAR
	PUSH BP
	MOV  BP,SP
	MOV  AX, [BP + 6]   ;x
	
        MOV CX,0      ;���������� ���� � �����
        MOV BX, 10

        BEGIN:
	    MOV DX,0
            DIV BX        ;������� � DX, ����� ����� � AX
            ADD DX,'0'
            PUSH DX       ;������� ����
            INC CX
            CMP AX,0
            JNE BEGIN
            MOV AH,2
        PRINT:
            POP DX        ;������� � �������� �������
            INT 21h
            LOOP PRINT
		
		
	POP BP

	RET 4
U10	ENDP
CSEG	ENDS
END