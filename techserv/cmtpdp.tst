::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::								    ::
::	PATCH: CMTPDP.TST		DATE: 02/21/90		    ::
::	PROD:  CMTI			VERS: 11.01		    ::
::	BY:    PETER O'HARROW		TKT#: 287372		    ::
::	CUST:  NISNET						    ::
::								    ::
::	This patch is to be used only for CMTI 11.01 when genned    ::
::	on PDP-10 systems. Its intent is to bypass the limitation   ::
::	of PDP-10 NAD which doesn't support the TARGET directive.   ::
::	This patch, which must be assembled before the CMTI11.I01   ::
::	file, simply defines TARGET as a macro which equates the    ::
::	associated label to 1. This file should be used ONLY when   ::
::	the code is to be genned on a PDP-10 system - NEVER with    ::
::	NAD68 or with Sun System NAD.				    ::
::								    ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::	

 REMARK%%FOR USE ON PDP10-GENNED CODE ONLY - DO NOT USE ON SUN SYSTEMS%%

TARGET	MACRO	[EQ	1
	]

::	EOF - CMTPDP.TST
 