addi x5, x5, 0x123
slli x5, x5, 12
addi x5, x5, 0x456
slli x5, x5, 8
addi x5, x5, 0x78

add a1, x0, x5# a1 <= 42
addi a0, x0, 1# print_int ecall
ecall