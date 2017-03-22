     .text
main:
   ori $s0 $0 7
   ori $s1 $0 5
   ori $s2 $0 15
   ori $s3 $0 2
   ori $s4 $0 28
   ori $s5 $0 4093
   lui $s6 65535
   ori $s6 $s6 65534

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

   sll $s7 $s6 8
   srl $s7 $s7 16
   sllv $s7 $s7 $s4
   srlv $s7 $s7 $s4
   add $a0 $s7 $0
   ori $v0 $0 1
   syscall

   ori $v0 $0 10
   syscall
