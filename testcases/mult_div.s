     .text
main:
   ori $s0 $0 3
   ori $s1 $0 4
   ori $s3 $0 6

   mult $s0 $s1
   mflo $s7
   div $s7 $s3
   mflo $a0   
   ori $v0 $0 1
   syscall

   mfhi $a0   
   ori $v0 $0 1
   syscall

   multu $s0 $s1
   mflo $s7
   divu $s7 $s3
   mflo $a0   
   ori $v0 $0 1
   syscall

   mfhi $a0   
   ori $v0 $0 1
   syscall

   ori $v0 $0 10
   syscall
