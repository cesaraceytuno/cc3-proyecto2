.data
msgBCodif: .asciiz "Codificando el siguinete programa:\n\n"

##### INICIO DEL PROGRAMA A CODIFICAR #####
programa:	.asciiz ".text\nmain:\n   ori $s0 $0 0\n   add $a0 $s0 $0\n   ori $v0 $0 1\n   syscall\n   ori $s1 $0 1\n   add $a0 $s1 $0\n   ori $v0 $0 1\n   syscall\n   ori $s2 $0 2\n   add $a0 $s2 $0\n   ori $v0 $0 1\n   syscall\n   ori $s3 $0 3\n   add $a0 $s3 $0\n   ori $v0 $0 1\n   syscall\n   ori $s4 $0 4\n   add $a0 $s4 $0\n   ori $v0 $0 1\n   syscall\n   ori $s5 $0 5\n   add $a0 $s5 $0\n   ori $v0 $0 1\n   syscall\n   ori $s6 $0 6\n   add $a0 $s6 $0\n   ori $v0 $0 1\n   syscall\n   ori $s7 $0 7\n   add $a0 $s7 $0\n   ori $v0 $0 1\n   syscall\n  ori $t0 $0 0\n   add $a0 $t0 $0\n   ori $v0 $0 1\n   syscall\n   ori $t1 $0 1\n   add $a0 $t1 $0\n  ori $v0 $0 1\n   syscall\n   ori $t2 $0 2\n   add $a0 $t2 $0\n   ori $v0 $0 1\n   syscall\n   ori $t3 $0 3\n   add $a0 $t3 $0\n   ori $v0 $0 1\n   syscall\n   ori $t4 $0 4\n   add $a0 $t4 $0\n   ori $v0 $0 1\n   syscall\n   ori $t5 $0 5\n   add $a0 $t5 $0\n   ori $v0 $0 1\n   syscall\n   ori $t6 $0 6\n  add $a0 $t6 $0\n   ori $v0 $0 1\n   syscall\n   ori $t7 $0 7\n   add $a0 $t7 $0\n   ori $v0 $0 1\n   syscall\n   ori $t8 $0 8\n   add $a0 $t8 $0\n   ori $v0 $0 1\n   syscall\n   ori $t9 $0 9\n   add $a0 $t9 $0\n   ori $v0 $0 1\n   syscall\n   ori $v0 $0 0\n   add $a0 $v0 $0\n   ori $v0 $0 1\n   syscall\n   ori $v1 $0 1\n   add $a0 $v1 $0\n   ori $v0 $0 1\n   syscall\n   ori $a0 $0 0\n   add $a0 $a0 $0\n   ori $v0 $0 1\n   syscall\n   ori $a1 $0 1\n   add $a0 $a1 $0\n   ori $v0 $0 1\n   syscall\n   ori $a2 $0 2\n   add $a0 $a2 $0\n   ori $v0 $0 1\n   syscall\n   ori $a3 $0 3\n   add $a0 $a3 $0\n   ori $v0 $0 1\n   syscall\n   addi $a0 $sp 4\n   ori $ra $0 0\n   add $a0 $ra $0\n   ori $v0 $0 1\n   syscall\n   ori $v0 $0 10\n   syscall\n"
##### FIN DEL PROGRAMA A CODIFICAR ####

errMsg: .asciiz "Error!!!\n"
msgFCodif: .asciiz "\n\nFinaliza la codificacion...\n\nEjecutando el programa codificado...\n"

.align 2
data:	.space 200	# Reservo 200 bytes para datos
text:	.space 400	# Reservo espacio para almacenar el programa compilado (100 instrucciones)
.text

main:
   la $a0 msgBCodif	# Imprimo el programa que voy a ensamblar
   jal print_str
   la $a0 programa
   jal print_str
   la $a0 msgFCodif
   jal print_str
   sllv $t1 $t2 $t3
   la $a0 programa	# Llamo a la funcion con sus respectivos argumentos
   la $a1 text
   la $a2 data
   jal ensamblador

   jr $v0		# Ejecuto el programa después de ser ensamblado
   j exit		# Termino la ejecucion


print_str:		# Funcion para imprimir strings, recibe la direccion del string en $a0
   li $v0 4
   syscall
   jr $ra

exit:
   li $v0 10
   syscall

###################################################
########### FIN DEL MAIN ##########################
###################################################

###################################################
######### Comienza la funcion ensamblador #########
###################################################

