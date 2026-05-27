.model small
.stack 100h
.data   
m0 db "Enter an input : $"
m1 db 0Ah,0dh,"Number $"
m2 db 0ah,0dh,"invalid $"
a db ?


.code
main proc  
    mov ax, @data
    mov ds,ax      
    
    mov ah,9
    lea dx , m0
    int 21h
    mov ah ,1
    int 21h
    mov a,al
    
    cmp a,'0'
    jge check
    jmp invalid
    
    check:
    cmp a,'9'
    jle number 
    jmp invalid
    
    number:
    mov ah,9 
    lea dx,m1
    int 21h
    jmp ending
    
    
    invalid:
     mov ah,9 
    lea dx,m2
    int 21h
    jmp ending
    
    
    
    
    
   ending:
    mov ah,4cH
    int 21h