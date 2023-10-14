assume cs:codesg,ds:datasg

datasg segment
	db 'Welcome to MASM'
	db 16 dup (0)
datasg ends

codesg segment
start:
	mov AX,datasg
	mov DS,AX
	mov SI,0
	mov ES,AX
	mov DI,16
	mov CX,16
	cld
	rep movsb
	mov AX,4c00h
	int 21h
codesg ends
end start
