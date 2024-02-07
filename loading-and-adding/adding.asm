/**
 * Adding
 */

.global _main
.align  4

_main:
    ; Immediate and shift
    add     x2, x1, #4000
    add     x2, x1, #0x20, LSL #12

    ; Register and shift
    add     x2, x1, x0
    add     x2, x1, x0, LSL #2
    
    ; Register and extend
    
    ; The book uses the following instruction:
    ; ADD   X2, X1, X0, SXTB
    ; However, the for A64 X is the width specifier and not the register specifier.
    ; The extends available on X width specifier are UXTX, SXTX.
    ; We can use the W width specifier to use SXTB, UXTH.

    add     x2, x1, w0, SXTB
    add     x2, x1, w0, UXTH #2
    
    ; Exit the program
    mov     x0, #0
    mov     x16, #1
    svc     #0x80