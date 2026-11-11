# Trang Nhu Thinh - 26560060
# Lab02_22520001_EXT.asm - 3x3 Game Board Memory Indexing
# Register plan: $s0 = base address of board
#                $s1 = row index r
#                $s2 = column index c
.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board       # base address

    # --- Store 1 into cell (1, 2) ---
    li   $s1, 1           # r = 1
    li   $s2, 2           # c = 2

    sll  $t0, $s1, 1      # $t0 = 2 * r
    add  $t0, $t0, $s1    # $t0 = 3 * r
    add  $t0, $t0, $s2    # $t0 = 3 * r + c (1D index)
    sll  $t0, $t0, 2      # $t0 = 4 * index (byte offset)
    add  $t0, $t0, $s0    # $t0 = absolute element address

    li   $t1, 1
    sw   $t1, 0($t0)      # board[1][2] = 1

    # --- Store 2 into cell (2, 0) ---
    li   $s1, 2           # r = 2
    li   $s2, 0           # c = 0

    sll  $t0, $s1, 1      # $t0 = 2 * r
    add  $t0, $t0, $s1    # $t0 = 3 * r
    add  $t0, $t0, $s2    # $t0 = 3 * r + c (1D index)
    sll  $t0, $t0, 2      # $t0 = 4 * index (byte offset)
    add  $t0, $t0, $s0    # $t0 = absolute element address

    li   $t1, 2
    sw   $t1, 0($t0)      # board[2][0] = 2

    li   $v0, 10
    syscall
