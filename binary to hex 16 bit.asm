.model small
.stack 100h
.data 
msg2 db "enter :$"
msg1 db 0AH,0DH, "ot :$"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    xor bx,bx
    mov cx,16
    mov ah,1

input:
    int 21h
    cmp al,0dh
    je output_prepare
    and al,0Fh
    shl bx,1
    or bl,al
    loop input

output_prepare:
    mov ah,9
    lea dx,msg1
    int 21h

    mov cx,4

output:
    mov ah,2
    mov dl,bh
    shr dl,4
    rol bx,4
    cmp dl,10
    jge output_letter
    add dl,30h
    int 21h
    jmp continue

output_letter:
    add dl,37h
    mov ah,2
    int 21h

continue:
    loop output

    mov ah,4ch
    int 21h
main endp
end main
