:
:*******************************************************************************

        LO      IR100
        LO      FCB
        LO      IDS
        LO      LINE

PATCH(900730,1410,NIS.KANETA,IRPUT+10,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,150)
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


ENDPATCH(Fix IRS problem in virtual mode)

        FO      IR100
        FO      FCB
        FO      IDS
        FO      LINE
    