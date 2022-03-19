include 'emu8086.inc' 
org 100h

mov ax, 0           ;F5 = 0
mov cx, 12          ;i <= 12
 
k1: 
  
    mov bx, cx        ;j=i
    push cx           ;dua vao stack
    mov cx, bx        
    
    k2: 
    
    cmp bx, 10          
    jg stop
    add ax, bx          ;F5 += (i+j)
    add ax, cx
         
         
    loop k2
     
    add ax,bx            ;phai them cai nay vi khac vs C, khi CX = 0 thi cai nay ko chay nua
    stop: pop cx 
    
loop k1

call PRINT_NUM

Ret
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END