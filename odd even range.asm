.model smell
.stack 100h
.data
a db "Enter :$"
b db 0ah,0dh,"It is VOWEL$"
c db 0ah,0dh,"It is CONSONENT$"
e db 0ah,0dh,"it is a number$" 
d db 0ah,0dh,"the number is invalid $"


.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah ,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'A'
    jge l1
    jmp ll4
    
    l1:
    cmp bl,'Z'
    jle l2
    jmp ll4
    
    L2:  
    cmp bl,'A'
    je Vowel
   
     cmp bl,'E'
    je Vowel
    
     cmp bl,'I'
    je Vowel
   
     cmp bl,'O'
    je Vowel
     
     cmp bl,'U'
    je Vowel
    jmp cons 
    
     Vowel:
     mov ah,9
     lea dx,b
     int 21h
     jmp ending 
     
     cons:
     mov ah,9
     lea dx,c
     int 21h
     jmp ending 
      
       
  
    mov ah,2
    int 21h 
    
    ll4:
    cmp bl,'0'
    jge ll1
    jmp invl
    
    ll1:
    cmp bl,'9'
    jle ll2
    jmp invl
    
    ll2:
     mov ah,9
     lea dx,e
     int 21h
     jmp ending 
     
     
    invl:
    mov ah,9
    lea dx,d
    int 21h 
    jmp enter
    
    enter:
     
     mov ah,9
    lea dx,a
    int 21h 
    mov ah,1
    int 21h
    jmp ending
    
    
    
    ending:
    mov ah,4ch
    int 21h