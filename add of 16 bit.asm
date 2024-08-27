
org 100h             ; start address for the program
; Define 16-bit numbers to add
num1 dw 4678h        ; First number (hexadecimal)
num2 dw 1234h        ; Second number (hexadecimal)
start:
    ; Load the first 16-bit number into AX
    mov ax, num1     ; Load first 16-bit number into AX
    add ax, num2     ; Add second 16-bit number to AX
    ; Result is now in AX (16-bit result)
    ; Save the result in BX for manipulation and printing
    mov bx, ax       ; Move result into BX
    ; Convert and print the upper nibble of BH (upper byte)
    mov ah, bh       ; Move upper byte of BX to AH
    and ah, 0F0h     ; Mask the lower nibble
    shr ah, 4        ; Shift right by 4 to get the upper nibble
    add ah, 30h      ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_first_digit
    add ah, 7        ; Convert to ASCII letter (A-F) if necessary
print_first_digit:
    mov dl, ah       ; Move the first digit to DL for printing
    mov ah, 02h      ; BIOS interrupt to display character
    int 21h
    
    ; Convert and print the lower nibble of BH (upper byte)
    mov ah, bh       ; Move upper byte of BX to AH
    and ah, 0Fh      ; Mask the upper nibble
    add ah, 30h      ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_second_digit
    add ah, 7        ; Convert to ASCII letter (A-F) if necessary 
print_second_digit:
    mov dl, ah       ; Move the second digit to DL for printing
    mov ah, 02h      ; BIOS interrupt to display character
    int 21h
    ; Convert and print the upper nibble of BL (lower byte)
    mov ah, bl       ; Move lower byte of BX to AH
    and ah, 0F0h     ; Mask the lower nibble
    shr ah, 4        ; Shift right by 4 to get the upper nibble
    add ah, 30h      ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_third_digit
    add ah, 7        ; Convert to ASCII letter (A-F) if necessary  
print_third_digit:
    mov dl, ah       ; Move the third digit to DL for printing
    mov ah, 02h      ; BIOS interrupt to display character
    int 21h   
    ; Convert and print the lower nibble of BL (lower byte)
    mov ah, bl       ; Move lower byte of BX to AH
    and ah, 0Fh      ; Mask the upper nibble
    add ah, 30h      ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_fourth_digit
    add ah, 7        ; Convert to ASCII letter (A-F) if necessary
print_fourth_digit:
    mov dl, ah       ; Move the fourth digit to DL for printing
    mov ah, 02h      ; BIOS interrupt to display character
    int 21h
    ; End the program
    mov ah, 4Ch      ; Terminate the program
    int 21h


ret




