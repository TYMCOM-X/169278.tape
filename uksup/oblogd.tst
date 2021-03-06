:---------------------------------------------------------------------
: Patch name:  OBLOGC	                Product and Version:  CMH 1.07
:     Author:  Julia Riddington             Organization:  UKNS
:   Customer:  UKNET                        Date Written:  18/04/89
: Description :
:  MBASE presents CMH with host text data before CMH to SNA IIX dialog is
:  complete on circuit build/set-up. The text data is forwarded to SNA by CMH
:  without any kind of processing, upon which the SNA HIF appears to throw it
:  away as unknown data and the end user never appears to be connected.
: Solution:
:  Backpressure MBASE until CMH-SNA IIX dialog complete. This cannot be done
:  by ISIS SND/NOS as MBASE processes these too late to stop the text data
:  being sent to the CMH. MBASE, when a circuit is established, issues a YB
:  to act as a synchronisation mechanism, if CMH does not reply with the OB
:  until the IIX dialog with SNA has completed then circuits will be made
:  correctly.
:-------------------------------------------------------------------------  
	LO	GIIX
	LO	FRNTND
PATCH(890418,1100,J/RIDDINGTON,DDHSTT+42,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,46)
	STH	R0,DCBLKS+DCBOUT,RDCB,   : RDCB = T-port DCB
	LHL	R4,DCBLKS+DCBADB,RDCB,	: Pick up H-port DCB
	LHL	R0,DCBLKS+DCBIPR,R4,	: Pick up H-port RPORT
	RBT	R0,OBFLAG		: Reset OB oustanding flag
	JE	FSHNTM,,		:
	ST	R1,SAVER1
	ST	R2,SAVER2
	LR	R1,R0			: Set up RPORT
	LIS	R0,3			: Flag was set, send OB on H-port
	LHI	R2,OBMSG
	JAL	R5,OB+6,,
	L	R1,SAVER1
	L	R2,SAVER2
	J	FSHNTM,,


CONPATCH(OB,,6)
	J	PA1PTR,,
CONPATCH(PA1PTR,,44)
	CHI	R2,YBMSG		: Is it a YB ?
	JN	OBSEND			: BR if not
	LHL	R4,DCBLKS+DCBTCB,RDCB,	: Did it come from H-port ?
	CR	R4,RDCB			:
	JE	OBSEND			: BR if not
	LB	R0,DCBLKS+DCBSTA,R4,	: YB from H-port, get T-port status
	CLHI	R0,L.DSP		: Has IIX dialog completed
	JE	OBSEND			: BR if yes
	SBT	RPORT,OBFLAG		: Set OB outstanding flag
	JR	R5			: Return without sending
OBSEND	LIS	R0,3			: Contine to send Ball
	LHI	R2,1,R2
	J	OB+6,,


CONPATCH(PA0PTR,,14)
OBFLAG	HS	NGRP		: OB outstanding flag
SAVER1	WS	1		: Reg save area
SAVER2	WS	1
ENDPATCH(Implement some YB/OB logic for flow control)   
	FO	FRNTND
	FO	GIIX
 