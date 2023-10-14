;冒泡排序
ASSUME DS:datasg,CS:codesg
datasg SEGMENT
    BUF DB 57,49,53,55,48,50,51,52,56,54,57,"$","$"   ;共10个数
    N EQU 10
datasg ENDS
codesg SEGMENT
start:
    ;初始化寄存器
    MOV AX,datasg
    MOV DS,AX
    LEA BX,BUF  ;BUF偏移量
    MOV SI,0    ;外循环初始值

;【【【【【【每一次让一个最小的数移到(该次的)最前面
OUTSIDE_LOOP:
    MOV DI,SI
    INC DI  ;内循下标值
    MOV AL,[BX+SI]

    ;【【【AL中的数与后面每一个数相比较
    INSIDE_LOOP:
        CMP AL,[BX+DI]
        JBE AFTER_CHANGE    ;已经递增排序，不需要交换
        XCHG AL,[BX+DI]
    AFTER_CHANGE:
        ;判断内循环继续条件
        INC DI
        CMP DI,N
        JB INSIDE_LOOP
    MOV [BX+SI],AL  ;比较结束，存放当前最小的那个数
    ;AL中的数与后面每一个数相比较】】】

    ;判断内循环继续条件
    INC SI
    CMP SI,N
    JBE OUTSIDE_LOOP
;每一次让一个最小的数移到(该次的)最前面】】】】】

    ;回显排序结果
    MOV AX,SEG BUF
    MOV DS,AX
    LEA DX,BUF
    MOV AH,9
    INT 21H

    ;结束退出
    MOV AX,04CH
    INT 21H
codesg ENDS
END start