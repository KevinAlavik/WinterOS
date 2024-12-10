;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; WinterOS Bootloader Entry ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

org 0x10000

; Parameters passed from Firmware:
;  - r0 = Pointer to the WFPT
entry:
    ; Display boot message via the console
    mov r10, r0             ; Move the WFPT pointer to r10.
    mov r0, boot_msg        ; Set arg1 (r0) of the Print() function.
    mov r11, 0              ; Index 0
    mov r12, 0x08           ; Offset 0x08
    call [r12 * r11 + r10]  ; Call the print handler from the table, WFPT[0](boot_msg) = [offset * index + abase] -> Print(boot_msg)
    hlt


; Includes
%include "utils/data.asm"