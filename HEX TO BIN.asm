.model small
.stack 100h
.data
m1 db "please enter :$"
m2 db 13,10,"output :$" 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
    
    xor bx,bx
    mov cx,4
    mov ah,1

intput:
    int 21h
    cmp al,0dh
    je OT
    cmp al,41h
    jge letter
    and al,0fh
    jmp shift

letter:
    sub al,37h

shift:
    shl bx,4
    or bl,al
    jmp intput  

OT:
    mov ah,9
    lea dx,m2
    int 21h 

    mov cx,16

output:
    shl bx,1
    jnc zero
    jmp one

one:
    mov ah,2
    mov dl,'1'
    int 21h
    jmp continue

zero:
    mov ah,2
    mov dl,'0'
    int 21h

continue:
    loop output

    mov ah,4ch
    int 21h
main endp
end main
