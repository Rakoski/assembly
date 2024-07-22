.data

vetor: .word 8 10 5 4 7, 3, 6, 11, -1 # valor sentinela pra saber quando o vetor termina
msg_maior: .asciiz "quantidade maior ou igual a média: "
msg_menor: .asciiz " quantidade menor que a média: "

.text
inicio:
	move $t2, $zero
	move $t6, $zero # r = 0
	move $t7, $zero # valor_media = 0
	move $t8, $zero # valores_acima_media = 0
	move $s1, $zero # valores_abaixo_media = 0
	la $t3, vetor # endereço do vetor
laco:
	lw $t4, ($t3)   # $t4 += vetor[i]
	li $t5, -1 # $t5 = -1
	beq $t4, $t5, descobre_a_media # se $t5 for igual a -1, vai descobrir a média
	
	#li $v0, 1
	#move $a0, $t4
	#syscall
	
	add $t6, $t6, $t4 # r += vetor[i]
	add $t2, $t2, 1  # i++
	add $t3, $t3, 4  # avança 4 bytes na word --> proximo elemento do vetor (vetor]i])
	b laco  # repete o laço
	
descobre_a_media:
	div $t6, $t2 # dividindo o vetor pela quantidade de elementos dele
	mflo $t7
	#li $v0, 1	
	#move $a0, $t7
	#syscall
	#li $v0, 1	
	#move $a0, $t7
	#syscall
	la $t3, vetor # recarrega o vetor pro segundo loop
	j laco_pra_saber_os_numeros_maiores_e_menores_que_a_media

laco_pra_saber_os_numeros_maiores_e_menores_que_a_media:
	lw $t9, ($t3)
	beq $t9, $t5, fim # se $t9 for igual a -1, vai pro fim
	#li $v0, 1	
	#move $a0, $t9
	#syscall
	#li $v0, 1	
	#move $a0, $t7
	#syscall
	bge $t9, $t7, maior_que_a_media
	blt $t9, $t7, menor_que_a_media
	
maior_que_a_media:
        add $t8, $t8, 1
        j itera_o_vetor

menor_que_a_media:
        #li $v0, 1
	#move $a0, $t9
	#syscall
	add $s1, $s1, 1
	j itera_o_vetor

itera_o_vetor:
        addi $t3, $t3, 4
        j laco_pra_saber_os_numeros_maiores_e_menores_que_a_media

fim:
        li $v0, 4
	la $a0, msg_maior
	syscall
        li $v0, 1
	move $a0, $t8
	syscall
	li $v0, 4
	la $a0, msg_menor
	syscall
        li $v0, 1
	move $a0, $s1
	syscall
