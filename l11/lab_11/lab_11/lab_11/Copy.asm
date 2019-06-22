.386
.MODEL FLAT,C

PUBLIC CopyStr
.CODE
CopyStr proc
	PUSH EBP
	MOV EBP,ESP ; стековый кадр
	PUSH ESI
	PUSH EDI

	MOV ESI, [EBP+8]   ; STR1
	MOV EDI, [EBP+12]  ; STR2
	MOV ECX, [EBP+16]  ; LEN

	MOV EAX,EDI

	sub edi, esi
	cmp edi, 0
	jge M0 ; если адрес второй строки больше адреса первой строки
	jmp M1
	;neg edi
M0:
	cmp ecx, edi
	jge M3 ; проверим, пересекаютс€ ли строки
	jnp M1
M3:
	mov edi, eax
	cmp edi, esi
	jge M2 ; если пересекаютс€
	jmp M2
M1:
	mov edi, eax
	CLD ; cброс флага направлени€, DF = 0
	REP MOVSB ; копирует один байт из €чейки пам€ти по адресу DS:ESI в €чейку пам€ти по адресу ES:EDI
	mov [edi], cx
	JMP EXIT
M2:
	STD ; установка флага направлени€, DF = 1
	add edi, ecx
	add esi, ecx
	dec edi
	dec esi
	mov bh, 0
	mov [edi + 1], bh
	REP MOVSB
EXIT:
	POP EDI
	POP ESI
	POP EBP
	RET
CopyStr endp
END