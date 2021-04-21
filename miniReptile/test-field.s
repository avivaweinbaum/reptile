	.text
	.file	"Reptile"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI0_0:
	.quad	4614613358185178726     # double 3.2999999999999998
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$80, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -16
	movl	$1, %edi
	movl	$2, %esi
	movl	$3, %edx
	callq	Rgb@PLT
	movl	%eax, %esi
	movl	%esi, (%rsp)
	movl	%ecx, 8(%rsp)
	movl	%edx, 4(%rsp)
	movl	%esi, 12(%rsp)
	leaq	.Lfmt(%rip), %rbx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	$9, (%rsp)
	movl	$9, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	(%rsp), %ecx
	movl	4(%rsp), %r8d
	movl	8(%rsp), %r9d
	leaq	16(%rsp), %rdi
	movsd	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$4, %esi
	movl	$5, %edx
	callq	Pointer@PLT
	movsd	40(%rsp), %xmm0         # xmm0 = mem[0],zero
	movq	16(%rsp), %rax
	movq	24(%rsp), %rcx
	movl	32(%rsp), %esi
	movl	%esi, 64(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%rax, 48(%rsp)
	movsd	%xmm0, 72(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$80, %rsp
	popq	%rbx
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
