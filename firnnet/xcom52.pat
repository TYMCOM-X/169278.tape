: **********************************************************************
: *                                                                    *
: *  File     : XCOM52.PAT                                             *
: *  Customer : FIRN                                                   *
: *  Comments : Original file - E0CRSH.301                             *
: *           : Use in all FIRN XCOM 3.01 code                         *
: *                                                                    *
: **********************************************************************

PATCH(860210,1600,JL,CHKS25+10,,4)
         J         CHKS25+14
ENDPATCH(XCOM52.PAT - AVOIDS CRASHING ON FAULTILY REPORTED BAD SIO STATUS)
    