.model small 

.stack 100h 

.data 

a db ? 

b db ?

c db ?

m1 db 0Ah,0Dh,"Number is grater $ " 

m2 db 0Ah,0Dh,"Number is small $"

m3 db 0Ah,0Dh,"Number is equal $"

m0 db 0Ah,0Dh,"enter the number:$"

m5 db 0Ah,0Dh,"show the sum:$"

.code 

main proc    

    mov ax,@data 

    mov ds,ax

    mov ah,9

    lea dx,m0 

    int 21h 

    mov ah,1

    int 21h 

    mov a,al 

     mov ah,9

    lea dx,m0

    int 21h 

    mov ah,1

    int 21h 

    mov b,al 

    mov ah,9

    lea dx,m5

    int 21h  

    mov ah,2 

    mov bl,a 

    add bl,b

    sub bl,30h

    mov dl,bl 

    int 21h 

     mov ah,9

    lea dx,m0 

    int 21h 

    mov ah,1

    int 21h 

    mov c,al

    cmp bl,c 

    jg gratter 

    cmp bl,c

    jl less 

    cmp bl,c 

    je equal 

    gratter: 

    mov ah,9

    lea dx,m1

    int 21h 

    jmp ending

    less: 

    mov ah,9

    lea dx,m2

    int 21h 

    jmp ending 


     equal: 

    mov ah,9

    lea dx,m3

    int 21h 

    jmp ending

    ending:

    mov ah,4ch

    int 21h  



    main endp 

end main 

 