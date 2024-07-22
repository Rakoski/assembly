.data

vetor1: .word 8 10 5 4 7
vetor2: .word 5 14 2 3 6
vetor3: .word 0 0 0 0 0
n: .word 5

.text

inicio:
	lw $t0, n # n = 5
	move $t1, $zero  #r = 0
	move $t2, $zero  #i = 0.
	move $t7, $zero # c = 0
	move $s1, $zero # soma = 0
	la $t3, vetor1
	la $t5, vetor2
	la $t8, vetor3
	
laco:
	bge $t2, $t0, fim
	lw $t4, ($t3)   # $t4 = *
	lw $t6, ($t5)
	lw $t9, ($t8) # load vetor3[i]
	#li $v0, 1
	#move $a0, $t4
	#syscall
	#li $v0, 1
	#move $a0, $t6
	#syscall
	add $t6, $t6, $t4
	add $t9, $t9, $t6 # colocando a soma do vetor2[i] + vetor1[i] no vetor3[i]
	#li $v0, 1
	#move $a0, $t8
	#syscall
	li $v0, 1
        move $a0, $t9 # printanto o vetor3[i] somado com os outros 2 vetores
	syscall
	add $t1, $t1, $t4  #  0 += 8
	add $t7, $t7, $t2
	
	add $t2, $t2, 1  #  i += 1
	add $t3, $t3, 4  # avança 4 bytes --> proximo elemento
	add $t5, $t5, 4 # avança 4 bytes no vetor 2
	add $t8, $t8, 4 # avança 4 bytes no vetor 3
	b laco  # repete o laço

fim: