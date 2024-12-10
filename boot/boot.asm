;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; WinterOS Bootloader Entry ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

org 0x10000

; Bootloader entry.
; Parameters passed from BIOS:
;  - r0 = pointer to print function
main: 
    mov r1, r0 ; Move the print function to our container.
    mov r0, boot_msg
    call r1
    hlt

; Our "print" container
print:
    dq 0

; Boot message
boot_msg:
    asciiz "Hello from the WinterOS bootloader!\n"