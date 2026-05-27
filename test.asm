.model small

.stack 100h

.data

m1 db "the number is even$"

m2 db 0ah,0dh,"the number is odd $"

m3 db 0ah,0dh,"the number of zero is :$"

m4 db 0ah,0dh,"the number of one is :$"    

countzero db 0

countone db 0

.code

main proc

    mov ax,@data

    mov ds,ax

    ;checking even or odd hobe kina

    mov al,1Ah

    test al,01h

    jz even 

    jmp odd

even:

    mov ah,9

    lea dx,m1

    int 21h

    jmp counting

odd:

    mov ah,9

    lea dx,m2

    int 21h

counting:

    mov countzero, 0

    mov countone, 0

    mov al, 1Ah  

    mov cx, 8    

shift1:

    shl al, 1    

    jc one      

    jmp zero     

one:

    inc countone

    loop shift1 

    jmp display_results

zero:

    inc countzero

    loop shift1

display_results:

    mov ah,9

    lea dx,m3

    int 21h

    mov dl,countzero

    add dl,'0'

    mov ah,2

    int 21h


    mov ah,9

    lea dx,m4

    int 21h

    mov dl,countone

    add dl,'0'

    mov ah,2

    int 21h

    ; Exit program

    mov ah,4ch

    int 21h

main endp

end main
 