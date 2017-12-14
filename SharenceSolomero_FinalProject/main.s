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
	.file	"main.c"
	.text
	.align	2
	.global	drawScore
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	beq	.L2
	cmp	r0, #1
	beq	.L2
	cmp	r0, #2
	beq	.L2
	cmp	r0, #3
	beq	.L2
	cmp	r0, #4
	beq	.L2
	cmp	r0, #5
	beq	.L2
	cmp	r0, #6
	beq	.L2
	cmp	r0, #7
	beq	.L2
	cmp	r0, #8
	beq	.L2
	cmp	r0, #9
	moveq	r0, #9
	movne	r0, #0
.L2:
	cmp	r1, #0
	beq	.L3
	cmp	r1, #1
	beq	.L3
	cmp	r1, #2
	beq	.L3
	cmp	r1, #3
	beq	.L3
	cmp	r1, #4
	beq	.L3
	cmp	r1, #5
	beq	.L3
	cmp	r1, #6
	beq	.L3
	cmp	r1, #7
	beq	.L3
	cmp	r1, #8
	beq	.L3
	cmp	r1, #9
	moveq	r1, #9
	movne	r1, #0
.L3:
	mov	ip, #16384
	ldr	r3, .L25
	mov	r2, ip
	add	r2, r2, #115
	add	r0, r0, #256
	add	r1, r1, #256
	add	ip, ip, #100
	mov	r0, r0, asl #1
	mov	r1, r1, asl #1
	strh	r2, [r3, #66]	@ movhi
	mov	r2, #70	@ movhi
	strh	ip, [r3, #58]	@ movhi
	strh	r0, [r3, #60]	@ movhi
	strh	r1, [r3, #68]	@ movhi
	strh	r2, [r3, #56]	@ movhi
	strh	r2, [r3, #64]	@ movhi
	bx	lr
.L26:
	.align	2
.L25:
	.word	shadowOAM
	.size	drawScore, .-drawScore
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r5, #100663296
	mov	r3, #5824
	ldr	r4, .L28
	mov	r0, #3
	ldr	r1, .L28+4
	mov	r2, r5
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L28+8
	add	r2, r5, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L28+12
	add	r2, r5, #16384
	mov	r3, #736
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L28+16
	add	r2, r5, #59392
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L28+20
	add	r2, r5, #32768
	mov	r3, #1168
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L28+24
	add	r2, r5, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r1, #376832
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L28+28
	add	r1, r1, #1168
	ldr	ip, .L28+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L28+36
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	DMANow
	.word	skyTiles
	.word	skyMap
	.word	cityTiles
	.word	cityMap
	.word	splashTiles
	.word	splashMap
	.word	GameSong
	.word	playSoundA
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L31
	ldr	r3, .L31+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+8
	mov	lr, pc
	bx	r3
	mov	r1, #7168
	mov	r3, #67108864
	add	r1, r1, #8
	mov	r2, #7424
	strh	r1, [r3, #8]	@ movhi
	add	r2, r2, #4
	mov	r1, #7680	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	mov	r1, #5888	@ movhi
	add	r2, r3, #256
	ldrh	r2, [r2, #48]
	strh	r1, [r3, #0]	@ movhi
	ldr	r3, .L31+12
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L31+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L31+24
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L31+28
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L32:
	.align	2
.L31:
	.word	skyPal
	.word	loadPalette
	.word	hideSprites
	.word	buttons
	.word	setupSounds
	.word	setupInterrupts
	.word	shadowOAM
	.word	DMANow
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #67108864
	mov	lr, #5632	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34
	add	r2, r2, #65536
	mov	r3, #16384
	ldr	r4, .L34+4
	strh	lr, [ip, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L34+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+12
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	spritesheetTiles
	.word	DMANow
	.word	spritesheetPal
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r5, #100663296
	ldr	r4, .L37
	mov	r0, #3
	ldr	r1, .L37+4
	add	r2, r5, #49152
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L37+8
	add	r2, r5, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #6912
	mov	r2, #67108864
	add	r3, r3, #12
	strh	r3, [r2, #8]	@ movhi
	mov	r3, #5888	@ movhi
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L37+12
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L37+16
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L37+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+24
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	waitForVBlank
	.word	shadowOAM
	.word	hideSprites
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L44+4
	mov	r2, #117440512
	ldr	ip, .L44+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L44+12
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L40
	ldr	r2, .L44+16
	ldrh	r2, [r2, #0]
	tst	r2, #1
	beq	.L42
.L40:
	tst	r3, #2
	beq	.L39
	ldr	r3, .L44+16
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L43
.L39:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	ldmfd	sp!, {r4, lr}
	b	initialize
.L42:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L45:
	.align	2
.L44:
	.word	waitForVBlank
	.word	shadowOAM
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r5, #100663296
	ldr	r4, .L47
	mov	r0, #3
	ldr	r1, .L47+4
	add	r2, r5, #49152
	mov	r3, #624
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L47+8
	add	r2, r5, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #6912
	mov	r2, #67108864
	add	r3, r3, #12
	strh	r3, [r2, #8]	@ movhi
	mov	r3, #5888	@ movhi
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L47+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L47+16
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L47+20
	mov	lr, pc
	bx	r3
	mov	r4, #11008
	ldr	r3, .L47+24
	mov	lr, pc
	bx	r3
	add	r4, r4, #17
	mov	r1, #376832
	ldr	r0, .L47+28
	add	r1, r1, #1168
	mov	r2, r4
	mov	r3, #1
	ldr	ip, .L47+32
	mov	lr, pc
	bx	ip
	mov	r1, #28928
	mov	r2, r4
	mov	r3, #0
	ldr	r0, .L47+36
	add	r1, r1, #2
	ldr	ip, .L47+40
	mov	lr, pc
	bx	ip
	ldr	r3, .L47+44
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	DMANow
	.word	scoreTiles
	.word	scoreMap
	.word	waitForVBlank
	.word	shadowOAM
	.word	hideSprites
	.word	stopSound
	.word	GameSong
	.word	playSoundA
	.word	GameOver
	.word	playSoundB
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L54
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
	ldr	r3, .L54+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
	ldr	r3, .L54+12
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L54+16
	mov	r2, #117440512
	ldr	ip, .L54+20
	mov	lr, pc
	bx	ip
	ldr	r3, .L54+24
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L50
	ldr	r3, .L54+28
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L53
.L50:
	ldr	r3, .L54+32
	ldr	r2, [r3, #0]
	ldr	r3, [r3, #20]
	rsb	r3, r3, r2
	cmp	r3, #159
	bgt	.L51
	cmp	r2, #0
	ble	.L51
	ldmfd	sp!, {r4, lr}
	bx	lr
.L51:
	ldmfd	sp!, {r4, lr}
	b	goToLose
.L53:
	bl	goToPause
	b	.L50
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	shadowOAM
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	player
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L59
	stmfd	sp!, {r4, lr}
	ldr	r0, .L59+4
	ldr	r2, [r3, #0]
	smull	r3, r1, r0, r2
	mov	r3, r2, asr #31
	rsb	r3, r3, r1, asr #2
	smull	r1, r0, r3, r0
	mov	r1, r3, asr #31
	rsb	r0, r1, r0, asr #2
	add	r0, r0, r0, asl #2
	add	r1, r3, r3, asl #2
	sub	r1, r2, r1, asl #1
	sub	r0, r3, r0, asl #1
	bl	drawScore
	ldr	r3, .L59+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L59+12
	mov	r2, #117440512
	ldr	ip, .L59+16
	mov	lr, pc
	bx	ip
	ldr	r3, .L59+20
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L59+24
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L58
.L56:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L58:
	ldmfd	sp!, {r4, lr}
	b	initialize
.L60:
	.align	2
.L59:
	.word	level
	.word	1717986919
	.word	waitForVBlank
	.word	shadowOAM
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToInstr
	.type	goToInstr, %function
goToInstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r5, #100663296
	mov	r0, #3
	ldr	r1, .L62
	add	r2, r5, #32768
	mov	r3, #1744
	ldr	r4, .L62+4
	mov	lr, pc
	bx	r4
	add	r2, r5, #57344
	mov	r0, #3
	ldr	r1, .L62+8
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+16
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	instructionsTiles
	.word	DMANow
	.word	instructionsMap
	.word	waitForVBlank
	.word	state
	.size	goToInstr, .-goToInstr
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L69
	stmfd	sp!, {r4, lr}
	ldr	r2, [r3, #0]
	ldr	r4, .L69+4
	add	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	tst	r3, #1
	beq	.L65
	ldr	r2, .L69+12
	ldrh	r2, [r2, #0]
	tst	r2, #1
	beq	.L67
.L65:
	tst	r3, #2
	beq	.L64
	ldr	r3, .L69+12
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L68
.L64:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L68:
	ldmfd	sp!, {r4, lr}
	b	goToInstr
.L67:
	bl	goToGame
	ldr	r3, .L69+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	b	.L65
.L70:
	.align	2
.L69:
	.word	.LANCHOR0
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instr
	.type	instr, %function
instr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L76
	ldrh	r3, [r4, #0]
	tst	r3, #1
	beq	.L72
	ldr	r2, .L76+4
	ldrh	r2, [r2, #0]
	tst	r2, #1
	beq	.L74
.L72:
	tst	r3, #2
	beq	.L71
	ldr	r3, .L76+4
	ldrh	r3, [r3, #0]
	tst	r3, #2
	beq	.L75
.L71:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L75:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L74:
	bl	goToGame
	ldr	r3, .L76+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	b	.L72
.L77:
	.align	2
.L76:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instr, .-instr
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bl	initialize
	mov	r7, #67108864
	ldr	sl, .L87
	ldr	r6, .L87+4
	ldr	r8, .L87+8
	ldr	r5, .L87+12
	add	r7, r7, #256
	mov	r4, #67108864
.L86:
	ldrh	r3, [r6, #0]
	strh	r3, [sl, #0]	@ movhi
	ldr	r3, [r8, #0]
	ldrh	r2, [r7, #48]
	strh	r2, [r6, #0]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L79
.L85:
	.word	.L80
	.word	.L81
	.word	.L82
	.word	.L83
	.word	.L84
.L84:
	bl	lose
.L79:
	ldrh	r2, [r5, #0]
	ldrh	r3, [r5, #4]
	strh	r2, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	b	.L86
.L83:
	bl	pause
	ldrh	r2, [r5, #0]
	ldrh	r3, [r5, #4]
	strh	r2, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	b	.L86
.L82:
	bl	game
	ldrh	r2, [r5, #0]
	ldrh	r3, [r5, #4]
	strh	r2, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	b	.L86
.L81:
	bl	instr
	ldrh	r2, [r5, #0]
	ldrh	r3, [r5, #4]
	strh	r2, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	b	.L86
.L80:
	bl	start
	ldrh	r2, [r5, #0]
	ldrh	r3, [r5, #4]
	strh	r2, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	b	.L86
.L88:
	.align	2
.L87:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	.LANCHOR0
	.size	main, .-main
	.global	hOff
	.global	vOff
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
