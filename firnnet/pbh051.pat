: **********************************************************************
: *                                                                    *
: *  File     : PBH051.PAT                                             *
: *  Customer : FIRN                                                   *
: *  Comments : Original file - PBH07.PAQ                              *
: *           : Use in all FIRN PBH 7.05 code                          *
: *                                                                    *
: **********************************************************************

:*** NOTE *** THIS PATCH SHOULD BE USED WITH (QSATS)PBH07.PAA.
:
:FMC LinkBelt esc#47694 - invalid DSP sequence number
:Original problem was Foreground did not tell Background that
:there was a Forward Abort. Patch to use is PBH07.PAA. But,the problem
:was not fixed because Background did not check the Forward Abort
:message (ENQBIT) from Foreground to format correct DSP packet.
:This patch will force Background to check ENQBIT in order to perform
:proper function. 
:
          PATCH(110386,1020,D/TSAO,OND15-0A,,4)
                    THI       R0,ETBBIT!ETXBIT!ENQBIT
          CONPATCH(OND50-0C,,4)
                    THI       R0,ETBBIT!ETXBIT!ENQBIT
          CONPATCH(OND115-0A,,4)
                    THI       R0,ETBBIT!ETXBIT!ENQBIT
          ENDPATCH(Force Background to check ENQBIT and take action)
 
    