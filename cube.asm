 ASSUME CS:codesg,DS:datasg
 datasg SEGMENT
    DW 1,2,3,4,5,6,7,8
    DD 0,0,0,0,0,0,0,0
datasg ENDS
codesg SEGMENT
START:
    MOV AX,datasg
    MOV DS,AX
    MOV SI,0
    MOV DI,16
    MOV CX,8
S:
    MOV BX,[SI]
    CALL CubeCalculate
    MOV [DI],AX
    MOV [DI+2],DX
    ADD SI,2
    ADD DI,4

    LOOP S
    MOV AX,4C00H
    INT 21H
CubeCalculate:
    MOV AX,BX
    MUL BX
    MUL BX
    RET
codesg ENDS
END START