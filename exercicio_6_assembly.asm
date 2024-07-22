.data

vetor: .word 5 9 2 8 7 1 14 2 -1
msg_menor: .asciiz " O menor número é: "
msg_maior: .asciiz " Já o maior número é: "

.text
main:
	la $t1, vetor # t1 = vetor
	move $t2, $zero # maior_numero = 0
	lw $t4, vetor # carregando o primeiro número do vetor pra comparar com os outros
	j loop

loop:
	lw $t3, ($t1) # t3 = vetor[i]
	beq $t3, -1, fim # pula pro fim se t3 = -1
	 
	bgt $t3, $t2, maior_numero # se t3 for maior que o maior_numero, muda ele
	blt $t3, $t4, menor_numero # se t3 for menor que o menor_numero, muda ele
	
	#li $v0, 1
	#move $a0, $t4
	#syscall
	
	add $t1, $t1, 4 # avança 4 bytes no vetor
	j loop

maior_numero:
	#li $v0, 1
	#move $a0, $t3
	#syscall
	move $t2, $zero
	move $t2, $t3 # colocando t2 como maior número
	j loop


menor_numero:
	move $t4, $zero
	move $t4, $t3 # colocando t4 como menor número
	j loop

fim:
	li $v0, 4
	la $a0, msg_menor # print da msg de menor número
	syscall
	li $v0, 1
	move $a0, $t4 #printando o menor número
	syscall
	li $v0, 4
	la $a0, msg_maior # printando a msg de maior
	syscall
	li $v0, 1
	move $a0, $t2 # printando o maior número
	syscall