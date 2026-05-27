.model small
.stack 100h
.data
    num1 db ?
    num2 db ?
    num3 db ?
    msg1 db "First number: $"
    msg2 db 0ah,0dh,"Second number: $"
    msg3 db 0ah,0dh,"Third number: $"
    result db  " is the biggest number.$"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Input first number
    mov ah, 9
    lea dx, msg1
    int 21h
    mov ah, 1
    int 21h
    mov num1, al
    
    ; Input second number
    mov ah, 9
    lea dx, msg2
    int 21h
    mov ah, 1
    int 21h
    mov num2, al
    
    ; Input third number
    mov ah, 9
    lea dx, msg3
    int 21h
    mov ah, 1
    int 21h
    mov num3, al
    
     mov ah,2
    mov dx,0ah
    int 21h
    mov dx,0dh
    int 21h
    
    ; Find biggest number
    mov al, num1
    cmp al, num2
    jg compare_third
    mov al, num2
    
compare_third:
    cmp al, num3
    jg display
    mov al, num3
    
display: 
   
    ; Display result
    mov ah, 2
    mov dl, al
    int 21h
    
    mov ah, 9
    lea dx, result
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main