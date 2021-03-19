:*************************************************************************
:          FILE:  DSC PARAMETER FILE
:  COMPANY NAME:  DIALOG
:   NODE NUMBER:  2013                        LOCATION:  PALO ALTO
:   KERNEL HOST:    13
:      INITIALS:  GW                          DATE:   10-APRIL-84
:***************************************************************************
:>>>>>>>>>>>>>>>>>>>>>>>>>>>REVISION HISTORY<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
:***************************************************************************
	IF	NTAPE+MSCDSK

:	ISIS CONFIGURATION CONSTRAINTS
MXGLU	EQ	8		:MAX NO. OF DISTINCT UNITS OR DISC PARTITIONS

:       MSC-1400 DISC CONTROLLER CONFIGURATION
:               (ONLY REQUIRED IF IN USE)
MSCDA0  EQ      0F8             :CONTROLLER ZERO ADDRESS
NMSC0   EQ      1               :ONE DRIVES ON CONTROLLER 0
MSCCY0  EQ      $A 820          :CYLINDERS PER DRIVE
MSCTK0  EQ      $A 19           :TRACKS PER CYLINDER
MSCST0  EQ      $A 53           :SECTORS PER TRACK

:	ALLOCATION OF GLOBAL UNITS
:		EACH ENTRY HAS 5 PARAMETERS:
:			GLOBAL-UNIT NUMBER,
:			CONTROLLER TYPE (DK, MT, MS),
:			UNIT NUMBER,
:			START CYLINDER (DISCS ONLY),
:			NUMBER OF CYLINDERS (DISCS ONLY).

	SGU.DEF(1,MS,0,0000,0004)	: Node Save Area
	SGU.DEF(2,MS,0,0004,0004)	: Slot 1 Save Area
	SGU.DEF(3,MS,0,0008,0001)       : Slot 2 Save Area
	SGU.DEF(4,MS,0,0009,0001)       : Slot 3 Save Area
	SGU.DEF(5,MS,0,000A,0010)       : Slot 1 Work Area
	SGU.DEF(6,MS,0,001A,0314)	: Slot 2 Work Area
	SGU.DEF(7,MS,0,032E,0001)	: Slot 1 Backup Area
	SGU.DEF(8,MS,0,032F,0001)	: Slot 2 Backup Area


:	FLAGS
:	LICENCES MAY BE: RD, WR, AT, SS

:	SLOT 0 - NODE CODE
NXLU0	EQ	0

:	SLOT 1 - TMCS
NXLU1	EQ	$A 3
	SGU.REF(1,0,2,SS+RD+WR+AT)	:SAVE AREA
	SGU.REF(1,1,7,SS+RD+WR+AT)	:BACKUP AREA
	SGU.REF(1,2,5,SS+RD+WR+AT)	:WORK AREA


:       SLOT 2 - NEM
NXLU2   EQ      $A 3
        SGU.REF(2,0,3,SS+RD+WR+AT)      :SAVE AREA
        SGU.REF(2,1,8,SS+RD+WR+AT)      :BACKUP AREA
        SGU.REF(2,2,6,SS+RD+WR+AT)      :WORK AREA

	EI	(NTAPE+MSCDSK)

:	SLOT 3 - CONSAT
NXLU3	EQ	$A 1
	SGU.REF(3,0,4,SS+RD+WR+AT)	:SAVE AREA 