.data		# Palabras reservadas (instrucciones y directivas)
str_data:	.asciiz ".data"
str_text:	.asciiz ".text"
str_asciiz:	.asciiz ".asciiz"
str_add:	.asciiz "add"
str_addu:	.asciiz "addu"
str_and:	.asciiz "and"
str_or:	.asciiz "or"
str_div:	.asciiz "div"
str_divu:	.asciiz "divu"
str_mult:	.asciiz "mult"
str_multu:	.asciiz "multu"
str_sub:	.asciiz "sub"
str_subu:	.asciiz "subu"
str_slt:	.asciiz "slt"
str_sltu:	.asciiz "sltu" 
str_sll:	.asciiz "sll"
str_srl:	.asciiz "srl"
str_sra:	.asciiz "sra"
str_sllv:	.asciiz "sllv"
str_srlv:	.asciiz "srlv" 
str_mfhi:	.asciiz "mfhi"
str_mflo:	.asciiz "mflo"

str_ori:	.asciiz "ori"
str_addi:	.asciiz "addi"
str_addiu:	.asciiz "addiu"
str_andi:	.asciiz "andi"
str_slti:	.asciiz "slti"
str_sltiu:	.asciiz "sltiu"
str_lui:	.asciiz "lui"
str_lw:	.asciiz "lw"
str_sw:	.asciiz "sw"

str_li:	.asciiz "li"
str_move:	.asciiz "move"
str_neg:	.asciiz "neg"
str_mul:	.asciiz "mul"
str_abs:	.asciiz "abs"
str_ror:	.asciiz "ror"
str_rol:	.asciiz "rol"
str_seq:	.asciiz "seq"
str_sne:	.asciiz "sne"

str_syscall:	.asciiz "syscall"


.text
###################################################
############ funcion ensamblador ##################
###################################################

ensamblador:
# Entrada, almaceno variables a utilizar
   addi $sp $sp -40
   sw $a1 36($sp)
   sw $ra 32($sp)
   sw $s7 28($sp)
   sw $s6 24($sp)
   sw $s5 20($sp)
   sw $s4 16($sp)
   sw $s3 12($sp)
   sw $s2  8($sp)
   sw $s1  4($sp)
   sw $s0  0($sp)

# Transfiero los argumentos a un lugar seguro
   move $s0 $a0	# s0 -> codigo fuente
   move $s1 $a1	# s1 -> area de .text
   move $s2 $a2	# s2 -> area de .data
   li   $s3 '#' 	# s3 -> caracter para comentarios
   li   $s4 ' '	# s4 -> caracter espacio
   li   $s5 10  	# s5 -> caracter "\n" -> EOL
   li   $s6 9   	# s6 -> tabulador

# Inicio de la codificacion
# Asumo que empieza en modo .text
asm_text_loop:
   lb $t0 0($s0)
   addi $s0 $s0 1
   beq $t0 $0 asm_exit		# Salir cuando se llegue al final del archivo
   beq $t0 $s4 asm_text_loop	# Ignorar espacios en blanco
   beq $t0 $s5 asm_text_loop	# lineas en blanco
   beq $t0 $s6 asm_text_loop	# y tabuladores
   j asm_get_instruction

asm_data_loop:		# Implemente esta parte
   lb $t0 0($s0)
   addi $s0 $s0 1
   beq $t0 $0 asm_exit		# Salir cuando se llegue al final del archivo
   beq $t0 $s4 asm_data_loop	# Ignorar espacios en blanco
   beq $t0 $s5 asm_data_loop	# lineas en blanco
   beq $t0 $s6 asm_data_loop	# y tabuladores
   j asm_get_instruction
   

   j asm_exit

asm_error:			# Manejo generico de errores
   la $a0 errMsg		# En caso de cualquier problema, imprimimos error y terminamos la ejecucion
   jal print_str
   j asm_exit

# Salida
asm_exit:
   lw $a1 36($sp)
   lw $ra 32($sp)
   lw $s7 28($sp)
   lw $s6 24($sp)
   lw $s5 20($sp)
   lw $s4 16($sp)
   lw $s3 12($sp)
   lw $s2  8($sp)
   lw $s1  4($sp)
   lw $s0  0($sp)

   move $v0 $a1		# Devolvemos el buffer (la dirección que recibimos en $a1)
   addi $sp $sp 40
   jr $ra

###########################################
###### Funciones ##########################
###########################################

