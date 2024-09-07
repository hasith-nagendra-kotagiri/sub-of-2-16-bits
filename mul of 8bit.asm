org 100h 
start :


num1 db 32h
num2 db 39h
mov al,num1
mul num2
mov bx,ax
AND ax,0F000h
shr ax, 12
add ax,30h
cmp ax,39h
jle first_bit
add ax,7h
first_bit: mov dl,al
           mov ah,02h
           int 21h
mov ax,bx
and ax,0F00h
shr ax,8
add ax,30h
cmp ax,39h
jle second_bit
add ax,7h
second_bit: mov dl,al
            mov ah,02h
            int 21h  
mov ax,bx
and ax,00F0h
shr ax,4
add ax,30h
cmp ax,39h
jle third_bit
add ax,7h
third_bit: mov dl,al
            mov ah,02h
            int 21h  
mov ax,bx
and ax,000Fh
add ax,30h
cmp ax,39h
jle fourth_bit
add ax,7h
fourth_bit: mov dl,al
            mov ah,02h
            int 21h
ret