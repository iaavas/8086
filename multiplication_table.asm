.model small

.stack 100h

.data

.code
    main proc far
        mov ax,@data
        mov ds,ax
        
       mov ah,07h
       int 21h
       mov bx,1
       
       sub al,30h
       mov ah,00h 
       mov cx,ax
       
       multiply:mov ax,cx 
                mul bx
                 call displayMul
                 inc bx
                 
                 
                 cmp bx,11
                 jne multiply
                 
            
       
       
       
       mov ah,4ch
       int 21h
       
       main endp
    
    
    displayMul proc near
          
        push cx
        push ax
        push bx
        mov ah,00h
        mov bl,00h
        mov cx,000ah
        
        up:mov dx,0000h
           div cx 
           add dx,30h
           push dx
           inc bl
           cmp ax,0000h
           jne up
           
            
         up1:pop dx
            
            mov ah,02h
            int 21h
            dec bl
                
            jnz up1 
            
            mov dl,00h
            int 21h
            

         
         pop bx
         pop ax 
         pop cx
         
         
            
         
         ret
         displayMul endp
            
           
           
    
