.model small


.stack 100h


.data   

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


    cmp a, '2'

    je even

    cmp a, '4'

    je even 

    cmp a, '6'

    je even 


     cmp a, '1'

    je odd 

    cmp a, '3'

    je odd 

    cmp a, '5'

    je odd  

     even:

    mov ah,9

    lea dx,m1

    int 21h 

    jmp ending  


     odd:


    mov ah,9

    lea dx,m2

    int 21h 

    jmp ending  


      ending:

      mov ah,4ch

      int 21h 

 