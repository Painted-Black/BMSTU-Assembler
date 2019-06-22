.386
.model FLAT,C

include MacroLib.txt

public START

.DATA

.CODE
START PROC

;PUSHR <ESI,EDI,EBX,EBP>
;POPR <ESI,EDI,EBX,EBP>

RET
START ENDP

;SIN PROC
;create_func M1, VOID, <X, Y>, <>
;ret
;SIN ENDP

END