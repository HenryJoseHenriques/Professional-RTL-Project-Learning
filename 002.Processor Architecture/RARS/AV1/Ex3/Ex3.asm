	.data
		.TC: #Text Call
		        .asciz "\nLEITURA DOS ELEMENTOS DO VETOR:\n"
		.TI: #Text Input
		        .asciz "Entre com A["
		.TI2: #Text Input 2
		        .asciz "]: "
		.TE: #Text Exit
		        .asciz "\nAPRESENTACAO DO VETOR LIDO:\n"
		.TOUT: #Text Output
		        .asciz "A["
		.TOUT2: #TExt Output2
		        .asciz "] = "
		.TB: #Text Break Line
		        .asciz "\n"

			.align 2 # Define o endereço para um tipo palavra(Endreço de memória multiplo de 4)
		vetor:
			.space 16 # Aloca 16 bytes de memória, cada inteiro ocupa 4 bytes 

	.text
		main:
			li s0, 0 # Define i = 0
			li s1, 4 # Tamanho máximo do laço
			la t0, vetor #carrega o endereço base do vetor para o registrador t0
			li s2, 1 # Define j = 1
			
			#----
			li a7, 4
			la a0, .TC
			ecall
			#----
			
		LoopR: #Loop de Leitura de Dados
			
			#----
			li a7, 4
			la a0, .TI
			ecall
			#----
			
			#----
			li a7, 1
			add a0, zero, s0
			ecall
			#----
			
			
			#----
			li a7, 4
			la a0, .TI2
			ecall
			#----
			
		
			li a7, 5 #Chamada do serviço de entrada de inteiro	
			ecall #Chama o serviço da interface
			add t1, zero, a0 #Armazena o retorno em t1 (vou utilizar t1 como intermediador)
			
			sw t1, 0(t0) #Armazena o valor temporário de t0 em t1
			
			#agora devemos atulizar o valor de t0 para um multiplo de 4
			add t2, s2, s2 # t2  = 2*i
			add t2, t2, t2 # t2 = 4*i
			add t0, t0, t2 # Endereço Absoluto(t0) = Endereço base(t0) + Endereço Relativo(t2)
			 
			#agora vamos atualizar o laço do "for"
			addi s0, s0, 1 #agora, s1 passa a ser s1 = s1 + 1
			bne s0, s1, LoopR #Verifica se s0 é igual a s1
			
			#----
			li a7, 4
			la a0, .TB # Quebra de linha
			ecall
			#----
			
		second:
			li s0, 0 # Define i = 0
			la t0, vetor #Armazena o endereço base do vetor
			li s2, 1
			
			#----
			li a7, 4
			la a0, .TE
			ecall
			#----
			

		LoopW: #Loop de Saída de Dados
		
			#----
			li a7, 4
			la a0, .TOUT
			ecall
			#----
			
			#----
			li a7, 1
			add a0, zero, s0
			ecall
			#----
			
			#----
			li a7, 4
			la a0, .TOUT2
			ecall
			#----
		
			li a7, 1 #serviço de impressão de inteiro
			lw t3, 0(t0) # armazena o valor de t0 em t3
			add a0, zero, t3 #s3 armazena t0 
			ecall
			
			#----
			li a7, 4
			la a0, .TB
			ecall
			#----
			
			#agora devemos atulizar o valor de t0 para um multiplo de 4
			add t2, s2, s2 # t2  = 2*i
			add t2, t2, t2 # t2 = 4*i
			add t0, t0, t2 # Endereço Absoluto(t0) = Endereço base(t0) + Endereço Relativo(t2)
			 
			#agora vamos atualizar o laço do "for"
			addi s0, s0, 1 #agora, s1 passa a ser s1 = s1 + 1
			bne s0, s1, LoopW #Verica se s0 e igual a s1
