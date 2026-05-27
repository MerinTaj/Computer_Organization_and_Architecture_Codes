.model small


.stack 100h


.data 

aa db 2DH  

m0 db " enter input $"  

m1 db  0AH,0DH, "even$"

m2 db 0AH,0DH," odd $"

a db ?

.code 

main proc 

    mov ax,@data 

    mov ds , ax

    mov ah,9 

    lea dx,m0 

    int 21h 

    mov ah,1 

    int 21h 

    mov a,al