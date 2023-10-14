ASSUME CS:codesg,DS:datasg
datasg SEGMENT
    ARY1 DW 0A7H,2DH,88H
    LEN = $-ARY1
    RES1 DW 0
datasg ENDS
codesg SEGMENT
START:
    MOV AX,datasg
    MOV DS,AX
    MOV CX,LEN
    LEA SI,ARY1
    MOV BX,[SI]
S:
    CMP [SI],BX
    JG Greater
S1:
    LOOP S
    JMP OVER
Greater:
    MOV BX,[SI]
    JMP S1
OVER:
    MOV RES1,BX
    MOV AH,04CH
    INT 21H
codesg ENDS
END START