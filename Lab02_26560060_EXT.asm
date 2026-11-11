.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board       
   
    li   $s1, 1           
    li   $s2, 2           

    sll  $t0, $s1, 1      
    add  $t0, $t0, $s1   
    add  $t0, $t0, $s2    
    sll  $t0, $t0, 2      
    add  $t0, $t0, $s0    

    li   $t1, 1
    sw   $t1, 0($t0)      

    
    li   $s1, 2           
    li   $s2, 0           

    sll  $t0, $s1, 1      
    add  $t0, $t0, $s1    
    add  $t0, $t0, $s2  
    sll  $t0, $t0, 2     
    add  $t0, $t0, $s0   

    li   $t1, 2
    sw   $t1, 0($t0)     

    li   $v0, 10
    syscall