        LO      BSCPTP
        LO      BSCDEF

PATCH(900220,1800,WARNERD,PA0PTR,,0C)
STTBL   HS      1
RTINDX  HS      1
DATTBL  HS      1
DATIND  HS      1
BTTBL   HS      1
BATIND  HS      1

CONPATCH(RDATB2,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,1A)
        STH     R4,STTBL,,
        STH     R2,RTINDX,,
NKERR   JAL     R5,MXSTER,,
        LIS     R1,XCNAK
        J       RDATB2+6,,

CONPATCH(RDATB,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,1E)
        STH     R4,DATTBL,,
        STH     R2,DATIND,,
        JAL     R2,CKDATA,,
        J       RDATB1,,
        J       RDATB+8,,

CONPATCH(RDATB1,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,24)
        LHL     R5,DATTBL,,
        STH     R5,BTTBL,,
        LHL     R5,DATIND,,
        STH     R5,BATIND,,
        JAL     R5,PBBC,,
        J       RDATB1+6,,
ENDPATCH(SAVE AREA PRIOR TO EXCEEDING ERROR COUNTER)
 