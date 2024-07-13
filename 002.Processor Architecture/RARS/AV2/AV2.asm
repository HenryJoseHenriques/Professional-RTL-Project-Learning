# Disciplina: Arquitetura e Organização de Processadores 
# Avaliação: 01 – Programação em Linguagem de Montagem 
# Alunos: Ian Marcos, Henry jose, Vinicius Tridapalli

	.data
		.TX:
			.asciz "Entre com o tamanho dos vetores (máx.= 8).\n"
		.TA: 
			.asciz "Vetor_A [ "
		.TB: 
			.asciz "Vetor_B [ "
		.TC: 
			.asciz "Vetor_C [ "
		.TF:
			.asciz " ] = "
		.BR:
			.asciz "\n"
		.VI:
			.asciz "Valor inválido.\n"
				
		Vetor_A:
			.word 0, 0, 0, 0, 0, 0, 0, 0	
		Vetor_B:
			.word 0, 0, 0, 0, 0, 0, 0, 0
		Vetor_C:
			.word 0, 0, 0, 0, 0, 0, 0, 0

	.text

		main:
			la, s0, Vetor_A # Carrega o endereço base do Vetor A
			la, s1, Vetor_B # Carrega o endereço base do Vetor B
			la, s2, Vetor_C # Carrega o endereço base do Vetor C
			li s3, 9 # MAX = 8
			li s7, 1 # MIN = 1
			#s4 = armazena o valor do tamanho do vetor
			li s5, 0 # i = 0
			li s6, 1 # j = 1, serve para atualizar o endereço dos vetores
					  
			
		TamV:	# Loop Até que o valor digitado seja igual ou menor que 8
			li a7, 4 #Serviço de impressão de string, texto: Entre com o tamanho dos vetores (máx.= 8).\n
			la a0, .TX #Chamada da String
			ecall
			
			#Entrada do tamanho máximo
			li a7, 5 #Chamada do serviço de entrada de inteiro
			ecall #Chama o serviço da interface
			add s4, zero, a0 #Armazena o retorno em s4
			bge s4, s3, ValorInvalido #Vai para a mensagem de valor inválido, caso o número digitado seja maior que 8
			blt s4, s7, ValorInvalido #Vai para a mensagem de valor inválido, caso o número digitado seja menor que 1
			j LoopA #Se passar pela verificação, pula o Loop A
			
		ValorInvalido:
			li a7, 4 #Serviço de impressão de string, texto: Valor inválido.\n
			la a0, .VI #Chamada da String
			ecall # Chamada do serviço
			j TamV #Retorna para o Loop V
			
			# Loop Encerra aqui, cso o valor digitado seja menor ou igual a 8
			
		LoopA:	
			li a7, 4 #Serviço de impressão de string, texto: Vetor_A [ 
			la a0, .TA #Chamada da String
			ecall #chamada do serviço
			
			li a7, 1
			add a0, zero, s5 # valor de i
			ecall
			
			li a7, 4 # Serviço de impressão de string
			la a0, .TF # Chamada da String, texto: ] = 
			ecall #Chamada de Sistema
			
			li a7, 5 #Serviço de entrada de inteiro, para armazenar  valores  no vetor A
			ecall # Chama o serviço da interface
			add t0, zero, a0 #armazena o retorno em t1 (intemediador)
			
			sw t0 0(s0) #Armazena o valor de t0 na primeira posição do vetor A
			
			#Atualização do endereço de memória do vetor A
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t1 = 4*j
			add s0, s0, t1 # Endereço absoluto = endereço base(s0) + Endereço relativo(s6)
			
			addi s5, s5, 1 # i = i + 1
			bne s5, s4, LoopA # Se o valor de  i for diferente do valor do tamanho máximo do vetor, volta para o LoopA
			
			li a7, 4 # Serviço de impressão de string
			la a0, .BR # Chamada da String, Quebra de linha 
			ecall #Chamada de Sistema
			
		Reset:
			li s5, 0 # i = 0
			li s6, 1 # j = 1, serve para atualizar o endereço dos vetores		

		LoopB:	li a7, 4 #Serviço de impressão de string, texto: Vetor_B [ 
			la a0, .TB #Chamada da String
			ecall # Chamada do serviço
			
			li a7, 1
			add a0, zero, s5 # valor de i
			ecall
			
			li a7, 4 # Serviço de impressão de string
			la a0, .TF # Chamada da String, texto: ] = 
			ecall #Chamada de Sistema
			
			li a7, 5 #Serviço de entrada de inteiro, para armazenar  valores  no vetor B
			ecall # Chama o serviço da interface
			add t0, zero, a0 #armazena o retorno em t1 (intemediador)
			
			sw t0 0(s1) #Armazena o valor de t0 na primeira posição do vetor B
			
			#Atualização do endereço de memória do vetor B
			add t2, s6, s6 # s6 = 2*j
			add t2, t2, t2 # t2 = 4*j
			add s1, s1, t2 # Endereço absoluto = endereço base(s1) + Endereço relativo(s6)
			
			addi s5, s5, 1 # i = i + 1
			bne s5, s4, LoopB # Se o valor de  i for diferente do valor do tamanho máximo do vetor, volta para o LoopB
			
		PreencheC:
			#lw t3, 0(s0) #Armazena o endereço base do vetor A
			#lw t4, 0(s1) #Armazena o endereço base do vetor B
			la, s0, Vetor_A # Carrega o endereço base do Vetor A
			la, s1, Vetor_B # Carrega o endereço base do Vetor B
			li s5, 0 # i = 0
			li s6, 1 # j = 1, serve para atualizar o endereço dos vetores
			li t1, 0 # Retorna t1 para 0
			#li t2, 0 # Retorna t2 para 0
			#li t3, 0 # Utiliza t3 para atualizar o endereço do vetor C
			
			#agora devemos atualizar o valores dos endereços do vetor A e Vetor B
			
			#Atualização do endereço de memória do vetor A
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t1 = 4*j
			add s0, s0, t1 # Endereço absoluto = endereço base(s0) + Endereço relativo(s6)
			
			li s6, 1 # Reseta o registrador para usar para atualizar o endereço do Vetor B
			li t1, 0 # Reseta o registrador para usar para atualizar o endereço do Vetor B
			
			#Atualização do endereço de memória do vetor B
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t2 = 4*j
			add s1, s1, t1 # Endereço absoluto = endereço base(s1) + Endereço relativo(s6) 
			
			#Vamor atualizar o valor de i para não ultrapassar o tamanho máximo do vetor
			addi s5, s5, 1 # i = i + 1
			
			bge t3, t4, PreencheAC
			bge t4, t3, PreencheBC
			
		PreencheAC:
			sw t3, 0(s2) # Armazena o endereço base do vetor C
			li s6, 1 # Reseta o registrador para usar para atualizar o endereço do Vetor B
			li t1, 0 # Reseta o registrador para usar para atualizar o endereço do Vetor B
			
			#Atualização do endereço de memória do vetor C
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t3 = 4*j
			add s2, s2, t1 # Endereço absoluto = endereço base(s3) + Endereço relativo(s6)
			beq s5, s4, ResetTwo # Se o valor de  i for igual do valor do tamanho máximo do vetor, vai para a saidaC
			j PreencheC
		
		PreencheBC:
			sw t4, 0(s2)
			li s6, 1 # Reseta o registrador para usar para atualizar o endereço do Vetor C
			
			#Atualização do endereço de memória do vetor C
			add t3, s6, s6 # s6 = 2*j
			add t3, t3, t3 # t3 = 4*j
			add s2, s2, t3 # Endereço absoluto = endereço base(s3) + Endereço relativo(s6)
			beq s5, s4, ResetTwo # Se o valor de  i for igual do valor do tamanho máximo do vetor, vai para a saidaC
			j PreencheC
			
		ResetTwo:
			li s5, 0 # i = 0
			li s6, 1 # Reseta o registrador para usar para atualizar o endereço do Vetor C
			li t1, 0 # Reseta o registrador para usar para atualizar o endereço do Vetor C
			
		SaidaC:
			li a7, 4 #Serviço de impressão de string, texto: Vetor_C [ 
			la a0, .TC #Chamada da String
			ecall
			
			li a7, 1
			add a0, zero, s5 # valor de i
			ecall
			
			li a7, 4 # Serviço de impressão de string
			la a0, .TF # Chamada da String, texto: ] = 
			ecall #Chamada de Sistema
			
			li a7, 1 #serviço de impressão de inteiro
			lw t3, 0(s2) # armazena o valor de s3 em t3
			add a0, zero, t3 #a0 armazena t3
			ecall
			
			#Atualização do endereço de memória do vetor C
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t3 = 4*j
			add s2, s2, t1 # Endereço absoluto = endereço base(s3) + Endereço relativo(s6)
			
			addi s5, s5, 1 # i = i + 1
			bne s5, s4, SaidaC # Se o valor de  i for diferente do valor do tamanho máximo do vetor, volta para o LoopA