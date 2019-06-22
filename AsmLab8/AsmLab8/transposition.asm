.386
.model flat, C
public transpos
.code
transpos:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8] ; m

	mov ecx, 4
main:
	mov esi, 4 ;установка начала цикла в диагональный элемент
	mov edi, 32
	push ecx
exchange:
	xchg edx, [eax][esi]
	xchg edx, [eax][edi]
	xchg edx, [eax][esi]
	add esi, 4
	add edi, 32
	loop exchange
	pop ecx
	add eax, 36
	loop main
	pop ebp
	ret
END