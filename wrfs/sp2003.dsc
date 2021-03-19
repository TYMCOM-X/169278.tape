: **********************************************************************
:           FILE:  Disk Parameters
:   COMPANY NAME:  Southwestern Bell
:    NODE NUMBER:  2003                      LOCATION Kansas City
:    KERNEL HOST:  123                           HOST:  na
:    SLOT NUMBER:  na
:        VERSION:  na                            DATE:  21-MAY-84
:       INITIALS:  RDH
: **********************************************************************
: >>>>>>>>>>>>>>>>>>>>>>>>>REVISION HISTORY<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
: 05-Oct-90  Installed as backup supervisor                   RDH/WSTSL
:
: **********************************************************************

        IF      NDISC+NTAPE+MSCDSK

:**************************************************************************
:*      ISIS CONFIGURATION CONSTRAINTS					  *
:**************************************************************************
MXGLU   EQ      14		:MAX NO. OF DISTINCT UNITS 
NMSC0	EQ	1		:# OF MSC DRIVES ON CONTROLLER 0
MSCDA0	EQ	0F8		:CONTROLLER 0 DRIVE ADDRESS

:**************************************************************************
:      DEFINE DRIVE 0
:**************************************************************************
MSCCY0  EQ      $A 823          :# OF CYLINDERS ON DRIVE 0
MSCTK0	EQ	$A 19		:TRACKS PER CYL (# OF SURFACES/HEADS)
MSCST0	EQ	$A 53		:# OF SECTORS PER TRACK
:**************************************************************************
:       DEFINE DRIVE 1
:**************************************************************************
MSCCY1  EQ      $A 823      :# OF CYLINDERS ON DRIVE 1
MSCTK1  EQ      $A 19       :TRACKS PER CYL ON DRIVE 1
MSCST1  EQ      $A 53       :# OF SECTORS PER TRACK ON DRIVE 1

:**************************************************************************
:*       ALLOCATION OF GLOBAL UNITS					  *
:*         EACH ENTRY HAS 5 PARAMETERS PLUS 1 IF SYSTEM DEVICE:	 	  *
:*              F1=     GLOBAL-UNIT NUMBER IN HEX			  *
:*              F2=     MNEUMONIC DEVICE TYPE: DK, MT, MS		  *
:*              F3=     DEVICE UNIT NUMBER IN DECIMAL 			  *
:*              F4=     AREA START CYLINDER IN HEX (DISCS ONLY)		  *
:*              F5=     AREA SIZE IN HEX - NUMBER OF CYL (DISCS ONLY).	  *
:*                      1 CYL = 530 SECTORS				  *
:*              F6=     SYSTEM DEVICE FLAG = '1' (ASSIGN ONLY ONE)	  *
:**************************************************************************

:**************************************************************************
:*      TAPE UNIT 0 - ASSIGNMENTS					  *
:**************************************************************************
:*	
:*
:**************************************************************************
:*      DISC UNIT 0 - ASSIGNMENTS					  *
:**************************************************************************

        SGU.DEF(1,MS,0,0000,0005)       :1 MEG DISK SAVE AREA
        SGU.DEF(2,MS,0,0005,0006)       :SUPERVISOR SAVE AREA
        SGU.DEF(3,MS,0,000B,0004)       :UTILITY SAVE AREA
        SGU.DEF(4,MS,0,000F,0005)       :HOST MESSAGE AREA
	SGU.DEF(5,MS,0,0014,0001)	:NODE AND KERNAL SAVE AREA
        SGU.DEF(6,MS,0,0015,0010)	:ACCOUNTING DATA AREA
	SGU.DEF(7,MS,0,0025,0071)       :MUD
	SGU.DEF(8,MS,0,0096,0010)	:ERROR LOG
        SGU.DEF(9,MS,0,00A6,0001)       :CLASS & GROUP DEFINITIONS
        SGU.DEF(0A,MS,0,00A7,0004)      :SUPERVISOR HISTORY
        SGU.DEF(0B,MS,0,00AB,0001)      :UTILITY SLOT SAVE AREA
	SGU.DEF(0C,MS,0,00AC,0001)	:SLOT 1 SAVE AREA
	SGU.DEF(0D,MS,0,00AD,0026)	:Spare SPACE
	SGU.DEF(0E,MS,0,0000,0332)	:USER SPACE
	SGU.DEF(0F,MS,0,0000,0337)	:FORMAT SPACE


:**************************************************************************
:*      FLAGS								  *
:*        (SLOT,XLU,GLU,ACCESS)						  *
:*          SLOT  = SLOT NUMBER ASSIGNED (DECIMAL)			  *
:*          XLU   = EXTENDED LOGICAL UNIT NUMBER FOR THIS SLOT (DECIMAL)  *
:*          GLU   = GLOBAL UNIT NUMBER (HEXIDECIMAL)			  *
:*          ACCESS= RD-READ, WR-WRITE, AT-ATTACH, SS-SAVE LICENSE	  *
:*                  LICENCES MAY BE: RD, WR, AT, SS			  *
:**************************************************************************

:**************************************************************************
:*      SLOT 0 - NODE CODE						  *
:**************************************************************************

NXLU0   EQ      0


:**************************************************************************
:*      SLOT Q - SUPERVISOR						  *
:**************************************************************************

Q       EQ      NSLOT+1
NXLU|Q| EQ      $A 8
        SGU.REF(Q,0,7,RD)               :MUD
        SGU.REF(Q,1,6,SS+RD+WR)         :ACCOUNTING DATA
        SGU.REF(Q,2,2,SS+RD+WR)         :SUP SAVE AREA
        SGU.REF(Q,3,9,RD)               :CLASS & GROUP DEF
        SGU.REF(Q,5,8,SS+RD+WR)         :ERROR LOG
        SGU.REF(Q,6,4,RD)               :HOST MESSAGE AREA
	SGU.REF(Q,7,0A,SS+RD+WR)        :SUPERVISOR HISTORY
Q       EQ      Q+1


:**************************************************************************
:*       PROBE								  *
:**************************************************************************

NXLU|Q| EQ      $A 7
        SGU.REF(Q,1,6,SS+RD+WR)         :ACCOUNTING DATA
        SGU.REF(Q,4,3,SS+RD+WR)         :UTILITY SAVE AREA
        SGU.REF(Q,5,8,SS+RD+WR)         :ERROR LOG
        SGU.REF(Q,6,4,SS+RD+WR)         :HOST MESSAGE AREA
Q       EQ      Q+1


:**************************************************************************
:*      ERRLOG								  *
:**************************************************************************

NXLU|Q| EQ      6
        SGU.REF(Q,4,3,SS+RD+WR)         :UTILITY SAVE AREA
        SGU.REF(Q,5,8,SS+RD+WR)         :ERROR LOG
Q       EQ      Q+1


:**************************************************************************
:*      ACCOUNT								  *
:**************************************************************************

NXLU|Q| EQ      5
        SGU.REF(Q,1,6,SS+RD+WR)         :ACCOUNTING DATA
        SGU.REF(Q,4,3,SS+RD+WR)         :UTILITY SAVE AREA
Q       EQ      Q+1


:**************************************************************************
:*      SYSMSG1								  *
:**************************************************************************

NXLU|Q| EQ      $A 8
        SGU.REF(Q,4,3,SS+RD+WR)         :UTILITY SAVE AREA
        SGU.REF(Q,6,4,SS+RD+WR)         :HOST MESSAGE AREA
        SGU.REF(Q,7,9,SS+RD+WR)         :CLASS & GROUP DEF
Q       EQ      Q+1


:**************************************************************************
:*      UN2								  *
:**************************************************************************

NXLU|Q| EQ      5
        SGU.REF(Q,0,7,SS+RD+WR)         :MUD
        SGU.REF(Q,4,3,SS+RD+WR)         :UTILITY SAVE AREA
Q       EQ      Q+1


:**************************************************************************
:*      UTILITY								  *
:**************************************************************************

NXLU|Q| EQ      $A 10 
        SGU.REF(Q,0,7,SS+RD+WR+AT)      :MUD
        SGU.REF(Q,1,6,SS+RD+WR+AT)      :ACCOUNTING DATA
        SGU.REF(Q,2,2,SS+RD+WR+AT)      :SUP SAVE AREA
        SGU.REF(Q,3,9,SS+RD+WR+AT)      :CLASS & GROUP DEF
        SGU.REF(Q,4,3,SS+RD+WR+AT)      :UTILITY SAVE AREA
        SGU.REF(Q,5,8,SS+RD+WR+AT)      :ERROR LOG
        SGU.REF(Q,6,4,SS+RD+WR+AT)      :HOST MESSAGE AREA
	SGU.REF(Q,7,0A,SS+RD+WR+AT)     :SUPERVISOR HISTORY
        SGU.REF(Q,8,0E,SS+RD+WR+AT)     :USER SPACE - DISK 0
        SGU.REF(Q,9,0F,SS+RD+WR+AT)     :FORMAT SPACE - DISK 0
        SGU.REF(Q,10,10,SS+RD+WR+AT)     :USER SPACE - DISK 1
        SGU.REF(Q,11,11,SS+RD+WR+AT)     :FORMAT SPACE DISK 1

        EI      (NDISC+NTAPE+MSCDSK)
   