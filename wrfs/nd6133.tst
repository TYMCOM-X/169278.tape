:*****************************************************************************
:
:    DATE: JAN 4, 1989
: COMPANY: Frank Russell
:    NODE:    6133
:  KERNeL:    1842
:    SLOT:    02
:    HOST:    8470(SWITCHED WITH TIF HOST)
:    VERSION: 2.04
:
:
print

begintym
:
freeze(yes)			: Halt slot on crash
ptchsz(200,200,400)		: Size of Patch areas ph, p0 and p1
:
:	System Parameters
:
system(tymnt2)
timezone(0)
isisring(4092,4092)
bufsize(500)
msiotp(m.typ1)
odnic(3106)
:
:	Monitor
:
 monitor(756)
 mports(3)
 mgoodguy(ISISTECH,0)
 mgoodguy(SOM,0)
 mgoodguy(xray,0)


:
:	SDLC Link
:
group(0)
	secondary	: Secondary link group (HIF)
	host(8470) 		: Host = 8470
	speed(9600)		: Line speed = 9600 bps
	datamode(half)		: Data mode = half duplex
	vtam(yes)		: VTAM on host side
         WINDOWSIZE(7)
         XMTFRMQA(7)
         RCVFRMQA(7)
         RCVSIOFR(7)
        REPLYTO(60)
        NETREPLYTO(100)
	switched(no)
        framesize(2000)
	rtscts(no)		: RST/CTS signalling not required
 	pvcline			: Outgoing PVC
	dsiotp(d.typ1)
:
:  Line options
:
	line(0)
		pu(0)
			addr(01)
 			pvc.dlink(0)		: Link 0 on X.25 HIF
 			pvc.dchan(1)		: Channel 1 on X.25 HIF
                        loption(0,tpd.,0)
                        loption(0,tir.,5)
                         option(cdopt0,1)

option(v40ncp,1)
    DHOST(11671)
:		lgn.user(x2511671)
:		lgn.password()
:
endtym
   