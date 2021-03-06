:-------------------------------------------------------------------------
: Patch name:	nowsf.tst		Product and Version:	CTMK 6.01
:     Author:	Richard Ho		       Organization:	STS
:   Customer:	NIS			       Date Written:	05-01-90
:    Ticket#:	296647   			       NSR#: 
:-------------------------------------------------------------------------
:
: Problem: CMTK crashes upon receiving of the Erase/Reset Structured Field
:	   from the host.
:	
: Solution: The Erase/Reset Structured Field is not supported by CMTK.
:           When receiving this command, CMTK should send the error
:	    message of "Unsupported Command" to the end-user and then
:	    clear the circuit.
:	
	LO	DSP
PATCH(900502,1200,R/HO,DSPCMD,,6)
	J	PA1PTR,,
CONPATCH(PA1PTR,,20)
	LIS	R3,0		:From source.
	ST	R3,DETBBR,R12,
	JALR	R1,R1
	CHI	R0,0F3		:Did we get an F3 command?
	JN	DSPCMD+8,,	:No back to source.
	LA	R3,LEM15D,,	:Yes - unsupported command.
	J	CLRREJ,,	:Send error message to end-user then
				:clear the circuit.
ENDPATCH(FIX PROBLEM WITH CMTK CRASHES WHEN RECEIVING WSF ERASE/RESET)
	FO	DSP
 