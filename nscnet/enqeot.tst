:==============================================================================
: Product	BBXS v07.01 (for Diamond Computer Service only)
: Patch Name	ENQEOT.TST
: Author	Toshi Aoki (NIS.AOKI)
: Date		12-FEB-1991
: Description	ZENGINKYO protocol specifies that EOT sent from host
:		after BBXS sent ENQ as bidding must be ignored.
:		Current BBXS may zap the circuit when this situation occured,
:		so I modified SBID state table to satisfy above specification.
:==============================================================================

	LO	BSCPTP
PATCH(120291,1430,NIS.AOKI,SBID+6,,2)
	HC	RCVRTY-PSEG
ENDPATCH(modified SBID state table to retry rcv op when received EOT from host)
	FO	BSCPTP

   