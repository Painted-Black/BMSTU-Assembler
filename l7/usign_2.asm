PUBLIC U2

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG

U2		PROC NEAR

		PUSH BP
		MOV  BP, SP
		MOV  BX, [BP + 6] ;x
		MOV  CX, 16
		MOV  DI,0
		BEGIN:
			MOV  DL, '0'
			SHL BX, 1
			JNC FIRST_0 ;���� ������� (��� ������������)
			MOV DI,1    ;���� ��� ���������� �����
			INC DL      ;������ '1'
		FIRST_0:
			CMP DI,0    ;���������� ����
			JNE PRINT
			LOOP BEGIN
		PRINT:
			MOV  AH, 2  ;������ �������
			INT  21h
			CMP CX,0
			JE EXIT
			LOOP BEGIN
		EXIT:

		POP BP

		RET 4
U2		ENDP
		
CSEG	ENDS
END