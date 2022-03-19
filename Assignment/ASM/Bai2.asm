;dw = dword = 16bit
;db = dbyte = 8bit
include 'emu8086.inc'
org 100h
jmp start

    num_a dw ?
    num_b dw ?

start:


    call SCAN_NUM   ;luu vao CX
    mov num_a, cx
    PRINT 10        ;newline
    call SCAN_NUM
    mov num_b, cx
    PRINT 10
    PRINT 10
    
    mov ax, num_a
    mov bx, num_b
    add ax, bx
    PRINT 'a+b='
    call PRINT_NUM    ;in ra tu AX
    PRINT ', '
    
    mov ax, num_a
    mov bx, num_b
    sub ax, bx
    PRINT 'a-b='
    call PRINT_NUM
    PRINT ', '
    
    mov ax, num_a
    mov bx, num_b
    mul bx
    PRINT 'a*b='
    call PRINT_NUM_UNS
    PRINT ', '
                  
    mov ax, num_a
    mov bx, num_b
    cmp bx, 0
    je ERROR
    div bx
    PRINT 'a/b='
    call PRINT_NUM
    PRINT ', reminder '
    mov ax, dx
    call PRINT_NUM
    jmp end 
    ERROR: PRINT 'a / b doesnt exist, reminder doesnt exist'
    
     
end:
RET 
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS 
DEFINE_GET_STRING
DEFINE_PRINT_STRING
END 