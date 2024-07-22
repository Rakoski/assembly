.data

vetor: .word 8 10 5 4 7 # 34 no fimal
n: .word 5

.text
# como eu tinha feito o exercício 2 na aula e esqueci de salvar e depois fiz o 3 em casa, vou usar o exercício 3 como base pra conseguir fazer a somatória do vetor
inicio:
	lw $t0, n # n = 5
	move $t2, $zero  #i = 0.
	move $t6, $zero #r = 0
	la $t3, vetor
laco:
	bge $t2, $t0, fim
	lw $t4, ($t3)   # vetor[i] += vetor[i - 1]
	add $t6, $t6, $t4 # 
	
	add $t2, $t2, 1  #  i += 1
	add $t3, $t3, 4  # avança 4 bytes na word --> proximo elemento
	b laco  # repete o laço
	
fim:
	li $v0, 1
	move $a0, $t6
	syscall