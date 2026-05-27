.model small
.stack 100h
.data 
 a db  ?
 b db  ?
 c db  ?
 msg1 db "hello:$"
 msg2 db "meke :$"

.code
 main proc  
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h  
    
    lea dx, msg2
    int 21h
    
    
    
    
    
    
    
    
    main endp
 end main