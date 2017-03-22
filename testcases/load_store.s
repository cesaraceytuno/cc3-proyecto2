     .text
main:
   lui $s0 65535
   ori $s0 $s0 65535

   sw $s0 0($sp)
   lw $a0 0($sp)
   ori $v0 $0 1
   syscall

   ori $v0 $0 10
   syscall
   