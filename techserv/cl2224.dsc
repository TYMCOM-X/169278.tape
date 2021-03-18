:**************************************************************************
:           FILE: disk Parameters
:   COMPANY NAME: UKNET QA
:    NODE NUMBER: 2224				LOCATION: London, England
:    KERNAl HOST: 668 				    HOST: na
:    SLOT NUMBER: na
:        VERSION: na
:**************************************************************************
:>>>>>>>>>>>>>>>>>>>>>>>>REVISION HISTORY<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
:  06/19/90 UPPED CUD SIZE, AND UPGRADED NVAL TO V 5.09     RDH/CTSSL
:  06/20/90 added information  for slot 2 - RAM             CML/STS - RAM
:  06/20/90 changed MSCCY0 to 823 see comments              CML/STS - RAM
:**************************************************************************

        IF      NDISC+NTAPE+MSCDSK

:**************************************************************************
:*      ISIS CONFIGURATION CONSTRAINTS					  *
:**************************************************************************

MXGLU   EQ      06		:MAX NO. OF DISTINCT UNITS 
NMSC0	EQ	1		:# OF MSC DRIVES ON CONTROLLER 0
MSCDA0	EQ	0F8		:CONTROLLER 0 DRIVE ADDRESS

MSCCY0	EQ	$A 823		:# OF CYLINDERS ON DRIVE 0 <<<<<<<<<<<<
				:CYLINDERS PER DISK DRIVE = 337 HEX
:MSCCY0	EQ	$A 820		:# OF CYLINDERS ON DRIVE 0 <<<<<<<<<<<<
                                :  randy had MSCCY0 EQ 823 (?????)

MSCTK0	EQ	$A 19		:TRACKS PER CYL (# OF SURFACES/HEADS)
MSCST0	EQ	$A 53		:# OF SECTORS PER TRACK

:**************************************************************************
:*       ALLOCATION OF GLOBAL UNITS					  *
:*         EACH ENTRY HAS 5 PARAMETERS PLUS 1 IF SYSTEM DEVICE:	 	  *
:*              F1=     GLOBAL-UNIT NUMBER IN HEX			  *
:*              F2=     MNEUMONIC DEVICE TYPE: DK, MT, MS		  *
:*              F3=     DEVICE UNIT NUMBER IN DECIMAL 			  *
:*              F4=     AREA START CYLINDER IN HEX (DISCS ONLY)		  *
:*              F5=     AREA SIZE IN HEX - NUMBER OF CYL (DISCS ONLY).	  *
:*                1 CYL = 530 SECTORS(160/MB) OR 1007 SECTORS(300/MB)     *
:*              F6=     SYSTEM DEVICE FLAG = '1' (ASSIGN ONLY ONE)	  *
:**************************************************************************

:**************************************************************************
:*      TAPE UNIT 0 - ASSIGNMENTS					  *
:**************************************************************************
:*	
	SGU.DEF(4,MT,0)		:MAGNETIC TAPE DRIVE 0
:*
:**************************************************************************
:*      DISC UNIT 0 - ASSIGNMENTS					  *
:**************************************************************************

        SGU.DEF(1,MS,0,0000,0005)       :1 MEG DISK SAVE AREA
:       SGU.DEF(2,MS,0,0008,0004)       :SLOT 1 SAVE AREA
        SGU.DEF(2,MS,0,0005,0193)       :CUD, ALL OF DISK UNIT 0
        SGU.DEF(3,MS,0,0198,0012)       :MUD UPDATE AREA DISK UNIT 1
        SGU.DEF(5,MS,0,01AA,0010)       :SLOT 2 RAM save area
        SGU.DEF(6,MS,0,01BA,0170)       :SLOT 2 RAM work area
        SGU.DEF(7,MS,0,0000,0335)       :USER ADDRESSABLE AREA (WHOLE DISK)
        SGU.DEF(8,MS,0,0000,0337)       :USER ADDRESSABLE AREA (WHOLE DISK)



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
:*	SLOT 1 - NETVAL
:**************************************************************************

NXLU1	EQ	3
	SGU.REF(1,0,2,SS+RD+WR+AT)	:CUD
	SGU.REF(1,1,3,SS+RD+WR+AT)	:MUD CHANGE AREA
        SGU.REF(1,2,4,RD+WR+AT)         :TAPE 0


        EI      (NDISC+NTAP+MSCDSK)

:**************************************************************************
:*	SLOT 2 - RAM
:**************************************************************************

NXLU2	EQ	3
        SGU.REF(2,0,4,RD+WR+AT)         :TAPE 0
	SGU.REF(2,1,6,SS+RD+WR+AT)	:RAM work area
	SGU.REF(2,2,5,SS+RD+WR+AT)	:RAM slot save area

        EI      (NDISC+NTAP+MSCDSK)
    