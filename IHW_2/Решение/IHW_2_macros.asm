.data
	enterL: 	.string "Enter lower limit of internalization (integer) L: "
	enterR: 	.string "Enter upper limit of internalization (integer) R: "
	enterA: 	.string "Enter A: "
	enterB: 	.string "Enter B: "
	error_string: 	.string "ERROR! L > R"
	result_string:	.string "Result: "
	space:		.string "\n"
	end_string:	.string "End of the program"

.macro input_L # entering the left boundary of integtration L
	la a0, enterL
	li a7, 4
	ecall
	li a7, 5
	ecall
.end_macro

.macro input_R # entering the right boundary of integtration R
	la a0, enterR
	li a7, 4
	ecall
	li a7, 5
	ecall
.end_macro

.macro input_A # entering A
	la a0, enterA
	li a7, 4
	ecall
	li a7, 6
	ecall
.end_macro

.macro input_B # entering B
	la a0, enterB
	li a7, 4
	ecall
	li a7, 6
	ecall
.end_macro

.macro output_result # output result
	la a0, result_string
	li a7, 4
	ecall
	li a7 2
	ecall
.end_macro

.macro print_error # output error
	la a0, error_string
	li a7, 4
	ecall
.end_macro

.macro print_end # end of program output
	la a0, space
	li a7, 4
	ecall
	la a0, end_string
	li a7, 4
	ecall
.end_macro