.model small
.stack 100h
.data 
msg2 db "enter :$"
msg1 db 0AH,0DH, "ot :$"
msg3 db 0AH,0DH, "invalid$"

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    xor bx,bx
    mov cx,16
    
input: 
    mov ah,1
    int 21h
    cmp al,0dh
    je output_prepare
    cmp al,'0'
    je valid
    cmp al,'1'
    je valid
    jmp invalid

valid:
    and al,0Fh
    shl bx,1
    or bl,al
    loop input

output_prepare:
    mov ah,9
    lea dx,msg1
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
    jmp continue

continue:
    loop output
    mov ah,4ch
    int 21h

invalid:
    mov ah,9
    lea dx,msg3
    int 21h
    mov ah,4ch
    int 21h

main endp
end main
