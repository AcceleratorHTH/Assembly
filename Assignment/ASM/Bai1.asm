
org 100h

jmp start

        msg:    db      "Hello world$"

start:  
        
        mov     dx, msg
        mov     ah, 09h 
        int     21h 
        
        
ret 