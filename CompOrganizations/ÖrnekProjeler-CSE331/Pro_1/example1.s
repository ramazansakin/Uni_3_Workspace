    .data
str:
    .asciiz "Result is "
    .text
    .globl main
main:
    li $v0, 5
    # system call code for read_int
    syscall
# read int
    move $t0, $v0
    # move integer to t0
    li $v0, 5
    syscall
    move $t1, $v0 # system call code for read_int
    # read another int
    # move integer to t1
    add $t2, $t0, $t1 # add t0 and t1 and put the result into t2
    li $v0, 4
    la $a0, str
    syscall # system call code for print_str
    # address of string to print
    # print the string
    move $a0, $t2
    li $v0, 1
    syscall # copy t2 to a0
    # system call code for print_int
    # print it
