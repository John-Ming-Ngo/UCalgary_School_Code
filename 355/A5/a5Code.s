	.arch armv8-a
	.file	"a5Code.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"zero divisor popped"
	.align	3
.LC1:
	.string	"\n%d\n\n"
	.align	3
.LC2:
	.string	"%.20s ... is too long\n"
	.align	3
.LC3:
	.string	"unknown command %c\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x19, [sp, 16]
	.cfi_offset 19, -48
	b	.L2
.L16:
	ldr	w0, [x29, 60]
	cmp	w0, 47
	beq	.L4
	cmp	w0, 47
	bgt	.L5
	cmp	w0, 43
	beq	.L6
	cmp	w0, 45
	beq	.L7
	cmp	w0, 42
	beq	.L8
	b	.L3
.L5:
	cmp	w0, 57
	beq	.L9
	cmp	w0, 57
	bgt	.L10
	cmp	w0, 48
	beq	.L11
	b	.L3
.L10:
	cmp	w0, 61
	beq	.L12
	cmp	w0, 99
	beq	.L13
	b	.L3
.L11:
	add	x0, x29, 32
	bl	atoi
	bl	push
	b	.L2
.L6:
	bl	pop
	mov	w19, w0
	bl	pop
	add	w0, w19, w0
	bl	push
	b	.L2
.L8:
	bl	pop
	mov	w19, w0
	bl	pop
	mul	w0, w19, w0
	bl	push
	b	.L2
.L7:
	bl	pop
	str	w0, [x29, 56]
	bl	pop
	mov	w1, w0
	ldr	w0, [x29, 56]
	sub	w0, w1, w0
	bl	push
	b	.L2
.L4:
	bl	pop
	str	w0, [x29, 56]
	ldr	w0, [x29, 56]
	cmp	w0, 0
	beq	.L14
	bl	pop
	mov	w1, w0
	ldr	w0, [x29, 56]
	sdiv	w0, w1, w0
	bl	push
	b	.L2
.L14:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
	b	.L2
.L12:
	bl	pop
	bl	push
	mov	w1, w0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	b	.L2
.L13:
	bl	clear
	b	.L2
.L9:
	add	x1, x29, 32
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	b	.L2
.L3:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	ldr	w1, [x29, 60]
	bl	printf
	nop
.L2:
	add	x0, x29, 32
	mov	w1, 20
	bl	getop
	str	w0, [x29, 60]
	ldr	w0, [x29, 60]
	cmn	w0, #1
	bne	.L16
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.global	sp
	.bss
	.align	2
	.type	sp, %object
	.size	sp, 4
sp:
	.zero	4
	.comm	val,400,8
	.section	.rodata
	.align	3
.LC4:
	.string	"error: stack full"
	.text
	.align	2
	.global	push
	.type	push, %function
push:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29, 28]
	adrp	x0, sp
	add	x0, x0, :lo12:sp
	ldr	w0, [x0]
	cmp	w0, 99
	bgt	.L19
	adrp	x0, sp
	add	x0, x0, :lo12:sp
	ldr	w0, [x0]
	add	w2, w0, 1
	adrp	x1, sp
	add	x1, x1, :lo12:sp
	str	w2, [x1]
	adrp	x1, val
	add	x1, x1, :lo12:val
	sxtw	x2, w0
	ldr	w3, [x29, 28]
	str	w3, [x1, x2, lsl 2]
	adrp	x1, val
	add	x1, x1, :lo12:val
	sxtw	x0, w0
	ldr	w0, [x1, x0, lsl 2]
	b	.L20
.L19:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	bl	clear
	mov	w0, 0
.L20:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE6:
	.size	push, .-push
	.section	.rodata
	.align	3
.LC5:
	.string	"error: stack empty"
	.text
	.align	2
	.global	pop
	.type	pop, %function
pop:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	adrp	x0, sp
	add	x0, x0, :lo12:sp
	ldr	w0, [x0]
	cmp	w0, 0
	ble	.L22
	adrp	x0, sp
	add	x0, x0, :lo12:sp
	ldr	w0, [x0]
	sub	w1, w0, #1
	adrp	x0, sp
	add	x0, x0, :lo12:sp
	str	w1, [x0]
	adrp	x0, sp
	add	x0, x0, :lo12:sp
	ldr	w1, [x0]
	adrp	x0, val
	add	x0, x0, :lo12:val
	sxtw	x1, w1
	ldr	w0, [x0, x1, lsl 2]
	b	.L23
.L22:
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	bl	clear
	mov	w0, 0
.L23:
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE7:
	.size	pop, .-pop
	.align	2
	.global	clear
	.type	clear, %function
clear:
.LFB8:
	.cfi_startproc
	adrp	x0, sp
	add	x0, x0, :lo12:sp
	str	wzr, [x0]
	nop
	ret
	.cfi_endproc
