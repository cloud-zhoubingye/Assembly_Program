assume cs:codesg
codesg segment
	dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
	dw 0,0,0,0,0,0,0,0,0,0
start:
	mov ax,cs:[10h]
	mov ss,ax
	mov sp,24h

	mov ax,0
	mov ds,ax
	mov bx,0
	mov cx,8
s:	push [bx]
	pop cs:[bx]
	add bx,2
	loop s

	mov ax,4c00h
	int 21h
codesg ends
end start