asm_get_instruction:	# Basicamente, un gran switch que indica que instruccion es
   addi $s0 $s0 -1		# Ya se habia sumado un 1 antes de llegar aqui, arreglamos eso

   move $a0 $s0			# verifico si es la directiva .data
   la $a1 str_data
   jal strcmp
   bne $v0 $0 asm_data_loop

   move $a0 $s0			# verifico si es la directiva .text
   la $a1 str_text
   jal strcmp
   bne $v0 $0 asm_text_loop
  
   move $a0 $s0			# verifico si es data tipo .asciiz
   la $a1 str_asciiz
   jal strcmp
   bne $v0 $0 asm_asciiz

   move $a0 $s0			# verifico si es la instruccion add
   la $a1 str_add
   jal strcmp
   bne $v0 $0 asm_add

   move $a0 $s0			# verifico si es la instruccion addu
   la $a1 str_addu
   jal strcmp
   bne $v0 $0 asm_addu

   move $a0 $s0			# verifico si es la instruccion and
   la $a1 str_and
   jal strcmp
   bne $v0 $0 asm_and

   move $a0 $s0			# verifico si es la instruccion or
   la $a1 str_or
   jal strcmp
   bne $v0 $0 asm_or

   move $a0 $s0			# verifico si es la instruccion div
   la $a1 str_div
   jal strcmp
   bne $v0 $0 asm_div

   move $a0 $s0			# verifico si es la instruccion divu
   la $a1 str_divu
   jal strcmp
   bne $v0 $0 asm_divu
   
   move $a0 $s0			# verifico si es la instruccion mul
   la $a1 str_mul
   jal strcmp
   bne $v0 $0 asm_mul

   move $a0 $s0			# verifico si es la instruccion mult
   la $a1 str_mult
   jal strcmp
   bne $v0 $0 asm_mult

   move $a0 $s0			# verifico si es la instruccion multu
   la $a1 str_multu
   jal strcmp
   bne $v0 $0 asm_multu

   move $a0 $s0			# verifico si es la instruccion sub
   la $a1 str_sub
   jal strcmp
   bne $v0 $0 asm_sub

   move $a0 $s0			# verifico si es la instruccion subu
   la $a1 str_subu
   jal strcmp
   bne $v0 $0 asm_subu

   move $a0 $s0			# verifico si es la instruccion slt
   la $a1 str_slt
   jal strcmp
   bne $v0 $0 asm_slt

   move $a0 $s0			# verifico si es la instruccion sltu
   la $a1 str_sltu
   jal strcmp
   bne $v0 $0 asm_sltu

   move $a0 $s0			# verifico si es la instruccion sll
   la $a1 str_sll
   jal strcmp
   bne $v0 $0 asm_sll

   move $a0 $s0			# verifico si es la instruccion srl
   la $a1 str_srl
   jal strcmp
   bne $v0 $0 asm_srl

   move $a0 $s0			# verifico si es la instruccion sra
   la $a1 str_sra
   jal strcmp
   bne $v0 $0 asm_sra

   move $a0 $s0			# verifico si es la instruccion sllv
   la $a1 str_sllv
   jal strcmp
   bne $v0 $0 asm_sllv
   
   move $a0 $s0			# verifico si es la instruccion srlv
   la $a1 str_srlv
   jal strcmp
   bne $v0 $0 asm_srlv
   
   move $a0 $s0			# verifico si es la instruccion mfhi
   la $a1 str_mfhi
   jal strcmp
   bne $v0 $0 asm_mfhi
   
   move $a0 $s0			# verifico si es la instruccion mflo
   la $a1 str_mflo
   jal strcmp
   bne $v0 $0 asm_mflo

   move $a0 $s0			# verifico si es la instruccion ori
   la $a1 str_ori
   jal strcmp
   bne $v0 $0 asm_ori
   
   move $a0 $s0			# verifico si es la instruccion addi
   la $a1 str_addi
   jal strcmp
   bne $v0 $0 asm_addi
   
   move $a0 $s0			# verifico si es la instruccion addiu
   la $a1 str_addiu
   jal strcmp
   bne $v0 $0 asm_addiu
   
   move $a0 $s0			# verifico si es la instruccion andi
   la $a1 str_andi
   jal strcmp
   bne $v0 $0 asm_andi
   
   move $a0 $s0			# verifico si es la instruccion slti
   la $a1 str_slti
   jal strcmp
   bne $v0 $0 asm_slti
   
   move $a0 $s0			# verifico si es la instruccion sltiu
   la $a1 str_sltiu
   jal strcmp
   bne $v0 $0 asm_sltiu
   
   move $a0 $s0			# verifico si es la instruccion lui
   la $a1 str_lui
   jal strcmp
   bne $v0 $0 asm_lui
   
   move $a0 $s0			# verifico si es la instruccion lw
   la $a1 str_lw
   jal strcmp
   bne $v0 $0 asm_lw
   
   move $a0 $s0			# verifico si es la instruccion sw
   la $a1 str_sw
   jal strcmp
   bne $v0 $0 asm_sw
   
   move $a0 $s0			# verifico si es la instruccion li
   la $a1 str_li
   jal strcmp
   bne $v0 $0 asm_li
   
   move $a0 $s0			# verifico si es la instruccion move
   la $a1 str_move
   jal strcmp
   bne $v0 $0 asm_move
   
   move $a0 $s0			# verifico si es la instruccion neg
   la $a1 str_neg
   jal strcmp
   bne $v0 $0 asm_neg
   
   move $a0 $s0			# verifico si es la instruccion abs
   la $a1 str_abs
   jal strcmp
   bne $v0 $0 asm_abs
   
   move $a0 $s0			# verifico si es la instruccion ror
   la $a1 str_ror
   jal strcmp
   bne $v0 $0 asm_ror

   move $a0 $s0			# verifico si es la instruccion rol
   la $a1 str_rol
   jal strcmp
   bne $v0 $0 asm_rol

   move $a0 $s0			# verifico si es la instruccion seq
   la $a1 str_seq
   jal strcmp
   bne $v0 $0 asm_seq
   
   move $a0 $s0			# verifico si es la instruccion sne
   la $a1 str_sne
   jal strcmp
   bne $v0 $0 asm_sne

   move $a0 $s0			# verifico si es la instruccion syscall
   la $a1 str_syscall
   jal strcmp
   bne $v0 $0 asm_syscall

   move $a0 $s0			# verifico si es un label
   jal asm_label_check
   bne $v0 $0 asm_label

   j asm_error			# si no es ninguna me voy a error

