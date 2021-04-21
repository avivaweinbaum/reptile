	.text
	.file	"Reptile"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI0_0:
	.quad	4636033603912859648     # double 90
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movl	$1, %edi
	movl	$2, %esi
	movl	$5, %edx
	callq	Rgb@PLT
	movl	%edx, %r8d
	movl	%ecx, %r9d
	movl	%eax, 8(%rsp)
	movl	%r9d, 16(%rsp)
	movl	%r8d, 12(%rsp)
	leaq	24(%rsp), %rdi
	movsd	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$50, %esi
	movl	$60, %edx
	movl	%eax, %ecx
	callq	Pointer@PLT
	movl	40(%rsp), %eax
	movsd	48(%rsp), %xmm0         # xmm0 = mem[0],zero
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	%rdx, 64(%rsp)
	movq	%rcx, 56(%rsp)
	movsd	%xmm0, 80(%rsp)
	movl	%eax, 72(%rsp)
	xorl	%eax, %eax
	addq	$88, %rsp
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


	.section	".note.GNU-stack","",@progbits
