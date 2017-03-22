.data
num: .asciiz \"256\"
.text

main:
   la $a0 num
   jal ascii_to_int
   move $a0 $v0
   li $v0 1
   syscall
   li $v0 10
   syscall

ascii_to_int:
li $t1 0
li $t2 32
li $t3 10
li $t4 10
li $v0 0

ascii_to_int_loop:
   lb $t0 0($a0)
   beq $t0 $0 ascii_to_int_exit
   beq $t0 $t2 ascii_to_int_exit
   beq $t0 $t3 ascii_to_int_exit
   addi $a0 $a0 1
   addi $t0 $t0 -48
   mul $v0 $v0 $t4
   add $v0 $v0 $t0
   j ascii_to_int_loop
   
ascii_to_int_exit:
   jr $ra