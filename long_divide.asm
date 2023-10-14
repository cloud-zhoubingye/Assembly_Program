ASSUME CS:codesg,DS:datasg
datasg SEGMENT
    DA1 DW 12H,12H,12H,12H
datasg ENDS
codesg SEGMENT
START:
    MOV AX,datasg
    MOV DS,AX
    LEA DI,DA1
    MOV CX,3
S:
    MOV AX,[DI+6]
    RCR AX,1
    MOV [DI+6],AX
    MOV AX,[DI+4]
    RCR AX,1
    MOV [DI+4],AX
    MOV AX,[DI+2]
    RCR AX,1
    MOV [DI+2],AX
    MOV AX,[DI]
    ROR AX,1
    MOV [DI],AX
    LOOP S

    MOV AH,04CH
    INT 21H
codesg ENDS
END START