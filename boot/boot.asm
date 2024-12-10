;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; WinterOS Bootloader Entry ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

org 0x10000

; Parameters passed from BIOS:
;  - r0 = pointer to print function
entry: 
    mov QWORD [console_print], r0 ; Move the print function to our container.
    mov r0, boot_msg
    call [console_print]
    hlt

; Includes
%include "utils/data.asm"