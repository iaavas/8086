.model small
.stack 100h
.data
    fact dw ?
   
.code 
    main proc far
        
        mov ax,@data
        mov ds,ax
        
        call input
        call factorial
        
        
        mov ah,4ch
        int 21h
        
        main endp
    
    
    input proc near
        
        mov ah,01h
        
        
        int 21h   
        sub al,30h
        ret
        input endp
    
    factorial proc near
        
        mov ah,00h
        cmp al,01h
        jb down
        cmp  al,09h
        ja down
        mov bx,ax
        dec bx
        
       up: mul bx
           dec bx
           jnz up
           
           mov fact,ax
           
           
       mov bl,00h
       mov cx,000ah
       mov ax,fact
       
       calcdisp: mov dx,0000h
            div cx
            add dx,30h
            push dx
            inc bl
            cmp ax,0000h
            jne calcdisp
            
            
            
            mov ah,00h
            mov al,03h
            int 10h
            
            
        
        conti:pop dx
              mov ah,02h
              int 21h
              dec bl
              jnz conti
           
       
           
        down: ret
        factorial endp
        
        
        
        