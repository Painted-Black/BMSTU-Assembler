.386
.model FLAT, C
PUBLIC factorial_stack
.CODE

factorial_stack:
	push ebp
	mov	ebp, esp ; создание стекового кадра

	mov	ecx, [ebp + 8] ; n
	mov	ebx, [ebp + 12] ; адрес nf

	cmp ecx, 0
	je RET_1
	cmp ecx, 1
	je RET_1
		
	dec ecx

	push ebx ; NF adress
	push ecx ; N - 1
	call factorial_stack
	
	add	esp, 8 ; возвращаем указатель на стек, можно сделать mov esp, ebp

	inc	ecx
	mov	eax, dword ptr [ebx]
	mul	ecx

	mov	dword ptr [ebx], eax
	jmp	EXIT

RET_1:	
	mov	dword ptr [ebx], 1

EXIT:
	pop	ebp
	ret	
END
