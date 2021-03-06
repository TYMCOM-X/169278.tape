patch(900924,1115,warnerd,pa0ptr,,40)

place   ws      10                      :temporary storage for registers

        lo      utsptp
        lo      utsfex
        lo      utsblk
        lo      utsrcv
        lo      utssrv
        lo      unativ
        lo      cmdlst

conpatch(entna1+0bc,,6)
        j       pa1ptr,,

conpatch(pa1ptr,,112)

        stm     r0,place,,                      :save registers
        lhi     r2,0fff5                        :load DLE 6 command code
        lhi     r3,A6.                          :load the 6
        sdload  rsid,dcbsid,rdcb,               :set up rsid to queue cmd
        pgload  rrid,dcbrid,rdcb,               :set up rrid to queue cmd
        putcmd(xmt,rsid)                        :get cmd ready for f.g.
        rlcmd(xmt,rsid,rrid)                    :set bit for data
        lm      r0,place,,                      :put registers back
        sth     r6,m.cacp+9,,                   :replace old instruction
        j       entna1+0c2,,                    :go back to send call acc

conpatch(xdatp1+1e,,6)                          :process xmit data

        j       pa1ptr,,

conpatch(pa1ptr,,84)

        je      xrprq3,,                        :no data
        ci      r2,0fffffff5                    :see if DLE 6 cmd
        jn      xdatp1+24,,                     :not it - go back
        stm     r0,place,,                      :save registers
        advcmd(xmt,rsid,rrid)                   :DLE 6 is ready to be
                                                :sent re-set XMTDAT
        lm      r0,place,,                      :put registers back
        lcs     r4,1                            :subtract 1 and make -11
        xr      r2,r4                           :positive for index into
                                                :command type table
        j       xstatu,,                        :send out as station status


        fo      utsptp
        fo      utsfex
        fo      utsblk
        fo      utsrcv
        fo      utssrv
        fo      unativ
        fo      cmdlst

endpatch( send DLE 6 at logon)
  