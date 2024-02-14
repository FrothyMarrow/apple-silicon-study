/**
 * Moving and adding
 */

.global _main
.align  4

_main:
    movn    w0, #2
    add     w0, w0, #2

    ; Exit the program
    mov     x16, #1
    svc     #0x80