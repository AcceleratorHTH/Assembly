
org 100h
jmp start
    file db 'README2.md', 0    ;dua file README2.md vao folder cai emu8086(..\emu8086\MyBuild)
    handle dw ?
    str db 10000 dup('$')
start:

    mov ah, 3Dh
    lea dx, file
    mov al, 0        ;chi cho phep doc
    int 21h
    mov handle, ax

    mov ah, 3fh
    lea dx, str
    mov cx, 10000     ;read tung dong
    mov bx, handle
    int 21h
    
    lea dx, str
    mov ah, 9         ;in ra man hinh
    int 21h
    
    mov ah, 3eh
    mov bx, handle    ;dong file
    int 21h


ret