###########################################
######### asm_label #######################
###########################################
asm_label:			# codigo a ejecutarse en caso que sea un label
   lb $t0 0($s0)		# la tabla de simbolos se debe llenar con las etiquetas
   addi $s0 $s0 1
   bne $t0 $s5 asm_label
   j asm_text_loop

###########################################
######### asm_syscall #####################
###########################################
asm_syscall:			# esta instruccion es la mas facil de codificar
   la $t0 0x0000000c
   sw $t0 0($s1)
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_asciiz ######################
###########################################
asm_asciiz:		# codigo a ejecutarse en caso que sea un data segment de tipo .asciiz
   
   addi $s0 $s0 1	# Elimino el espacio
   addi $a0 $0 200	# Se necesita pedir 200 bytes para guardar como maximo un string de 200 carateres
   addi $v0 $0 9	
   syscall
   add $t3 $0 $v0	# temporal de direccion
   addi $t1 $0 34	# carater (")
   add $t2 $0 $0	# inicializo contador de doble comillas y saber cuando empezar y terminar de guardar

loop_asciiz:
   lb $t0 0($s0)
   beq $t0 $t1 if_asciiz
   beq $t2 1 save_asciiz
   beq $t2 2 exit_asciiz
   
if_asciiz:
   addi $t2 $t2 1	# contador += 1
   addi $s0 $s0 1	# ignoro la doble comilla (")
   j loop_asciiz
   
save_asciiz:
   sb $t0 0($t3)
   addi $t3 $t3 1
   addi $s0 $s0 1
   j loop_asciiz

exit_asciiz:
   add $v0 $v0 $0
   j asm_data_loop


###########################################
######### asm_ori #########################
###########################################
asm_ori:
   li $s7 0x0d	# codigo de ori 0x0d

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir (van cruzados)
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_addi #########################
###########################################
asm_addi:
   li $s7 0x08	# codigo de addi 0x08

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir (van cruzados)
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_addiu #########################
###########################################
asm_addiu:
   li $s7 0x09	# codigo de addiu 0x08

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir (van cruzados)
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_andi #########################
###########################################
asm_andi:
   li $s7 0x0c	# codigo de andi 0x0c

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir (van cruzados)
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_slti #########################
###########################################
asm_slti:
   li $s7 0x0a	# codigo de slti 0x0a

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir (van cruzados)
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_sltiu #########################
###########################################
asm_sltiu:
   li $s7 0x0b	# codigo de sltiu 0x0b

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir (van cruzados)
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_lui #########################
###########################################
asm_lui:
   li $s7 0x0f	# codigo de lui 0x0f

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_lw #########################
###########################################
asm_lw:
   li $s7 0x23	# codigo de lw 0x23

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rt
   
   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia

   addi $s0 $s0 1	# elimino el primer parentesis '('
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 21	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs
   
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s0 $s0 2	# elimino el ultimo parentesis ')'
   addi $s1 $s1 4
   j asm_text_loop
   
###########################################
######### asm_sw #########################
###########################################
asm_sw:
   li $s7 0x2b	# codigo de sw 0x2b

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rt
   
   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia

   addi $s0 $s0 1	# elimino el primer parentesis '('
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 21	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs
   
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s0 $s0 2	# elimino el ultimo parentesis ')'
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_mfhi #########################
###########################################
asm_mfhi:
   li $s7 0x00	# codigo de mfhi 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 16 	# concateno el function del mfhi (16 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_mflo #########################
