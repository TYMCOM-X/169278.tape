 
::::::	I2IS 11.01 - Assembled Patch file  		::::::
:	.....................................................................
	REMARK %ISIS 11.01 PATCH 3    PICO ENGINE
	REMARK %logs spurious interupt <69> instead
	REMARK %of crashing the slot on and 8730
	REMARK % special -- not for everyone!
	REMARK %
	ORG	IZ4
	HC	0,0,0
	ORG	IZ4
	J	KNEXT,,
	ORG	KNEXT
	RE	37
	HC	0
	ER
	ORG	KNEXT
	ST	R6,K.SAVE
	LA	R6,PATN			:interupt vector
	STH	R6,0D0+(69)*2		:cell for int 69
	L	R6,K.SAVE
	ST	R11,MACAREA,R8		:replaced instructions
	SIS	R8,4			:
	J	IZ4+6,,			:return
PATN	LHL	R4,SLOT,R1		:slot
	LA	R5,PATM			:message
	JAL	R11,SETDIAG,,		:message in history buffer
	LPSWR	R0			:exit
K.SAVE	HS	2
PATM	SC	/*69-INT*/
KNEXT	HS	0
:
:	................end of patch files...................................
:
   