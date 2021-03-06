:**************************************************************
: PATCHNAME: RCVSYN.TST                      VERSION 2.04
:    AUTHOR: JAMES WANG                       STS
:  CUSTOMER: NIS                             DATE: NOV 13, 1989
:     TASK : CC34.TST FIX A BUG LOCATED AT RSTART1 WHEN PROCESS
:            AN COMING FRAME WITH LENGTH OF ZERO.
:            THERE IS ANOTHER PLACE INTRODUCE THE SAME TYPE CRASH 34
:            -RCVSYN.
:
: NOTE: PLS INSTALL BOTH CC34.TST AND RCVSYN.TST TO FIX CC 34 BUG.
:*********************************************************************

PATCH(891113,1000,JWANG,RCVSYN+1A,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,22)
        LR      R4,R4
        JG      RCVSYN+20,,
        AIS     R2,2
        LHL     R3,RBUFRM,RL,RL
        CR      R2,R3
        JLEFS   RCVSY0
        LIS     R2,0
RCVSY0  STH     R2,RINDEX,RL,RL
        J       RCVSYN,,
ENDPATCH(SKIP A FRAME WITH LENGTH ZERO OR LESS THAN -1)
  