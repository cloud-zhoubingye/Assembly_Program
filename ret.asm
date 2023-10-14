ASSUME CS:codesg,SS:stacksg
stacksg SEGMENT
      db 16 dup (0)
stacksg ENDS
codesg SEGMENT
    MOV AX,4C00H
    INT 21H
START:
    MOV AX,stacksg
    MOV SS,AX
    MOV SP,16
    MOV AX,0
    PUSH AX
    MOV BX,0
    RET
codesg ENDS
END START