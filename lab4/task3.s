    .data
vector1:   .byte 1, 2, 3, 4, 5, 6, 7, 8   
vector2:   .byte 9, 10, 11, 12, 13, 14, 15, 16  
result:    .space 32 

    .text
    .globl _start

_start:
    li t0, 0                
    la t1, vector1          
    la t2, vector2          
    la t3, result           
    li t4, 8               

loop:
    bge t0, t4, end_loop    

    lb t5, 0(t1)           
    
    lb t6, 0(t2)          
    add x1, t5, t6         

   
    sw x1, 0(t3)          


    addi t1, t1, 1         
    addi t2, t2, 1         
    addi t3, t3, 4        

   
    addi t0, t0, 1

   
    j loop

end_loop:

    li a0, 10               
    ecall      
