	.arch armv5te
	.fpu softvfp
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"exceptionhandler.c"
	.text
	.syntax unified
	
.arm

//install exception handler
ncp_jump(0x020366D0)
	ldr r1,=ExceptionHandler
	ldr r2,=0x021701BC
	str r1, [r2]
	mov r1, #0
	b   0x020366D4

	.arm
	.syntax unified
	.section	.text.ExSwizzleDigitPair,"ax",%progbits
	.align	2
	.global	ExSwizzleDigitPair
	.syntax unified
	.arm
	.type	ExSwizzleDigitPair, %function
ExSwizzleDigitPair:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsr	r0, r0, r1
	and	r1, r0, #255
	lsl	r0, r1, #8
	and	r0, r0, #3840
	orr	r0, r0, r1, lsr #4
	bx	lr
	.size	ExSwizzleDigitPair, .-ExSwizzleDigitPair
	.section	.text.ExWriteDebug32,"ax",%progbits
	.align	2
	.global	ExWriteDebug32
	.syntax unified
	.arm
	.type	ExWriteDebug32, %function
ExWriteDebug32:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, r1
	mov	r3, r0
	push	{r4, lr}
	mov	r1, #24
	mov	r0, r2
	bl	ExSwizzleDigitPair
	mov	r1, #16
	strh	r0, [r3]	@ movhi
	mov	r0, r2
	bl	ExSwizzleDigitPair
	mov	r1, #8
	strh	r0, [r3, #2]	@ movhi
	mov	r0, r2
	bl	ExSwizzleDigitPair
	mov	r1, #0
	strh	r0, [r3, #4]	@ movhi
	mov	r0, r2
	bl	ExSwizzleDigitPair
	strh	r0, [r3, #6]	@ movhi
	pop	{r4, pc}
	.size	ExWriteDebug32, .-ExWriteDebug32
	.section	.text.ExceptionHandler,"ax",%progbits
	.align	2
	.global	ExceptionHandler
	.syntax unified
	.arm
	.type	ExceptionHandler, %function
ExceptionHandler:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	mov	r4, r0
	mov	r0, #15
	bl	GX_SetBankForBG
	mov	r2, #524288
	mov	r1, #100663296
	mov	r0, #0
	bl	MIi_CpuClearFast
	mov	r1, #100663296
	ldr	r2, .L11
	ldr	r0, .L11+4
	bl	SVC_UnpackBits
	mov	r3, #83886080
	mov	r2, #23
	mov	r1, #1
	strh	r2, [r3]	@ movhi
	mvn	r2, #32768
	mov	r0, r1
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #0
	bl	GX_SetGraphicsMode
	mov	r3, #67108864
	ldr	r2, [r3]
	mov	r1, #0
	bic	r2, r2, #7936
	orr	r2, r2, #2048
	str	r2, [r3]
	mov	r2, #16640
	strh	r2, [r3, #14]	@ movhi
	mov	r2, #256
	strh	r2, [r3, #48]	@ movhi
	strh	r1, [r3, #50]	@ movhi
	strh	r1, [r3, #52]	@ movhi
	strh	r2, [r3, #54]	@ movhi
	ldr	r2, [r3]
	ldr	r0, .L11+8
	bic	r2, r2, #196608
	orr	r2, r2, #65536
	str	r2, [r3]
	ldr	r6, [r4, #60]
	strh	r1, [r3, #108]	@ movhi
	mov	r2, #65536
	ldr	r5, [r4, #64]
	ldr	r1, .L11+12
	bl	MIi_CpuClear16
	mov	r1, r6
	ldr	r0, .L11+12
	bl	ExWriteDebug32
	mov	r1, r5
	ldr	r0, .L11+16
	bl	ExWriteDebug32
	ldr	r5, .L11+20
	ldr	r6, [r4, #56]
	ldr	r7, .L11+24
.L5:
	mov	r0, r5
	ldr	r1, [r6], #4
	add	r5, r5, #32
	bl	ExWriteDebug32
	cmp	r5, r7
	bne	.L5
	mov	r5, #0
	add	r6, r4, #4
.L7:
	cmp	r5, #13
	beq	.L6
	lsl	r0, r5, #5
	add	r0, r0, #100663296
	ldr	r1, [r6, r5, lsl #2]
	add	r0, r0, #2160
	bl	ExWriteDebug32
	add	r5, r5, #1
	b	.L7
.L6:
	ldr	r1, [r4]
	ldr	r4, .L11+28
	ldr	r0, .L11+32
	bl	ExWriteDebug32
	ldr	r1, [r4]
	ldr	r0, .L11+36
	bl	ExWriteDebug32
	ldr	r1, [r4, #4]
	ldr	r0, .L11+40
	bl	ExWriteDebug32
	ldr	r1, [r4, #8]
	ldr	r0, .L11+44
	bl	ExWriteDebug32
	ldr	r1, [r4, #12]
	ldr	r0, .L11+48
	bl	ExWriteDebug32
	.syntax unified
@ 114 "source\exceptionhandler.c" 1
	mov r11, r11
@ 0 "" 2
	.arm
	.syntax unified
.L8:
	b	.L8
.L12:
	.align	2
.L11:
	.word	unpackStruct.0
	.word	mDebugFont
	.word	4112
	.word	100665344
	.word	100665376
	.word	100665440
	.word	100666368
	.word	gExceptionInformation
	.word	100665872
	.word	100666000
	.word	100666032
	.word	100666064
	.word	100666096
	.size	ExceptionHandler, .-ExceptionHandler
	.section	.rodata.unpackStruct.0,"a"
	.align	2
	.type	unpackStruct.0, %object
	.size	unpackStruct.0, 8
unpackStruct.0:
	.short	128
	.byte	1
	.byte	8
	.word	0
	.global	gExceptionInformation
	.section	.bss.gExceptionInformation,"aw",%nobits
	.align	2
	.type	gExceptionInformation, %object
	.size	gExceptionInformation, 16
gExceptionInformation:
	.space	16
	.section	.rodata.mDebugFont,"a"
	.type	mDebugFont, %object
	.size	mDebugFont, 128
mDebugFont:
	.ascii	"\0342**&6\034\000\010\014\010\010\010\010<\000<  \030"
	.ascii	"\010\004<\000<  \030  \034\000\020\030\024\026>\020"
	.ascii	"\020\000<\004\0048  \034\000\034\006\002\036\"\"\034"
	.ascii	"\000< \020\020\010\010\010\0008$$\030$$\034\000\034"
	.ascii	"\"\"< 0\034\000\010\010\024\024\034\"\"\000<$$\034$"
	.ascii	"$\034\0008\014\004\004\004\0148\000\034$$$$$\034\000"
	.ascii	"<\004\004\034\004\004<\000<\004\004\034\004\004\004"
	.ascii	"\000"
	.ident	"GCC: (GNU) 12.2.0"
