.386
.MODEL FLAT,C

PUBLIC DlinaStroki
.CODE
DlinaStroki proc
	PUSH EBP
	MOV EBP,ESP ; �������� ����
	
	PUSH EDI
	mov edi, [ebp + 8] ; ������
	mov esi, edi

	mov al, 0
	repnz SCASB

	dec edi
	mov eax, edi
	sub eax, esi

	pop edi
	POP EBP
	RET
DlinaStroki endp
END