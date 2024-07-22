.data

n: .word 6 # int n = 4
s: .word

.text

main:
	li $0,, 0 # i = 0
	lw $t1, n # n = 5
	li $t2, 0 # soma = 0
	
	# while (i <= n)
loop:

	bgt $t0, $t1, end_loop  # se ele entrar dentro do loop é pq o i é = a n
	add $t2, $t2, $t0       #soma += 1
	add $t0, $t0, 1         # i++
	b loop
	
end_loop:
	sw $t2, s
	
	#syscall
	li $v0, 1
	lw $a0, s
	syscall
	
