:
: Patch to force high order bit of username terminator to 0
: when forwarded by the GUNAM sub-host option
:
	IF	OP|E8BTM.|
	IF	OP|GUNAM.|
	PATCH(871124,1330,LEEWAKE,PUN010,,4)

	J	PA1PTR,,
CONPATCH(PA1PTR,,24)
	GL	HERE

PUN010	LHI	R3,8D
	JAL	R4,GETCH,,
	CR	R0,R3
	JNFS	HERE
	LHI	R0,0D
HERE	JAL	R5,PPCDR,,
	SIS	R11,1
	JGBS	PUN010
	J	SUN020,,

	ENDPATCH(ONLY FOR C/R - CONVERT MARK TO SPACE WHEN GUNAM USED)

	EI
	EI	OP|E8BTM.|
 