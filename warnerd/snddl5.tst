patch(900924,1115,warnerd,pa0ptr,,2)

ndlsav  bs      1
place   ws      10

        lo      utsptp
        lo      utsfex
        lo      utsblk
        lo      utsrcv
        lo      utssrv
        lo      unativ
        lo      cmdlst

conpatch(entna1+0bc,,6)
        j       pa1ptr,,

conpatch(pa1ptr,,250)

        stm     r0,place,,
        jal     r4,gbb,,
        j       nobf
        lis     r3,0
        lhi     r4,rsoh
        stb     r4,bbufer,r3,
        ais     r3,1
        lhi     r4,45
        stb     r4,bbufer,r3,
        ais     r3,1
        lhi     r4,8a
        stb     r4,bbufer,r3,
        ais     r3,1
        lhi     r4,0e
        stb     r4,bbufer,r3,
        ais     r3,1
        lhi     r4,08
        stb     r4,bbufer,r3,
        ais     r3,1
        lhi     r4,6c
        stb     r4,bbufer,r3,
        ais     r3,1
        lhi     r4,0C1
        stb     r4,bbufer,r3,
        lis     r2,07
        putcmd(xmt,rsid)
        rlcmd(xmt,rsid,rrid)
        lm      r0,place,,
        j       entna1+0c2,,

nobf    hc      0

        fo      utsptp
        fo      utsfex
        fo      utsblk
        fo      utsrcv
        fo      utssrv
        fo      unativ
        fo      cmdlst

endpatch( send DLE 6 at logon)
   