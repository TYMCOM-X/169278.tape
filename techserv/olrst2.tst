
PATCH(900525,1300,bpc,olrst1+2a,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,40)
        SBT     R1,LCBTAB+BPINIT,R4,
        LHL     RDCB,LSDTAB+LSDDCB,R11,
        lhl     0c,dcblks+dcbprt,rdcb,
        JE      OLRSTX,,
        J       OLRST1+30,,
olrstx  lis     1,1
        ahm     1,dsroff,,
        lcs     1,1
        sth     1,dcblks+dcbtmo,rdcb,
        lhl     1,lsdtab+lsdrid,r11,
        sbt     1,tflag,,
        j       olrst2,,
conpatch(pa0ptr,,2)
dsroff  hc      0
ENDPATCH(OLRST ACCIDENTLY CHANGE THE CIRCUIT STATE FOR NON-ACTIVE CIRCUIT)
   