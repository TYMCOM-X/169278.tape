:******************************************************************************
:(NSCNET:37)ANRTSU.701
:******************************************************************************
:
:       1. This patch apply to BBXS version 7.01.
:
:       2. This patch designed for ANRTSU BBXS VM sequence. BBXS version 5.02
:          handling with skip retrun when line is empty from the Async Host.
:          So, this patch support BBXS version 5.02 sequence with skip return
:          when line is empty from Async Host.
:
:       3. Net message of version 7.01 is diffrent from version 6.01 .
:          So fix this problem by this patch.
:
:*******************************************************************************

        LO      IR100
        LO      FCB
        LO      IDS
        LO      LINE
        LO      HSEC




PATCH(900815,1525,NIS.KANETA,PA0PTR,,29)

SIGOK1  SC      /CALL COMPLETED/
LNKDN3  SC      /LINK CLEARED/
LNKDN4  SC      /CALL CLEARED/

CONPATCH(SIG0A2-22,,6)
        LA      R1,SIGOK1,,             :SET SIGOK1 ADDRESS

CONPATCH(DROPE,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,12)
        LA      R1,LNKDN3,,             :SET LNKDN3 ADDRESS
        LHL     R0,L.PORT,RLL,          :FROM SOURCE
        J       DROPE+8,,               :RETURN TO SOURCE

CONPATCH(DROPE+8,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,12)
        JE      DROPF,,                 :FROM SOURCE
        LA      R1,LNKDN4,,             :SET LNKDN4 ADDRESS
        J       DROPF,,                 :RETURN TO SOURCE


CONPATCH(IRPUT+10,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,0C0)
	JN	IRPUTD,,                :..THEN SKIP
	LIS	R0,EORSW		:IF END OF RECORD NOT PENDING
	RBT	R0,F.IRFL,RAFCB,,       :..
	JE	IRPUTA			:..THEN SKIP
	LHL	R4,F.AII,RAFCB,,	:IF 3780
	LB	R0,F.DIAL,R4,,          :..
	LO	EBCCHR			:..
	LHI	RDATA,IRS		:..
	FO	EBCCHR			:..
	CHI	R0,E3780		:..
	JEFS	IRPUT7			:..THEN USE IRS
	LHI	RDATA,ASCRS		:..
	CHI	R0,A3780		:..
	JNFS	IRPUT9			:..THEN USE RS
IRPUT7	LHI	RCL,ID.SDF		:..
	PUTR				:..
	J	IRPUTD,,                :..
IRPUT9	LI	RCL,ID.ITB		:..ELSE DRIVE ITB
	PUTR				:       ..
	J	IRPUTC			:       ..
IRPUTA	HS	0
	LIS	R0,EOBSW		:IF END OF BLOCK NOT PENDING
	RBT	R0,F.IRFL,RAFCB,,       :..
	JE	IRPUTB			:..THEN SKIP
	LIS	RCL,ID.ETB		:..ELSE DRIVE ETB
	PUTR				:       ..
	J	IRSXPR			:       BYPASS TRANSPARENCY INIT
IRPUTB	HS	0
	LHL	R1,F.AII,RAFCB,,	:SET TRANSPARENCY FLAG
	LHL	R0,F.BIT,R1,,           :..
	TBT	R0,VTRFLG,,,            :..
	JEFS	IRSXPR			:..
	LIS	R0,XPRSW		:..
	SBT	R0,F.IRFL,RAFCB,,       :..
IRSXPR	HS	0			:..
	LIS	RCL,ID.BB		:BEGIN A NEW BLOCK
	PUTR				:..
	LHL	R0,F.BIT,RAFCB,,	:SET TRANSMISSION TIMER
	SBT	R0,TFLAG,,              :..
	JN	IRPUTC			:..
	LA	R0,IRTMO,,		:..
	ST	R0,F.ATMO,RAFCB,,       :..
	LB	R0,F.RTO,RAFCB,,	:..
	SLHLS	R0,1			:..
	STH	R0,F.TMO,RAFCB,,        :..
IRPUTC	HS	0
	LIS	R0,XPRSW		:IF NON-TRANSPARENT
	TBT	R0,F.IRFL,RAFCB,,       :..
	JEFS	IRNXPR			:..THEN SKIP
	LIS	RCL,ID.TR		:..ELSE SET TRANSPARENCY
	PUTR				:       ..
IRNXPR	HS	0			:
	LIS	RCL,ID.BT		:BEGIN TEXT
	PUTR				:..
        J       IRPUTD,,

CONPATCH(IR3ER1+0A,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,34)
	L	RLINK,F.RET1,RAFCB,,	:RESTORE RETURN
	LH	R0,F.NCHR,RAFCB,,	:IF NO RECORD IN PROGRESS
	JER	RLINK			:..THEN RETURN
	LIS	R0,PADSW		:IF NO PADDING REQUIRED
	TBT	R0,F.IRFL,RAFCB,,	:..
        JE      EOR01D,,                :..THEN SKIP
	ST	RLINK,F.RET1,RAFCB,,	:..ELSE SAVE RETURN
	JAL	R4,IRPAD,,		:       PROVIDE PADDING
	L	RLINK,F.RET1,RAFCB,,	:       RESTORE RETURN
        J       EOR01D,,                : RETUN TO SOURCE



ENDPATCH(Support skip return when line is empty for ANRTSU VM)

        FO      IR100
        FO      FCB
        FO      IDS
        FO      LINE
        FO      HSEC
    