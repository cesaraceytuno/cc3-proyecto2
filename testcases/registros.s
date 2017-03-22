     .text
main:
   ori $s0 $0 0
   add $a0 $s0 $0
   ori $v0 $0 1
   syscall
   ori $s1 $0 1
   add $a0 $s1 $0
   ori $v0 $0 1
   syscall
   ori $s2 $0 2
   add $a0 $s2 $0
   ori $v0 $0 1
   syscall
   ori $s3 $0 3
   add $a0 $s3 $0
   ori $v0 $0 1
   syscall
   ori $s4 $0 4
   add $a0 $s4 $0
   ori $v0 $0 1
   syscall
   ori $s5 $0 5
   add $a0 $s5 $0
   ori $v0 $0 1
   syscall
   ori $s6 $0 6
   add $a0 $s6 $0
   ori $v0 $0 1
   syscall
   ori $s7 $0 7
   add $a0 $s7 $0
   ori $v0 $0 1
   syscall

   ori $t0 $0 0
   add $a0 $t0 $0
   ori $v0 $0 1
   syscall
   ori $t1 $0 1
   add $a0 $t1 $0
   ori $v0 $0 1
   syscall
   ori $t2 $0 2
   add $a0 $t2 $0
   ori $v0 $0 1
   syscall
   ori $t3 $0 3
   add $a0 $t3 $0
   ori $v0 $0 1
   syscall
   ori $t4 $0 4
   add $a0 $t4 $0
   ori $v0 $0 1
   syscall
   ori $t5 $0 5
   add $a0 $t5 $0
   ori $v0 $0 1
   syscall
   ori $t6 $0 6
   add $a0 $t6 $0
   ori $v0 $0 1
   syscall
   ori $t7 $0 7
   add $a0 $t7 $0
   ori $v0 $0 1
   syscall
   ori $t8 $0 8
   add $a0 $t8 $0
   ori $v0 $0 1
   syscall
   ori $t9 $0 9
   add $a0 $t9 $0
   ori $v0 $0 1
   syscall

   ori $v0 $0 0
   add $a0 $v0 $0
   ori $v0 $0 1
   syscall
   ori $v1 $0 1
   add $a0 $v1 $0
   ori $v0 $0 1
   syscall

   ori $a0 $0 0
   add $a0 $a0 $0
   ori $v0 $0 1
   syscall
   ori $a1 $0 1
   add $a0 $a1 $0
   ori $v0 $0 1
   syscall
   ori $a2 $0 2
   add $a0 $a2 $0
   ori $v0 $0 1
   syscall
   ori $a3 $0 3
   add $a0 $a3 $0
   ori $v0 $0 1
   syscall

   addi $a0 $sp 4
   ori $ra $0 0
   add $a0 $ra $0
   ori $v0 $0 1
   syscall

   ori $v0 $0 10
   syscall
