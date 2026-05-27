.MODEL SMALL
.STACK 100H
.DATA
    A DB 'HELLOS$'    ; $ terminator for string printing
    B DB 'BESTS$'
    C DB 'FRIENDS$'
    D EQU 10          ; Line feed (LF)
    E EQU 13          ; Carriage return (CR)
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 5         ; Initialize loop counter

AA:
    LEA DX, A         ; Load address of A
    MOV AH, 9         ; Print string function
    INT 21H           ; Print "HELLOS"

    MOV AH, 2         ; Character output function
    MOV DL, D         ; Line feed
    INT 21H
    MOV DL, E         ; Carriage return
    INT 21H

    DEC CX            ; Decrement counter
    CMP CX, 3         ; Compare with 3
    JG AA             ; Jump if greater (CX > 3)

BB:
    LEA DX, B         ; Load address of B
    MOV AH, 9
    INT 21H           ; Print "BESTS"

    MOV AH, 2
    MOV DL, D         ; Line feed
    INT 21H
    MOV DL, E         ; Carriage return
    INT 21H

    DEC CX            ; Decrement counter
    CMP CX, 0         ; Compare with 0
    JNLE BB           ; Jump if not less or equal (CX > 0)

    LEA DX, C         ; Load address of C
    MOV AH, 9
    INT 21H           ; Print "FRIENDS"

    MOV AH, 2
    MOV DL, D         ; Line feed
    INT 21H
    MOV DL, E         ; Carriage return
    INT 21H

EXIT:
    LEA DX, C         ; Print "FRIENDS" again
    MOV AH, 9
    INT 21H

    MOV AH, 4CH       ; Exit to DOS
    INT 21H
MAIN ENDP
END MAIN