        LO      DSP
PATCH(900326,1700,NIS.KOBAYASHI,WSFER6,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,016)
        LIS     R3,WSFBIT
        RBT     R3,CBITS,R11
        CHI     R0,40                   :3270 OUTBUAND DATA?
        JE      SF.RDP+48,,
        J       WSFER6+6,,
ENDPATCH(WSF COMMAND)
        FO      DSP
 