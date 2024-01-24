/**
 * Printing Hello World! to the console using the write syscall
 */

; Make the _main symbol visible to the linker for the entry point
.global _main

; Align everything to 4 bytes boundary
.align 4

_main: 
    mov     x0, #1            ; stdout
    adr     x1, helloworld    ; address of string
    mov     x2, #13           ; length of string
    mov     x16, #4           ; write syscall
    svc     #0x80             ; system interrupt 
    mov     x0, #0            ; exit code
    mov     x16, #1           ; exit syscall
    svc     #0x80             ; system interrupt

helloworld: 
    .ascii  "Hello World!\n"  ; string
