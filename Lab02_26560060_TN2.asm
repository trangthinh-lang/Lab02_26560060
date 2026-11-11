
.data
scores: .word 40, 55, 70, 85, 100
msg:    .asciiz "Total: "
nl:     .asciiz "\n"

.text
.globl main
main:
    la   $s0, scores      # $s0 = base address

    # (1) Dynamic update: scores[k] = V 
    li   $s1, 0           # k = 0
    li   $s2, 62          # V = 62
    sll  $t1, $s1, 2      # $t1 = 4 * k
    add  $t1, $t1, $s0    # $t1 = address of scores[k]
    sw   $s2, 0($t1)      # scores[k] = V

    # (2) Sum all five scores using constant offsets
    lw   $t0, 0($s0)
    lw   $t1, 4($s0)
    lw   $t2, 8($s0)
    lw   $t3, 12($s0)
    lw   $t4, 16($s0)

    add  $s3, $t0, $t1
    add  $s3, $s3, $t2
    add  $s3, $s3, $t3
    add  $s3, $s3, $t4

    
    li   $v0, 4
    la   $a0, msg
    syscall

    li   $v0, 1
    move $a0, $s3
    syscall

    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall