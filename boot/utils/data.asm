;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; WinterOS "Data" Section   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Our "print" container, stores pointer to console callback defined in the firmware.
console_print:
    dq 0

; Boot message, this is printed during the boot.
boot_msg:
    asciiz "WinterOS Bootloader v0.1.0-alpha\n"