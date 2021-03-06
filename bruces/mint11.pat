	REMARK %ISIS 11.01 PATCH X
	REMARK % designates save area for mint interrupt ----
	REMARK %	
patmax	eq	7					:modify for useage
	lo kernel
:
	REMARK %look at - ISR(4), fetch<rel>(4), par(4), fetch<phy>(4)
	REMARK %
	NUMBER $0 MAC340
	REMARK -to-
	NUMBER $0 MAC34C+4  
	REMARK %for 10x
	REMARK 
	org	mint
	hc	0,0
	org	mint
	j	knext
	org	knext
	re	43
	hc	0,0
	er
	org	knext
	stm	r12,mcrgsv
	lhi	r13,90
	stm	r13,inttyp		:save int type and psd
	lm	r0,300
	stm	r0,mac300		:save mac rel registers
	lpsw	.+4
	hc	0,0f0,0,patx0
:	lhi	r2,00f0
:	epsr	r1,r2
patx0	stm	r0,mrgsvf		:save register set f
	lpsw	.+4
	hc	0,0,0,patx1
:	lis	r2,0
:	epsr	r1,r2
patx1	stm	r0,mrgsv0		:save register set 0
	l	r15,350
	st	r15,mac350
	j	mint+4,,		:return
inttyp	ws	1
intpsd	ws	2
mrgsv0	ws	10
mrgsvf	ws	10
mac300	ws	10
mac350	wc	0
:
knext	hs	0

	REMARK %
	REMARK %look at - typ(4), psd (8), regs#0 (40), regs#f (40)
	REMARK %        - macrelreg (40), last mac phy (4)
	REMARK %
	NUMBER $0 INTTYP
	REMARK -to-
	NUMBER $0 KNEXT
	REMARK %for 0d0x
	REMARK %
	fo	kernel
:	.....................................................................
:	................end of patch files...................................
:
:	This places the # of the last patch in PATLEV and must
:	remain at the end of the patch file.
:
:	.....................................................................

	ORG	PATLEV
	HC	0
	ORG	PATLEV
	HC	PATMAX


:	Check that there is no overflow in any of the patch areas.

	LO	DDT
	IF	DNEXT-HGHDDT
	REMARK	%%***  ERROR - DPATCH OVERFLOW  ***%%
	EI
	FO	DDT
	IF	SHARE
	 LO	SHARE
	 IF	HNEXT-(HPATCH+(2*80))
	 REMARK	%%***  ERROR - HPATCH OVERFLOW  ***%%
	 EI
	 FO SHARE
	EI	(SHARE)
	LO	KERNEL
	IF	KNEXT-F1
	REMARK	%%***  ERROR - KPATCH OVERFLOW  ***%%
	EI
	FO	KERNEL
	IF	SNEXT-(SPATCH+(2*100))
	REMARK	%%***  ERROR - SPATCH OVERFLOW  ***%%
	EI
   