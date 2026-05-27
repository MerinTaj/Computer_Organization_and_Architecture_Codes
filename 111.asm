.model small
.stack 100h
.data
a db ?
b db ?
c db ? 
d db ?
msg1 db 0ah,0dh,"enter the number :$"  
msg2 db 0ah,0dh, "sum :$"
msg3 db 0ah,0dh, "great :$"   
msg4 db 0ah,0dh, "great not :$" 
msg5 db 0ah,0dh,"equal$"
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov a,al   
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov b,al  
    
    mov ah,2
    mov bl,a
    add bl,b
    sub bl,30h 
    
    mov ah,9
    lea dx,msg2
    int 21h
     mov ah,2
     mov dl,bl
     int 21h
                
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov c,al   
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov d,al  
    
    mov ah,2
    mov cl,c
    add cl,d
    sub cl,30h 
    
    mov ah,9
    lea dx,msg2
    int 21h
     mov ah,2
     mov dl,cl
     int 21h  
     
     cmp bl,cl
     jg great 
     cmp bl,cl
     jl notg 
     cmp bl,cl
     je equal
     
     great:
     mov ah, 9
     lea dx,msg3
     int 21h
     jmp ending  
     
     equal:
      mov ah, 9
     lea dx,msg5
     int 21h
     jmp ending  
     
     notg:  
     mov ah, 9
     lea dx,msg4
     int 21h
     jmp ending 
     
     ending:
     mov ah,4ch
     int 21h
     
     
     
     
                  
                  
                  
              
    
    
    