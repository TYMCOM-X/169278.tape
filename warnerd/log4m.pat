: THIS PATCH IS TO BE USED IN CONJUNCTION WITH 'MODTAT.PAT' WHICH SETS
: A 15 SECOND LOGIN TIME.  THIS PATCH WILL ZERO OUT THE 15 SECOND COUNTER
: WHEN TERMINATION IS FOUND FOR LOGIN, AT THIS THE BIT IN 'LOGER' ARRAY
: IS RESET.  THE TIMER IS BASED ON THE SETTING OF THE BIT IN 'LOGER'.


        LO      LOGGER

        ORG     LOG4+4
        HC      0,0,0
        ORG     LOG4+4
        J       PATCH1,,

        ORG     PATCH1
        RE      0E
        HC      0
        ER
        ORG     PATCH1
        LHI     R5,0
        STB     R5,LOGCNT,R14,,         :ZERO COUNTER
        SBT     RP,FL.LOG,,
        J       LGRET,,
PATCH1  EQ      .
 