	.text
	.file	"tiger"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	$9, %ebx
	cmpl	$-1, %ebx
	je	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %while_body
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	__print_int
	decl	%ebx
	cmpl	$-1, %ebx
	jne	.LBB0_2
.LBB0_3:                                # %while_end
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
