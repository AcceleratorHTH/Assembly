include 'emu8086.inc'
org 100h
jmp start
    ar dw 100 dup(?)
    c dw 0   ; c = count
    sum dw 0
    
start:

    call SCAN_NUM
    cmp cx, 10
    jl zero
    PRINT 10
    PRINT 10
    mov si, 0
    mov ax, cx
    mov bx, 10
    
    do:
        xor dx, dx   ;xoa thanh ghi dx
        div bx       ;chia cho 10
        inc c
        push dx      ;day vao stack
        cmp ax, 0    ;chia den khi ax = 0
    jne do
        
    do1:
        pop dx              ;lay dx ra khoi stack
        mov ax, dx          ;gan vao AX de in ra dc
        call PRINT_NUM      
        PRINT ', '
        dec c
        add sum, ax
        cmp c, 1      ;ko pop het vi can dau . o cuoi
    jne do1
    
    pop dx             
    mov ax, dx
    add sum, ax
    call PRINT_NUM    
    PRINT '.'
    
    PRINT 10
    PRINT 13            ;lui ve dau dong
    mov ax, sum
    call PRINT_NUM
    jmp end
    
    zero:
    PRINT 10
    PRINT 10
    mov ax, cx
    call PRINT_NUM
    PRINT '.'
    PRINT 10
    PRINT 13
    call PRINT_NUM        
              

end:
RET
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS 
DEFINE_GET_STRING
DEFINE_PRINT_STRING
END