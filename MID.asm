.model small
.stack 100h
.data
 CR EQU 0DH
 LF EQU 0AH
 MSG1 DB 'MSG$'
 MSG2 DB 'SP'
 .CODE
 MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     MOV CX,5
     
     PRINT:
     LEA DX,MSG1
     MOV AH,9
     INT 21H
     MOV AH,2
     MOV DL,CR
     INT 21H
     MOV DL,LF
     INT 21H
     DEC CX
     JNZ PRINT
     MOV AH,2
     MOV DL,0DH
     INT 21H
     MOV DL,10
     INT 21H
     LEA DX,MSG2
     MOV AH,9
     
     INT 21H
     MOV AH,4CH
     INT 21H
     MAIN ENDP