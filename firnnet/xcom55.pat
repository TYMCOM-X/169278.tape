: **********************************************************************
: *                                                                    *
: *  File     : XCOM55.PAT                                             *
: *  Customer : FIRN                                                   *
: *  Comments : Original file - XON.301                                *
: *           : Use in all FIRN XCOM 3.01 code                         *
: *                                                                    *
: **********************************************************************

PATCH(851120,1100,BPC,NDL060+8,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,34)
        LHL     R1,DPORT
        LIS     R0,5    :MSG LENGTH
        LHI     R2,0B1
        JAL     R4,BSLOR,,
        LHI     R0,0E
        JAL     R4,BPUTCH,,
        LIS     R0,1
        JAL     R4,BPUTCH,,
        JAL     R4,BELOR,,
        LHL     R1,DPORT
        LIS     R0,0
        J       NDL060+0E,,
ENDPATCH(XCOM55.PAT - SEND PAR 0E VALUE 1 TO CONSAT WHEN A NEEDLE COMES IN)
  