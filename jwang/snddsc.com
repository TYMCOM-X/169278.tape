


PATCH(871122,1200,JWANG,PRRINF+10,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,3A)
        RBT     RL,OTHBSY,,
        CLHI    RL,1
        JN      RFG200,,
        LB      R5,RECVCM,RL,
        CLHI    R5,61
        JN      RFG200,,
        LB      R5,PA0PTR,,
        SIS     R5,1
        STB     R5,PA0PTR,,
        JN      RFG200,,
        J       SNDDSC,,
ENDPATCH(SIMULATION OF SENDING DISC DURING INFO XFER STATE)
  