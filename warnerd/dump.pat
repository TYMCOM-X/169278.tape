        FO FCB
        LO MAIN
        LO BSCPTP
        LO IR100
        LO R100
        LO BSCDEF
:  This patch is to detect FORWARD ABORT control message and to dequeue
:  all commands and data and to ship out EOT to host to prevent endless
:  bidding when host doesn't acknowledge previously sent data or ENQ.  This
:  is during SXTMOT state and SBID state.            DEW  01/10/90

PATCH(891219,1730,WARNERD,SBID+20,,4)
        HC      XLCM+48-PSEG  :FORMERLY IXNOBR, CONFLICT WITH OTHER PATCH

CONPATCH(XLCM+48,,6)
        J       PA1PTR,,        :FOR SBID STATE
CONPATCH(XTMOT,,6)
        J       SEOT,,          :FOR SXTMOT STATE

CONPATCH(PA1PTR,,134)

        RBT     R8,FORABR,,             :TEST BIT SET FOR FORWARD ABORT (EOT)
        JE      IXNOBR+6,,              :IF NOT SET GO BACK TO MAIN PROGRAM
        J       OPCHK,,                 :IF SET PREPARE TO DEQUEUE DATA 
SEOT    RBT     R8,FORABR,,             :CHECK BIT SET DURING SXTMOT STATE
        JN      OPCHK,,                 :IF SET PREPARE TO DEQUEUE DATA
        JAL     R5,SETERR,,             :IF NOT REPLACE OLD INSTRUCT 
        LHI     R0,SXTMOT-PSEG
        J       XTMOT+8,,               :AND GO BACK
OPCHK   XOPCHK(COMP,DUMP,BOOT,BOOT)     :MACRO TO CHECK TYPE OF DATA AND REACT
BOOT    JAL     R5,CDEQUE,,             :EOT OR OTHER COMMAND - DEQUEUE IT
        J       OPCHK,,                 :GO CHECK FOR MORE
DUMP    XOPDQU                          :MACRO TO DEQUEUE DATA
        J       OPCHK,,                 :GO CHECK FOR MORE
COMP    LIS     R0,0                    :COMPLETE, REPLACE INSTRUCT
        STB     R0,RETRY,RL,            :DOESN'T ALLOW RESET SO EOT GOES OUT
        J       IRESET,,                :FINISH NORMAL PROCESSING
ENDPATCH(IF FORWARD ABORT DEQUEUE DATA AND SEND EOT)
  