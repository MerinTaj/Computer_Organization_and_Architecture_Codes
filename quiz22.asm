.model small
.stack 100h
.data
.code
main proc
mov cx,4  
mov Bl,7

SHIFT:
shl Bl,1
jnc l1
jmp l2 

l1:
xor DL,DL
mov ah, 2
add dl,31h       ; Shift original value
and bl,0D6h    ; Apply mask
inc bl  
int 21h 

mov dl,10
int 21h
mov dl,13
int 21h 
loop SHIFT 
JMP ENDL

l2:
xor DL,DL
mov ah,2
add dl,35h
or bl,0Fh 
mov dl,10
int 21h
mov dl,13
int 21h 
loop SHIFT

ENDL:       ; Increment
mov ax, 4Ch   ; Exit
int 21h  

main endp
end 