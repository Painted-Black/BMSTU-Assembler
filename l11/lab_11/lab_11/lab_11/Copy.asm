.386
.MODEL FLAT,C

PUBLIC CopyStr
.CODE
CopyStr proc
	PUSH EBP
	MOV EBP,ESP ; �������� ����
	PUSH ESI
	PUSH EDI

	MOV ESI, [EBP+8]   ; STR1
	MOV EDI, [EBP+12]  ; STR2
	MOV ECX, [EBP+16]  ; LEN

	MOV EAX,EDI

	sub edi, esi
	cmp edi, 0
	jge M0 ; ���� ����� ������ ������ ������ ������ ������ ������
	jmp M1
	;neg edi
M0:
	cmp ecx, edi
	jge M3 ; ��������, ������������ �� ������
	jnp M1
M3:
	mov edi, eax
	cmp edi, esi
	jge M2 ; ���� ������������
	jmp M2
M1:
	mov edi, eax
	CLD ; c���� ����� �����������, DF = 0
	REP MOVSB ; �������� ���� ���� �� ������ ������ �� ������ DS:ESI � ������ ������ �� ������ ES:EDI
	mov [edi], cx
	JMP EXIT
M2:
	STD ; ��������� ����� �����������, DF = 1
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