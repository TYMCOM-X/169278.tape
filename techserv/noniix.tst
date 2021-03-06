:---------------------------------------------------------------------
: Patch name:  NONIIX                Product and Version:  SDLC 2.04
:     Author:  PHIL SNEDDON                 Organization:  PITS
:   Customer:  DAY SHIFT                    Date Written:  May 9, 1991
: Description of Problem:  If a user logs into the line host number from
: an IIX capable consat the slot will crash with an ill. mem. ref.
: This patch will check the IQ in the needle and zap the user right away.
:
:---------------------------------------------------------------------

PATCH(910509,1604,Stig,ACT2,,6)
        J     ACT222,,
CONPATCH(PA1PTR,,1A)
ACT222  CLH   R11,HOSTAB+HSTUSR,R6,   :see if IQ matches
        JE    ACT2+6,,                :yes, continue normally
        AR    R14,RLEN                :flush ring
        LA    R3,ucpmsg,,             :get "uncompatible host" message
        J     ACT1+6,,
ENDPATCH(zap user from IIX capable consat)
 