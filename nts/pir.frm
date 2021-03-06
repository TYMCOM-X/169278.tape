
Bill,

Following the <><><> below is the form you need for entering a PIR.  The
one  below is one I used to enter a request  for one  of our  monitoring
tools  and can  serve  as an example.   Most of it is  self explanitory,
except for the following:

    o  Use CSC for the division name.
    o  Leave the  Product manager  section blank, as there is no product
       manager.
    o  Client is CSC.
    o  Skip the revenue or cost impact and marketing comments sections,
       as well as the addendum section.

The way the file  is set  up, it  uses a  program on  the PDP-X's called
ONTYME.  The ONTYME program is primarily used to transfer files from the
PDP-X to the OnTyme system.   It is  envoked by entering "R ONTYME", and
answering  the OnTyme  username and password prompts.  At this point the
ONTYME program  will build  an aux  circuit to OnTyme, and prompt for  a
file name or command.   Responding with a  file name  will transfer  the
file from the PDP-X to OnTyme,  executing any  commands contained in it.
Responding with a ":<command>" will cause OnTyme  to execute the command
entered.

The following is a sample of the use of the ONTYME PDP-X program:

    please log in: BRUCES:34;<password>;
    Load 37%, response 483 ms
    D34-P035/E [KL-10] 2021-0 [4800]
    
    -R ONTYME
    
    ONTYME TRANSFER      VERSION: 3.24

    ENTER ONTYME NAME:nsc.b/shepherd
    ENTER PASSWORD:
    01 MAY 89 14:09:42  


    ENTER FILE NAME OR COMMAND: :in
    NO MESSAGES ON THIS LIST

    ENTER FILE NAME OR COMMAND:

    EXIT

    -

What you will do is enter the name of the file the PIR form is contained
in.  I use the name PIR.FRM, which is what I enter at the prompt.   Note
that any line  beginning in column 1  with a  ":"  is  interpreted as  a
command  to  OnTyme  (such  as  the  :top, :erase, :send, and :out lines 
below).  What the following file will do is:

    o  execute the OnTyme :top command (move to top of user work space).
    o  execute the OnTyme :erase command (clearing the user work space).
    o  move the body  of the  PIR form from the PDP-X to the OnTyme user
       work space.
    o  execute  the OnTyme :send command (with carbon copies [CC] to the
       listed users.
    o  execute the  OnTyme :out command to  insure that  the message was
       sent.

Note that a <@CR> at the enter file name  or command prompt,  will cause
the ONTYME  program to  terminate and return you to the PDP-X XEXEC.  It
may take a few minutes  for  OnTyme  to  acknowledge  the circuit  drop,
during which time you won't be able to log into OnTyme directly.

That pretty much is it, EXCEPT limit the test lines to 60 characters, as
that is what is requested by the PIR processors.

Good luck, and call me if it doesn't make sense,
Bruce


PS:  Delete everything  above  and  including  the <>><> line before you
     send the file.



<>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>


:top
:erase

************************
*                      *
*      TYMNET PIR      *
*       Project        *
*      Initiation      *
*       Request        *

*                      *
************************



PIR NAME:  TMCS Enhancement
PIR REQUEST DATE:  28 April 1989
DESIRED PIR RESPONSE DATE (not ASAP): 15 May 1989
DESIRED PIR IMPLEMENTATION DATE (not ASAP):  1 August 1989
PRODUCT(S) AFFECTED/PRODUCT NAME:  TMCS
 
REQUESTOR NAME:  Bruce Shepherd
REQUESTOR PHONE NUMBER:  408-922-7517
REQUESTOR ONTYME NAME:  NSC.B/SHEPHERD
REQUESTING DIVISION NAME:  NTD
REQUESTING DEPT. NAME:  NTS
REQUESTING DEPT. COST CODE:  2603
 
PRODUCT MANAGER NAME:
PRODUCT MANAGER PHONE:
PRODUCT MANAGER ONTYME NAME:
 
CLIENT NAME (TYMNET if no other):  TYMNET
 
PIR DESCRIPTION:                 
Change the Archive facility to terminate with an abnormal message
when encountering a disk or tape error.

PIR PURPOSE:                     
At the present time  the Archive  facility will  continue to  the
next file when it encounters  a disk  or tape  error.   This  can
result in a  useless archive tape  (particularly when the file in
question is  the Profile file),  and  may  not  be noticed  by an
operator because it appears to complete normally.

REVENUE OR COST IMPACT:           

PIR IMPACT:                      
Will  insure that  the archive process creates good backup of the
TMCS system.

MARKETING COMMENTS:               
 
ADDENDA (Optional):            

:send cc nscms.nspirs nsc.b/shepherd nsc.t/yeh
TMCS PIR
:out
   