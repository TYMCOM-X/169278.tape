        LO BSCDEF
        LO BSCPTP
        LO MAIN
        LO FCB
        LO R100
        LO IR100
PATCH(891218,1730,WARNERD,PA0PTR,,4)
ACCMSG  HS      1

CONPATCH(IRABRT,,6)
        J       PA1PTR,,

CONPATCH(PA1PTR,,26)

        CLHI    R0,RCDATB       : SEE IF THIS IS EOT IN SRCV STATE
        JE      IRABRT+6,,      : IF SO, DON'T SET COUNTER, SHIP OUT
                                : (LEAVES OUT INSTRUCT THAT RESET COUNTER)
        ROPQND(FFFORW)          : NEW CONTROL MESSAGE 091D FOR EOT RECEIVED
        J       IRABRT+6,,      :AFTER GIVING UP WHEN NO ACK IS RECEIVED FOR
                                :DATA PREVIOUSLY TRANSMITTED
ENDPATCH(send 091d instead of 0911)
    