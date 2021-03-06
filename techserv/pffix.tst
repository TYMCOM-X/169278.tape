:---------------------------------------------------------------------
: Patch name:  PFFIX.171                     Product and Version:  PBT 17.01
:     Author:  JEFF MORDEN                            Organization:  STS
:   Customer:  AUTOSTRADE                            Date Written:  5/18/91
: Escalation Number:  355270         PIR:  #              NSR:  #
: Description of Problem:  #
:       IF THE TWOPF KEY OPTION IS CONFIGURED INTO THE INTERFACE IT IS
:       POSSIBLE TO SEND A RESPONSE TO THE HOST WITH AN AID OF THE NSS
:       KEY BY SENDING THE MESSAGE TWICE FROM THE TERMINAL DEVICE.  
:       HOWEVER, THE INTERFACE WAS FLUSHING THIS SECOND TRANSMISION FROM
:       THE DEVICE/CONTROL UNIT BECAUSE IS DID NOT RESET A BIT AT SEEING
:       THE ETX OF THE FIRST MESSAGE.  THIS BIT IS USED TO INSURE THAT
:       THE ENTIRE FIRST MESSAGE IS FLUSHED REGARDLESS OF WHAT SIZE IT IS.
:
:---------------------------------------------------------------------

PATCH(051691,1100,J/MORDEN,RDP072,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,12)
        LA      R1,UNLKB,,              :FROM SOURCE
        RBT     RDEV,RFD,,              :SHOW NO NEED TO FLUSH MESSAGE
        J       RDP072+6,,
ENDPATCH(DO NOT FLUSH SECOND MESSAGE WITH AID OF PFKEY)
  