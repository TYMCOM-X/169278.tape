:Patch name: NOMSG.PAT                Product and Version: MSV0 3.03
:    Author: MLN (MDIS)                      Organization: MDIS
:  Customer: Infolink                        Date written: 25/08/89
:
:Description:
:
:This patch is a special one off for Infolink to inhibit the "Building
:Circuit to Host" message that menuserver version 3.03 sends out.
:
PATCH(890824,2030,MNEWTON,PSNEED+62,,6)
	J	PA1PTR,,
:
:
CONPATCH(PA1PTR,,6)
	J	PSNEED+70,,
:
:
ENDPATCH(SKIP "BUILDING CIRCUIT TO HOST" MESSAGE)
:
:-EOF-
   