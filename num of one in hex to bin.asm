.model small
.stack 100h
.data
m1 db "please enter :$"
m2 db 13,10,"output :$"
m3 db 13,10,"number of zeros :$"
m4 db 13,10,"number of ones  :$"
countzero db 0
countone db 0

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
    mov countzero,0
    mov countone,0

output:
    shl bx,1
    jnc zero
    jmp one

one:
    inc countone        
    mov ah,2
    mov dl,'1'
    int 21h
    jmp continue

zero:
    inc countzero       
    mov ah,2
    mov dl,'0'
    int 21h

continue:
    loop output
    mov ah,9
    lea dx,m3
    int 21h

    mov al,countzero
    add al,'0'
    mov dl,al
    mov ah,2
    int 21h

    mov ah,9
    lea dx,m4
    int 21h

    mov al,countone
    add al,'0'
    mov dl,al
    mov ah,2
    int 21h

    mov ah,4ch
    int 21h
