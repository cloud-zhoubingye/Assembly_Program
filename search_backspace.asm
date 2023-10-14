ASSUME CS:codesg,DS:datasg
datasg SEGMENT
    STR DB 'A','x',' ','-','0'
    LEN = $-STR
    POSI DW 0
datasg ENDS
codesg SEGMENT
START:
    MOV AX,datasg
    MOV DS,AX
    LEA SI,STR
    MOV CX,LEN
S:
    CMP [SI],' '
    JZ EQUAL
    INC SI
    LOOP S
    JMP OVER
EQUAL:
    MOV POSI,SI
    JMP OVER
OVER:
    MOV AH,04CH
    INT 21H
codesg ENDS
END START