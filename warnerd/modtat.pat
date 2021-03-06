: THIS PATCH STARTS A COUNTER WHEN THE BIT IN 'LOGER' IS SET, IF THAT BIT
: IS STILL SET AFTER 15 SECONDS EXPIRES THEN THE PORT IS HUNG.  ANY PORT
: THAT SHOWS 'TATBIN' RESET (I.E. 'NOHNG') AFTER INITIALIZATION WILL BE
: SKIPPED OVER AND NOT CHECKED FOR LOGIN STATUS.  PATCHES 'TEXTM.PAT',
: 'LOG4M.PAT', AND 'CIRM.PAT' ARE USED IN CONJUNCTION WITH THIS PATCH TO
: RESET COUNTER WHEN BIT IN 'LOGER' IS RESET.  << THIS WAS WRITTEN
: SPECIFICALLY FOR EXXON DIAL TRANSACTION TERMINALS TO GIVE THEM A 15
: SECOND WINDOW TO LOG IN OR BE DROPPED >>


        SEG     0
        ORG     PATCH0
LOGCNT  BS      20      :STORAGE (FOR 32 PORTS) FOR LOGIN TIME COUNTER
PORT    BS      1       :PLACE TO KEEP TRACK OF CURRENT PORT
TEMP14  WS      1
PATCH0  EQ      .
        SEG     1


        ORG     XNF0
        HC      0,0,0
        ORG     XNF0
        J       PATCH1,,

        ORG     PATCH1
        RE      3C
        HC      0
        ER
        ORG     PATCH1
        LIS     R8,0
        STB     R8,PORT
TESTLG  TBT     R8,TATBIN       :TEST FOR 'NOHNG' PORT
        JE      NOTLOG,,        :IF 'NOHNG' DON'T SET TIMER
        TBT     R8,LOGER        :SEE IF PORT IS IN 'LOGIN' STATE
        JE      NOTLOG,,        :IF NOT DON'T SET TIMER
        LB      R9,LOGCNT,R8    :OTHERWISE START TIMER
        CHI     R9,1E           :15 SEC. ELAPSE AFTER 1E TIMES. (I.E. 30
                                : 1/2 SECS.)
        JGE     DISCCQ,,        :GO DISC PORT AFTER 15 SECS.
        AIS     R9,1            :IF NOT 15, ADD TO COUNTER
        STB     R9,LOGCNT,R8
NOTLOG  AIS     R8,1            :LOOK AT NEXT PORT
        STB     R8,PORT         :KEEP TRACK OF PORT NUMBER
        CHI     R8,20           :REACH MAX. NO. OF PORTS YET?
        JL      TESTLG          :IF NOT GO BACK AND CHECK ANOTHER
        J       OUT,,           :OTHERWISE, LEAVE PATCH
DISCCQ  ST      R14,TEMP14,,    :ROUTINE TO HANG PORT
        LB      R14,PORT,,
        JAL     R10,HANGUP,,
        L       R14,TEMP14,,
        LIS     R9,0
        LB      R8,PORT,,       :ZERO COUNTER FOR HUNG PORT
        STB     R9,LOGCNT,R8
OUT     L       R0,RLA,RPOL,,
        N       R0,ASYNC,RPOL,,
        J       XNF0+8,,
PATCH1  EQ      .
    