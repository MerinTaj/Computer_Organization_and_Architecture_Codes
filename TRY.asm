.model small
.stack 100h
.data
  msg1 db " number are :$"       
  msg2 db " sum are :$"
  
.code

main proc
            
            mov ax, @data
            mov ds,ax
            
            mov ah,9
            lea dx,msg1
            int 21h
            
            
              mov ah,2
            mov bh,02h
            
            int 21h
            mov bl,03h
            int 21h
            mov ch,04h
            int 21h
            
            mov DL,0Ah
            int 21h
            mov DL, 0Dh
            int 21h
            
            mov cl,bh
            add cl,bl 
            add cl,ch
            add cl,30h
            
            mov ah,9
            lea dx,msg2
            int 21h  
            
            MOV AH,2
            
            mov dl,cl
            int 21h
    
    
    
    
     mov ah,4ch
     int 21h
    
    main endp

end main