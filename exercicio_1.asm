.data

soma: .word 0
index: .word 0
numero_inserido: .word 0
prompt: .asciiz "Por favor, digite um valor:"
mensagem_resultado: .asciiz "Resultado:"

.text

# vou ter que fazer um loop ir somando do 0 até o número guardado que o usuário colocar, agora como vou fazer isso em assembly nem eu sei
# primeiro, guardar o prompt e guardar o número colocado pelo usuário no registrador n
.globl main
main:
	li $v0, 4 # usnado a instrução 4 do li pra imprimir uma string "prompt"
	la $a0, prompt
	syscall 
	
	li $v0, 5 # guardando o 5 no registrador "prompt"
	syscall
	sw $v0, numero_inserido # carregando a palavra que o usuário colocou no registrador n
	 
	#li $v0, 4 # printando a mensagme de resultado
	#la $a0, mensagem_resultado
	#syscall
	
	#lw $a0, numero_inserido # printando n, isto é, o número que colocamos o número escolido pelo usuário
	#li $v0, 1
	# syscall # se eu comentar esse syscall aqui, ele só vai printar a soma, sem printar o número
	
	li $t1, 0 # soma = 0
	li $t2, 0 # index do número = 0

loop:
    lw $t3, numero_inserido
    ble $t2, $t3, continua_loop  # se o índice for menor ou igual ao número, continua no loop
    j end_loop

continua_loop:
    add $t1, $t1, $t2  # colocando o índice na soma
    addi $t2, $t2, 1  # i++
    j loop

end_loop:
    sw $t1, soma
    
    li $v0, 4
    la $a0, mensagem_resultado
    syscall

    lw $a0, soma
    li $v0, 1
    syscall
