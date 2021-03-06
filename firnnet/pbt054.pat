: **********************************************************************
: *                                                                    *
: *  File     : PBT054.PAT                                             *
: *  Customer : FIRN                                                   *
: *  Comments : Original file - DLESTX.PAT                             *
: *           : Use in all FIRN PBT 5.05 code                          *
: *                                                                    *
: **********************************************************************

:PBT version 5.05 in routine DSPQ11, when check if there is XPR bit,
:PBT did not get the control byte (XPR,LCM..) back to register zero
:thus XPR was ignored , so PBT did not insert DLE infront of STX.
:05/07/87 Dee Jong Tsao.
:
PATCH(050787,1620,D/TSAO,DSPQ11,,6)
     J         PA1PTR,,
CONPATCH(PA1PTR,,16)
     LHL       R0,DIR0,RDCB,       :get control byte
     THI       R0,XPRBIT
     JN        DSPQ16,,
     J         DSPQ11+8,,
ENDPATCH(PBT054.PAT - GET CONTROL BYTE BACK)
    