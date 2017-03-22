        .text
main:
   li $a0 1
   beq $a0 $0 exit
   li $a0 5
   addi $s0 $0 5

exit:
   li $v0 1
   syscall
   li $v0 10
   syscall