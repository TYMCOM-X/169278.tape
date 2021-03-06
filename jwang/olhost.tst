:***************************************************************************
: PATCHNAME: OLHOST.TST                           SDLC 2.04
:    AUTHOR: JAMES WANG                           STS
:   CUSTOMER: KAL
:    DATE  : MAY 3, 1990
: TASK: IF OUTGOING I/F DOES NOT DEFINE HOST NUMBER, I/F WILL CRASH
:       IMMEDIATELY AFTER LOADING THE SLOT.
:***************************************************************************

PATCH(900503,1000,JWANG,OLWUP+66,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,12)
        LH      R1,CFGTAB+LNHST,R12,
        JL      OLWUP+78,,
        J       OLWUP+6C,,
CONPATCH(OLCKT+4A,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,12)
        LH      R1,CFGTAB+LNHST,R12,
        JL      OLCKT+5C,,
        J       OLCKT+50,,
ENDPATCH(IF HOST NOT DEFINED FOR OUTGOING I/F, SLOT WILL CRASH)


   