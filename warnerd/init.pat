        LO      CONSAT
        LO      DATA
        LO      ISIS
        LO      LOGGER

        ORG     INIT0
        HC      0,0,0
        ORG     INIT0
        J       PATCH1,,
        
        ORG     PATCH1
        RE      1B
        HC      0
        ER
        ORG     PATCH1
        ST      R2,TEMP1,,
        ST      R4,TEMP2,,
        LIS     R2,0
        LIS     R4,0F
ZRCNT   STB     R2,LOGCNT,R4,,
        SIS     R4,1
        CLB     R4,0
        JG      ZRCNT
        L       R2,TEMP1,,
        L       R4,TEMP2,,
        STH     R0,BEGZRO,R1,,
        SIS     R1,2
        J       INIT0+6,,
PATCH1  EQ      .
 