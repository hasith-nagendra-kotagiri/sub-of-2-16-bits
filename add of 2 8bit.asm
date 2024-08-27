org 100h             ; start address for the program

; Define 8-bit numbers to add

num1 db 24h          ; First number (hexadecimal)
num2 db 29h          ; Second number (hexadecimal)

start:
    mov al,num1      ;Load the first number into register AL
    add al,num2      ;Load the second number to AL
    
    ; Result is now in AL
    ; Convert the result to a printable ASCII value for display
    
    ; save the result for display
    mov bl, al
    
    ; convert the upper nubble(4bits) of AL to a character
    mov ah, al       
    and ah, 0F0h     ; Mask the lower nibble
    shr ah, 4        ; Shift right by 4 to get the upper nibble
    add ah, 30h      ; Convert to ASCII  digit(0-9)
    cmp ah, 39h
    jle Print_first_digit
    add ah, 7        ; Convert to ASCII letter (A-F) if necessary
    
print_first_digit:
    mov dl, ah       ; move the first digit to DL for printing
    mov ah, 02h      ; BIOS interrupt to display character
    int 21h
    
    ; convert the lower nibble to AL to a character
    mov ah, bl
    and ah, 0Fh      ; Mask the upper nibble
    add ah, 30h      ; convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_second_digit
    add ah, 7        ; convert to ASCII letter (A-F) if necessary
    
print_second_digit:
    mov dl, ah        ; move the second digit to DL for printing
    mov ah, 02h       ; BIOS interrupt to display character
    int 21h
    
    ; End the program
    mov ah, 4Ch       ; Terminate the program
    int 21h 
 
 ret