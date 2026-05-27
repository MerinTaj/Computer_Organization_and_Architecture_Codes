.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'MSG$'
    MSG2 DB 'SP$'      ; Added $ terminator for proper string display
    A DB 30H           ; Added variable A with initial value 30H
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 5
    
              ; Initialize loop counter
          MOV BL, A          ; BL = 30H (value from variable A)
    ADD BL, 03H        ; BL = 33H (30H + 03H)
    
    MOV AH, 2
    MOV DL, BL
    INT 21H            ; Display character (33H = '3')
    INT 21H            ; Display again
    
    INC BL             ; BL = 34H (33H + 1)
    SUB BL, 2          ; BL = 32H (34H - 2)
    
    MOV AH, 2
    MOV DL, BL
    INT 21H            ; Display character (32H = '2')
    
    ; Print MSG2 and exit
    MOV AH, 2
    MOV DL, 0DH
    INT 21H            ; Carriage return
    MOV DL, 0AH
    INT 21H
     jmp PRINT            ; Line feed
             ; Print MSG2
    ; Modified print loop with your requested changes
    PRINT:
     
        
             ; Print MSG1
        
        MOV BL, '$'    ; Your requested addition
        MOV AH, 2      ; Prepare for character output
        MOV DL, BL
        INT 21H        ; Display '$' character
        
        MOV BL, 0AH   ; Your requested addition
        MOV DL, BL
        INT 21H     
        
            ; Display line feed (same as LF)
           ; Display line feed (same as LF)
        
        DEC CX
        JNZ PRINT     ; Loop until CX=0
    
    ; Added arithmetic operations with BL
    
    
    MOV AH, 4CH
    INT 21H            ; Exit to DOS
MAIN ENDP
END MAIN