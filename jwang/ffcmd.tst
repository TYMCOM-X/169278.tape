
:*******************************************************************
: Patchname: FF93.202 (FF93.tst)             Product verion: QLLC 2.02
:    Author: James Wang                        Organization: STS
:  CUstomer: Morino                            Date written: June 8, 1989
: Description of the problem:
:   QLLC (secondary) H/F connected to NPSI. X.25 T/F is connected to CU.
:   NPSI sends commands with address other than '0FF'. CU expects to see
:   the address 'FF' and clears the circuit with diag 52 if address is not
:   'FF'. This patch will do the address convertion to 'FF' if this is
:   a QLLC line in a secondary port/interface.
:
:   LOPTION(line#,QLLC,yes/no) should be gened for that line. The default
:   will set QLLCk to no.(where k is the line number)
:
:   (do not confuse with OPTION(QLLC,yes/no) ).
:*************************************************************************
        LO OUTPUT
        LO GBLDEF
        LO FRNTND
        LO CMDLST
        LO CTLDEF

PA0PTR  EQ      ((PA0PTR+3)/4)*4
PATCH(890608,1400,JWANG,PA0PTR,,NLINES+40)
CONSAV  WS      10
QLCLNK  BS
Q       EQ      0
        RE      NLINES
  IF  \QLLC|Q|
        BC      QLLC|Q|
  ELSE
        BC      0
  EI
Q       EQ      Q+1
        ER
CONPATCH(OUTDX1,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,4A)
        STM     R0,CONSAV,,
        LB      R8,DCBLKS+DCBLNM,RDCB,  :GET LINE NUMBER
        CLHI    R8,0FF
        JE      OUTDX5
        LHL     R11,LCBPTR,R8,R8        :GET LCB
        LB      R0,LCBTAB+LLPORS,R11,           : SECONDARY PORT?
        JN      OUTDX5                          :NOT, DO NOTHING
        LB      R0,QLCLNK,R8,                   :GET LINE CONFIGURATION
        JE      OUTDX5                          :NOT QLLC LINE, DO NOTHING
        LHI     R0,0FF                          :ADDRESS OF '0FF'
        STB     R0,CMDBLK+CLADD,R9,             :CHANGE THE ADDRESS TO FF
OUTDX5  LM      R0,CONSAV,,
        LHL     R11,CMDTBL,R7,R7                :GET ENTRY OF CMDTBL
        J       OUTDX1+6,,                      :RETURN
ENDPATCH(CONVERT ADDRESS TO FF FOR ALL COMMAND FROM NPSI TO QLLC H/F)
        FO GBLDEF
        FO FRNTND
        FO CMDLST
        FO CTLDEF
        FO OUTPUT
  