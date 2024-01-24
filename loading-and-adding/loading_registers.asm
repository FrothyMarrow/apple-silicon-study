/*
 * Loading registers
 */

; Make the _main symbol visible to the linker for the entry point
.global _main

; Align everything to 4 bytes boundary
.align  4

_main:
    ; Move 0x1234FEDC4F5D6E3A into x2
    mov     x2, #0x6E3A
    movk    x2, #0x4F5D, LSL #16
    movk    x2, #0xFEDC, LSL #32
    movk    x2, #0x1234, LSL #48

    ; In the book mov <Xd>, <Xm> , LSL #shift is used which is not 
    ; part of the A64-A profile instruction set architecture.


    ; Move w2 into w1
    mov    w1, w2

    ; Move x2 into x1 with different shifts using aliases
    lsl    x1, x2, #1
    lsr    x1, x2, #1
    asr    x1, x2, #1
    ror    x1, x2, #1

    ; Using a value bigger than 16 bits but can be represented with a shift
    mov    x1, #0xAB000000

    ; Using a value bigger than 16 bits and can't be represented with a shift
    ; mov     x1, #0xABCDEF11

    ; Move bitwise not of 45 into w1
    movn   w1, #45

    ; Move a negative value using the mov (inverted wide immediate) alias
    mov    w1, #0xFFFFFFFE ; (-2)

    ; Setup the parameters to exit the program
    mov    x0, x1          ; Use 0 return code
    mov    x16, #1         ; move 1 into x16 for exit syscall
    
    ; System interrupt
    svc     #0x80
