
##################################################
#    Ramazan  SAKİN --  111044069
#    Computer Organization -- Project - 1

#################################################


	.data

	# Strings 
str1:
    .asciiz "Which program do you want to start Procedure 1 (Drawing stars) or Procedure 2 ( 0 or 1 ) "
str2:
	.asciiz "Please enter an odd number to draw the shape ( 1 to 21 ) : "
space:    	
	.asciiz " "
star:
    .asciiz "*"
nline:
	.asciiz "\n"


getDateAndTime:
	.asciiz	"Please enter the current time and date : "
dolar:
	.asciiz "1)Dolar  :"
gold:
	.asciiz "2)Gold   :"
bond:
	.asciiz "3)Bond   :"
money:
	.asciiz "Money  :"
total:
	.asciiz "Total  :"
play1:
	.asciiz "Player 1's turn : "
play2:
	.asciiz "Player 2's turn : "
buy:
	.asciiz "1)Buy"
sell:	
	.asciiz "2)Sell"
pass:
	.asciiz "3)Pass"
choice:
	.asciiz "Your choice : "
amount:
	.asciiz "Amount 	 : "
week:
	.asciiz "Week--"		
	
date:	
	.asciiz ""
Buy	:
	.asciiz "-- BUY --"
Sell:
	.asciiz "-- SELL --"	
Dot:
	.asciiz " ) "

nthWeek:
		.word   12

Player1:
	.asciiz "Player - 1  "	

Ply2:
	.asciiz "Player - 2  "


    .text
    .globl main
main:
	
	
	li $v0, 4    
	la $a0, str1
	syscall

	li $v0, 5		# read int to choose the program
	syscall			
	
	move $t0, $v0	# move integer to t0 to start valid program

	bne $t0, $zero, marketGame		# if the int is 0, Drawing Shape starts o.w. market Game starts

###########################
### Part 1  ###############
###########################	

askAgain:

	# Drawing Shape
	# to set loop number
	li $v0, 4    	# ask to user for number
	la $a0, str2
	syscall


	li $v0, 5		# to get number to draw the shape
	syscall			# to read int

	move $t0, $v0		
	andi $t1, $t0, 0x01		# to determine if the number is odd or not 

	beq $t1, $zero, askAgain	# if the user entered an even number, jmp to askAgain

	# required numbers for star and spaces nums
	addi $t1, $t0, 1
	sra  $t1, $t1, 1 		# loop
	addi $t2, $t0, -1 		# space
	addi $t3, $zero, 1 		# star
	li   $zero, 0


	slti $t5, $t0, 2
	bne  $t5, $zero, onlyStar	   

	# outer loop
loop1:	
	addi $t1, $t1, -1

	li $v0, 4    	# for new line
	la $a0, nline
	syscall

	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t2
	# loop for spaces
prtSpace1:
	addi $t7, $t7, -1	

	li $v0, 4    	# to print space
	la $a0, space
	syscall	

	bne $t7, $zero, prtSpace1

	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t3
	# star loop
prtStar1:
	addi $t7, $t7, -1

	li $v0, 4    	# to print space
	la $a0, star
	syscall

	bne $t7, $zero, prtStar1
	
	addi $t2, $t2, -1
	addi $t3, $t3,  2

	bne  $t1, $zero, loop1

	
	# outer loop for shape's under 1
	# required numbers for star and spaces nums
	sra  $t1, $t0, 1
	addi $t2, $t0, -3
	sra  $t2, $t2, 1
	li   $t3, 2
	addi $t4, $t0, -2


loop2:
	li $v0, 4    	# for new line
	la $a0, nline
	syscall

	addi $t1, $t1, -1

	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t2
prtSpace2:
	addi $t7, $t7, -1	

	# controls if the num is negative  avoiding forever loop
	slti $t6, $t7, 0
	bne  $t6, $zero, pass_a

	li $v0, 4    	# to print space
	la $a0, space
	syscall	

	bne $t7, $zero, prtSpace2

pass_a:
	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t3
prtStar2:
	addi $t7, $t7, -1

	li $v0, 4    	# to print star
	la $a0, star
	syscall

	bne $t7, $zero, prtStar2

	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t4
prtSpace3:
	addi $t7, $t7, -1

	li $v0, 4    	# to print space
	la $a0, space
	syscall	

	bne $t7, $zero, prtSpace3

	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t3
prtStar3:
	addi $t7, $t7, -1

	li $v0, 4    	# to print star
	la $a0, star
	syscall

	bne $t7, $zero, prtStar3

	addi $t2, $t2, -1
	addi $t3, $t3,  1


	# controls if the num is negative or 0
	slti $t6, $t1, 1
	beq  $t6, $zero, loop2

	

	#### 3
	# required numbers for star and spaces nums
	sra  $t1, $t0, 1
	addi $t1, $t1, -1
	li   $t2, 1
	addi $t3, $t0, -1
	sra  $t3, $t3, 1
	addi $t4, $t0, -2	


