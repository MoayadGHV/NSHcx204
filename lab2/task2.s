addi x5,x0,0x00
sub x5,x0,x5
addi x5,x5,-1
add a1, x0, x5# a1 <= 42
addi a0, x0, 1# print_int ecall
ecall