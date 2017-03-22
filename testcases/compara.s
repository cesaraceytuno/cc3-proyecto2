     .text
main:
   lui $s0 65535
   ori $s0 $s0 65535

   slt $a0 $s0 $0    
   ori $v0 $0 1
   syscall

   slti $a0 $s0 0    
   ori $v0 $0 1
   syscall

   sltu $a0 $s0 $0    
   ori $v0 $0 1
   syscall

   sltiu $a0 $s0 0    
   ori $v0 $0 1
   syscall

   ori $v0 $0 10
   syscall
   