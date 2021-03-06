:---------------------------------------------------------------------
: Patch name:  VMNO1E                Product and Version:  BBXS 7.01
:     Author:  Phil Sneddon                 Organization:  STS
:   Customer:  NIS                          Date Written:  July 31, 1990
: Description of Problem:  There is no way to turn of the PRO.ELINE
: option if you don't want a 1E inserted into the data stream.
: ESC #314119
:---------------------------------------------------------------------

        LO IR100
PATCH(900731,1457,Stig,EOR01A,,2)
        LIS   R0,0                    :dummy line
Q       EQ    0
        RE PRON
Q       EQ    Q+1
        IF VM|Q|
        IF \NO1E|Q|                   :no 1E for profile number Q
CONPATCH(IRCP|Q|+0D,,1)
        BC    0                       :don't treat CR as end of record
        EI
        EI
        ER
ENDPATCH(Don't insert 1E after CR for selected profiles)
        FO IR100
  