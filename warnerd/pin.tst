        LO BSCPTP
        LO MAIN
        LO FCB
        LO BSCDEF
        LO IR100
        LO R100

PATCH(892019,1730,WARNERD,IXNOBR,,6)
        J       PA1PTR,,

CONPATCH(PA1PTR,,20)

        LHI     R0,PINMSG
        LB      R5,F.LINE,RAFCB,
        LIS     R0,0
        STB     R0,RETRY,RL,
        J       IXNOBR+6,,


ENDPATCH(SEND PSEUDO INTERRUPT DURING SBID STATE)
 