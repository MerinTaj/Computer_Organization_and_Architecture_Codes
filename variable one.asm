.model small
.stack 100h

.data
    ;byte db
    ;word dw
  a db 05h
  b db 02h 
  c db 01h  
  msg1 db "enter three input :$" ;doller sign dite hobe end hole msg cotetion er bahire 
  msg2 db "sumation:$"
 
.code

 
 
 main proc
    
    mov ax, @data
    mov ds,ax
       mov ah,9
       lea dx,msg1   ; load effective address 
                     ; msg er jonno dl hobe na dx hobe
       int 21h
       
       
     ; single charecter input
      ; MOV AH,1
       ;INT 21H
      ; MOV a,AL 
       ;int 21h
       ;mov b,al
       ;int 21h
       ;mov c,al
            
     ;NEW LINE PRINT        
       MOV AH,2     
       MOV DL,0AH
       INT 21H
       MOV DL,0DH
       INT 21H  
       
       
       ;add
       mov bl,a
       add bl,b 
       ;sub bl,30h 
       SUB bl,c
       add bl,30h
       
       mov ah,9    ; load effective address 
                     ; msg er jonno dl hobe na dx hobe
       lea dx, msg2
       int 21h
   
     ;SINGLE CHAACTER OUTPUT{it will print user input    
       MOV AH,2
       MOV DL,bl
       INT 21H 
       
       ;mov dl,'A'
       ;INT 21H  
             
             
      ;Dealocate not important
       MOV AH,4CH
       INT 21H
    
         main endp
 
 
 end main 