:: PTI VERSION 1.00
:: ESC. # 07939 FOR HONGKONG & SHANGHAI BANK
:: Modify the PHI state table so that it treats RVI as a valid acknowledge-
:: ment.
        LO     BSCPTP
PATCH(870427,1120,T/FISTE,SXMT+12,,2)
        HC     XRRVI-PSEG              :RVI
ENDPATCH(TREAT RVI AS VALID ACKNOWLEDGEMENT)
        FO     BSCPTP

   