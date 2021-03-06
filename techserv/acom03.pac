: When inactivity timer is enabled in Tymcom, BREAKs are accumulated
: on a seperate counter. When 18h BREAKS are counted the user is
: zapped. When the user inputs characters the counter should be reset
: but the method of indexing between set and reset is inconsistent
: This patch will set and reset on port number indexing into the
: Break counter table and if user is zapped for exceeding limit will
: reset counter before zapping.


        IF        INAN+1
        PATCH(870121,1400,LEEWAKE,ICBRK,,4)

        J        PA1PTR

CONPATCH(pa1ptr,,22)
        
        lb        r7,brkact,rhp,        : Index in with port number
        ais       r7,1                  : Bump up count
        stb       r7,brkact,rhp,        : and store
        clhi      r7,brklim             : is limit reached ?
        jn        icbrk+16              : No
        lis       r7,0                  : reset counter before disconnect
        stb       r7,brkact,rhp,
        j         donbrk                : if yes drop circuit

ENDPATCH(Correct reset of break count on user activity)

        EI
   