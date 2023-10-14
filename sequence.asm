ASSUME DS:DATA,CS:CODE
DATA SEGMENT
BUFA DB 20,20,20,10,3
    DB 30,9,10,20,40
    DB 20,13,34,9,7
    DB 10,10,26,10,10
    M EQU 4
    N EQU 5
BUFS DW M+2 DUP(?)
DATA ENDS
;计算每行之和，并存入BUFS中
CODE SEGMENT
START:
    ;初始化寄存器
    MOV AX,DATA
    MOV DS,AX
    LEA SI,BUFA
    LEA DI,BUFS
    ;每一行分别计算
    MOV CX,4
S0:
        ;计算每一行之和
        MOV DX,5    ;DX作为循环标志
        MOV BX,0    ;初始化BX，作为sum
    S1:
        MOV AL,[SI]
        CBW
        ADD BX,AX   ;BX存储求和结果
        INC SI
        DEC DX
        CMP DX,0
        JNZ S1
    ;结果存入
        MOV [DI],BX
        ADD DI,2
    LOOP S0
    ;回显输出
    MOV [DI],"!"
    MOV [DI+2],"$"
    MOV AX,SEG BUFS
    MOV DS,AX
    MOV DX,OFFSET BUFS
    MOV AH,9
    INT 21H
    ;结束
    MOV AX,04CH
    INT 21H
CODE ENDS
END START