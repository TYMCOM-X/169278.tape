: **********************************************************************
: *                                                                    *
: *  File     : ISCS51.PAT                                             *
: *  Customer : FIRN                                                   *
: *  Comments : Patch to disable IIX bit in PSN messages               *
: *           : Use in all FIRN ISCS 6.03 code                         *
: *                                                                    *
: **********************************************************************

  IF    OUTDIAL
NOIIX   EQ      1
  EI
  IF    1-\NOIIX
NOIIX   EQ      0
  EI
  IF    NOIIX
	LO	ISIS
PATCH(871108,1230,JWADE,ESTPT4,,0A)
	NHI	R0,7FFF
	JAL	R4,PUTH
	JFS	ESTPT4+0E
ENDPATCH(ISCS51.PAT - Patch to disable IIX bit in ISIS PSN messages)
	FO	ISIS
  EI
    