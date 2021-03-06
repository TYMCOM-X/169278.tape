:******************************************************
: Patchname: HPOPAN.TST                Product version: SDLC 2.04
:   AUthor : James Wang                 STS
: Problem:
:      WHenever there is no information frame, RR frame is xmit'd
:      very quickly by TIF. We should not call SETFPF
:      if TFP.LN is not defined in slot tymfile via 'LOPTION(line#,
:      TFP.,value).
:
: NOTE! This patch is to be added in TIF only.
: --------------------------------------------
:
:*******************************************************************

PATCH(891024,1400,JWANG,HPOPAN,,4)
        NOP     0,0,0
CONPATCH(HPOPAN+12,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,12)
        ST      R0,SCBLKS+SCBPAU,RSCB,,
        JAL     R5,SETFPF,,
        J       HPOPAQ,,
ENDPATCH(NOT CALL SETFPF IF TPF.LN IS NOT DEFINED VIA LOPTION)
  