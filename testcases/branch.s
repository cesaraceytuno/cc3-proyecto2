     .text
main:
   ori $a0 $0 1

   beq $0 $0 label
   ori $a0 $0 5

label:  
   ori $v0 $0 1
   syscall

   ori $v0 $0 10
   syscall
   