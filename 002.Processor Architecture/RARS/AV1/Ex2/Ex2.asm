# Disciplina: Arquitetura e Organização de Processadores 
# Avaliação: 01 – Programação em Linguagem de Montagem 
# Alunos: Ian Marcos, Henry jose, Vinicius Tridapalli
	
	.text 
	
	li a1, 0 # Load imediato a1 recebe 0
	
for:
	li t1, 8 # Load imediato t1 recebe 8
	bge a1, t1, exit # Caso a1 seja igual a t1, salta para exit
	
	li a7, 1 # Seleciona o serviço de impressão de inteiro
	add a0, zero, a1 #Carrega o valor de a1 em a0 para ser impresso na tela
	ecall # Chama o serviço

	addi a1, a1 1 # Atualiza o valor de a1 para a1 + 1 
	j for # Salta para o for
	
exit:	
	nop #encerra o programa
