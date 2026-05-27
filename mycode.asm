.model small
.stack 100h
.data 
M dw 7F92h      ; Define M as a word (16-bit)
N dw 6BCBh      ; Define N as a word (16-bit)
a db "Enter the letter: $"
b db 0ah,0dh, "This is a number$ "
c db 0ah,0dh,"This is an alphabet$"  
result_msg1 db 0ah,0dh,"AX is greater than BBBBh after subtraction$"
result_msg2 db 0ah,0dh,"AX is NOT greater than BBBBh after subtraction$"

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ; Load AX and BX with given values
    mov ax, M    ; AX = 7F92h
    mov bx, N    ; BX = 6BCBh
    
    ; Subtract BX from AX (AX = AX - BX)
    sub ax, bx   ; AX = 7F92h - 6BCBh = 13C7h
    
    ; Compare AX with BBBBh
    cmp ax, 0BBBBH
    jg greater_than_BBBB
    jmp not_greater
    
greater_than_BBBB:
    mov ah, 9
    lea dx, result_msg1
    int 21h
    jmp input_check
    
not_greater:
    mov ah, 9
    lea dx, result_msg2
    int 21h
    
input_check:
    ; Now check if input is alphabet or number
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
    cmp bl, 'A'
    jge check_upper
    jmp is_number
    
check_upper:
    cmp bl, 'Z'
    jle is_alphabet
    jmp check_lower
    
check_lower:
    cmp bl, 'a'
    jge check_lower_z
    jmp is_number
    
check_lower_z:
    cmp bl, 'z'
    jle is_alphabet
    jmp is_number
    
is_alphabet:
    mov ah, 9
    lea dx, c
    int 21h
    jmp ending
    
is_number:
    mov ah, 9
    lea dx, b
    int 21h
    
ending:
    mov ah, 4ch
    int 21h
main endp
end main