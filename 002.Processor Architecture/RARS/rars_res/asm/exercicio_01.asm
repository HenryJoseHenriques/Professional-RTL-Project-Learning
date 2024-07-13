##############################################################################
# Exerc�cio 01 - Patterson pags. 54/55/56
# Mostra a compila��o de um comando de atribui��o em C
##############################################################################
# Trecho em C:
# 
# f = (g + h) - (i + j)

	.text # segmento de c�digo (programa)

main:
	addi s1, zero, 4 # s1 = g = 0 + 4 <- o restrador s1 recebe soma imediata de 0 e 4 (duas constantes)
	addi s2, zero, 3 # s2 = h = 0 + 3
	addi s3, zero, 2 # s3 = i = 0 + 2
	addi s4, zero, 1 # s4 = j = 0 + 1

	add t0, s1, s2 # t0 = g + h <- restrador tempor�rio t0 recebe a soma do conte�do do restrador s1 com o registrador s2
	add t1, s3, s4 # t1 = i + j
	 
	sub s0, t0, t1 # f = t0 - t1
