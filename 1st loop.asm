.model small
.stack 100h
.data
m1 db "Hello world",0ah,0dh,'$'


.code

mov ax,@data
mov ds,ax
mov cx,10
 
print:
mov ah,9 
lea dx,m1
int 21h
loop print

endl:
mov ah,4ch
int 21h


