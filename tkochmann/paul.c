
ONTYME II   04 AUG 88 01:38:55  GMT

ID? qsats.t/kochgma


ID? qsats.t/kochmann

KEY? 

ACCEPTED

 MSG#      SENDER                     SENT             LENGTH
     SUBJECT 
 M79813    QSATS.J/STEIN              03 AUG 88 09:55  1347
     USE OF DSYN AND DSYA WITH CPU3/MAC3 AT 10 MHZ.
 I11997    NETS.S/KIM                 03 AUG 88 09:58  3134
 M79854    QSATS.J/STEIN              03 AUG 88 13:00  726
     V.35 REVERSAL FOR FIDELITY INVESTMENTS.
 M79856    QSATS.P/NELSON             03 AUG 88 13:10  13958
     FASBE forms for July
 S56277    ISIPR.P/COPPERFIELD        03 AUG 88 15:47  2544
     SNA connection
 M79930    QSATS.P/NELSON             03 AUG 88 17:08  702
     re: OCL longer than 100'

PLACED IN WORKSPACE

?



Tim

Find below themodel for demostration to a potential customer. The
3270 terminal that the customer sent me is an co-axial inteface 
terminal.


 
Paul,
 
We are trying to set up a demo for the Australian Federal Police of
Reverse SNA.  The demo will be in about 4-5 weeks, so it will be
after your return.
 
This is the configuration that we will need for the test:
 
   MD House, St. Leonards// TYMNET // ST. Louis
              __________        ____________         _ ____ 
    __       |..........|      |............|      _| :   I|
 __|  |------|SNA TIF   |. . . |VHR TIF     |-----| | :-. B|
/_____|      |..........|      |............|     |3|V:V. M|
 IBM 3270    |__________|      |____________|     |7|T:T.  |
/SNA Terminal __________        ____________      |x|A:R. 3|
(loaned from |..........|      |............|     |5|M:A. 0|
 Fed. Police)|  CMH     | . . .|VHR TIF     |-----|_| :-  8|
             |..........|      |............|       |_:___1|
 ________    | TYMCOM   |      |____________|              
| SYDNEY |  /|..........|
| HOST   |/  |__________|
|        |
|________|
 
 
Ww will be using the SNA Reflect method.  As you know. the TYMCOM
and host already exist, and there is sufficient space in the dual
mini for the other interfaces.  We can allocate one of the already
connected ports to either the PES or Series-18 for this demo.  CMH
requires no hardware resources except memory, all connections are
internal.
 
The SNA connection will be the most difficult.  I believe that we
will need an SIO V.35 connection to support the SDLC/SNA connection.
This means that we will 1)  have to obtain a V.35 daughter card and
use some of the mini's SIO ports, or  2)  obtain and use a Micro-4 or
Pico.
 
David Ruscoe is pursuing getting the setup in St. Louis re-installed.
If this is not possible, then we may have to get a host from the U.K.,
and this would then require access through their gateway.
 
Anyway, what I would like you to do is to track down Dennis Lindsey,
who is supporting us from the UK end, discuss this with him (he is
already aware of the plans).  Pick his brains so that you are the
"expert" when you return.  Be sure to look for any traps or glitches
that we may fall into.
 
Thanks and best regards,
 
Dan


Tim

Refering to the above model,  the SNA Tif,CMH & TYMCOMwill bbe in
Sydney while the VHR & IBM host will be in the UK.

The terminal that the customer sent me is a TELEX 191 terminal.

Regards

Paul

ACCEPTED

ACCEPTED


NOW LEAVING ONTYME II
03 AUG 88 18:39:49  
 