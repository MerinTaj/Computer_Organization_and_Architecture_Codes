.model small
.stack 100h
.data
a db  'a'
msg1  db "enter letter : $"
msg2  db "output :$"

.code

main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h 
    
   
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ah,2
    mov bl,a
    sub bl,20h 
    
   
    
    mov dl,bl  
    int 21h
    
    main endp

end main
    
    
    