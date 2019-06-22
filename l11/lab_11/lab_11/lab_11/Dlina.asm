.386
.MODEL FLAT,C

PUBLIC DlinaStroki
.CODE
DlinaStroki proc
	PUSH EBP
	MOV EBP,ESP ; стековый кадр
	
	PUSH EDI
	mov edi, [ebp + 8] ; строка
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