loop3:
	li $v0, 4    	# for new line
	la $a0, nline
	syscall

	addi $t1, $t1, -1

	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t2
prtSpace4:
	addi $t7, $t7, -1	

	# controls if the num is negative  avoiding forever loop
	slti $t6, $t7, 0
	bne  $t6, $zero, pass2

	li $v0, 4    	# to print space
	la $a0, space
	syscall	

	bne $t7, $zero, prtSpace4

pass2:
	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t3
prtStar4:
	addi $t7, $t7, -1

	li $v0, 4    	# to print star
	la $a0, star
	syscall

	bne $t7, $zero, prtStar4

	move $t7, $t4
prtSpace5:
	addi $t7, $t7, -1

	li $v0, 4    	# to print space
	la $a0, space
	syscall	

	bne $t7, $zero, prtSpace5
	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t3
prtStar5:
	addi $t7, $t7, -1

	li $v0, 4    	# to print star
	la $a0, star
	syscall

	bne $t7, $zero, prtStar5

	addi $t2, $t2, 1
	addi $t3, $t3, -1

	slti $t6, $t1, 1
	beq  $t6, $zero, loop3
	

	# required numbers for star and spaces nums
	# outer loop for shape's under 2
	addi $t1, $t0, 1
	sra  $t1, $t1, 1 		# loop
	addi $t2, $t0, -1 		# space
	sra  $t2, $t2, 1
	add  $t3, $zero, $t0 		# star

loop4:
	addi $t1, $t1, -1

	li $v0, 4    	# for new line
	la $a0, nline
	syscall

	# copy the actual reg to temp reg avoiding changing the content
	move $t7, $t2
prtSpace6:
	addi $t7, $t7, -1	

	li $v0, 4    	# to print space
	la $a0, space
	syscall	

	bne $t7, $zero, prtSpace6

	move $t7, $t3
prtStar6:
	addi $t7, $t7, -1

	li $v0, 4    	# to print space
	la $a0, star
	syscall

	bne $t7, $zero, prtStar6
	
	addi $t2, $t2, 	1
	addi $t3, $t3, -2

	bne  $t1, $zero, loop4
	j end

# special case if the user entered  1
onlyStar:
	li $v0, 4    	# for new line
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, star
	syscall

	# halt the program  syscall 10
	j end



###########################
### Part 2  ###############
###########################

marketGame:
	
	li $t0, 0

	li $v0, 4    	# to print space
	la $a0, getDateAndTime
	syscall	

	li 	$v0,  8    	# to get date and time
	la  $a0,  date
    li  $a1,  64
	syscall


	lb $t9, 15($a0)		# to generate random number 
	sra $t9, $t9, 1


	# initial values for player 1
	addi $t1, $zero, 100
	addi $t2, $zero, 0
	addi $t3, $zero, 0
	addi $t4, $zero, 0

	#initial values for player 2
	addi $s1, $zero, 100
	addi $s2, $zero, 0
	addi $s3, $zero, 0
	addi $s4, $zero, 0	

	# initial state for investiments
	addi $t6, $zero, 7
	addi $t7, $zero, 18
	addi $t8, $zero, 25


# loop for week	
week_loop:
	
	# increase week number	
	addi  $t0, $t0, 1


	# to generate number 
	# take number from string of last character ( second ) and generate rand num from it
	# for dolar 
	li $a1, 7	# get modulo for the range
	div $t9, $a1
	mfhi $a1
	addi $s5, $a1, 7

	# for gold
	li $a1, 5 # get modulo for the range
	div $t9, $a1
	mfhi $a1
	addi $s6, $a1, 18

	# for bond
	li $a1, 50 # get modulo for the range
	div $t9, $a1
	mfhi $a1
	addi $s7, $a1, 25


	li $v0, 4    	# to print space
	la $a0, nline
	syscall		


	li $v0, 4    	# to print space
	la $a0, week
	syscall


	li $v0, 1    	# to print space
	move $a0, $t0
	syscall

	# Player 1 -- Status and operations 
again1:
	
	move $a1, $t6
	move $a2, $t7
	move $a3, $t8

	jal status

	jal Player1_status

	jal Player2_status

	li $v0, 4    	# to print space
	la $a0, nline
	syscall		

	la $a0, buy
	syscall

	la $a0, nline
	syscall		

	la $a0, sell
	syscall

	la $a0, nline
	syscall		

	la $a0, pass
	syscall	

	la $a0, nline
	syscall		

	la $a0, play1
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a1, $v0

	slti $a2, $a1, 2
	bne $a2, $zero, say_buy1

	slti $a2, $a1, 3
	bne $a2, $zero, say_sell1

	slti $a2, $a1, 4
	bne $a2, $zero, cont



