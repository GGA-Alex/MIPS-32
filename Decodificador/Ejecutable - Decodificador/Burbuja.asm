addi $s0,$zero,7500
addi $s1,$zero,0
addi $s2,$zero,10000
addi $s3,$zero,6035
addi $s4,$zero,6040
nop
addi $t0,$zero,1
addi $t1,$zero,5
nop
addi $t2,$zero,0
addi $t3,$zero,4
nop
addi $at,$zero,1
addi $v0,$zero,2
addi $v1,$zero,3
addi $a0,$zero,4
.for1:
	beq $t0,$t1,.final
	nop
	nop
	nop
	nop
	addi $t2,$zero,0
	nop
.for2:
	beq $t2,$t3,.for1
	nop
	nop
	nop
	nop
	beq $zero,$t2,.it1
	nop
	nop
	nop
	nop
	beq $at,$t2,.it2
	nop
	nop
	nop
	nop
	beq $v0,$t2,.it3
	nop
	nop
	nop
	nop
	beq $v1,$t2,.it4
	nop
	nop
	nop
	nop
.it1:
	addi $t5,$s0,0
	addi $t6,$s1,0
	slt $t8,$s0,$s1
	nop
	nop
	beq $t8,$at,.a
	nop
	nop
	nop
	nop
	addi $s0,$t6,0
	addi $s1,$t5,0
	addi $t2,$t2,1
	j .for2
	nop
	nop
	nop
	nop
	nop
.it2:
	addi $t5,$s1,0
	addi $t6,$s2,0
	slt $t8,$s1,$s2
	nop
	nop
	beq $t8,$at,.a
	nop
	nop
	nop
	nop
	addi $s1,$t6,0
	addi $s2,$t5,0
	addi $t2,$t2,1
	j .for2
	nop
	nop
	nop
	nop
	nop
.it3:
	addi $t5,$s2,0
	addi $t6,$s3,0
	slt $t8,$s2,$s3
	nop
	nop
	beq $t8,$at,.a
	nop
	nop
	nop
	nop
	addi $s2,$t6,0
	addi $s3,$t5,0
	addi $t2,$t2,1
	j .for2
	nop
	nop
	nop
	nop
	nop
.it4:
	addi $t5,$s3,0
	addi $t6,$s4,0
	slt $t8,$s3,$s4
	nop
	nop
	beq $t8,$at,.a1
	nop
	nop
	nop
	nop
	addi $s3,$t6,0
	addi $s4,$t5,0
	addi $t2,$t2,1
	addi $t0,$t0,1
	j .for2
	nop
	nop
	nop
	nop
	nop	
.a:
	addi $t2,$t2,1
	j .for2
	nop
	nop
	nop
	nop
	nop
.a1:
	addi $t2,$t2,1
	addi $t0,$t0,1
	j .for2
	nop
	nop
	nop
	nop
	nop
.final:
	sw $s0,0($zero)
	nop
	nop
	sw $s1,0($at)
	nop
	nop
	sw $s2,0($v0)
	nop
	nop
	sw $s3,0($v1)
	nop
	nop
	sw $s4,0($a0)
	nop
	nop
	lw $s0,0($zero)
	nop
	nop
	lw $s1,0($at)
	nop
	nop
	lw $s2,0($v0)
	nop
	nop
	lw $s3,0($v1)
	nop
	nop
	lw $s4,0($a0)
	nop
	nop
