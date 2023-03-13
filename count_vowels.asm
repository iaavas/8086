.model small
.stack 100h


.data
    para label byte
    max db 80
    act db ?
    str db 50 dup('$')
    mes db 'Enter the string: ','$',
    vowel db 'aeiouAEIOU','$'
    count db 0
    
    
.code
    main proc far
        mov ax,@data
        mov ds,ax
        
        call displaymsg
        call input
        call countvow
        call displayvow
        mov ah,4ch
        int 21h
    main endp
    
    displaymsg proc near
        
        mov ah,09h
        lea dx,mes
        int 21h
        ret 
        displaymsg endp
    
    input proc near
        mov ah,0ah
        lea dx,para
        int 21h
        ret 
        input endp
    
    countvow proc near
        lea si,str
        mov bh,act
        redo: mov bl,0Ah
        lea di,vowel
        mov al,[si]
                
        up:cmp al,[di]
        jne down
        inc count  
        
        down:inc di  
        dec bl
        jnz up
        inc si
        dec bh
        jnz redo
        ret
        countvow endp
    
    
    displayvow proc near
        
        mov bl,00h
        mov cx,000ah
        mov al,count
        mov ah,00h
       vow: mov dx,0000h
        div cx
        add dx,30h
        push dx
        inc bl
        cmp ax,0000h
        jne vow
        cont: pop dx
            mov ah,02h
            int 21h
            dec bl
            jnz cont
        
        ret
        displayvow endp
        
        
        
        
    
    
    
    
    