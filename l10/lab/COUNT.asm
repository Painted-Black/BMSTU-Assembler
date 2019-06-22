;Составить подпрограмму с именем Count типа
;      function (const S: LONGWORD; L:LONGWORD)
;возвращающую число единиц битовой строки S длины L.
.386
.model FLAT,PASCAL
PUBLIC COUNT

.CODE
COUNT:
X EQU DWORD PTR[EBP+12] ; строка
L EQU DWORD PTR[EBP+8] ; длина строки
  PUSH EBP
  MOV EBP,ESP ; создание стекового кадра
  PUSH EBX
  MOV EAX,0
  MOV EBX,X
  MOV ECX,L
M0:
  MOV EDX,1
M:
  TEST [EBX],EDX ; логическое И, влияет только на флаги, результат никуда не записывается
  JZ M2
  INC EAX
M2:
  DEC ECX
  JZ M4
  SHL EDX,1 ; логический сдвиг влево 
  JC M3 ; если есть переполнение, признак переполнения -- флаг CF
  JMP M
M3:
  ADD EBX,4
  JMP M0
M4:
  POP EBX
  POP EBP
  RET 8
END
