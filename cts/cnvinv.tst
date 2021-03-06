:****************************************************************
: Patch name:  cnvinv.531       Product and Version:  TII 5.31
:     Author:  scott wedel             Organization:  STS
:   Customer:  swb                     Date Written:  01/02/91
: Reason for patch:  invoice number not saved at lepacv and it needs to
:    saved to cqinv in order to setup rebuild parameters.
:****************************************************************

        if      rebild!logii
        patch(910102,0020,sdw.cnvinv,lgcv06+20,,6)
        j       pa1ptr,,
        conpatch(pa1ptr,,20)
        st      r4,cqinv                :inserted instruction
        exhr    r1,r4
        jal     r9,whwi,,
        j       lgcv06+26,,
        endpatch(Save correct invoice number for rebuild)
        ei
    