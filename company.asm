ASSUME CS:codesg,DS:datasg,ES:tablesg

datasg SEGMENT
    db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'
    ;以上表示21年
    dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    ;以上表示21年里总收入
    dw 3,7,9,13,28,38,130,220,467,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800
    ;以上表示21年里公司雇员人数
datasg ENDS

tablesg SEGMENT
        db 21 dup ('year summ ne ?? ')
tablesg ENDS

codesg SEGMENT
START:
    MOV AX,datasg
    MOV DS,AX
    MOV AX,tablesg
    MOV ES,AX
    XOR BX,BX
    XOR SI,SI
    XOR DI,DI

    MOV CX,21
s:
        ;move year
    MOV AX,[BX]
    MOV ES:[DI],AX
    MOV AX,[BX+2]
    MOV ES:[DI+2],AX
        ;move backspace
    MOV BYTE PTR ES:[DI+4],20H
        ;move income
    MOV AX,[BX+84]
    MOV ES:[DI+5],AX
    MOV AX,[BX+86]
    MOV ES:[DI+7],AX
        ;move backspace
    MOV BYTE PTR ES:[DI+9],20H
        ;move employees
    MOV AX,[SI+168]
    MOV ES:[DI+10],AX
        ;move backspace
    MOV BYTE PTR ES:[DI+12],20H 
        
        ;calculate salary
    MOV AX,[BX+84]
    MOV DX,[BX+86]
    DIV WORD PTR DS:[SI+168]
    MOV ES:[DI+13],AX
    MOV BYTE PTR ES:[DI+0FH],20H
    
    ADD DI,16
    ADD SI,2
    ADD BX,4
LOOP s
    MOV AX,4C00H
    INT 21H
codesg ENDS
END START