
org 100h 

    num1 dw 2929h
    num2 dw 2423h
start:
     mov ax,num1
     sub ax,num2
     mov bx,ax
     mov ah,bh
     and ah,0F0h
     shr ah,4
     add ah,30h
     cmp ah,39h
     jle print_first_number
     add ah,7
print_first_number:
     mov dl,ah
     mov ah,02h
     int 21h
     mov ah,bh
     and ah,0Fh
     add ah,30h
     cmp ah,39h
     jle print_second_number
      add ah,7
print_second_number:
      mov dl,ah
     mov ah,02h
     int 21h
      mov ah,bl
     and ah,0F0h
     shr ah,4
     add ah,30h
     cmp ah,39h
    jle print_third_number
     add ah,7
print_third_number:
    mov dl,ah
    mov ah,02h
     int 21h
     mov ah,bl
     and ah,0Fh
    add ah,30h
     cmp ah,39h
    jle print_fourth_number
    add ah,7
print_fourth_number:
    mov dl,ah
    mov ah,02h
    int 21h
    mov ah,4Ch
    int 21h
ret
