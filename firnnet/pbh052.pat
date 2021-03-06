: **********************************************************************
: *                                                                    *
: *  File     : PBH052.PAT                                             *
: *  Customer : FIRN                                                   *
: *  Comments : Original file - PBH07.PAP                              *
: *           : Use in all FIRN PBH 7.05 code                          *
: *                                                                    *
: **********************************************************************

: INS esc#68347
: PBT crashed due to use up maximum (FF) bufferlet to store FFx.
: This patch was written based on assumption that  customer sent us
: a data block without ETB or ETX to end the block which violated the
: protocol. In this case PAD characters were treated as normal data without
: being removed by PBH code. This patch will detect this situation and
: abort the data block.
: This patch should be installed in PBH.
          LO   BSCRCV
     PATCH(061786,1400,D/TSAO,RPDSTO,,6)
          J    PA1PTR,,
     CONPATCH(PA1PTR,,22)
          CLHI RC,0FF                   : is it a pad
          JNFS JUN17
          LI   RC,7
          J    RPDONE,,                 : yes, skip
JUN17     EXBR RCRC,RCRC
          LBR  R3,RCRC
          STBR RC,RCRC
          J    RPDSTO+6,,
     ENDPATCH(PBH052.PAT - PATCH TO HANDLE pad TO ABORT)
          FO   BSCRCV
P1END  EQ   PA1PTR
P0END  EQ   PA0PTR
  