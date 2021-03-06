: **********************************************************************
: *                                                                    *
: *  File     : ISCS50.PAT                                             *
: *  Customer : FIRN                                                   *
: *  Comments : Original file - ISCS06.PAT                             *
: *           : Use in all FIRN ISCS 6.03 code                         *
: *                                                                    *
: **********************************************************************

:	Patch to disable request for extended logon status by AVID
:
:
	LO	CONSAT
PATCH(871017,0045,JREILLY,AVID+0A0,,6)
	J	PA1PTR,,
CONPATCH(PA1PTR,,10)
	LHI	R5,SPECFE
	JAL	RLINK,BASE,RLINK,
	J	VRET,,
ENDPATCH(ISCS50.PAT - Patch to disable request for Extended Logon Status)
	FO	CONSAT

:************************************************************************
 