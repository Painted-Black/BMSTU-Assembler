.386
.model flat, C
public factorial_loop
.code

factorial_loop:
	push ebp
	mov ebp, esp

	mov eax, [ebp+8] ; get N value from stack
	mov ebx, [ebp+12] ; get NF adress from stack
	
	cmp eax, 0
	jne cp
	inc eax
cp:
	cmp eax, 1
	je res

	dec eax
	mov ecx, eax
	inc eax
l:
	mul ecx
	loop l

res:
	mov [ebx], eax
	pop ebp
	ret
end

