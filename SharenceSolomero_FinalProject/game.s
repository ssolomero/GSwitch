	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L10
	ldr	r0, [r2, #4]
	ldr	r1, [r2, #28]
	ldr	r3, .L10+4
	ldrh	r2, [r2, #0]
	cmp	r1, #1
	mvn	r0, r0, asl #17
	mvn	r0, r0, lsr #17
	strh	r2, [r3, #0]	@ movhi
	moveq	r2, #0	@ movhi
	strh	r0, [r3, #2]	@ movhi
	streqh	r2, [r3, #4]	@ movhi
	bxeq	lr
	cmp	r1, #0
	moveq	r2, #4	@ movhi
	streqh	r2, [r3, #4]	@ movhi
	bxeq	lr
	cmp	r1, #4
	moveq	r2, #128	@ movhi
	streqh	r2, [r3, #4]	@ movhi
	bxeq	lr
	cmp	r1, #5
	moveq	r2, #132	@ movhi
	streqh	r2, [r3, #4]	@ movhi
	bxeq	lr
	cmp	r1, #2
	moveq	r2, #8	@ movhi
	streqh	r2, [r3, #4]	@ movhi
	bxeq	lr
	cmp	r1, #3
	moveq	r2, #12	@ movhi
	streqh	r2, [r3, #4]	@ movhi
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	mov	r1, #2
	mov	r2, #0
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	mov	r1, #90
	mov	r0, #32
	str	r1, [r3, #0]
	str	r2, [r3, #24]
	mov	r1, #88
	str	r2, [r3, #28]
	mov	r2, #1
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r1, [r3, #4]
	str	r2, [r3, #32]
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L52
	sub	sp, sp, #20
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L43
	ldr	r5, .L52+4
	ldr	sl, .L52+8
	ldr	r6, .L52+12
	ldr	r7, .L52+16
.L16:
	ldr	ip, [r5, #8]
	ldr	fp, [r4, #0]
	ldr	r0, [r4, #8]
	ldr	r8, [r5, #4]
	ldr	r9, [r5, #12]
	ldr	lr, [r5, #0]
	mov	ip, ip, asl #1
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	rsb	r0, r0, fp
	stmib	sp, {r8, r9}	@ phole stm
	str	lr, [sp, #0]
	str	ip, [sp, #12]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	ldr	r8, .L52
	ldr	r9, .L52+8
	beq	.L47
.L29:
	ldr	fp, [r4, #0]
	ldr	r0, [r4, #8]
	ldr	ip, [r5, #0]
	ldr	r8, [r5, #4]
	ldr	r9, [r5, #12]
	ldr	lr, [r5, #8]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	rsb	r0, r0, fp
	str	ip, [sp, #0]
	stmib	sp, {r8, r9, lr}	@ phole stm
	mov	lr, pc
	bx	sl
	ldr	r2, .L52+4
	cmp	r0, #0
	ldrne	r0, [r2, #0]
	ldr	r3, .L52
	ldrne	r2, [r2, #12]
	ldreq	r0, [r3, #0]
	addne	r0, r0, r2
	ldr	r9, [r4, #8]
	ldr	lr, [r6, #0]
	ldr	ip, [r6, #4]
	add	r5, r6, #8
	ldmia	r5, {r5, r8}	@ phole ldm
	subne	r0, r0, #2
	strne	r0, [r3, #0]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	rsb	r0, r9, r0
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r8, [sp, #8]
	str	r5, [sp, #12]
	mov	lr, pc
	bx	sl
	ldr	r2, .L52+12
	cmp	r0, #0
	ldrne	r0, [r2, #0]
	ldr	r3, .L52
	ldrne	r2, [r2, #12]
	ldreq	r0, [r3, #0]
	addne	r0, r0, r2
	ldr	r8, [r4, #8]
	ldmia	r7, {r5, lr}	@ phole ldm
	add	r6, r7, #8
	ldmia	r6, {r6, ip}	@ phole ldm
	subne	r0, r0, #2
	strne	r0, [r3, #0]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	rsb	r0, r8, r0
	stmia	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r6, [sp, #12]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	ldr	r3, .L52+16
	beq	.L35
	ldr	r2, [r3, #0]
	ldr	r3, [r3, #12]
	add	r2, r2, r3
	ldr	r3, .L52
	sub	r2, r2, #2
	str	r2, [r3, #0]
.L35:
	ldr	r3, .L52+20
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L36
	ldr	r3, .L52+24
	ldrh	r3, [r3, #0]
	ands	r3, r3, #1
	beq	.L48
.L36:
	ldr	r3, [r4, #24]
	tst	r3, #7
	ldr	r2, .L52
	bne	.L37
	ldr	r1, [r2, #28]
	cmp	r1, #2
	moveq	r1, #3
	streq	r1, [r2, #28]
	beq	.L37
	mov	r1, #2
.L46:
	str	r1, [r2, #28]
.L37:
	add	r3, r3, #1
	str	r3, [r4, #24]
.L15:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L43:
	ldr	r5, .L52+4
	ldr	r8, [r4, #8]
	ldr	r0, [r4, #0]
	ldmia	r5, {r6, lr}	@ phole ldm
	add	r7, r5, #8
	ldmia	r7, {r7, ip}	@ phole ldm
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	add	r0, r8, r0
	ldr	sl, .L52+8
	stmia	sp, {r6, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r7, [sp, #12]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	bne	.L49
	ldr	r6, .L52+12
	ldr	r9, [r4, #8]
	ldr	r0, [r4, #0]
	ldr	r7, [r6, #12]
	ldr	lr, [r6, #0]
	ldr	ip, [r6, #4]
	ldr	r8, [r6, #8]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	add	r0, r9, r0
	str	r7, [sp, #8]
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r8, [sp, #12]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	ldrne	r7, .L52+16
	beq	.L50
.L17:
	ldr	fp, [r4, #8]
	ldr	r0, [r4, #0]
	ldr	ip, [r5, #0]
	ldr	r8, [r5, #4]
	ldr	r9, [r5, #12]
	ldr	lr, [r5, #8]
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	add	r0, fp, r0
	str	ip, [sp, #0]
	stmib	sp, {r8, r9, lr}	@ phole stm
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	ldrne	r2, .L52+4
	ldr	r3, .L52
	ldrne	r0, [r2, #0]
	ldrne	r2, [r3, #20]
	ldreq	r0, [r3, #0]
	addne	r0, r0, #2
	ldr	r9, [r4, #8]
	ldr	lr, [r6, #0]
	ldr	ip, [r6, #4]
	add	r5, r6, #8
	ldmia	r5, {r5, r8}	@ phole ldm
	rsbne	r0, r2, r0
	strne	r0, [r3, #0]
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	add	r0, r0, r9
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r8, [sp, #8]
	str	r5, [sp, #12]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	ldrne	r2, .L52+12
	ldr	r3, .L52
	ldrne	r0, [r2, #0]
	ldrne	r2, [r3, #20]
	ldreq	r0, [r3, #0]
	addne	r0, r0, #2
	ldr	r8, [r4, #8]
	rsbne	r0, r2, r0
	ldmia	r7, {r5, lr}	@ phole ldm
	add	r6, r7, #8
	ldmia	r6, {r6, ip}	@ phole ldm
	strne	r0, [r3, #0]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	add	r0, r0, r8
	stmia	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r6, [sp, #12]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	ldr	r3, .L52
	beq	.L23
	ldr	r2, .L52+16
	ldr	r2, [r2, #0]
	ldr	r1, [r3, #20]
	add	r2, r2, #2
	rsb	r2, r1, r2
	str	r2, [r3, #0]
.L23:
	ldr	r3, .L52+20
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L24
	ldr	r3, .L52+24
	ldrh	ip, [r3, #0]
	ands	ip, ip, #1
	beq	.L51
.L24:
	ldr	r3, [r4, #24]
	ands	r1, r3, #7
	ldr	r2, .L52
	bne	.L37
	ldr	r0, [r2, #28]
	cmp	r0, #0
	moveq	r1, #1
	streq	r1, [r2, #28]
	beq	.L37
	b	.L46
.L49:
	ldr	r6, .L52+12
	ldr	r7, .L52+16
	b	.L17
.L47:
	ldmia	r6, {ip, lr}	@ phole ldm
	ldr	fp, [r8, #0]
	ldr	r0, [r8, #8]
	ldr	r1, [r8, #4]
	ldr	r2, [r8, #20]
	ldr	r3, [r8, #16]
	stmia	sp, {ip, lr}	@ phole stm
	ldr	ip, [r6, #12]
	str	ip, [sp, #8]
	ldr	ip, [r6, #8]
	rsb	r0, r0, fp
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L29
	ldmia	r7, {ip, lr}	@ phole ldm
	ldr	fp, [r8, #0]
	ldr	r0, [r8, #8]
	ldr	r1, [r8, #4]
	ldr	r2, [r8, #20]
	ldr	r3, [r8, #16]
	stmia	sp, {ip, lr}	@ phole stm
	ldr	ip, [r7, #12]
	str	ip, [sp, #8]
	ldr	ip, [r7, #8]
	rsb	r0, r0, fp
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L29
	ldr	r3, [r8, #32]
	cmp	r3, #0
	bne	.L28
	ldr	r2, [r8, #0]
	ldr	r3, [r8, #8]
	rsb	r3, r3, r2
	mov	r2, #4
	str	r2, [r8, #28]
	str	r3, [r8, #0]
	b	.L15
.L50:
	ldr	r7, .L52+16
	ldr	fp, [r4, #8]
	ldr	r0, [r4, #0]
	ldmia	r7, {ip, lr}	@ phole ldm
	ldr	r8, [r7, #12]
	ldr	r9, [r7, #8]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	add	r0, fp, r0
	stmia	sp, {ip, lr}	@ phole stm
	str	r8, [sp, #8]
	str	r9, [sp, #12]
	mov	lr, pc
	bx	sl
	cmp	r0, #0
	bne	.L17
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L16
.L28:
	ldr	r3, [r4, #0]
	ldr	r2, [r4, #8]
	add	r3, r2, r3
	mov	r2, #5
	str	r2, [r4, #28]
	str	r3, [r4, #0]
	b	.L15
.L51:
	mov	r3, ip
	str	ip, [r4, #32]
	mov	r1, #2048
	mov	ip, #4
	mov	r2, #11008
	ldr	r0, .L52+28
	add	r1, r1, #6
	add	r2, r2, #17
	str	ip, [r4, #28]
	ldr	ip, .L52+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L52+36
	ldr	r0, [r4, #0]
	ldr	r2, [r3, #0]
	ldr	r1, [r4, #8]
	add	r2, r2, #1
	rsb	r1, r1, r0
	str	r1, [r4, #0]
	str	r2, [r3, #0]
	b	.L24
.L48:
	mov	ip, #1
	str	ip, [r4, #32]
	mov	r1, #2048
	mov	ip, #5
	mov	r2, #11008
	ldr	r0, .L52+28
	add	r1, r1, #6
	add	r2, r2, #17
	str	ip, [r4, #28]
	ldr	ip, .L52+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L52+36
	ldr	r1, [r4, #0]
	ldr	r2, [r3, #0]
	ldr	r0, [r4, #8]
	add	r2, r2, #1
	add	r1, r0, r1
	str	r1, [r4, #0]
	str	r2, [r3, #0]
	b	.L36
.L53:
	.align	2
.L52:
	.word	player
	.word	platform1
	.word	collision
	.word	platform2
	.word	platform3
	.word	oldButtons
	.word	buttons
	.word	jump
	.word	playSoundB
	.word	level
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initPlatforms
	.type	initPlatforms, %function
initPlatforms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L55
	stmfd	sp!, {r4, r5, r6}
	mov	r6, #144
	ldr	r2, .L55+4
	mov	r0, #1
	mov	r5, #128
	mov	r4, #16
	str	r6, [r1, #0]
	mov	r6, #120
	str	r5, [r1, #8]
	str	r4, [r1, #12]
	str	r6, [r1, #4]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	mov	r1, #0
	str	r1, [r2, #0]
	mov	r1, #250
	ldr	r3, .L55+8
	str	r1, [r2, #4]
	mov	r1, #3
	mov	ip, #372
	str	r5, [r2, #8]
	str	r4, [r2, #12]
	str	r0, [r2, #16]
	str	r1, [r2, #20]
	mov	r2, #72
	add	ip, ip, #3
	str	r2, [r3, #0]
	mov	r2, #2
	str	r5, [r3, #8]
	str	r4, [r3, #12]
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	str	r2, [r3, #20]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L56:
	.align	2
.L55:
	.word	platform1
	.word	platform2
	.word	platform3
	.size	initPlatforms, .-initPlatforms
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	initPlayer
	bl	initPlatforms
	ldr	r2, .L58
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L58+4
	str	r3, [r2, #0]
	ldr	r2, .L58+8
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	level
	.word	cheat
	.word	winner
	.size	initGame, .-initGame
	.align	2
	.global	updatePlatforms
	.type	updatePlatforms, %function
updatePlatforms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, .L79
	ldr	r6, .L79+4
	ldr	r4, .L79+8
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #16]
	ldr	r0, [r5, #8]
	rsb	r2, r3, r2
	ldr	r7, [r6, #4]
	ldr	ip, [r4, #4]
	ldr	r3, [r6, #16]
	ldr	r1, [r4, #16]
	add	r0, r2, r0
	rsb	r3, r3, r7
	rsb	r1, r1, ip
	cmp	r0, #0
	str	r2, [r5, #4]
	str	r3, [r6, #4]
	str	r1, [r4, #4]
	ble	.L74
.L61:
	ldr	r2, [r6, #8]
	add	r3, r3, r2
	cmp	r3, #0
	ldr	r7, .L79+4
	ble	.L75
.L67:
	ldmib	r4, {r0, r3}
	add	r3, r3, r0
	cmp	r3, #0
	ldr	r7, .L79+8
	ble	.L76
.L70:
	ldr	r1, .L79+12
	ldr	r2, .L79+16
	ldr	r3, [r1, #0]
	smull	r0, r2, r3, r2
	mov	r0, r3, asr #31
	rsb	r2, r0, r2, asr #1
	add	r2, r2, r2, asl #2
	cmp	r3, r2
	bne	.L60
	cmp	r3, #0
	ble	.L60
	ldr	r2, .L79+20
	ldr	r2, [r2, #0]
	cmp	r2, #0
	bne	.L60
	ldr	r2, .L79+24
	ldr	r8, [r5, #16]
	ldr	r7, [r6, #16]
	ldr	ip, [r4, #16]
	ldr	r0, [r2, #8]
	add	r8, r8, #1
	add	r7, r7, #1
	add	ip, ip, #1
	add	r0, r0, #1
	add	r3, r3, #1
	str	r8, [r5, #16]
	str	r7, [r6, #16]
	str	ip, [r4, #16]
	str	r0, [r2, #8]
	str	r3, [r1, #0]
.L60:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L76:
	ldr	r3, .L79+28
	mov	lr, pc
	bx	r3
	ldr	r2, .L79+24
	ldr	r2, [r2, #8]
	ldr	r3, [r6, #20]
	add	r2, r2, #251
	str	r2, [r7, #4]
	ldr	r2, .L79+4
	cmp	r3, #1
	ldrne	r3, [r2, #12]
	moveq	r3, #2
	streq	r3, [r7, #20]
	rsbne	r3, r3, #160
	moveq	r3, #72
	movne	r2, #1
	streq	r3, [r7, #0]
	strne	r2, [r7, #20]
	strne	r3, [r7, #0]
	b	.L70
.L74:
	ldr	r3, .L79+28
	mov	lr, pc
	bx	r3
	ldr	r2, .L79+24
	ldr	r3, [r4, #20]
	ldr	r2, [r2, #8]
	add	r1, r0, r0, lsr #31
	and	r1, r1, #1
	add	r2, r2, #251
	cmp	r3, #1
	sub	r1, r1, r0, lsr #31
	str	r2, [r5, #4]
	beq	.L77
	cmp	r3, #2
	beq	.L78
	cmp	r1, #0
	bne	.L66
	ldr	r3, [r5, #12]
	mov	r2, #2
	rsb	r3, r3, #160
	str	r3, [r5, #0]
	str	r2, [r5, #20]
	ldr	r3, [r6, #4]
	b	.L61
.L66:
	mov	r3, #2
	str	r3, [r5, #20]
	mov	r3, #72
	str	r3, [r5, #0]
	ldr	r3, [r6, #4]
	b	.L61
.L75:
	ldr	r3, .L79+28
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #20]
	ldr	r2, .L79+24
	cmp	r3, #1
	ldr	r2, [r2, #8]
	ldrne	r3, [r7, #12]
	add	r2, r2, #251
	moveq	r3, #2
	str	r2, [r7, #4]
	streq	r3, [r7, #20]
	rsbne	r3, r3, #160
	moveq	r3, #72
	movne	r2, #1
	streq	r3, [r7, #0]
	strne	r2, [r7, #20]
	strne	r3, [r7, #0]
	b	.L67
.L77:
	cmp	r1, #0
	beq	.L66
.L65:
	mov	r3, #3
	str	r3, [r5, #20]
	mov	r3, #0
	str	r3, [r5, #0]
	ldr	r3, [r6, #4]
	b	.L61
.L78:
	cmp	r1, #0
	bne	.L65
	ldr	r3, [r5, #12]
	mov	r2, #1
	rsb	r3, r3, #160
	str	r3, [r5, #0]
	str	r2, [r5, #20]
	ldr	r3, [r6, #4]
	b	.L61
.L80:
	.align	2
.L79:
	.word	platform1
	.word	platform2
	.word	platform3
	.word	level
	.word	1717986919
	.word	cheat
	.word	player
	.word	rand
	.size	updatePlatforms, .-updatePlatforms
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	updatePlayer
	bl	updatePlatforms
	ldr	r3, .L84
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L81
	ldr	r3, .L84+4
	ldrh	r3, [r3, #0]
	ands	r3, r3, #2
	bne	.L81
	ldr	r2, .L84+8
	ldr	r1, [r2, #0]
	cmp	r1, #0
	moveq	r3, #1
	streq	r3, [r2, #0]
	ldreq	r2, .L84+12
	streq	r3, [r2, #16]
	ldreq	r2, .L84+16
	streq	r3, [r2, #16]
	ldreq	r2, .L84+20
	strne	r3, [r2, #0]
	streq	r3, [r2, #16]
.L81:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	oldButtons
	.word	buttons
	.word	cheat
	.word	platform1
	.word	platform2
	.word	platform3
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlatforms
	.type	drawPlatforms, %function
drawPlatforms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L87
	ldr	r2, .L87+4
	ldr	r3, .L87+8
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	sl, [r1, #4]
	ldr	r7, [r2, #4]
	ldr	r5, [r3, #4]
	ldr	r8, [r1, #8]
	ldr	r6, [r2, #8]
	ldr	r4, [r3, #8]
	ldr	ip, [r1, #0]
	ldr	r0, [r2, #0]
	ldr	r1, [r3, #0]
	mov	r2, r5, asl #23
	mov	sl, sl, asl #23
	mov	r7, r7, asl #23
	mov	r2, r2, lsr #23
	mov	sl, sl, lsr #23
	mov	r7, r7, lsr #23
	add	r8, r8, r8, lsr #31
	add	r6, r6, r6, lsr #31
	add	r4, r4, r4, lsr #31
	add	r8, sl, r8, asr #1
	add	r6, r7, r6, asr #1
	add	r4, r2, r4, asr #1
	orr	ip, ip, #16384
	orr	r0, r0, #16384
	orr	r1, r1, #16384
	ldr	r3, .L87+12
	mvn	r5, r2, asl #18
	mov	ip, ip, asl #16
	mvn	sl, sl, asl #18
	mvn	r8, r8, asl #18
	mov	r0, r0, asl #16
	mvn	r7, r7, asl #18
	mvn	r6, r6, asl #18
	mov	r1, r1, asl #16
	mvn	r4, r4, asl #18
	mov	r2, #256
	mov	ip, ip, lsr #16
	mov	r0, r0, lsr #16
	mov	r1, r1, lsr #16
	mvn	sl, sl, lsr #18
	mvn	r8, r8, lsr #18
	mvn	r7, r7, lsr #18
	mvn	r6, r6, lsr #18
	mvn	r5, r5, lsr #18
	mvn	r4, r4, lsr #18
	strh	ip, [r3, #8]	@ movhi
	strh	sl, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	strh	ip, [r3, #16]	@ movhi
	strh	r8, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	r0, [r3, #24]	@ movhi
	strh	r7, [r3, #26]	@ movhi
	strh	r2, [r3, #28]	@ movhi
	strh	r0, [r3, #32]	@ movhi
	strh	r6, [r3, #34]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	strh	r1, [r3, #40]	@ movhi
	strh	r5, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	strh	r1, [r3, #48]	@ movhi
	strh	r4, [r3, #50]	@ movhi
	strh	r2, [r3, #52]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L88:
	.align	2
.L87:
	.word	platform1
	.word	platform2
	.word	platform3
	.word	shadowOAM
	.size	drawPlatforms, .-drawPlatforms
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	drawPlayer
	ldmfd	sp!, {r4, lr}
	b	drawPlatforms
	.size	drawGame, .-drawGame
	.comm	player,36,4
	.comm	level,4,4
	.comm	winner,4,4
	.comm	platform1,24,4
	.comm	platform2,24,4
	.comm	platform3,24,4
	.comm	cheat,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
