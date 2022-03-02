
org 100h

mov ax, 0

mov bp, 10

mov bx, 10

loop_i:
    
    mov cx, 12
    mov dx, 12
    
    loop_j:
    
    add ax, dx
    
    add ax, bx
    dec dx
                
    loop loop_j
    
    dec bx   
    dec bp
    
jnz loop_i
    

    


ret




