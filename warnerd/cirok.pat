        LO      CONSAT
        LO      DATA
        LO      ISIS
        LO      LOGGER

        ORG     CIROK+32
        HC      0,0,0
        ORG     CIROK+32
        J       PATCH1,,

        ORG     PATCH1
        RE      15
        HC      0
        ER
        ORG     PATCH1
        ST      R1,TEMP1
        ST      R2,TEMP2
        LB      R1,PORT
        LHI     R2,0
        STB     R2,LOGCNT,R1
        L       R1,TEMP1
        L       R2,TEMP2
        RBT     RP,LOGING
        RBT     RP,NEWLOG
        J       CIROK+3A,,
PATCH1  EQ      .
  