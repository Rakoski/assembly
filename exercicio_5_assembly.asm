.data

vetor: .word 8 10 5 4 7 3 # valor sentinela pra saber quando o vetor termina
n: .word 5 # na memória

.text
inicio:
	move $t2, $zero
	move $t6, $zero # r = 0
	move $t7, $zero # n = 0
	move $t9, $zero
	lw $t8, n
	la $t3, vetor # endereço do vetor
	
laco:
	lw $t4, ($t3)   # $t4 += vetor[i]
	#li $t5, -1 # $t5 = -1 carregando o registrador pra ser igual a -1
	beq $t2 $t8, fim # se $t7 for igual a 99 (n^² de -1 por algum motivo), vai descobrir a média
	
	mul $t7, $t4, $t4
	
	li $v0, 1
	move $a0, $t7
	syscall
	
	add $t6, $t6, $t4 # r += vetor[i]
	add $t2, $t2, 1  # i++
	add $t3, $t3, 4  # avança 4 bytes na word --> proximo elemento do vetor (vetor]i])
	b laco  # repete o laço
	
fim:
