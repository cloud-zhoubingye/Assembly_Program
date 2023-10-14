assume cs:codesg
codesg segment
start:
	mov dx,1h
	mov ax,86a1h
	mov bx,64h
	div WORD PTR bx
	
	mov ax,4c00h
	int 21h
codesg ends
END start