cont:
	# Player 2 -- Status and operations	
	
	move $a1, $t6
	move $a2, $t7
	move $a3, $t8

	jal status

	jal Player1_status

	jal Player2_status

	# informations of players to show user

	li $v0, 4    	
	la $a0, nline
	syscall		

	la $a0, buy
	syscall

	la $a0, nline
	syscall		

	la $a0, sell
	syscall

	la $a0, nline
	syscall		

	la $a0, pass
	syscall	
	
	la $a0, nline
	syscall		

	la $a0, play2
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a1, $v0

	# operation selection -- BUY or SELL or Pass
	slti $a2, $a1, 2
	bne $a2, $zero, say_buy2

	slti $a2, $a1, 3
	bne $a2, $zero, say_sell2



	slti  $a1, $t0, 12
	bne   $a1, $zero, week_loop




end:	
	li $v0, 10
	syscall




say_buy1:
	
	jal BUYY_1

	j end

	j again1

say_sell1:

	jal SELL_1
	j again1


say_buy2:
	jal BUYY_2
	j cont

say_sell2:
	jal SELL_2
	j cont


Player1_status:
	
	li $v0, 4    	# to print space
	la $a0, nline
	syscall		

	li $v0, 4    	# to print space
	la $a0, Player1
	syscall

	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, money
	syscall

	li $v0, 1    	# to print space
	move $a0, $t1
	syscall

	
	move $a1, $t2
	move $a2, $t3
	move $a3, $t4	

	addi $sp,$sp, -8	
	sw $ra, 4($sp)
	sw $s0, 0($sp)

	jal status


	li $a1, 1
	mult  $t1, $a1
	mflo $a1

	mult  $t2, $s5
	mflo $a2 
	add $a1, $a1, $a2

	mult  $t3, $s6
	mflo $a2 
	add $a1, $a1, $a2

	mult  $t4, $s7
	mflo $a2 
	add $a1, $a1, $a2
	

	li $v0, 4    	# to print space
	la $a0, total
	syscall

	li $v0, 1    	# to print space
	move $a0, $a1
	syscall	
	


	lw $s0, 0($sp)	
	lw $ra, 4($sp)
	addi $sp,$sp, 8	


	jr $ra





	# OPERATIONSS hhelpers to hold datas

Player2_status:

	li $v0, 4    	# to print space
	la $a0, nline
	syscall		

	li $v0, 4    	# to print space
	la $a0, Ply2
	syscall

	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, money
	syscall

	li $v0, 1    	# to print space
	move $a0, $s1
	syscall

	
	move $a1, $s2
	move $a2, $s3
	move $a3, $s4	

	addi $sp,$sp, -8	
	sw $ra, 4($sp)
	sw $s0, 0($sp)

	jal status


	li $a1, 1
	mult  $s1, $a1
	mflo $a1

	mult  $s2, $s5
	mflo $a2 
	add $a1, $a1, $a2

	mult  $s3, $s6
	mflo $a2 
	add $a1, $a1, $a2

	mult  $s4, $s7
	mflo $a2 
	add $a1, $a1, $a2
	

	li $v0, 4    	# to print space
	la $a0, total
	syscall

	li $v0, 1    	# to print space
	move $a0, $a1
	syscall	
	


	lw $s0, 0($sp)	
	lw $ra, 4($sp)
	addi $sp,$sp, 8	


	jr $ra	






status:
	
	li $v0, 4    	# to print space
	la $a0, nline
	syscall
	li $v0, 4    	# to print space
	la $a0, dolar
	syscall

	li $v0, 1    	# to print space
	move $a0, $a1
	syscall

	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, gold
	syscall

	li $v0, 1    	# to print 
	move $a0, $a2
	syscall

	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, bond
	syscall

	li $v0, 1    	# to print 
	move $a0, $a3
	syscall

	li $v0, 4    	# to print 
	la $a0, nline
	syscall


	jr $ra


BUYY_1:
	
	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, buy
	syscall

	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, money
	syscall

	li $v0, 1    	# to print 
	move $a0, $t1
	syscall
	
	
	addi $sp,$sp, -8	
	sw $ra, 4($sp)
	sw $s0, 0($sp)

	move $a1, $t6
	move $a2, $t7
	move $a3, $t8

	jal status

	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, choice
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a1, $v0

	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, amount
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a2, $v0

	slti $a3, $a1, 2
	bne $a3, $zero, op1_1

	slti $a3, $a1, 3
	bne $a3, $zero, op1_2

	slti $a3, $a1, 4
	bne $a3, $zero, op1_3


