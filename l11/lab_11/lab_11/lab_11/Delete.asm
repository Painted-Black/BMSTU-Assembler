.386
.MODEL FLAT,C

PUBLIC DelProbel
.CODE
DelProbel proc
	PUSH EBP
	MOV EBP,ESP
	PUSH EDI

	xor ecx, ecx

	mov edi, [ebp+8] ; str1
	mov esi, edi

M1:
	mov al, 20h ; символ пробела
	scasb
	je M1
	
	dec edi
	mov ecx, edi
	sub ecx, esi
	cld
	push esi
	xchg esi, edi
M3:
	mov bl, [esi]
	cmp bl, 20h
	jne M4
	jmp M5
M4:
	mov edx, edi
M5:
	movsb
	mov bl, [esi]
	cmp bl, 0
	jne M3

	mov ecx, 0
	add edx, 1
	mov [edx], ecx

	pop edi
	sub edx, edi
	mov eax, edx
	
	POP EDI
	POP EBP
	RET
DelProbel endp
END