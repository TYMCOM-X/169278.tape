:******************************************************************
: PATCHNAME:  RNR.TST                      PRODUCTION VERSION : 2.04
:   AUTHOR : JAMES WANG                      ORGANIZATION: STS
:  CUSTOMER:                                  DATE WRITTEN: DEC 13,1990
: DESCRIPTION OF PROBLEM:
:   HIP SENDS RNR WHILE THE SRPRCV EQUALAS TO SGPRCV. RESTORE THE SCBRQA
:    WITH GENNED RQA VALUE.
:*************************************************************************

PATCH(901213,1400,JWANG,HSOPA1+0C,,8)
        J       PA1PTR,,
        NOPR    0,0
CONPATCH(PA1PTR,,3E)
        LHL     R1,SCBLKS+SGPRCV,RSCB,
        LHL     R5,SCBLKS+SRPRCV,RSCB,
        CR      R1,R5
        JN      HSRNR,,
        LHL     R5,CFGPTR,RL2,
        LHL     R1,CFGTAB+LNRBQA,R5,
        STH     R1,SCBLKS+SCBRQA,RSCB,
        LIS     R1,1
        AHM     R1,RBQA,,
        J       HSOPA2,,
HSRNR   LHI     R1,XRNR
        J       HSOPA3,,
CONPATCH(PA0PTR,,2)
RBQA    HC      0
ENDPATCH(RESTORE SCBRQA INSTEAD OF SENDING RNR IF SRPRCV=SGPRCB)
   