.model smell
.stack 100h
.data 
a db '5'
m1 db "enter the value :$"
m2 db 0AH,0dh, "the value is greter then6 $"                                                
m3 db 0AH,0dh, "the value is less then6 $"
m4 db 0AH,0dh, "the value is 6$"  

.code
   
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,a
    jg L1
    jl L2
    je L3
    
    L1:
    mov ah,9
    lea dx,m2
    int 21h
    jmp ending
                 
    L2:
    mov ah,9
    lea dx,m3
    int 21h
    jmp ending 
    
    L3:
    mov ah,9
    lea dx,m4
    int 21h  
    jmp ending
    
    ending:
    mov ah,4ch
    int 21h
    