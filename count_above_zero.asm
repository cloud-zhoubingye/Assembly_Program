ASSUME CS:codesg,DS:datasg
datasg SEGMENT
    DAT1 DW 0A7H,2DH,88H
    LEN = $-DAT1
    RES1 DW 0
    RES2 DW 0
datasg ENDS
codesg SEGMENT
START:
    MOV AX,datasg
    MOV DS,AX
    MOV CX,LEN
    LEA SI,DAT1
    MOV BX,[SI]
S:
    CMP [SI],0
    JB LOWER
    JNB UPPER
S1:
    LOOP S
    JMP OVER
LOWER:
    INC RES2
    JMP S1
UPPER:
    INC RES1
    JMP S1
OVER:
    MOV AH,04CH
    INT 21H
codesg ENDS
END START