###########################################
asm_mflo:
   li $s7 0x00	# codigo de mflo 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 18 	# concateno el function del mflo (18 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_add #########################
###########################################
asm_add:
   li $s7 0x00	# codigo de add 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 32 	# concateno el function del add (32 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_addu ########################
###########################################
asm_addu:
   li $s7 0x00	# codigo de addu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     # me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     # me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     # me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 33 	# concateno el function del addu (33 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_and #########################
###########################################
asm_and:
   li $s7 0x00	# codigo de and 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     # me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     # me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 36 	# concateno el function del and (36 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_or #########################
###########################################
asm_or:
   li $s7 0x00	# codigo de or 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 37 	# concateno el function del or (37 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_div #########################
###########################################
asm_div:
   addi $s0 $s0 9	# muevo mi puntero para ver si viene o no un registro en el 3er parametro
   lb $t0 0($s0)	
   li $t1 '$'
   addi $s0 $s0 -9	# regreso mi puntero al inicio de los parametros
   beq $t0 $t1 asm_div_3

#div con 2 parametros (registros)
   li $s7 0x00	# codigo de div 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 26 	# concateno el function del div (26 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop
   
asm_div_3:		#div con 3 parametros (registros)
   
   addi $sp $sp -12
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 1er registro
   sw  $s7 8($sp)	# guardo el 1er registro
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 2do registro
   sw  $s7 4($sp)	# guardo el 2do registro 
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 3er registro
   sw  $s7 0($sp)	# guardo el 3er registro
   
#bne 	#############################################################   

   li $s7 0x05	# codigo de bne 0x05

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   lw $t0 0($sp)	# me devuelve el 3er parametro
   sll $t0 $t0 5	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s7 $s7 1 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#break 	#############################################################   

   li $s7 0x0000000d	# codigo de break 0x0000000d
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   
#div 	#############################################################   

   li $s7 0x00	# codigo de div 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 4($sp)	# me devuelve el 2do parametro
   sll $t0 $t0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   lw $t0 0($sp)	# me devuelve el 3er parametro
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 26 	# concateno el function del div (26 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   
#div 	#############################################################   

   li $s7 0x00	# codigo de mflo 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 1er parametro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 18 	# concateno el function del mflo (18 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   
#exit
   addi $sp $sp 12
   j asm_text_loop
   

###########################################
######### asm_divu ########################
###########################################
asm_divu:
   li $s7 0x00	# codigo de divu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 27 	# concateno el function del divu (27 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_mult #########################
###########################################
asm_mult:
   li $s7 0x00	# codigo de mult 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 24 	# concateno el function del mult (24 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_multu #######################
###########################################
asm_multu:
   li $s7 0x00	# codigo de multu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 25 	# concateno el function del multu (25 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_sub #########################
###########################################
asm_sub:
   li $s7 0x00	# codigo de sub 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 34 	# concateno el function del sub (34 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_subu #######################
###########################################
asm_subu:
   li $s7 0x00	# codigo de subu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 35 	# concateno el function del subu (35 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_slt #########################
###########################################
asm_slt:
   li $s7 0x00	# codigo de slt 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 42 	# concateno el function del slt (42 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_sltu #######################
###########################################
asm_sltu:
   li $s7 0x00	# codigo de sltu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 43 	# concateno el function del sltu (43 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_sll #########################
###########################################
asm_sll:
   li $s7 0x00	# codigo de sll 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int     	# me devuelve el numero del inmediato
   sll $v0 $v0 6	# pongo shamt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el inmediato en shamt
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_srl #########################
###########################################
asm_srl:
   li $s7 0x00	# codigo de srl 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

  sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
  addi $s0 $s0 1	# elimino el espacio
  jal ascii_to_int     	# me devuelve el numero del inmediato
  sll $v0 $v0 6	# pongo shamt en la posicion que debe ir
  or  $s7 $s7 $v0	# almaceno el inmediato en shamt
  addiu $s7 $s7 2 	# concateno el function del srl (2 int)
  sw $s7 0($s1)	# almaceno la instruccion codificada
  addi $s1 $s1 4
  j asm_text_loop

###########################################
######### asm_sra #########################
###########################################
asm_sra:
   li $s7 0x00	# codigo de sra 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int     	# me devuelve el numero del inmediato
   sll $v0 $v0 6	# pongo shamt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el inmediato en shamt
   addiu $s7 $s7 3 	# concateno el function del sra (3 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_sllv #########################
###########################################
asm_sllv:
   li $s7 0x00	# codigo de  sllv 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 4 	# concateno el function del sllv (4 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop
   
###########################################
######### asm_srlv #########################
###########################################
asm_srlv:
   li $s7 0x00	# codigo de mult 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 6 	# concateno el function del mult (6 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop
   
