        LO      BSCPTP

PATCH(900202,1115,WARNERD,IRBPER,,6)
        J       PA1PTR,,

CONPATCH(PA1PTR,,24)

        LHI     R0,RBDCNT               : RESET BID CONTENTION COUNTER
        STH     R0,ENQCNT,R9,
        ROPQND(FFPER)                   : RESTORE OLD INSTRUCT
        J       IRBPER+0a,,             : GO BACK
ENDPATCH(RESET BID CONTENTION COUNTER)
 