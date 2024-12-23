addi x7,x0,0xFF#Shift me for picking




#the input number that we want to shift
addi x5, x5, 0x123
slli x5, x5, 12
addi x5, x5, 0x456
slli x5, x5, 8
addi x5, x5, 0x78





addi x6,x0,2 #How much to shift/which byte to take
slli x6, x6, 3 #Make it to bytes shift instead of bit shift

sll x7, x7, x6 # apply the shift then store in "picker"

and x5,x5,x7   #and the picker with the original number

srli x7, x7, 8 # make it so that when we shift the picker until it gets to zero we will have the full value of the original number but in the start of the byte
jump:
srli x5, x5, 1
srli x7, x7, 1
bnez x7, jump