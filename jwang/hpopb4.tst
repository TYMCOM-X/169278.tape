:**********************************************************************
: Patchname: HPOPB4.TST                        (SDLC 2.40)
:  Author  : James Wang     (STS)
:  Customer: NIS            (Jan 25, 1990)
: problem:  when RNR xmt timeout occurs, HPOPB4 routine uses wrong register
:           as a offset to set flag LCRNRX on and causes a slot crash with
:           14.
:**************************************************************************

  IF  (\(PHDPTS))!(\(PHDMPS))
PATCH(900225,1000,JWANG,HPOPB4+10,,6)
	SBT	R3,LCBTAB+LCRNRX,RLCB,
ENDPATCH(USE CORRECT REGISTER TO SET FLAG LCRNRX ON WHEN RNR XMT TIMEOUT)
  EI



   