###########################################
######### asm_li #########################
###########################################
asm_li:
   li $s7 0x09	# codigo de li el cual es pseudo usando addiu 0x08

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs    	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rs

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop
   
###########################################
######### asm_move #########################
###########################################
asm_move:
   li $s7 0x00	# codigo de move el cual es pseudo usando addu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 33 	# concateno el function del addu (33 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop

###########################################
######### asm_neg #########################
###########################################
asm_neg:
   li $s7 0x00	# codigo de neg el cual es pseudo usando sub 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 34 	# concateno el function del sub (34 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4 
   j asm_text_loop
       
###########################################
######### asm_mul #########################
###########################################
asm_mul:
   
   addi $s0 $s0 9	# muevo mi puntero para ver si viene un registro o un inmediato en el 3er parametro
   lb $t0 0($s0)	
   li $t1 '$'
   addi $s0 $s0 -9	# regreso mi puntero al inicio de los parametros
   bne $t0 $t1 asm_mul_imm
   
   li $s7 0x1c	# codigo de mul 0x1c

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 2 	# concateno el function del mul (2 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   j asm_text_loop    


###########################################
######### asm_mul_imm #########################
###########################################
asm_mul_imm:
   # pseudo instr compuesta de addi y mul	
   
   # mul
   li $s7 0x1c	# codigo de mul 0x1c

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rd

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     	# me devuelve el numero del registro
   sll $v0 $v0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $v0	# almaceno el numero del registro en rs
   
   li $t7 1
   sll $t7 $t7 5	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t7	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 2 	# concateno el function del mul (2 int)
   
   # addi
   li $t7 0x08	# codigo de addi 0x08

   sll $t7 $t7 10	# shift porque son 5b de rt + 5b de rs
   addi $t7 $t7 1	# almaceno el numero del registro $at en rt

   sll $t7 $t7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $t7 $t7 $v0 	# concateno el imm con el resto que ya tenia
   sw $t7 0($s1)	# almaceno la instruccion addi codificada
   addi $s1 $s1 4	
   sw $s7 0($s1)	# almaceno la instruccion mul codificada
   addi $s1 $s1 4
   j asm_text_loop
   
###########################################
######### asm_abs #########################
###########################################
asm_abs:

   addi $sp $sp -8
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 1er registro
   sw  $s7 4($sp)	# guardo el 1er registro
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 2do registro
   sw  $s7 0($sp)	# guardo el 2do registro 
   
#sra 	#############################################################

   li $s7 0x00	# codigo de sra 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s7 $s7 1	# almaceno el numero del registro $at en rd

   lw $t0 0($sp)	# me devuelve el 2do registro
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   li $t0 31
   sll $t0 $t0 6	# pongo shamt de 31 en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el inmediato en shamt
   addiu $s7 $s7 3 	# concateno el function del sra (3 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   
#xor 	#############################################################

   li $s7 0x00	# codigo de xor 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 4($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   li $t0 1
   sll $t0 $t0 10	# pongo $at en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro $at en rs

   lw $t0 0($sp)	# me devuelve el segundo registro
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 38 	# concateno el function del xor (38 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   
#subu 	#############################################################   
   
   li $s7 0x00	# codigo de subu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 4($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   sll $t0 $t0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   li $t0 1
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 35 	# concateno el function del subu (35 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#exit
         
   addi $sp $sp 8
   j asm_text_loop
   
   
###########################################
######### asm_ror #########################
###########################################
asm_ror:
   addi $sp $sp -12
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 1er registro
   sw  $s7 8($sp)	# guardo el 1er registro
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 2do registro
   sw  $s7 4($sp)	# guardo el 2do registro 
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 3er registro
   sw  $s7 0($sp)	# guardo el 3er registro
   
#subu 	#############################################################   
   
   li $s7 0x00	# codigo de subu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s7 $s7 1	# almaceno el numero del registro en rd

   lw $t0 0($sp)	# me devuelve el 3er registro
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 35 	# concateno el function del subu (35 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#sllv 	#############################################################   

   li $s7 0x00	# codigo de  sllv 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s7 $s7 1	# almaceno el numero del registro en rd

   lw $t0 4($sp)	# me devuelve el 2do registro
   sll $t0 $t0 5	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   li $t0 1
   sll $t0 $t0 10	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 4 	# concateno el function del sllv (4 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#srlv 	#############################################################   

   li $s7 0x00	# codigo de  srlv 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 4($sp)	# me devuelve el 2do registro
   sll $t0 $t0 5	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   lw $t0 0($sp)	# me devuelve el 3er registro
   sll $t0 $t0 10	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 6 	# concateno el function del srlv (6 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#or 	#############################################################   

   li $s7 0x00	# codigo de or 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 8($sp)	# me devuelve el 1er registro
   sll $t0 $t0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   li $t0 1
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 37 	# concateno el function del or (37 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#exit
   addi $sp $sp 12
   j asm_text_loop
   
