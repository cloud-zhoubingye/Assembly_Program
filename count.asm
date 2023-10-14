;计算三组字数据中大于0、小于0、等于0的数的个数
ASSUME CS:codesg,DS:datasg

datasg SEGMENT
    ARR1 DW 1,-2,3,4,0,-5,2,2,-4,0,0,0,3,4,0,-5,2,2,1,0,0,3,4,0,0
    CNT1 EQU $-ARR1
    ARR2 DW -1,-2,-4,0,0,0,0,1,1,1,1,1,1,1,1,1,1,3,4,5,6,7,8,9,6,3
    CNT2 EQU $-ARR2
    ARR3 DW 0,0,0,0,0,0,0,0,0,0,-1,2,2,-4,0,0,0,3,4,0,-5,2,2,1,0,0
    CNT3 EQU $-ARR3
    ABOVE_CNT DW 0
    BELOW_CNT DW 0
    ZERO_CNT DW 0
    ADDRESS DW OFFSET ARR1,OFFSET CNT1
        DW OFFSET ARR2,OFFSET CNT2
        DW OFFSET ARR3,OFFSET CNT3
datasg ENDS

codesg SEGMENT
;计算一行中大于0个数
PROC_ABOVE PROC
    
PROC_ABOVE ENDP
;计算一行中大于0个数
PROC_BELOW PROC
    
PROC_BELOW ENDP
;计算一行中等于0个数
PROC_ZERO PROC
    
PROC_ZERO ENDP
;主程序
BEGIN:
    MOV AX,datasg
    MOV DS,AX
    LEA DI,ADDRESS
    MOV CX,3
COUNT:
    MOV SI,[DI] ;取数组首地址
    MOV BX,[DI+2]  ;取数组个数首地址
    
    MOV AX,04CH
    INT 21H
codesg ENDS
END BEGIN