.LFE8:
	.size	clear, .-clear
	.align	2
	.global	getop
	.type	getop, %function
getop:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x0, [x29, 24]
	str	w1, [x29, 20]
.L26:
	bl	getch
	str	w0, [x29, 40]
	ldr	w0, [x29, 40]
	cmp	w0, 32
	beq	.L26
	ldr	w0, [x29, 40]
	cmp	w0, 9
	beq	.L26
	ldr	w0, [x29, 40]
	cmp	w0, 10
	beq	.L26
	ldr	w0, [x29, 40]
	cmp	w0, 47
	ble	.L27
	ldr	w0, [x29, 40]
	cmp	w0, 57
	ble	.L28
.L27:
	ldr	w0, [x29, 40]
	b	.L29
.L28:
	ldr	w0, [x29, 40]
	and	w1, w0, 255
	ldr	x0, [x29, 24]
	strb	w1, [x0]
	mov	w0, 1
	str	w0, [x29, 44]
	b	.L30
.L33:
	ldr	w1, [x29, 44]
	ldr	w0, [x29, 20]
	cmp	w1, w0
	bge	.L31
	ldrsw	x0, [x29, 44]
	ldr	x1, [x29, 24]
	add	x0, x1, x0
	ldr	w1, [x29, 40]
	and	w1, w1, 255
	strb	w1, [x0]
.L31:
	ldr	w0, [x29, 44]
	add	w0, w0, 1
	str	w0, [x29, 44]
.L30:
	bl	getchar
	str	w0, [x29, 40]
	ldr	w0, [x29, 40]
	cmp	w0, 47
	ble	.L32
	ldr	w0, [x29, 40]
	cmp	w0, 57
	ble	.L33
.L32:
	ldr	w1, [x29, 44]
	ldr	w0, [x29, 20]
	cmp	w1, w0
	bge	.L35
	ldr	w0, [x29, 40]
	bl	ungetch
	ldrsw	x0, [x29, 44]
	ldr	x1, [x29, 24]
	add	x0, x1, x0
	strb	wzr, [x0]
	mov	w0, 48
	b	.L29
.L37:
	bl	getchar
	str	w0, [x29, 40]
.L35:
	ldr	w0, [x29, 40]
	cmp	w0, 10
	beq	.L36
	ldr	w0, [x29, 40]
	cmn	w0, #1
	bne	.L37
.L36:
	ldrsw	x0, [x29, 20]
	sub	x0, x0, #1
	ldr	x1, [x29, 24]
	add	x0, x1, x0
	strb	wzr, [x0]
	mov	w0, 57
.L29:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE9:
	.size	getop, .-getop
	.comm	buf,100,8
	.global	bufp
	.bss
	.align	2
	.type	bufp, %object
	.size	bufp, 4
bufp:
	.zero	4
	.text
	.align	2
	.global	getch
	.type	getch, %function
getch:
.LFB10:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	adrp	x0, bufp
	add	x0, x0, :lo12:bufp
	ldr	w0, [x0]
	cmp	w0, 0
	ble	.L39
	adrp	x0, bufp
	add	x0, x0, :lo12:bufp
	ldr	w0, [x0]
	sub	w1, w0, #1
	adrp	x0, bufp
	add	x0, x0, :lo12:bufp
	str	w1, [x0]
	adrp	x0, bufp
	add	x0, x0, :lo12:bufp
	ldr	w2, [x0]
	adrp	x0, buf
	add	x1, x0, :lo12:buf
	sxtw	x0, w2
	ldrb	w0, [x1, x0]
	b	.L41
.L39:
	bl	getchar
.L41:
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE10:
	.size	getch, .-getch
	.section	.rodata
	.align	3
.LC6:
	.string	"ungetch: too many characters"
	.text
	.align	2
	.global	ungetch
	.type	ungetch, %function
ungetch:
.LFB11:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	w0, [x29, 28]
	adrp	x0, bufp
	add	x0, x0, :lo12:bufp
	ldr	w0, [x0]
	cmp	w0, 100
	ble	.L43
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	b	.L45
.L43:
	adrp	x0, bufp
	add	x0, x0, :lo12:bufp
	ldr	w0, [x0]
	add	w2, w0, 1
	adrp	x1, bufp
	add	x1, x1, :lo12:bufp
	str	w2, [x1]
	ldr	w1, [x29, 28]
	and	w2, w1, 255
	adrp	x1, buf
	add	x1, x1, :lo12:buf
	sxtw	x0, w0
	strb	w2, [x1, x0]
.L45:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE11:
	.size	ungetch, .-ungetch
	.ident	"GCC: (GNU) 7.1.1 20170622 (Red Hat 7.1.1-3)"
	.section	.note.GNU-stack,"",@progbits
