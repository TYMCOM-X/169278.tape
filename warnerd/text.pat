        LO      CONSAT
        LO      ISIS
        LO      DATA
        LO      LOGGER

        ORG     TEXT20+4
        HC      0,0,0
        ORG     TEXT20+4
        J       PATCH1,,
        
        ORG     PATCH1
        RE      14
        HC      0
        ER
        ORG     PATCH1
        ST      R2,TEMP2,,
        LHI     R2,0
        STB     R2,LOGCNT,R14,,
        L       R2,TEMP2,,
        THI     R9,L.LOGG
        JE      TEXT22,,
        J       TEXT20+0A,,
PATCH1  EQ      .
    