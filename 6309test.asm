
	PROCESSOR HD6303

exram	equ $6000	; external RAM start
extop	equ $7fff	; external RAM end

ratmp	equ $80	; temp storage for reg A
rbtmp	equ $81	; temp storage for reg B
rxtmp	equ $82	; temp storage for reg X

;	org $e000	; 0000 in 2864 eeprom
	org $f800	; 0000 in 2816 eeprom
;	org $ff00	; 0700 in 2816 eeprom, 1f00 in 2864 eeprom

main subroutine
	
start	ldab #$00	; COUNT
l2	stab $0000
	stab exram	; sore B in external RAM
	ldab #$ff
l3	ldaa #$00
l1	inca
	bne l1
	incb
	bne l3
	ldab exram	; get value from RAM
	incb
	bra l2

	org $ffe0
tofs	subroutine

ocfs	subroutine

int	subroutine
	rti

	org $fff2
sw3v	.word int	; SWI3
sw2v	.word int	; SWI2
firv	.word int	; FIRQ
irqv	.word int	; IRQ
swiv	.word int	; SWI
nmiv	dc.w int	; NMI
rstv	dc.w start	; RESET
