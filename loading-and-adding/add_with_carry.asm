/**
 * Add with carry
 */

.global _main
.align  4

_main:
    mov     x2, #0x0000000000000003
    ; Converts to movn
    mov     x3, #0xFFFFFFFFFFFFFFFF
    mov     x4, #0x0000000000000005
    mov     x5, #0x0000000000000001
    ; Add and set flags including carry
    adds    x1, x3, x5
    ; Add with carry
    adc     x0, x2, x4
    ; Exit
    mov     x16, #1
    svc     #0x80