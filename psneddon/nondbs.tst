:---------------------------------------------------------------------
: Patch name:  NONDBS                Product and Version:  CMH 1.07
:     Author:  PHIL SNEDDON                 Organization:  QSATS/STS
:   Customer:  UKNET                        Date Written:  02/10/89
: Description of Problem:  CMH TREATS BACKSPACE FROM HOST AS DESTRUCTIVE.
: THIS PATCH WILL MOVE THE CURSOR BACK AND THAT'S ALL.  ESC #221013
:---------------------------------------------------------------------

         LO ASIU
PATCH(890210,1056,P/SNEDDON,CTLTAB+10,,2)
         HC CTLC15-PSEG               :TREAT BACKSPACE AS "CURSOR BACK"
ENDPATCH(Treat backspace from host as non-destructive)
         FO ASIU
    