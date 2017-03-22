   .data
hi: 
.asciiz \"Hola Mundo!!!\n\"
bye: 
.asciiz \"Adios mundo cruel... :'( *snif*\"
   .text
main:
   la $a0 hi
   li $v0 4
   syscall     
   la $a0 bye
   li $v0 4
   syscall     
   li $v0 10
   syscall
