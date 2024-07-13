# Disciplina: Arquitetura e Organiza��o de Processadores 
# Avalia��o: 01 � Programa��o em Linguagem de Montagem 
# Alunos: Ian Marcos, Henry jose, Vinicius Tridapalli

	.data
		.TX:
			.asciz "Entre com o tamanho dos vetores (m�x.= 8).\n"
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
			.asciz "Valor inv�lido.\n"
				
		Vetor_A:
			.word 0, 0, 0, 0, 0, 0, 0, 0	
		Vetor_B:
			.word 0, 0, 0, 0, 0, 0, 0, 0
		Vetor_C:
			.word 0, 0, 0, 0, 0, 0, 0, 0

	.text

		main:
			la, s0, Vetor_A # Carrega o endere�o base do Vetor A
			la, s1, Vetor_B # Carrega o endere�o base do Vetor B
			la, s2, Vetor_C # Carrega o endere�o base do Vetor C
			li s3, 9 # MAX = 8
			li s7, 1 # MIN = 1
			#s4 = armazena o valor do tamanho do vetor
			li s5, 0 # i = 0
			li s6, 1 # j = 1, serve para atualizar o endere�o dos vetores
					  
			
		TamV:	# Loop At� que o valor digitado seja igual ou menor que 8
			li a7, 4 #Servi�o de impress�o de string, texto: Entre com o tamanho dos vetores (m�x.= 8).\n
			la a0, .TX #Chamada da String
			ecall
			
			#Entrada do tamanho m�ximo
			li a7, 5 #Chamada do servi�o de entrada de inteiro
			ecall #Chama o servi�o da interface
			add s4, zero, a0 #Armazena o retorno em s4
			bge s4, s3, ValorInvalido #Vai para a mensagem de valor inv�lido, caso o n�mero digitado seja maior que 8
			blt s4, s7, ValorInvalido #Vai para a mensagem de valor inv�lido, caso o n�mero digitado seja menor que 1
			j LoopA #Se passar pela verifica��o, pula o Loop A
			
		ValorInvalido:
			li a7, 4 #Servi�o de impress�o de string, texto: Valor inv�lido.\n
			la a0, .VI #Chamada da String
			ecall # Chamada do servi�o
			j TamV #Retorna para o Loop V
			
			# Loop Encerra aqui, cso o valor digitado seja menor ou igual a 8
			
		LoopA:	
			li a7, 4 #Servi�o de impress�o de string, texto: Vetor_A [ 
			la a0, .TA #Chamada da String
			ecall #chamada do servi�o
			
			li a7, 1
			add a0, zero, s5 # valor de i
			ecall
			
			li a7, 4 # Servi�o de impress�o de string
			la a0, .TF # Chamada da String, texto: ] = 
			ecall #Chamada de Sistema
			
			li a7, 5 #Servi�o de entrada de inteiro, para armazenar  valores  no vetor A
			ecall # Chama o servi�o da interface
			add t0, zero, a0 #armazena o retorno em t1 (intemediador)
			
			sw t0 0(s0) #Armazena o valor de t0 na primeira posi��o do vetor A
			
			#Atualiza��o do endere�o de mem�ria do vetor A
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t1 = 4*j
			add s0, s0, t1 # Endere�o absoluto = endere�o base(s0) + Endere�o relativo(s6)
			
			addi s5, s5, 1 # i = i + 1
			bne s5, s4, LoopA # Se o valor de  i for diferente do valor do tamanho m�ximo do vetor, volta para o LoopA
			
			li a7, 4 # Servi�o de impress�o de string
			la a0, .BR # Chamada da String, Quebra de linha 
			ecall #Chamada de Sistema
			
		Reset:
			li s5, 0 # i = 0
			li s6, 1 # j = 1, serve para atualizar o endere�o dos vetores		

		LoopB:	li a7, 4 #Servi�o de impress�o de string, texto: Vetor_B [ 
			la a0, .TB #Chamada da String
			ecall # Chamada do servi�o
			
			li a7, 1
			add a0, zero, s5 # valor de i
			ecall
			
			li a7, 4 # Servi�o de impress�o de string
			la a0, .TF # Chamada da String, texto: ] = 
			ecall #Chamada de Sistema
			
			li a7, 5 #Servi�o de entrada de inteiro, para armazenar  valores  no vetor B
			ecall # Chama o servi�o da interface
			add t0, zero, a0 #armazena o retorno em t1 (intemediador)
			
			sw t0 0(s1) #Armazena o valor de t0 na primeira posi��o do vetor B
			
			#Atualiza��o do endere�o de mem�ria do vetor B
			add t2, s6, s6 # s6 = 2*j
			add t2, t2, t2 # t2 = 4*j
			add s1, s1, t2 # Endere�o absoluto = endere�o base(s1) + Endere�o relativo(s6)
			
			addi s5, s5, 1 # i = i + 1
			bne s5, s4, LoopB # Se o valor de  i for diferente do valor do tamanho m�ximo do vetor, volta para o LoopB
			
		PreencheC:
			#lw t3, 0(s0) #Armazena o endere�o base do vetor A
			#lw t4, 0(s1) #Armazena o endere�o base do vetor B
			la, s0, Vetor_A # Carrega o endere�o base do Vetor A
			la, s1, Vetor_B # Carrega o endere�o base do Vetor B
			li s5, 0 # i = 0
			li s6, 1 # j = 1, serve para atualizar o endere�o dos vetores
			li t1, 0 # Retorna t1 para 0
			#li t2, 0 # Retorna t2 para 0
			#li t3, 0 # Utiliza t3 para atualizar o endere�o do vetor C
			
			#agora devemos atualizar o valores dos endere�os do vetor A e Vetor B
			
			#Atualiza��o do endere�o de mem�ria do vetor A
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t1 = 4*j
			add s0, s0, t1 # Endere�o absoluto = endere�o base(s0) + Endere�o relativo(s6)
			
			li s6, 1 # Reseta o registrador para usar para atualizar o endere�o do Vetor B
			li t1, 0 # Reseta o registrador para usar para atualizar o endere�o do Vetor B
			
			#Atualiza��o do endere�o de mem�ria do vetor B
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t2 = 4*j
			add s1, s1, t1 # Endere�o absoluto = endere�o base(s1) + Endere�o relativo(s6) 
			
			#Vamor atualizar o valor de i para n�o ultrapassar o tamanho m�ximo do vetor
			addi s5, s5, 1 # i = i + 1
			
			bge t3, t4, PreencheAC
			bge t4, t3, PreencheBC
			
		PreencheAC:
			sw t3, 0(s2) # Armazena o endere�o base do vetor C
			li s6, 1 # Reseta o registrador para usar para atualizar o endere�o do Vetor B
			li t1, 0 # Reseta o registrador para usar para atualizar o endere�o do Vetor B
			
			#Atualiza��o do endere�o de mem�ria do vetor C
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t3 = 4*j
			add s2, s2, t1 # Endere�o absoluto = endere�o base(s3) + Endere�o relativo(s6)
			beq s5, s4, ResetTwo # Se o valor de  i for igual do valor do tamanho m�ximo do vetor, vai para a saidaC
			j PreencheC
		
		PreencheBC:
			sw t4, 0(s2)
			li s6, 1 # Reseta o registrador para usar para atualizar o endere�o do Vetor C
			
			#Atualiza��o do endere�o de mem�ria do vetor C
			add t3, s6, s6 # s6 = 2*j
			add t3, t3, t3 # t3 = 4*j
			add s2, s2, t3 # Endere�o absoluto = endere�o base(s3) + Endere�o relativo(s6)
			beq s5, s4, ResetTwo # Se o valor de  i for igual do valor do tamanho m�ximo do vetor, vai para a saidaC
			j PreencheC
			
		ResetTwo:
			li s5, 0 # i = 0
			li s6, 1 # Reseta o registrador para usar para atualizar o endere�o do Vetor C
			li t1, 0 # Reseta o registrador para usar para atualizar o endere�o do Vetor C
			
		SaidaC:
			li a7, 4 #Servi�o de impress�o de string, texto: Vetor_C [ 
			la a0, .TC #Chamada da String
			ecall
			
			li a7, 1
			add a0, zero, s5 # valor de i
			ecall
			
			li a7, 4 # Servi�o de impress�o de string
			la a0, .TF # Chamada da String, texto: ] = 
			ecall #Chamada de Sistema
			
			li a7, 1 #servi�o de impress�o de inteiro
			lw t3, 0(s2) # armazena o valor de s3 em t3
			add a0, zero, t3 #a0 armazena t3
			ecall
			
			#Atualiza��o do endere�o de mem�ria do vetor C
			add t1, s6, s6 # s6 = 2*j
			add t1, t1, t1 # t3 = 4*j
			add s2, s2, t1 # Endere�o absoluto = endere�o base(s3) + Endere�o relativo(s6)
			
			addi s5, s5, 1 # i = i + 1
			bne s5, s4, SaidaC # Se o valor de  i for diferente do valor do tamanho m�ximo do vetor, volta para o LoopA