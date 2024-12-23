.data
# # 0x1000_0000
#  .word 0x87654321
# # 1000_0004
# .word 0x12345678
.space 20
a: .word 0x12345678
.text

la t0, a
li t1, 0xFF
sw t1, 0(t0)
#x5 has location
lui x5, 0x10000
addi x5, x5, 0x004# total hexa in a number is ? total bits is 32 total is then 8
# this was for the address, now for the actualthing to save

#x6 has what to store
lui x6, 0x12345
addi x6, x6, 0x678


sw x6,0(x5)
mv s0, x6
lui x6, 0x87654
addi x6, x6, 0x321
sw x6,-4(x5)

addi x7, x0, 7
sw x7, 0x0FC(x5)

add x8, s0,x7
sw x8, 4(x5)

lw x6, 0x0FC(x5)
lw x5, -4(x5)


