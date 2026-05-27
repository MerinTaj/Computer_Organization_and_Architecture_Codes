.model small
.stack 100h

.data
 
 
.code

 
 
 main proc
    
        mov bh, 07h
        mov bl, 02h
    
        mov ah,2
    
      
        mov dl,bh   
         int 21h 
    
         main endp
 
 
 end main 