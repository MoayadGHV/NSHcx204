    .data
arr:    .space 400          

    .text
    .globl _start

_start:
    li t0, 1                
    la t1, arr               
    li t2, 101              

loop:
    bge t0, t2, end_loop     

    # Store arr[i] = i
    sw t0, 0(t1)             

    addi t1, t1, 1           
    addi t0, t0, 1           

    j loop                  

end_loop:
    li a0, 10              
    ecall           
