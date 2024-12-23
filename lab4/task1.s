.data
    msg_equal:      .asciiz "Equal\n"
    msg_not_equal:  .asciiz "Not Equal\n"

.text

start:

    li t0, 5          
    li t1, 10        


    beq t0, t1, equal 

    la a1, msg_not_equal
    li a0, 4        
    ecall

    j end             

equal:

    la a1, msg_equal
    li a0, 4          
    ecall

end:
    li a0, 10      
    ecall
