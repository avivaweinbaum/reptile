	.text
	.file	"Reptile"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$800, %edi              # imm = 0x320
	movl	$800, %esi              # imm = 0x320
	callq	Canvas@PLT
	movl	%eax, (%rsp)
	movl	%edx, 4(%rsp)
	movl	%eax, %edi
	movl	%edx, %esi
	callq	create@PLT
	leaq	.Lstr(%rip), %rdi
	callq	save@PLT
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d\n"
	.size	.Lfmt, 4

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%g\n"
	.size	.Lfmt.1, 4

	.type	.Lfmt.2,@object         # @fmt.2
.Lfmt.2:
	.asciz	"%s\n"
	.size	.Lfmt.2, 4

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"myfile.png"
	.size	.Lstr, 11


	.section	".note.GNU-stack","",@progbits
