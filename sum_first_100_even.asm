.model small
.stack 100h

.data
    sum dw ?

.code
    main proc far
        
        mov ax,@data
        mov ds,ax
        
        mov cx,63h
        
        mov ax,0002h
        mov bx,0004h
        
        
        up: add ax,bx
        add bx,02h
        loop up
        
        mov sum,ax
        
        
        mov bl,00h
        mov cx,000ah
        mov ax,sum
        
        
        up2:mov dx,0000h
            div cx
            add dx,30h
            push dx
            inc bl
            cmp ax,0000h
            jne up2
            
            
          conti:pop dx
                mov ah,02h
                int 21h
                dec bl
                jnz conti
        
        mov ah,4ch
        int 21h
        
        main endp
        
        
        
        
        
               