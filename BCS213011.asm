[org 0x0100]

jmp multiplication_start

multiplicand dd 1600
multiplier  dw 400
result dd 0

multiplication_start:
    mov counter, 16
    mov multiplier_reg, [multiplier]

check_bit:
    shr multiplier_reg, 1
    jnc bit_skip

    mov ax, [multiplicand]
    add [result], ax
    mov ax, [multiplicand + 2]
    adc [result + 2], ax

bit_skip:
    shl word [multiplicand], 1
    rcl word [multiplicand + 2], 1
    dec counter
    jnz check_bit

    mov ax, 0x4c00
    int 0x21

counter         db 0
multiplier_reg  dw 0
