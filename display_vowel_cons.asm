.model small

.stack 100h


.data
    para label byte
    max db 80
    act db ?
    str db 50 dup('$')
    vow db 'aeiouAEIOU','$'
    vowel db 50 dup('$')
    con db 50 dup('$') 
    space DB ' ', '$'

    
    
.code
    main proc far
        
        mov ax,@data
        mov ds,ax
        
        lea dx,para
        mov ah,0ah
        int 21h
        

    
    mov ah,06h
    mov al,00h
    mov bh,07h
    mov cx,0
    mov dx,184fh 
    int 10h
                 
        call find
        
        

        lea dx,vowel
        mov ah,09h
        int 21h 
        
        
        lea dx,space
        mov ah,09h
        int 21h 

        
        
        
        
        lea dx,con
        mov ah,09h
        int 21h
        
       
        
        mov ah,4ch
        int 21h
        
        
        main endp             
        
        
        find proc near
             lea si,str
        
            cmp [si],65
            jb down1
            cmp [si],90
            ja down1
            jmp here
        
            down1: cmp [si],97
            jb fwd
            cmp [si],122
            ja fwd
        
        
        
            here: mov bx,0000h
            mov dx,0000h
            
        
            mov ch,act
            again: lea di,vow
            mov ah,0ah
        
            mov al,[si]
            up: cmp al,[di]
            jne down
        
            push di
            lea di,vowel
            mov [di + bx],al
            inc bx
            pop di
            jmp fwd
        
        
            down:
             inc di
             dec ah
             jnz up
             
             
                push di
                push bx
                mov bx,dx
                lea di,con
                mov [di + bx],al
                inc dx
                pop bx
                pop di
           
             
             fwd: 
             inc si    
             dec ch
             jnz again 
             
             
             
             
             
             
             
             
             
             
             
        
            ret
            find endp
        
        
        
             
        
        
        
        
        
        
        
        
        
       
        
        
        
    
               