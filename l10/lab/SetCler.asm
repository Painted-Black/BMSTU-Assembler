;Составить подпрограмму с именем Set1 типа
;   Procedure (var X: LONGWORD; N:LONGWORD; P:LONGWORD)
;выполняющую установку разряда N битовой строки S 
;в ноль, если P=0, в единицу,если P не равен 0.
.386
.model FLAT,PASCAL
PUBLIC SetCler 

.CODE
SetCler PROC
X EQU DWORD PTR[EBP+16]
N EQU DWORD PTR[EBP+12] ; N
P EQU DWORD PTR[EBP+8] ; P
  PUSH EBP
  MOV EBP,ESP ; создание стекового кадра
  PUSH EBX
  PUSH EDI
  
  MOV EDI,N ; 100111b
  SHR EDI,5 ; логический сдвиг вправо, в CF записывается последний сдвинутый бит
  MOV ECX,N
  AND ECX,11111B
  MOV EAX,1
  SHL EAX,CL
  MOV EBX,X
  CMP P,0
  JE M1
  OR [EBX+EDI*4],EAX
  JMP M2
M1:
  NOT EAX
  AND [EBX+EDI*4],EAX
  
M2:
  POP EDI
  POP EBX
  POP EBP
  RET 12
SetCler ENDP
END
