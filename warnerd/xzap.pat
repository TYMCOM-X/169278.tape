        LO      CONSAT
        LO      DATA
        LO      ISIS
        LO      LOGGER

        ORG     XZAP+1C
        HC      0,0,0
        ORG     XZAP+1C
        J       PATCH1,,

        ORG     PATCH1
        RE      1D
        HC      0
        ER
        ORG     PATCH1
        ST      R1,TEMP1,,
        ST      R2,TEMP2,,
        LB      R1,PORT,,
        LHI     R2,0
        STB     R2,LOGCNT,R1,,
        L       R1,TEMP1,,
        L       R2,TEMP2,,
        RBT     RP,LOGING,,
        JN      XLSTAT,,
        J       XZAP+24,,
PATCH1  EQ      .
  