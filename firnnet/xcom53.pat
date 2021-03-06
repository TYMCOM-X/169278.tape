: **********************************************************************
: *                                                                    *
: *  File     : XCOM53.PAT                                             *
: *  Customer : FIRN                                                   *
: *  Comments : Original file - XONOF.301                              *
: *           : Use in all FIRN XCOM 3.01 code                         *
: *                                                                    *
: **********************************************************************
:
: ESCALATION 60997
: REPORTED BY FIRNNET
:
:
: PROBLEM: GCI CRASH 03
:          TDA ROUTINE RECEIVES A DATA PACKET WITH ONLY ONE BYTE
:          OF DATA '11' WHICH IS XON. THE IDBUF CONTAINS A BUFFERLET
:          OF '00' ONLY FOR THIS DATA PACKET. THE BFRITO ROUTINE
:          CRASHES THE SLOT WHENEVER  IT WANTS TO BUILD A ORING MESSAGE
:          FOR THIS DATA PACKET.
:
: PROBLEM FIX: BUG IS AT BELODR. BUT THIS ROUTINE IS CALLED BY
:          MANY PLACES. WE WANT TO KEEP THE SHARED ROUTINE AS SIMPLE
:          AS POSSIBLE. SO, WE FIX THE PROBLEM AT THE ROUTINE BFRITO.
:
:          THIS IS A BUG FIX. NTD SHOULD EITHER ACCEPT THIS PATCH OR
:          INVESTIGATE A PATCH AT THE ROUTINE 'BELODR' OR AT TDA .
:
PATCH(861204,1600,JWANG,BFR032+2E,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,1A)
        STB     R0,INBCT,R4,
        LR      R0,R0
        JN      BFR032+34,,
        RBT     R4,INPROG,,
        J       BFR030,,        :DO NOT TRY TO READ EMPTY BUFFER
ENDPATCH(XCOM53.PAT - FIX XON DATA PACKET CRASH AT BFRITO ROUTINE)
   