###########################################
######### asm_rol #########################
###########################################

asm_rol:

   addi $sp $sp -12
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 1er registro
   sw  $s7 8($sp)	# guardo el 1er registro
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 2do registro
   sw  $s7 4($sp)	# guardo el 2do registro 
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 3er registro
   sw  $s7 0($sp)	# guardo el 3er registro
   
#subu 	#############################################################   
   
   li $s7 0x00	# codigo de subu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   addi $s7 $s7 1	# almaceno el numero del registro en rd

   lw $t0 0($sp)	# me devuelve el 3er registro
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 35 	# concateno el function del subu (35 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#srlv 	#############################################################   

   li $s7 0x00	# codigo de  srlv 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   li $t0 1		# guardo $at en rd
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 4($sp)	# me devuelve el 2do registro
   sll $t0 $t0 5	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   li $t0 1		# guardo $at en rt
   sll $t0 $t0 10	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 6 	# concateno el function del srlv (6 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   
#sllv 	#############################################################   

   li $s7 0x00	# codigo de  sllv 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 2do registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 4($sp)	# me devuelve el 2do registro
   sll $t0 $t0 5	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   lw $t0 0($sp)	# me devuelve el 2do registro
   sll $t0 $t0 10	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 4 	# concateno el function del sllv (4 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#or 	#############################################################   

   li $s7 0x00	# codigo de or 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 8($sp)	# me devuelve el 1er registro
   sll $t0 $t0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   li $t0 1
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 37 	# concateno el function del or (37 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#exit
   addi $sp $sp 12
   j asm_text_loop

 
###########################################
######### asm_seq #########################
###########################################

asm_seq:

   addi $sp $sp -12
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 1er registro
   sw  $s7 8($sp)	# guardo el 1er registro
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 2do registro
   sw  $s7 4($sp)	# guardo el 2do registro 
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 3er registro
   sw  $s7 0($sp)	# guardo el 3er registro
   
#subu 	#############################################################   
   
   li $s7 0x00	# codigo de subu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 4($sp)	# me devuelve el 2do registro
   sll $t0 $t0 10	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   lw $t0 0($sp)	# me devuelve el 3er registro
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt
   
   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 35 	# concateno el function del subu (35 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#ori 	#############################################################   

   li $s7 0x0d	# codigo de ori 0x0d

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs

   li $t0 1
   add $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   add $s7 $s7 $t0 	# concateno el imm con el resto que ya tenia
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   
#sltu 	#############################################################   

   li $s7 0x00	# codigo de sltu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 8($sp)	# me devuelve el 1er registro
   sll $t0 $t0 10	# pongo rs en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   li $t0 1
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 43 	# concateno el function del sltu (43 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#exit
   addi $sp $sp 12
   j asm_text_loop


###########################################
######### asm_sne #########################
###########################################

asm_sne:

   addi $sp $sp -12
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 1er registro
   sw  $s7 8($sp)	# guardo el 1er registro
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 2do registro
   sw  $s7 4($sp)	# guardo el 2do registro 
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs
   add $s7 $0 $v0	# me devuelve el 3er registro
   sw  $s7 0($sp)	# guardo el 3er registro
   
#subu 	#############################################################   
   
   li $s7 0x00	# codigo de subu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 4($sp)	# me devuelve el 2do registro
   sll $t0 $t0 10	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rs

   lw $t0 0($sp)	# me devuelve el 3er registro
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt
   
   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 35 	# concateno el function del subu (35 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
   
#sltu 	#############################################################   

   li $s7 0x00	# codigo de sltu 0x00

   sll $s7 $s7 15	# shift porque son 5b de rs + 5b de rt + 5b de rd
   lw $t0 8($sp)	# me devuelve el 1er registro
   add $s7 $s7 $t0	# almaceno el numero del registro en rd

   lw $t0 8($sp)	# me devuelve el 1er registro
   sll $t0 $t0 5	# pongo rt en la posicion que debe ir
   or  $s7 $s7 $t0	# almaceno el numero del registro en rt

   sll $s7 $s7 11	# le hago shift de 11 para hacer espacio al shamt (5b) y al funct (6b)
   addiu $s7 $s7 43 	# concateno el function del sltu (43 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4

#exit
   addi $sp $sp 12
   j asm_text_loop


