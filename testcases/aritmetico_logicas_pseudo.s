     .text
main:
   li $a0 15
   neg $a0 $a0
   ori $v0 $0 1
   syscall

   abs $a0 $a0
   ori $v0 $0 1
   syscall

   ori $s7 $0 3
   move $a0 $s7
   ori $v0 $0 1
   syscall

   ori $s0 $0 3
   ori $s1 $0 4
   ori $s3 $0 6

   mul $s7 $s0 $s1
   div $a0 $s7 $s3
   
   ori $v0 $0 1
   syscall

   ori $v0 $0 10
   syscall
