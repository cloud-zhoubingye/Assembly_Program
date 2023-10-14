ASSUME CS:codesg,DS:datasg
datasg SEGMENT
    DA1 DB 12H,12H,12H,12H,12H,12H,12H,12H
    DA2 DB 12H,12H,12H,12H,2H,12H,2H,12H
    RES1 DB 0,0,0,0,0,0,0,0,0
datasg ENDS
codesg SEGMENT
START:
    MOV AX,datasg
    MOV DS,AX
    LEA DI,DA1
    LEA SI,DA2
    LEA BX,RES1
    MOV CX,7
    MOV AL,[DI+7]
    SUB AL,[SI+7]
    MOV [BX+7],AL
S:
    MOV BP,CX
    DEC BP
    MOV AL, [DI+BP]
    SBB AL,[SI+BP]
    MOV [RES1+BP],AL
    LOOP S
    MOV AH,04CH
    INT 21H
codesg ENDS
END START