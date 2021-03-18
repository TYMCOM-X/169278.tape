:****************************************************************
: PATCHNAME: MSGB4.TST                PRODUCT VERSION: SDLC 2.04
:   AUTHOR : JAMES WANG                  DATE WRITTEN: JULY 18, 1991
:  CUSTOMER:
: DESCRIPTION OF PROBLEM:
:       ISIS MESSAGE B4A0 RECEIVED DURING LOGON MODE.
:       MSGB4 CALLED MASGB5 AND THEN LGFAIL ROUTINE. IN THE ROUTINE LGFAIL,
:       CIRCUIT STATES '4,5,6' ARE COMPARED. SINCE CURRENT CIRCUIT STATE '01'
:       DID NOT FALL INTO THAT RANGE, SLOT CRASHED AT LGFAIL+56.
:       THIS PATCH ADD CIRCUIT STATE '01' INTO THE RRANGE.
:****************************************************************************

PATCH(910718,1600,JWANG,LGFAIL+48,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,1A)
        CLHI    R0,CONTLG
        JE      LGFAI1,,
        CLHI    R0,COCLRD
        JE      LGFAI1,,
        J       LGFAIL+4E,,
ENDPATCH(INCLUDE COMPARSION WITH CIRCUIT STATE 01 INSIDE LGFAIL)
