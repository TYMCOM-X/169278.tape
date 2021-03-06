:--------------------------------------------------------------------------
: Patch name:  CCMCOD.TST                   Product and Version:  PBT13.01/9.03
:     Author:  PEGGY JING		    Organization:  STS
:   Customer:  AUTOSTRADE                   Date Written:  8/23/89
: Description of Problem:  
:    With trap BUFBIT.TST, the slot crashed when user received data message
:    with final block being status C4C4(data check) and requested for NSS
:    by two PF keys.  At the first time PBT processed the status message in
:    RCVS40, it freed the buffer.  Then in RDP400, PBT processed the status
:    message as data and tried to free the buffer again.
:    In this patch, PBT checks the first two bytes in the data/status message,
:    if it is a negative number (it's command code), skip putting the buffer
:    back, otherwise, throw message away, free the buffer, do READ BUFFER
:    and send NSS screen.    
:--------------------------------------------------------------------------
	LO	BSCRCV
PATCH(890823,1500,P/JING,RDP400,,6)
	J	PA1PTR,,
CONPATCH(PA1PTR,,18)
	LR	R2,R2		:IS THIS COMMAND CODE?
	JL	RDP400+6,,	:YES, SKIP PBBC
	JAL	R5,PBBC,,	:NO, THROW MESSAGE AWAY & GET RID OF BIG BUFFER
	J	RDP400+6,,	:SEND READ BUFFER & NSS SCREEN
CONPATCH(RDP805,,6)
	J	PA1PTR,,
CONPATCH(PA1PTR,,18)
	LR	R2,R2		:IS THIS COMMAND CODE?
	JL	RDP805+6,,	:YES, SKIP PBBC
	JAL	R5,PBBC,,	:NO, THROW MESSAGE AWAY & GET RID OF BIG BUFFER
	J	RDP805+6,,	:RELEASE COMMAND LINKS & FLUSH SAVE Q CONTENTS
ENDPATCH(DON'T RETURN BIG BUFFER OF STATUS MESSAGE WHEN USER TRY TO GET NSS)
	FO	BSCRCV

  