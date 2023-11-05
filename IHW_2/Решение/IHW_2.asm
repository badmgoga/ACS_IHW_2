.include "IHW_2_macros.asm"

.data
	result: 	.float 0.0
	step: 		.float 0.0001

.text
	flw      	fs0, result, t0 # writing result to a register fs0
	input_L
	fcvt.s.w  	fs1, a0 	# writing L to a register fs1
	input_R
	fcvt.s.w  	fs2, a0 	# writing R to a register fs2
	fle.s 		t0, fs1, fs2 	# if L > R
	beqz 		t0, error 	# error and end of the program
	input_A
	fmv.s  		fs3, fa0  	# writing A to a register fs3
	input_B
	fmv.s 		fs4, fa0 	# writing B to a register fs4
        flw     	fs5, step, t0  	# writing step to a register fs5
        jal loop  			# loop entry
        output_result 			# result output
	jal end 			# end of the program
	
loop:	
	fmul.s 		ft0, fs1, fs1 		# in ft0 L * L
	fmul.s 		ft0, ft0, fs1 		# in ft0 L * L * L
	fmadd.s 	ft0, ft0, fs4, fs3 	# in ft0 L * L * L * B + A
	fmadd.s 	fs0, ft0, fs5, fs0 	# result = (L * L * L * B + A) * step + result
	fadd.s 		fs1, fs1, fs5 		# L += step
	flt.s 		t0, fs1, fs2 		# if L < R
	bnez 		t0, loop 		# returning to the beginning of loop
	
	fmv.s 		fa0, fs0
	ret

error:
	print_error # error output

end:
	print_end # end of the program
