:************************************************************
: Patchname: cmdnx2.tst                   product version 2.04
:   Author : James Wang                     organization: STS
:  Customer: NIS                            Date written: Dec 5,1990
: description of problem:
:   SCBIC becomes negative in decic routine and the crashes slot.
:   this patch will reset scbic to zero in cmdnxt routine. original
:   code will decrement scbic by onse each time this routine is
:   executed when mpomsk is not set.
:***********************************************************************

PATCH(901205,1000,JWANG,RELBB1-10,,4)
        NOP     0,0,0
ENDPATCH(ALWAYS RESET SCBIC TO ZERO IN CMDNXT)
   