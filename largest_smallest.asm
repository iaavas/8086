.model small

.stack 100h

.data
    array db 5,3,4,1,7,8,'$'
    largest db 'The largest value is: ','$'
    smallest db 'The smalles value is: ','$'
    
.code

    main proc far
        mov ax,@data
        mov ds,ax
        
        mov bl,5
        
      next:  lea si,array
        
        mov cx,5
        
        
        again: mov al,[si]
                inc si
                cmp al,[si]
                jb down
                mov dl,[si]
                mov [si],al
                dec si
                mov [si],dl
                inc si
                
                down:loop again
                dec bl
                jnz next
                
                lea dx,smallest
                mov ah,09h
                int 21h
                
                
                lea si,array
                
                mov al,[si]
                call show  
                
                lea dx,largest
                mov ah,09h
                int 21h
                
                mov al,[si+5]
                call show
                mov ax,4ch
                
                
                int 21h
                main endp
    
      
    
    
    
    
    show proc near  
        mov ah,00h
        mov cx,000ah
        mov bl,00h
        
        up:mov dx,0000h
            div cx
            add dx,30h
            push dx
            cmp ax,0000h
            jne up
            
          up1:pop dx
                mov ah,02h
                int 21h
                
                
            
           mov dl,00h
            int 21h     
           ret
           
           show endp
                
                   
