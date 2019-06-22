.386
.model flat, C
public factorial_registers
.code

factorial_registers:
	push ebp
	mov ebp, esp ; создаем стековый кадр

	mov eax, 1
	mov	ecx, [ebp + 8] ; n
	mov	ebx, [ebp + 12] ; адрес nf

	call f
	mov	dword ptr [ebx], eax
	pop ebp
	ret
f:
	jecxz EXIT ; передает управление на указанный адрес, если CX != 0
	mul ecx
	dec ecx
	call f
EXIT:
	ret
END