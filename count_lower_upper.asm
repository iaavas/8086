.model small
.stack 100h

.data
    para label byte
    max db 80
    act db ?
    str db 50 dup ('$')
    mes db 'Type a string','$'
    lower db 0
    upper db 0
    
    
    
.code
    main proc far
        mov ax,@data 
        mov ds,ax
        call input
        call count
        call displayUpper   
        call displayLower
        mov ah,4ch
        int 21h
        main endp 
    
    
    input proc near
        lea dx,para
        mov ah,0ah 
        int 21h
        ret
        input endp
    
        
    count proc near
        lea si,str
        mov bl,act
        up: mov al,[si]
        cmp al,65
        jb fwd
        cmp al,90
        ja fwd
        inc upper
        jmp down
        
        fwd:cmp al,97
            jb down
            cmp al,122
            ja down
            inc lower
            
        down:inc si
            dec bl
            jnz up
            ret
            count endp
    
    
    displayUpper proc near
        
        mov bl,00h
        mov cx,000ah
        mov al,upper    
        mov ah,00h
        reupper: mov dx,0000h
        div cx
        add dx,30h
        push dx
        inc bl 
        cmp ax,0000
        jne reupper
        
        cont: pop dx
        mov ah,02h
        int 21h
        dec bl
        jnz cont
        ret
        displayUpper endp
    
    displayLower proc near
        mov bl,00h
        mov cx,000ah
        mov al,lower
        mov ah,00h
        relower: mov dx,0000h
        div cx
        add dx,30h
        push dx
        inc bl
        cmp ax,0000h
        jne relower
        conti: pop dx
            mov ah,02h
            int 21h
            dec bl
            jnz conti
            ret
            displayLower endp
        
        
        
            
    
        
        
        
        
        