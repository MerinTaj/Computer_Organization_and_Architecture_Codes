.model small
.stack 100h
.data
m1 db ,0ah,0dh,"Count:$" 
  
.code 

 main proc
    mov ax, @data
    mov ds, ax
    mov cl, 0          
 
Repeat:
 
    mov ah, 1
    int 21h
    cmp al, ' '
    je endl
    inc cl         
    jmp Repeat

endl:  
   
    mov ah, 9
    lea dx, m1
    int 21h
     
    mov ah, 2 
    mov al, cl       
            
    add al, 30h
    mov dl,al        
    int 21h 
               
    mov ah, 4Ch        
    int 21h

end main  