.model small
.stack 100h
.data
m1 db "pos:$"
m2 db 0ah,0dh,"neg:$"
m3 db 0ah,0dh,"eq:$"  

.code

mov ax,@data
mov ds,ax

mov bl,9
cmp bl,0
jg pos
jl neg
je zero

pos:
mov ah,9
lea dx,m1
int 21h
jmp ending 

neg:
mov ah,9
lea dx,m2
int 21h
jmp ending

zero:
mov ah,9
lea dx,m3
int 21h
jmp ending

ending:
mov ah,4ch
int 21h