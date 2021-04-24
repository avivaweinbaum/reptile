	.text
	.file	"Reptile"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI0_0:
	.quad	4636033603912859648     # double 90
.LCPI0_1:
	.quad	4643457506423603200     # double 270
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$366, %edi              # imm = 0x16E
	movl	$60, %esi
	callq	gcd@PLT
	movl	%eax, 20(%rsp)
	movl	$500, %edi              # imm = 0x1F4
	movl	$500, %esi              # imm = 0x1F4
	callq	Canvas@PLT
	movq	%rax, (%rsp)
	xorl	%edi, %edi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	Rgb@PLT
	movq	%rax, 8(%rsp)
	movq	(%rsp), %rdi
	xorps	%xmm0, %xmm0
	movl	$100, %esi
	movl	$100, %ecx
	movl	$100, %r8d
	movq	%rax, %rdx
	callq	turtle_draw@PLT
	movq	8(%rsp), %rdx
	movq	(%rsp), %rdi
	movsd	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$100, %esi
	movl	$200, %ecx
	movl	$100, %r8d
	callq	turtle_draw@PLT
	movq	8(%rsp), %rdx
	movq	(%rsp), %rdi
	movsd	.LCPI0_1(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$100, %esi
	movl	$100, %ecx
	movl	$200, %r8d
	callq	turtle_draw@PLT
	movq	(%rsp), %rdi
	leaq	.Lstr(%rip), %rsi
	callq	save@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	gcd                     # -- Begin function gcd
	.p2align	4, 0x90
	.type	gcd,@function
gcd:                                    # @gcd
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	movl	%esi, (%rsp)
	testl	%esi, %esi
	je	.LBB1_2
# %bb.1:                                # %then
	movl	4(%rsp), %edi
	movl	(%rsp), %esi
	callq	mod@PLT
	movl	(%rsp), %edi
	movl	%eax, %esi
	callq	gcd@PLT
	popq	%rcx
	retq
.LBB1_2:                                # %else
	movl	4(%rsp), %eax
	popq	%rcx
	retq
.Lfunc_end1:
	.size	gcd, .Lfunc_end1-gcd
	.cfi_endproc
                                        # -- End function
	.globl	step                    # -- Begin function step
	.p2align	4, 0x90
	.type	step,@function
step:                                   # @step
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, 40(%rsp)
	movl	%esi, 28(%rsp)
	movl	%edx, 24(%rsp)
	movl	%ecx, 52(%rsp)
	movl	%r8d, 48(%rsp)
	movq	%r9, 32(%rsp)
	movl	$0, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	%ecx, 12(%rsp)
	movl	%r8d, 8(%rsp)
	jmp	.LBB2_1
	.p2align	4, 0x90
.LBB2_2:                                # %while_body
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	40(%rsp), %rdi
	movq	32(%rsp), %rsi
	movl	12(%rsp), %edx
	movl	8(%rsp), %ecx
	callq	pixel@PLT
	incl	12(%rsp)
	incl	20(%rsp)
.LBB2_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	20(%rsp), %eax
	cmpl	24(%rsp), %eax
	jl	.LBB2_2
	jmp	.LBB2_3
	.p2align	4, 0x90
.LBB2_4:                                # %while_body20
                                        #   in Loop: Header=BB2_3 Depth=1
	movq	40(%rsp), %rdi
	movq	32(%rsp), %rsi
	movl	12(%rsp), %edx
	movl	8(%rsp), %ecx
	callq	pixel@PLT
	incl	8(%rsp)
	incl	16(%rsp)
.LBB2_3:                                # %while19
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%rsp), %eax
	cmpl	28(%rsp), %eax
	jl	.LBB2_4
# %bb.5:                                # %merge33
	xorl	%eax, %eax
	addq	$56, %rsp
	retq
.Lfunc_end2:
	.size	step, .Lfunc_end2-step
	.cfi_endproc
                                        # -- End function
	.globl	turtle_draw             # -- Begin function turtle_draw
	.p2align	4, 0x90
	.type	turtle_draw,@function
turtle_draw:                            # @turtle_draw
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -24
	movq	%rdi, -72(%rbp)
	movsd	%xmm0, -64(%rbp)
	movl	%esi, -44(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, -40(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%esi, %edi
	callq	getRise@PLT
	movl	%eax, -24(%rbp)
	movl	-44(%rbp), %edi
	movsd	-64(%rbp), %xmm0        # xmm0 = mem[0],zero
	callq	getRun@PLT
	movl	%eax, -32(%rbp)
	movl	-24(%rbp), %edi
	movl	%eax, %esi
	callq	gcd@PLT
	movl	%eax, %ecx
	movl	%ecx, -80(%rbp)
	movl	-24(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%eax, %esi
	movl	%esi, -28(%rbp)
	movl	-32(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%eax, -20(%rbp)
	leaq	.Lfmt.3(%rip), %rbx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	-20(%rbp), %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	$0, -76(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_3:                                # %while_body
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	%rsp, %rbx
	leaq	-16(%rbx), %rsp
	movq	-56(%rbp), %r9
	movl	-12(%rbp), %r8d
	movl	-16(%rbp), %ecx
	movl	-20(%rbp), %edx
	movl	-28(%rbp), %esi
	movq	-72(%rbp), %rdi
	callq	step@PLT
	movl	%eax, -16(%rbx)
	movl	-20(%rbp), %eax
	addl	%eax, -16(%rbp)
	movl	-28(%rbp), %eax
	addl	%eax, -12(%rbp)
.LBB3_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %ecx
	addl	-24(%rbp), %ecx
	movl	-40(%rbp), %eax
	addl	-32(%rbp), %eax
	cmpl	%ecx, -12(%rbp)
	movl	-16(%rbp), %ecx
	jl	.LBB3_3
# %bb.2:                                # %while
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	%eax, %ecx
	jl	.LBB3_3
# %bb.4:                                # %merge
	xorl	%eax, %eax
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end3:
	.size	turtle_draw, .Lfunc_end3-turtle_draw
	.cfi_endproc
                                        # -- End function
	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d\n"
	.size	.Lfmt, 4

	.type	.Lstr,@object           # @str
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.Lstr:
	.asciz	"turtle_start.png"
	.size	.Lstr, 17

	.type	.Lfmt.1,@object         # @fmt.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt.1:
	.asciz	"%d\n"
	.size	.Lfmt.1, 4

	.type	.Lfmt.2,@object         # @fmt.2
.Lfmt.2:
	.asciz	"%d\n"
	.size	.Lfmt.2, 4

	.type	.Lfmt.3,@object         # @fmt.3
.Lfmt.3:
	.asciz	"%d\n"
	.size	.Lfmt.3, 4


	.section	".note.GNU-stack","",@progbits
