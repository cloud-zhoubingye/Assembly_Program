;计算F=sqrt(2X)+sqrt(3Y)+sqrt(150)
;其中，X，Y均存储在数据段
ASSUME CS:codesg,DS:datasg
datasg SEGMENT
    X DW 100 
    Y DW 149
    RESULT DW 0
datasg ENDS
codesg SEGMENT

;计算平方根
sqrt PROC
    PUSH AX
    PUSH BX
    MOV AX,0    ;用于计数，初始化为0
    CMP DX,0
    JZ sqrt_over    ;被开方数为0
sqrt_process:
    MOV BX,AX
    SHL BX,1
    INC BX  ;形成奇数
    SUB DX,BX
    JC sqrt_over    ;不够减，无法完全开方为整数，截断
    INC AX
    JMP sqrt_process
sqrt_over:
    MOV DX,AX
    POP BX
    POP AX
    RET
sqrt ENDP
;主程序
START:
    MOV AX,datasg
    MOV DS,AX
    ;计算F=sqrt(2X)+sqrt(3Y)+sqrt(150)
    ;计算sqrt(2X)
    MOV AX,X
    ADD DX,DX
    CALL sqrt
    PUSH DX
    ;计算sqrt(3Y)
    MOV DX,Y
    MOV AX,DX
    ADD DX,DX
    ADD DX,AX
    CALL sqrt
    PUSH DX
    ;计算sqrt(150)
    MOV DX,5
    CALL sqrt
    ;求和
    POP AX
    POP BX
    ADD AX,BX
    ADD AX,DX
    ;存储结果
    MOV RESULT,AX
    ;结束
    MOV DL,'!'
    MOV AH,2
    INT 21H
    MOV AX,04CH
    INT 21H
codesg ENDS
END START
