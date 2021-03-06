:---------------------------------------------------------------
:
: INTERFACE : CMTI
: VERSION   : 11.01
:
:       To display KANJI character from host correctly in KANJI ONLY FIELD
:
:       1. CMT does not check if the field is KANJI ONLY field or not, 
:          when CMT receives text data from host. So, CMT display
:          alpha/numeric/katakana character instead of KANJI character even
:          if the field is KANJI ONLY field.
:
:       2. To display KANJI character correctly in KANJI ONLY field
:          for the data from host, check if the field is KANJI ONLY field or not
:
:
:
:----------------------------------------------------------
:
        LO      DSP
PATCH(900418,1530,NIS.KOBAYASHI,DATA12,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,3A)
        TBT     R7,SCNMAP,R8            :Is it attribute posittion ?
        JE      STKJ01                  :NO
        LB      R5,SCN,R8,R7            :Get current attribute byte
        THI     R5,40                   :KANJI ONLY?
        JN      STKJ01                  :NO
        POP(R7)                         :Get back original posittion
        STB     R0,SCN,R8,R7            :Put byte in buffer
        J       DATA20,,                :BACK SOURCE
STKJ01  LR      R7,R7                   :FROM SOURCE
        JN      DATA13,,                :FROM SOURCE
        LHI     R7,BUFSIZ               :FROM SOURCE
        J       DATA13,,                :BACK SOURCE
ENDPATCH(Fixing bug of not set kanji character in buffer)
        FO      DSP
 