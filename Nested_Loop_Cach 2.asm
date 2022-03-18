org 100h

mov ax, 0

mov cx, 10 
k1: 
    mov bp, cx
    mov bx, 12 
    push cx 
    mov cx, 12 
    k2: 
    
    add ax, bx
    add ax, bp
    dec bx     
         
    loop k2 ; internal loop. 
    pop cx 
loop k1 ; external loop. 
Ret
