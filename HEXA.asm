.model small
.stack 100h
.data
m1 db "please enter :$"
m2 db "output :$" 
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
    
    xor bx,bx
    mov cX,4
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
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,m2
    int 21h 
    MOV CX,4
    
    
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