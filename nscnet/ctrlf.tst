:************************************************************
:(NSCNET)CTRLF.603
:***************************************************************
:
:       <<<<< This patch apply to Consat version 6.03 >>>>>
:
:       (1). This patch enable to cancel HDX option on login mode
:            when user type ^F before username.
:
        LO      SIGNAL
        LO      DATA
        LO      LOGGER
 
PATCH(901130,1130,NIS.KANETA,LOG12,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,2C)
        SIS     RBC,1A-15               : ^Z *500.sdw
        JNFS    LOG13                   :
        SBT     RP,HANGWT               : Hang the user
        J       RELOG,,                 : Skip to log to check if more
                                        : character present
LOG13   AHI     RBC,1A-06               : ^F = HDX off (Only in Japan)
        JN      RELOG,,                 :
        LHI     R4,SHDSIG               : (Set Half-duplex =3E) get
        L       RBP,.TTBUF,RPI          : set to-terminal buffer pointer
        LIS     RBC,0                   :
        JAL     RCH,PUTSIG              : Put a (data) character
        J       RELOG,,                 : return
ENDPATCH(Add HDX off function by ^F)
 
        FO      LOGGER
        FO      DATA
        FO      SIGNAL
   