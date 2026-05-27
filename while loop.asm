.model small
.stack 100h
.data
  m1 db "cont:$"
.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 0          
    mov ah, 1
    int 21h

while:
    cmp al, 0dh
    je endl
    inc cx          
    int 21h
    jmp while

endl:  
   
    mov ah, 9
    lea dx, m1
    int 21h
    
    mov dl, cl       
    mov ah, 2         
    add dl, 30h        
    int 21h 
               
    mov ah, 4Ch        
    int 21h

end main  
    
