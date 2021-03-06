:---------------------------------------------------------------------
: Patch name:  GETSIB                Product and Version:  CMH 1.07
:     Author:  PHIL SNEDDON                 Organization:  QSATS/STS
:   Customer:  UKNET                        Date Written:  07/11/89
: Description of Problem:  ESC #248819  The wrong SIB address was used for
: blocks following the 1st ETB block from the SNA.
:---------------------------------------------------------------------

PATCH(890711,0939,P/SNEDDON,S.INSV+28,,6)
         J     S.STIG,,
CONPATCH(PA1PTR,,14)
S.STIG   STB   R9,INPPTR,,            :RESTORE ORIGINAL INSTRUCTION
         LR    R10,R3                 :COPY INPUT BUFFER POINTER TO R10
         BBL   R3,SCBBLK+SCCRPT,R2,   :GET CORRECT SIB ADDRESS
         J     S.IA10,,               :RESTORE ORIGINAL INSTRUCTION
ENDPATCH(get correct SIB address for subsequent SNA ETB blocks)
   