###########################################
############# asm_regs ####################
###########################################
asm_regs:			# Pasa de $xN -> N, por ejemplo $s0 -> 16
   addi $sp $sp -4
   sw $ra 0($sp)
   li $t7 '$'		# Se usara para verificar que viene un registro
   li $t6 'a'		# aX -> argumentos
   li $t5 'v'		# vX -> valores de retorno
   li $t4 '0'		# cero
   li $t3 't'		# tX -> temporales
   li $t2 's'		# sX -> save

   lb $t0 0($s0)
   addi $s0 $s0 1
   bne $t0 $t7 asm_regs_error	# Si no empieza con $ no es valido
   lb $t0 0($s0)
   addi $s0 $s0 1
   beq $t0 $t6 asm_regs_ax		# Verificar a que grupo pertence para sumarle un offset
   beq $t0 $t5 asm_regs_vx
   beq $t0 $t4 asm_regs_zero
   beq $t0 $t3 asm_regs_tx
   beq $t0 $t2 asm_regs_sx
   beq $t0 'r' asm_regs_ra

   j asm_regs_error				# No es ninguno, es un error

asm_regs_zero:		# Caso trivial
   li $v0 0
   j asm_regs_exit

asm_regs_ax:
   jal ascii_to_int
   addi $v0 $v0 4	# $a0 es 4, $a1 es 5, etc.
   j asm_regs_exit

asm_regs_vx:
   jal ascii_to_int
   addi $v0 $v0 2
   j asm_regs_exit

asm_regs_tx:
   jal ascii_to_int
   beq $v0 8 asm_regs_tx2
   beq $v0 9 asm_regs_tx2
   addi $v0 $v0 8           #$t0...$t7 es 8...15
   j asm_regs_exit
asm_regs_tx2:
   addi $v0 $v0 16	#$t8 es 24, $t9 es 25
   j asm_regs_exit

asm_regs_sx:
   lb $t0 0($s0)
   beq $t0 'p' asm_regs_sp  # $sp
   jal ascii_to_int
   addi $v0 $v0 16           # $s0...$s7 es 16...23
   j asm_regs_exit

asm_regs_sp:
   li $v0 29
   addi $s0 $s0 1
   j asm_regs_exit

asm_regs_ra:
   lb $t0 0($s0)
   bne $t0 $t6 asm_error	# si no es $ra goto asm_error
   li $v0 31
   addi $s0 $s0 1
   j asm_regs_exit

asm_regs_exit:
   lw $ra 0($sp)
   addi $sp $sp 4
   jr $ra

asm_regs_error:
   addi $sp $sp 4
   j asm_error

###########################################
######### ascii_to_int ####################
###########################################
ascii_to_int:   	# the infamous atoi, with no validations!
li $t1 0		# init with zero
li $t2 '0'
li $t3 '9'
li $t4 10
li $v0 0

ascii_to_int_loop:
   lb $t0 0($s0)
   beq $t0 $0  ascii_to_int_exit
   blt $t0 $t2 ascii_to_int_exit	# only accept numbers
   bgt $t0 $t3 ascii_to_int_exit	# only accept numbers
   addi $s0 $s0 1		# advance the char pointer
   addi $t0 $t0 -48		# get real number (without the '0' offset)
   mul  $v0 $v0 $t4		# multiply by 10
   add  $v0 $v0 $t0		# add real number
   j ascii_to_int_loop

ascii_to_int_exit:
   jr $ra

###########################################
######### strcmp ##########################
###########################################

strcmp:			# Compara 2 cadenas de caracteres
   li $t2 ' '
   li $t3 10

strcmp_loop:
   lb $t0 0($a0)
   lb $t1 0($a1)
   beq $t0 $t2 strcmp_true	# Un par de caracteres que no son letras
   beq $t0 $t3 strcmp_true
   beq $t0 $0  strcmp_true	# Fin de cadena
   bne $t0 $t1 strcmp_false	# Es diferente
   addi $a0 $a0 1
   addi $a1 $a1 1
   j strcmp_loop

strcmp_true:
   move $s0 $a0			# Esta funcion no es portable
   li $v0 1
   jr $ra

strcmp_false:
   li $v0 0
   jr $ra

###########################################
######### asm_label_check #################
###########################################
asm_label_check:	# Verifica si la cadena es un label
   li $t1 ':'
   li $t2 ' '
   li $t3 10

asm_label_loop:
   lb $t0 0($a0)
   addi $a0 $a0 1
   beq $t0 $t1 asm_label_true
   beq $t0 $t2 asm_label_false
   beq $t0 $t3 asm_label_false
   j asm_label_loop

asm_label_true:
   move $s0 $a0
   li $v0 1
   jr $ra

asm_label_false:
   li $v0 0
   jr $ra
   

###########################################
######### tabla de simbolos ###############
###########################################



#### FIN DEL CODIGO #####
