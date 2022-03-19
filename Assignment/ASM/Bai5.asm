
org 100h
jmp start
    file db 'README.md', 0  
    handle dw ?             ;temp file? idk 
    str db 256 dup('$')
start:
    
    mov ah, 3ch
    lea dx, file
    mov cl, 0               ;tao file README.md
    int 21h                 ;File se dc luu o ..\emu8086\MyBuild\
    mov handle, ax
    
    mov ah, 3Dh
    lea dx, file
    mov al, 1               ;chi cho phep ghi  
    int 21h
    mov handle, ax
    
    mov si, 0
    mov cx, 0
    
    get_str:          
        mov ah, 1
        int 21h
        cmp al, 13          ;13 chu kp 10 vi khi enter con tro se ve dau dong
        je end
        mov str[si], al
        inc si
        inc cx              ;giup in vua du so ki tu da nhap
        jmp get_str
    end:
    
    mov ah, 40h
    mov bx, handle
    lea dx, str             ;lea thi 16 bit + 8 bit cx dc
    int 21h
    
    mov ah, 3eh
    mov bx, handle          ;dong file
    int 21h
   

ret
