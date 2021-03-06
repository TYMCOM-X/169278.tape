:----------------------------------------------------------------------------
: Patch name:  SXM505.TS2               Product and Version:  PBT 5.05
:     Author:  t. bechly                       Organization:  ntd
:   Customer:  HONG KONG BANK (HKBGNET)        Date Written:  6/22/92
:
: !!!WARNING - PATCH WILL NOT WORK FOR TRANSPARENT DATA (i.e., will not send
: dle syn correctly)!!!
:
: Description of Problem:
:    DURING POLLING WITH A VAX HOST IF THE INTERFACE SENDS OUT ANY FFFF
:    CHARACTERS BEFORE THE ACK IS SENT, THE VAX WILL LOG OUT AND THE LINK
:    WILL BE DROPPED. (NOTE: AN IBM HOST IS NOT EFFECTED AS IT DISREGARDS
:    THE FFFF CHARACTERS).
:
: Problem Solution:  [ This is modified version of patch (HSBCCODES)SXM.PAT ]
:    This patch changes the PAD character to syn's on a single buffer
:    transmit, until the message has been loaded into the rotor list. Then
:    it is changed back to FFFF.  The rotor list ends up having 8 elements
:   (all of the reserved storage).  The patch fixes the problem of 
:    having FFFF appear between syn's and the EOT.  The FFFF appears because 
:    there is a delay and the PAD character is sent out to take up time.
:
:    Modified SXM505.TST to change idle char to syns prior to sending out first
:    syn chars. Changed for polls, data messages, and one and two byte
:    protocol messages.
:-----------------------------------------------------------------------------

	LO BSCCHR
	LO CMDLST
	LO BSCRRC
	LO BSCEXC
	LO BSCCRC
	LO BSCRCV
	LO BSCSRV
	LO BSCSXM
	LO BBUFER
	LO BSCPTP
	LO BSCDTR
	LO FRNTND
	LO STATUS

PATCH(062392,1500,bechlyt,BSXWRT,,6)
	J	PA1PTR,,
CONPATCH(PA1PTR,,22)
	L	RAD,XLISTX,RL2,RL2		:GET BUFFER ADR OF DATA
	LI	RCMD,CSPAD^10+RSYN^8+RSYN	:START LIST WITH SYN IDLE CHAR
	LIS	RDAT,0				:ZERO ADDRESS FIELD
	STM	RCMD,0,RAD			:STORE CMD INTO ROTOR
	LM	RCMD,SYNMOP,,			:THEN SENT SYN CHARS
	STM	RCMD,8,RAD			:STORE INTO CMD ROTOR
	J	BSXWRT+0E,,			:RETURN TO MAIN CODE

CONPATCH(BSXW05+1C,,4)
	STM	RCMD,10,RAD			:STORE CMD INTO ROTOR - BUF ADD

CONPATCH(BSXW10+6,,4)
	STM	RCMD,10,RAD			:STORE CMD INTO ROTOR - PROT BYTE

ENDPATCH(END PART 1 OF PATCH)

PATCH(062392,1500,bechlyt,BSXW13,,6)
	J	PA1PTR,,

CONPATCH(PA1PTR,,54)
	LI	RCMD,CSPAD^10+0FFFF		:RESET PAD CHAR TO FFFF 
	LIS	RDAT,0				:ADRS FIELD = 0
	STM	RCMD,18,RAD			:STORE CMD INTO ROTOR
	TBT	RL,RTSCTS,,			:FULL OR HALF DUPLEX
	JN	PSXW14,,			
	LM	RCMD,PAD2MOP,,			:FULL DUPLEX - 2 PADS
	STM	RCMD,20,RAD			:STORE CMD INTO ROTOR
	J	PSXW15

PSXW14  LM	RCMD,PAD6MOP,,			:HALF DUPLEX
	STM	RCMD,20,RAD			:6 PADS
	AIS	RAD,8				:ADVANCE LIST POINTER
	LIS	RCMD,CRTSOF			:PUT 'TURN RTS OFF' ON LIST
	STH	RCMD,20,RAD			

PSXW15
	LIS	RCMD,CSBT			:GET SET BIT COMMAND
	EXHR	RCMD,RCMD			:POSITION
	OR	RCMD,RL				:INCLUDE BISYNC LINE NUMBER
	LA	RDAT,BSXOCP,,			:GET ADR BIT ARRAY
	STM	RCMD,28,RAD			:STORE CMD INTO ROTOR
	LIS	RCMD,CHALT			:END LIST w/ HALT CMD
	STH	RCMD,30,RAD			:STORE CMD INTO ROTOR
	J	BSXW15+16,,			:RETURN TO SOURCE CODE

CONPATCH(BSXW32+4,,4)
	J	BSXW34+4				:SKIP OVER XPARENT

ENDPATCH(Temporarily Change Pad Character To SYN SYN)

	FO BSCCHR
	FO CMDLST
	FO BSCRRC
	FO BSCEXC
	FO BSCCRC
	FO BSCRCV
	FO BSCSRV
	FO BSCSXM
	FO BBUFER
	FO BSCPTP
	FO BSCDTR
	FO FRNTND
	FO STATUS
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          