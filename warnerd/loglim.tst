        LO      UTSLOG
        LO      UTSBLK
PATCH(900314,1200,WARNERD,VCTO1+6,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,40)
        IF      \STOPL|Q|
                ELSE
STOPL|Q|        EQ      0
        EI

        IF      \STOPL|Q|
        CLHI RDEV,0
        JN      RSTOR,,
        LHL     R5,LOGCNT,RDEV,RDEV
        CLHI    R5,06
        JG      LGSZ,,

        LR      RDEV,RDEV
        JL      VCTO0,,
        J       TORET,,

LGSZ    J       TORET,,

RSTOR   LR      RDEV,RDEV
        JL      VCTO0,,
        J       TORET,,

        EI

ENDPATCH(Patch to allow only one logon per username after count exceeded)
  