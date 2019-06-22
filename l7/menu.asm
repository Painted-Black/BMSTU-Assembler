PUBLIC Print_Menu

DSEG	SEGMENT PARA PUBLIC 'DATA'
	menu    db 13,10,'0. Otobrazit menu:'
	        db 13,10,'1. Vvod tcelogo v slovo X'
	        db 13,10,'2. Vivod iz X kak dvoichnogo tcelogo bez znaka'
	        db 13,10,'3. Vivod iz X kak dvoichnogo tcelogo so znakom'
	        db 13,10,'4. Vivod iz X kak desyatichnogo tcelogo bez znaka'
	        db 13,10,'5. Vivod iz X kak desyatichnogo tcelogo so znakom'
	        db 13,10,'6. Vivod iz X kak shestnadtsaterichnogo tcelogo bez znaka'
	        db 13,10,'7. Vivod iz X kak shestnadtsaterichnogo tcelogo so znakom'
	        db 13,10,'8. Vihod iz programmi$'
DSEG	ENDS

CSeg	SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSeg, DS:DSEG	

Print_Menu PROC NEAR
	mov  ah,9
	mov  dx, offset menu	
	int  21h	
	ret
Print_Menu ENDP

CSeg ENDS
END 