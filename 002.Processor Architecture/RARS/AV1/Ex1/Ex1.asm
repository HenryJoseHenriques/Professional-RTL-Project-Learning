# Disciplina: Arquitetura e Organização de Processadores 
# Avaliação: 01 – Programação em Linguagem de Montagem 
# Alunos: Ian Marcos, Henry jose, Vinicius Tridapalli

	.data
	
	.TX:
		.asciz "\nEntre com o valor de X:"
	.TY:
		.asciz "\nEntre com o valor de Y:"
	.TW:
		.asciz "\nA subtração de X e Y é igual a: "
	.text

main:
	li a7, 4
	la a0, .TX
	ecall
	
	li a7, 5
	ecall
	add t0, zero, a0
	
	li a7, 4
	la a0, .TY
	ecall
	
	li a7, 5
	ecall
	add t1, zero, a0
	
	sub t2, t0, t1
	
	li a7, 4
	la a0, .TW
	ecall
	
	li a7, 1
	add a0, zero, t2
	ecall