	.text
	.file	"Reptile"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$400, %edi              # imm = 0x190
	movl	$400, %esi              # imm = 0x190
	callq	Canvas@PLT
	movl	%eax, (%rsp)
	movl	%edx, 4(%rsp)
	leaq	.Lstr(%rip), %rdi
	movl	%eax, %esi
	callq	File@PLT
	movl	%ecx, 20(%rsp)
	movl	%edx, 16(%rsp)
	movq	%rax, 8(%rsp)
	movl	(%rsp), %edi
	movl	4(%rsp), %esi
	callq	create@PLT
	movq	8(%rsp), %rdi
	movl	16(%rsp), %esi
	movl	20(%rsp), %edx
	callq	save@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
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
	.asciz	"myfile"
	.size	.Lstr, 7


	.section	".note.GNU-stack","",@progbits
