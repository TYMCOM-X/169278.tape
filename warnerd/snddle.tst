patch(900924,1115,warnerd,pa0ptr,,2)

ndlsav  bs      1

        lo      utsptp
        lo      utsfex
        lo      utsblk
        lo      utsrcv
        lo      utssrv
        lo      unativ

conpatch(entna1+0bc,,6)
        j       pa1ptr,,

conpatch(pa1ptr,,14)

        lis     r5,1
        stb     r5,ndlsav
        sth     r6,m.cacp+9,,
        j       entna1+0c2,,

conpatch(rtpol3,,6)
        j       pa1ptr,,

conpatch(pa1ptr,,32)

        lb      r2,ndlsav,,
        jn      snddle6,,
        lb      r2,pgrtab+crxsid,rrid,
        j       rtpol3+6,,
snddle6 lis     r2,0
        stb     r2,ndlsav,,
        lb      r2,pgrtab+crxsid,rrid,
        lis     r2,xhss
        lhi     r3,A6.
        j       xstatu,,

        fo      utsptp
        fo      utsfex
        fo      utsblk
        fo      utsrcv
        fo      utssrv
        fo      unativ

endpatch(send DLE 6 upon receipt of needle)
   