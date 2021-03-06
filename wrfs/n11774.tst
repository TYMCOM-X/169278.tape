:=============================================================================
: node 11774 kernal 11046 host 11671(host switched for testing)
:=============================================================================
: locationn - pcio harwaired in london, england
:                             REVISION HISTORY
:=============================================================================
: 05/11/87 REGEN WITH (PINGCHU) NEWDLC.P12 PATCH FILE WHICH INCLUDES FIX FOR
:          ESCALATION #32483...CAA
: 07/14/87 DECREASE FRAME SIZE TO 2500 BYTES...CAA
: 08/18/87 INCREASE FRAME SIZE TO 4000 BYTES...CAA
: 01/18/88 INCREASE RCVSIOFR FROM 3 TO 4...CAA
:=============================================================================
:
:
PRINT					:PRINT SYSGEN 


 BEGINTYM				:START THE TYMFILE 

 FREEZE(YES)				:FREEZE ON CRASH
:
:	SYSTEM PARAMETERS
:
 SYSTEM(TYMNT2)                         :TYMNET II TECHNOLOGY

 TIMEZONE(-6)				:TIMEZONE CORRECTION TO ZULU

 ISISRING(4092,4092)			:IRSIZE & ORSIZE

 BUFSIZE(200)				:BUFFER SIZE IN BYTES

 PVCTIMER(60)				:PVC CIRCUIT REBUILD TIMER IN SECONDS



 MSIOTP(M.TYP1)				:MICRO CODE VERSION E OR LATTER IS USED
:
:	MONITOR PARAMETERS
:
:	DEFINE SDLC LINK PARAMETERS
:
 GROUP(0) 				:PRIMARY LINK GROUP
	primary  			:THIS IS A PRIMARY GROUP
	host(11671)
        DHOST(8470)
	SPEED(9600)			:9600 BAUD LINES
	DATAMODE(HALFDUPLEX)		:HALF-DUPLEX DATA MODE
        SWITCHED(YES)                   :USE DTR/DSR HANDSHAKING
	RTSCTS(NO)			:NO RTS/CTS HANDSHAKING
 	REPLYTO(3)			:REPLY TIMOUT IN SECOND
	PAUSE(1)			:POLLING PAUSE
	FRAMESIZE(4000)         	:FRAME SIZE
	WINDOWSIZE(7)			:MAX. OUTSTANDING FRAMES
 	XMTFRMQA(4)			:XMT FRAME BB QUOTA
 	RCVFRMQA(4)			:RCV FRAME BB QUOTA
         RCVSIOFR(2)                     :NUMBER OF SIO RECEIVE FRAMES
         NETREPLYTO(20)


LINE(0)
		DSIOTP(D.TYP1)		:SIO CARD VERSION TYPE IS H OR LATER

	PU(0)			:1ST PU IN THIS LINE
			ADDR(01)	:POLLING ADDRESS
			MAPADDR(01)
			pvc.dchan(01)
			pvc.dlink(0)
                        LGN.USERNAME(X2511671)
                        LGN.PASSWORD()

 ENDTYM                                 :END OF TYMFILE

         option(cdopt0,1)
                                        :PRIOR TO SENDING NEXT COMMAND FRAME
PICO  EQ  1
 