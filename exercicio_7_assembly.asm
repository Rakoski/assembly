.data

vetor: .word 5 9 2 8 7 1 14 2 -1
msg_menor: .asciiz " O menor número é: "
msg_maior: .asciiz " Já o maior número é: "

.text
main:
	la $t0, vetor 
	li $t1, 0 
	li $t2, 0 
	lw $t3, vetor 

loop_outer:
	lw $t4, 0($t0)
	la $t5, vetor 
	add $t5, $t5, $t2
	addi $t5, $t5, 4
	move $t6, $t5 

loop_inner:
	lw $t7, 0($t6) 
	beq $t7, -1, end_loop_inner 
	blt $t7, $t4, update_min 
	addi $t6, $t6, 4
	j loop_inner

update_min:
	move $t4, $t7
	move $t8, $t6
	j loop_inner

end_loop_inner:
	beq $t4, 0, no_swap 
	sw $t4, 0($t2) 
	lw $t9, 0($t2)
	sw $t9, 0($t8)

no_swap:
	addi $t2, $t2, 4
	lw $t4, 0($t2)
	beq $t4, -1, fim
	j loop_outer

fim:
	la $a0, vetor
	li $v0, 4
	la $a0, msg_menor
	syscall
	li $v0, 1
	lw $a0, vetor
	syscall
	li $v0, 4
	la $a0, msg_maior
	syscall
	li $v0, 1
	la $t1, vetor
	j find_largest

find_largest:
	lw $t2, 0($t1)
	beq $t2, -1, end_find_largest
	bgt $t2, $t3, update_largest
	addi $t1, $t1, 4
	j find_largest

update_largest:
	move $t3, $t2
	j find_largest

end_find_largest:
	move $a0, $t3
	syscall
