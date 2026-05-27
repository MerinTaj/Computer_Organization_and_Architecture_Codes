.model small
.stack 100h
.data   
m0 db "Enter an input : $"
m1 db 0Ah,0dh,"input is great than 5 $"
m2 db 0ah,0dh,"Input is less than 5 $"
m3 db 0ah,0dh,"input is equal to 5 $"
a db  'A'


.code
main proc  
    mov ax, @data
    mov ds,ax      
    
    mov ah,9
    lea dx , m0
    int 21h
    mov ah ,1
    int 21h
    mov bl,al
    cmp bl,a
    jg L1
    jl L2
    je L3
    
    L1:
    mov ah,9
    lea dx,m1
    int 21h    
    jmp ending
    
    L2:
    mov ah,9
    lea dx,m2
    int 21h 
    jmp ending
    
    L3:
    mov ah,9
    lea dx,m3
    int 21h
    
    
    ending:
    mov ah,4cH
    int 21h