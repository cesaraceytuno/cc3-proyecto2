.data
msgBCodif: .asciiz "Codificando el siguinete programa:\n\n"

##### INICIO DEL PROGRAMA A CODIFICAR #####
programa:	.asciiz ".text\nmain:\n   add $a0 $a1 $a2\n   ori $v0 $0 1\n   syscall\n   ori $v0 $0 10\n   syscall"
##### FIN DEL PROGRAMA A CODIFICAR #####


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
str_add:	.asciiz "add"
str_ori:	.asciiz "ori"
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

asm_data_loop:					# Implemente esta parte
   j asm_exit

asm_error:						# Manejo generico de errores
   la $a0 errMsg				# En caso de cualquier problema, imprimimos error y terminamos la ejecucion
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

   move $v0 $a1					# Devolvemos el buffer (la dirección que recibimos en $a1)
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
   
   move $a0 $s0			# verifico si es la instruccion add
   la $a1 str_add
   jal strcmp
   bne $v0 $0 asm_add

   move $a0 $s0			# verifico si es la instruccion ori
   la $a1 str_ori
   jal strcmp
   bne $v0 $0 asm_ori

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
asm_label:				# codigo a ejecutarse en caso que sea un label
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
######### asm_ori #########################
###########################################
asm_ori:
   li $s7 0x0d		# codigo de ori 0x0d

   sll $s7 $s7 10	# shift porque son 5b de rt + 5b de rs
   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     # me devuelve el numero del registro
   add $s7 $s7 $v0	# almaceno el numero del registro en rs

   addi $s0 $s0 1	# elimino el espacio
   jal asm_regs     # me devuelve el numero del registro
   sll $v0 $v0 5	# pongo rs en la posicion que debe ir (van cruzados)
   or  $s7 $s7 $v0	# almaceno el numero del registro en rt

   sll $s7 $s7 16	# le hago shift de 16 para hacer espacio al imm
   addi $s0 $s0 1	# elimino el espacio
   jal ascii_to_int	# hago la conversion de ascii a int
   addu $s7 $s7 $v0 # concateno el imm con el resto que ya tenia
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
   addiu $s7 $s7 32 	# concateno el function del add (32 int)
   sw $s7 0($s1)	# almaceno la instruccion codificada
   addi $s1 $s1 4
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
   j asm_regs_exit
 
asm_regs_ra:
   lb $t0 0($s0)
   bne $t0 $t6 asm_error	# si no es $ra goto asm_error
   li $v0 31
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
ascii_to_int:   # the infamous atoi, with no validations!
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
   addi $s0 $s0 1			# advance the char pointer
   addi $t0 $t0 -48			# get real number (without the '0' offset)
   mul  $v0 $v0 $t4			# multiply by 10
   add  $v0 $v0 $t0			# add real number
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

#### FIN DEL CODIGO #####
