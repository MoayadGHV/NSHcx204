    .data
    
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9 


.text


main:
    
    la a0, array       
    li a1, 9           
    jal ra, sum_array 


    li a0, 10          
    ecall
    

sum_array:
    
   
    li t0, 0         
    li t1, 0           

sum_loop:
    bge t1, a1, end_sum 

    
    slli t2, t1, 2      
    add t2, t2, a0      
    lw t2, 0(t2)        

    
    add t0, t0, t2     

    
    addi t1, t1, 1     

    
    j sum_loop

end_sum:
    mv a0, t0          
    ret                
