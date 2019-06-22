;Составить подпрограмму с именем X_Y типа
;   Procedure (var X: LONGWORD; const Y:LONGWORD; L:LONGWORD)
;выполняющую вычитание битовых строк X:=X \ Y длины L. 

.386
.model FLAT,PASCAL
PUBLIC X_Y

.CODE
X_Y PROC
;П\П ВЫЧИТАНИЯ БИТОВЫХ СТРОК 
;X И Y ДЛИНЫ L
X EQU DWORD PTR[EBP+16] ; S1
Y EQU DWORD PTR[EBP+12] ; S2
LXY EQU DWORD PTR[EBP+8] ; длина
  PUSH EBP
  MOV EBP,ESP  ; создание стекового кадра
  PUSH ESI
  PUSH EDI
  MOV ECX,LXY
  SHR ECX,5
  MOV EDI,X
  MOV ESI,Y
  INC ECX
@M1:
  MOV EAX,[ESI]
  NOT EAX
  AND [EDI],EAX
  ADD EDI,4
  ADD ESI,4
  LOOP @M1
  POP EDI
  POP ESI
  POP EBP
  RET 12
X_Y ENDP
END
