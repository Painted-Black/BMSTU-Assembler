EXTRN	SCAN : NEAR
EXTRN	U2 : NEAR	; unsigned	bin
EXTRN	S2 : NEAR	; signed	bin
EXTRN	U10 : NEAR	; unsigned	dec
EXTRN	S10 : NEAR	; signed	dec
EXTRN	U16 : NEAR	; unsigned	hex
EXTRN	S16 : NEAR	; signed	hex

SSTACK	SEGMENT PARA STACK 'STACK'
		DB	64 DUP('STACK___')
SSTACK	ENDS

DSEG	SEGMENT PARA PUBLIC 'DATA'
	F	DW	U2, S2, U10, S10, U16, S16
	X	DW	15
	vid     DB 'Viberite vid raboti 0..7: $'
	text    db 13,10,'0. Otobrazit menu:'
	        db 13,10,'1. Vvod tcelogo v slovo X'
	        db 13,10,'2. Vivod iz X kak dvoichnogo tcelogo bez znaka'
	        db 13,10,'3. Vivod iz X kak dvoichnogo tcelogo so znakom'
	        db 13,10,'4. Vivod iz X kak desyatichnogo tcelogo bez znaka'
	        db 13,10,'5. Vivod iz X kak desyatichnogo tcelogo so znakom'
	        db 13,10,'6. Vivod iz X kak shestnadtsaterichnogo tcelogo bez znaka'
	        db 13,10,'7. Vivod iz X kak shestnadtsaterichnogo tcelogo so znakom'
	        db 13,10,'8. Vihod iz programmi$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG, SS:SSTACK

NEW_LINE PROC NEAR
	 MOV  AH,2
	 MOV  DL,10
	 INT  21H
	 MOV  DL,13
	 INT  21H
	 RET
NEW_LINE ENDP

BEGIN:
	MOV  AX, DSEG
	MOV  DS, AX
	MOV  SI,0
MENU:
	MOV  AH, 9
	MOV  DX, OFFSET text
	INT  21H
		
VIBOR:
	CALL NEW_LINE 
	MOV  AH, 9
	MOV  DX, OFFSET vid
	INT  21H

	MOV  AH, 1
	INT  21H
	
	MOV  BX,AX
	SUB  BL,'0'
	XOR  BH,BH

	CMP  AL, '0'
	JB   VIBOR

	CMP  AL, '8'
	JA   VIBOR
		
	CALL NEW_LINE 

	CMP  BX, 8
	JE  EXIT
		
	CMP  BX, 0
	JE   MENU
		
	CMP  BX, 1
	JE   NUMBER
		
	SUB  BX,2
	SHL  BX, 1
		
	PUSH X
	PUSH SI
	CALL F[BX]
		
	JMP  VIBOR
		
NUMBER:
	MOV  SI,0
	CALL SCAN
	MOV  X, AX
	JMP  VIBOR
		
EXIT:
	MOV  AX, 4C00H
	INT  21H
		
CSEG	ENDS
END     BEGIN