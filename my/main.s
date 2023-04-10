	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.global	__aeabi_fadd
	.global	__aeabi_idiv
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r3, .L3
	str	r3, [fp, #-8]	@ float
	ldr	r3, .L3+4
	str	r3, [fp, #-12]	@ float
	ldr	r1, [fp, #-12]	@ float
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	mov	r3, #10
	str	r3, [fp, #-20]
	mov	r3, #11
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	1066192077
	.word	1074580685
	.size	main, .-main
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
