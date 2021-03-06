:***********************************************************************
: Patchname: ID94M.TST                  Production version: SDLC 2.04
:    Author: James Wang                    Organization   : STS
:   Customer: NIS                            Date written : May 22, 1990
: Problem: Before destination line is selected, IIX msg 'DM' received and
:          then crashed. Need to flush this illegal msg.
:**************************************************************************

PATCH(900522,1000,JWANG,ID94M,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,18)
        LB      R0,DCBLKS+DCBLNM,RDCB,
        JL      FLSHRC,,
        LB      R0,DCBLKS+DCBIMD,RDCB,
        J       ID94M+6,,
ENDPATCH(FLUSH IIX MSG DM BEFORE DEST LINE IS SELECTED)
 