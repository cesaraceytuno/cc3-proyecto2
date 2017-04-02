.text

lui  $t2 123
slti $t2 $s4 123
sltiu $t2 $s4 123	
sw $t2 4($t3)
mfhi $t2
mflo $t2
div $t1 $t2 $t3
