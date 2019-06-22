.386
.model FLAT,PASCAL
PUBLIC START
extern X_U_Y:near, X_Y:near, SetCler:near, COUNT:near

.DATA
S 	DD 0,0,0,0
S1 	DD 00001111000011110000111100001111B,1010101B 
           ;0-38 - РАЗРЯДЫ СТРОКИ
S2 	DD 00111100001111000011110000111100B,1000001B 
           ;0-38 - РАЗРЯДЫ СТРОКИ
L DD 39;= ДЛИНА СТРОКИ = 100111b


.CODE
START:
   PUSH OFFSET S1
   PUSH L
   CALL COUNT

   PUSH OFFSET S
   PUSH 34
   PUSH 1
   CALL SetCler ;S2,34 

   PUSH OFFSET S
   PUSH 34
   PUSH 0
   CALL SetCler ;S2,34 

   PUSH OFFSET S1
   PUSH OFFSET S2
   PUSH L
   CALL X_Y     ; S1,S2,38
RET
END
