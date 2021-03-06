:***********************************************************************
: Patchname: AXQXID.TST                      Product version: SNA 5.04
:    AUthor: JAmes Wang                         Organization: STS
:   Customer: Air France                        DAte written: May 17, 1990
: Descroiption of the problem:
:             When GQXID is genned and PU.QXID is not genned, the TIF does
:             not respond QXID correctly from QXID.
:
:****************************************************************************

PATCH(900517,1000,JWANG,AXQXID+1A,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,1E)
        LHL     R4,QXIDPT,R1,R1         :GET POINTER TO QXID
        LA      R1,QXIDPT-QXIDTB
        CR      R4,R1                   :USE GQXID ENTRY?
        JLE     AXQXID+20,,             :NO, USE PUQXID
        LA      R4,DEFQXI-QXIDTB,,      :PREPARE THE CORRECT OFFSET TO QXIDTB
        J       AXQXID+20,,
CONPATCH(AXQXI0,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,1E)
        LIS     R7,0
AXQXI5  AIS     R4,1
        LB      R0,QXIDTB,R4,
        STB     R0,QXIDMS,R7,
        AIS     R7,1
        SIS     R1,1                    :END OF QXID?
        JN      AXQXI5
        J       AXQXI0+16,,
ENDPATCH(USE GQXID IF PU.QXID IS NOT DEFINED)
  