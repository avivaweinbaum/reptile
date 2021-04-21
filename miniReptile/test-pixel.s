	.text
	.file	"Reptile"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI0_0:
	.quad	4614162998222441677     # double 3.1000000000000001
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$264, %rsp              # imm = 0x108
	.cfi_def_cfa_offset 272
	movl	$400, %edi              # imm = 0x190
	movl	$400, %esi              # imm = 0x190
	callq	Canvas@PLT
	movl	%eax, 32(%rsp)
	movl	%edx, 36(%rsp)
	movl	%eax, %edi
	movl	%edx, %esi
	callq	create@PLT
	movl	$100, %edi
	movl	$100, %esi
	movl	$100, %edx
	callq	Rgb@PLT
	movl	%edx, %r8d
	movl	%ecx, %r9d
	leaq	40(%rsp), %rdi
	movsd	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$200, %esi
	movl	$200, %edx
	movl	%eax, %ecx
	callq	Pointer@PLT
	movsd	64(%rsp), %xmm0         # xmm0 = mem[0],zero
	movl	56(%rsp), %r9d
	movl	52(%rsp), %r8d
	movl	48(%rsp), %ecx
	movl	40(%rsp), %esi
	movl	44(%rsp), %edx
	movl	%esi, (%rsp)
	movl	%ecx, 8(%rsp)
	movl	%r8d, 12(%rsp)
	movl	%r9d, 16(%rsp)
	movsd	%xmm0, 24(%rsp)
	movl	%edx, 4(%rsp)
	leaq	232(%rsp), %rdi
	pushq	$200
	.cfi_adjust_cfa_offset 8
	pushq	$200
	.cfi_adjust_cfa_offset 8
	callq	pixel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	256(%rsp), %xmm0        # xmm0 = mem[0],zero
	movl	248(%rsp), %r9d
	movq	232(%rsp), %rax
	movq	240(%rsp), %rcx
	movq	%rcx, 8(%rsp)
	movq	%rax, (%rsp)
	movl	%r9d, 16(%rsp)
	movsd	%xmm0, 24(%rsp)
	movl	8(%rsp), %ecx
	movl	12(%rsp), %r8d
	movl	(%rsp), %esi
	movl	4(%rsp), %edx
	leaq	200(%rsp), %rdi
	pushq	$200
	.cfi_adjust_cfa_offset 8
	pushq	$201
	.cfi_adjust_cfa_offset 8
	callq	pixel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	224(%rsp), %xmm0        # xmm0 = mem[0],zero
	movl	216(%rsp), %r9d
	movq	200(%rsp), %rax
	movq	208(%rsp), %rcx
	movq	%rcx, 8(%rsp)
	movq	%rax, (%rsp)
	movl	%r9d, 16(%rsp)
	movsd	%xmm0, 24(%rsp)
	movl	8(%rsp), %ecx
	movl	12(%rsp), %r8d
	movl	(%rsp), %esi
	movl	4(%rsp), %edx
	leaq	168(%rsp), %rdi
	pushq	$200
	.cfi_adjust_cfa_offset 8
	pushq	$202
	.cfi_adjust_cfa_offset 8
	callq	pixel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	192(%rsp), %xmm0        # xmm0 = mem[0],zero
	movl	184(%rsp), %r9d
	movq	168(%rsp), %rax
	movq	176(%rsp), %rcx
	movq	%rcx, 8(%rsp)
	movq	%rax, (%rsp)
	movl	%r9d, 16(%rsp)
	movsd	%xmm0, 24(%rsp)
	movl	8(%rsp), %ecx
	movl	12(%rsp), %r8d
	movl	(%rsp), %esi
	movl	4(%rsp), %edx
	leaq	136(%rsp), %rdi
	pushq	$200
	.cfi_adjust_cfa_offset 8
	pushq	$203
	.cfi_adjust_cfa_offset 8
	callq	pixel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	160(%rsp), %xmm0        # xmm0 = mem[0],zero
	movl	152(%rsp), %r9d
	movq	136(%rsp), %rax
	movq	144(%rsp), %rcx
	movq	%rcx, 8(%rsp)
	movq	%rax, (%rsp)
	movl	%r9d, 16(%rsp)
	movsd	%xmm0, 24(%rsp)
	movl	8(%rsp), %ecx
	movl	12(%rsp), %r8d
	movl	(%rsp), %esi
	movl	4(%rsp), %edx
	leaq	104(%rsp), %rdi
	pushq	$200
	.cfi_adjust_cfa_offset 8
	pushq	$204
	.cfi_adjust_cfa_offset 8
	callq	pixel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movsd	128(%rsp), %xmm0        # xmm0 = mem[0],zero
	movl	120(%rsp), %r9d
	movq	104(%rsp), %rax
	movq	112(%rsp), %rcx
	movq	%rcx, 8(%rsp)
	movq	%rax, (%rsp)
	movl	%r9d, 16(%rsp)
	movsd	%xmm0, 24(%rsp)
	movl	8(%rsp), %ecx
	movl	12(%rsp), %r8d
	movl	(%rsp), %esi
	movl	4(%rsp), %edx
	leaq	72(%rsp), %rdi
	pushq	$200
	.cfi_adjust_cfa_offset 8
	pushq	$205
	.cfi_adjust_cfa_offset 8
	callq	pixel@PLT
	addq	$16, %rsp
	.cfi_adjust_cfa_offset -16
	movl	88(%rsp), %eax
	movsd	96(%rsp), %xmm0         # xmm0 = mem[0],zero
	movq	72(%rsp), %rcx
	movq	80(%rsp), %rdx
	movq	%rdx, 8(%rsp)
	movq	%rcx, (%rsp)
	movsd	%xmm0, 24(%rsp)
	movl	%eax, 16(%rsp)
	leaq	.Lstr(%rip), %rdi
	callq	save@PLT
	xorl	%eax, %eax
	addq	$264, %rsp              # imm = 0x108
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
	.asciz	"pixeltest.png"
	.size	.Lstr, 14


	.section	".note.GNU-stack","",@progbits
