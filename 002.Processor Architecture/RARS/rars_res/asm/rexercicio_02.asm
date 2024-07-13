	.data
	
Array_A: .word
	
	.text

main:

	addi s2, zero, 1 
#	lui t1, Array_A
#	ori s3, t1, 0
	la s3, Array_A
	lw t0, 32(s3)
	add t0, s2, t0
	sw t0, 48(s3)