contin1:

	addi $sp,$sp, 8	
	lw $ra, 4($sp)
	lw $s0, 0($sp)

	jr $ra
	

op1_1:
		mult $t6, $a2
		mflo $a3
		sub  $t1, $t1, $a3
		add  $t2, $a2, $t2

		j contin1

op1_2:
		mult $t7, $a2
		mflo $a3
		sub  $t1, $t1, $a3
		add $t3, $a2, $t3
		j contin1

op1_3:
		mult $t8, $a2
		mflo $a3
		sub  $t1, $t1, $a3
		add $t4, $a2, $t4
		j contin1

BUYY_2:
	
	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, buy
	syscall

	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, money
	syscall

	li $v0, 1    	# to print space
	move $a0, $s1
	syscall
	
	
	addi $sp,$sp, -8	
	sw $ra, 4($sp)
	sw $s0, 0($sp)

	move $a1, $t6
	move $a2, $t7
	move $a3, $t8

	jal status

	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, choice
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a1, $v0

	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, amount
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a2, $v0

	slti $a3, $a1, 2
	bne $a3, $zero, op2_1

	slti $a3, $a1, 3
	bne $a3, $zero, op2_2

	slti $a3, $a1, 4
	bne $a3, $zero, op2_3


contin2:

	addi $sp,$sp, 8	
	lw $ra, 4($sp)
	lw $s0, 0($sp)

	jr $ra


op2_1:
		mult $t6, $a2
		mflo $a3
		sub  $s1, $s1, $a3
		add $s2, $a2, $s2
		j contin2

op2_2:
		mult $t7, $a2
		mflo $a3
		sub  $s1, $s1, $a3
		add $s3, $a2, $s3
		j contin2

op2_3:
		mult $t8, $a2
		mflo $a3
		sub  $s1, $s1, $a3
		add $s4, $a2, $s4 
		j contin2



SELL_1:
	
	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, sell
	syscall

	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, money
	syscall

	li $v0, 1    	# to print 
	move $a0, $t1
	syscall
	
	
	addi $sp,$sp, -8	
	sw $ra, 4($sp)
	sw $s0, 0($sp)

	move $a1, $t6
	move $a2, $t7
	move $a3, $t8

	jal status

	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, choice
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a1, $v0

	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, amount
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a2, $v0

	slti $a3, $a1, 2
	bne $a3, $zero, sell1_1

	slti $a3, $a1, 3
	bne $a3, $zero, sell1_2

	slti $a3, $a1, 4
	bne $a3, $zero, sell1_3


contin_sell1:

	addi $sp,$sp, 8	
	lw $ra, 4($sp)
	lw $s0, 0($sp)

	jr $ra



sell1_1:
		mult $t6, $a2
		mflo $a3
		add  $t1, $t1, $a3
		sub $t2, $t2 , $a2
		j contin_sell1

sell1_2:
		mult $t7, $a2
		mflo $a3
		add  $t1, $t1, $a3
		sub  $t3, $t3 , $a2
		j contin_sell1

sell1_3:
		mult $t8, $a2
		mflo $a3
		add  $t1, $t1, $a3
		sub $t4, $t4 , $a2
		j contin_sell1



SELL_2:
	
	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, sell
	syscall

	li $v0, 4    	# to print 
	la $a0, nline
	syscall

	li $v0, 4    	# to print 
	la $a0, money
	syscall

	li $v0, 1    	# to print 
	move $a0, $s1
	syscall
	
	
	addi $sp,$sp, -8	
	sw $ra, 4($sp)
	sw $s0, 0($sp)

	move $a1, $t6
	move $a2, $t7
	move $a3, $t8

	jal status

	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, choice
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a1, $v0

	li $v0, 4    	# to print space
	la $a0, nline
	syscall

	li $v0, 4    	# to print space
	la $a0, amount
	syscall

	li $v0, 5
	# system call code for read_int
	syscall
	# read int
	move $a2, $v0

	slti $a3, $a1, 2
	bne $a3, $zero, sell2_1

	slti $a3, $a1, 3
	bne $a3, $zero, sell2_2

	slti $a3, $a1, 4
	bne $a3, $zero, sell2_3


contin_sell2:

	addi $sp,$sp, 8
	lw $ra, 4($sp)
	lw $s0, 0($sp)

	jr $ra



sell2_1:
		mult $t6, $a2
		mflo $a3
		add  $s1, $s1, $a3
		sub $s2, $s2 , $a2
		j contin_sell2

sell2_2:
		mult $t7, $a2
		mflo $a3
		add  $s1, $s1, $a3
		sub  $s3, $s3 , $a2
		j contin_sell2

sell2_3:
		mult $t8, $a2
		mflo $a3
		add  $s1, $s1, $a3
		sub $s4, $s4 , $a2
		j contin_sell2


