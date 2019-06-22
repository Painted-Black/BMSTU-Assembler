.386
.model flat, C
public factorial_registers
.code

factorial_registers:
	push ebp
	mov ebp, esp ; ������� �������� ����

	mov eax, 1
	mov	ecx, [ebp + 8] ; n
	mov	ebx, [ebp + 12] ; ����� nf

	call f
	mov	dword ptr [ebx], eax
	pop ebp
	ret
f:
	jecxz EXIT ; �������� ���������� �� ��������� �����, ���� CX != 0
	mul ecx
	dec ecx
	call f
EXIT:
	ret
END