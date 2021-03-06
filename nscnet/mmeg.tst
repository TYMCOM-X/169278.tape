:****************************************************************
: Patch name:  MMEG.703 	Product and Version:  ISIS 7.03
:     Author:  Clive Rowe     	       Organization:  STS
:   Customer:  TYMNET		       Date Written:  02/01/89
: Reason for patch:
:    This is a special patch to default MAC set 0 for LOADII
:    and ELF if extended memory is used.
:****************************************************************
:
				:********************************
PATMAX	EQ	PATMAX+1	:
				:********************************
	RA	$0 0A		:
	REMARK	%ISIS 7.03 PATCH
	NUMBER	PATMAX
	REMARK	%This is a special patch to default MAC set 0
	REMARK	%for LOADII and ELF if extended memory is used.
	REMARK	%
	RA	0		:
				:********************************

:****************************************************************
:
:****************************************************************
:
				:********************************
	LO	KERNEL		:
	ORG	EXT040+8	:
	HC	0,0		:
	ORG	EXT040+8	:
	LA	R11,PATCH3	:
				:********************************
	ORG	PATCH3+4	:
	HC	0,0,0,0,0,0	:
	ORG	PATCH3+4	:
	ST	R4,UMAC,R1	:
	L	R11,KLINK	:
	J	4,R11		:
				:********************************
	FO	KERNEL		:
				:********************************

:****************************************************************
: This places the number of the last patch in PATLEV and must
:  remain at the end of the patch file.
:****************************************************************
:
				:********************************
	ORG	PATLEV		:
	HC	0		:
	ORG	PATLEV		:
	HC	PATMAX		:
				:********************************

:****************************************************************
: Check that there is no overflow in any of the patch areas.
:****************************************************************
:
				:********************************
	LO	DDT		:
	IF	DNEXT-HGHDDT	:
	REMARK	%%***  ERROR - DPATCH OVERFLOW  ***%%
	EI			:
	FO	DDT		:
				:********************************
	IF	SHARE		:
	LO	SHARE		:
	IF	HNEXT-(HPATCH+2*80))
	REMARK	%%***  ERROR - HPATCH OVERFLOW  ***%%
	EI			:
	FO	SHARE		:
	EI	(SHARE)		:
				:********************************
	LO	KERNEL		:
	IF	KNEXT-F1	:
	REMARK	%%***  ERROR - KPATCH OVERFLOW  ***%%
	EI			:
	FO	KERNEL		:
				:********************************
	IF	SNEXT-(SPATCH+(2*100))
	REMARK	%%***  ERROR - SPATCH OVERFLOW  ***%%
	EI			:
				:********************************
  