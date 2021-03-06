:---------------------------------------------------------------------
: Patch name:  DSCETX                Product and Version:  BBXS 7.01
:     Author:  PHIL SNEDDON                 Organization:  STS/QSATS
:   Customer:  NSCNET                       Date Written:  07/17/89
: Description of Problem:  ESC #249272
:
:---------------------------------------------------------------------

: PROBLEM - The host ends all blocks with ETX instead of ETB as it should.
:           Consequently when the circuit is zapped the BSCPIN array is
:           never checked since we are not expecting any more data after
:           an ETX block, therefore we never send the DISC msg.
:SOLUTION - Check the BSCPIN array after receiving an ETX block.

         LO BSCPTP
         LO BSCRCV
         LO LINE
         LO BSCDEF
         LO BSCHDX
         IF \LHCTIM                   :TIMEOUT VALUE FOR LHLTC
         ELSE
LHCTIM   EQ $A5                       :DEFAULT TO 5 SECONDS
         EI
PATCH(890717,1225,P/SNEDDON,RDATAX,,6)
         J     RDATXX,,
CONPATCH(PA1PTR,,2E)
RDATXX   LHL   R0,TRX.LN,R9,          :RESTORE ORIGINAL INSTRUCTION
         RBT   R8,BSCPIN,,            :SEE IF PSEUDO-INTERRUPT RECEIVED
         JE    RDAT10,,               :NO, CONTINUE NORMALLY
         JAL   R5,PBBC,,              :YES, DITCH THE DATA RECEIVED
         LIS   R1,XCEOT               :SEND AN EOT
         TBT   R8,TTDISC,,            :DISCONNECT SUPPORTED?
         JE    RRCV,,                 :NO, SEND EOT
         LIS   R1,XCDISC              :YES, SEND DISC INSTEAD OF EOT
         J     RRCV,,                 :DISC WILL BE SENT LATER
         LO HSEC
CONPATCH(DROP4+1E,,6)
         J     DROP49,,
CONPATCH(PA1PTR,,18)
DROP49   LHI   R12,LHCTIM*$A600        :GET LHLTC TIMEOUT VALUE
         A     R12,FASTC,,
         ST    R12,RTIME,R14,R14
         LA    R12,LHLTC,,            :RESTORE ORIGINAL  INSTRUCTION
         JR    R9                     :RESTORE ORIGINAL  INSTRUCTION
         FO HSEC
ENDPATCH(Check BSCPIN after ETX block received)
         FO BSCPTP
         FO BSCRCV
         FO BSCDEF
         FO LINE
         FO BSCHDX
    