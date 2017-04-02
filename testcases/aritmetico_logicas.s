     .text
main:
   
   add $s7 $s1 $s0
   sub $s7 $s7 $s3
   add $a0 $s7 $0
   ori $v0 $0 1
   syscall

   addi $s7 $s7 1
   addu $s7 $s7 $s6
   subu $s7 $s7 $s6
   add $a0 $s7 $0
   ori $v0 $0 1
   syscall
   
   addiu $s7 $0 32767
   and $s7 $s7 $s6
   andi $s7 $s7 240
   or $s7 $s7 $s2
   add $a0 $s7 $0
   ori $v0 $0 1
   syscall

