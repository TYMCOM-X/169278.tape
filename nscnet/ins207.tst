:---------------+--------------------------------------------------------------
: Interface     : xcom (x.75)
: Version       : 04.03/SOURCE
: Author        : Hitoshi Obata
: Date          : 11 NOV. 1991
: Purpose       : To support DTE chargable call from ins-p user.
: Function      : (1) Check if called pnic is 207.
:               : (2) If the pnic is 207, then the call is treated as
:               :     calling DTE chargable call.  So, the username is
:               :     constracted from the calling address.
:               : (3) And the destination host number is extracted
:               :     from called address.
:               :
:               :     Calling Address : 081335510171
:               :     Called  Address : 440620701234
:               :     Login   Strings : 081335510171:1234<semi-colon><cr>
:               :
: Generation	: This patch should be installed into only the gateway
:		: interfaces for ins-p.
:---------------+--------------------------------------------------------------
PATCH(911111,1000,Hitoshi Obata,PA0PTR,,14)
        BND     4
INSNUI  BS      14                      : LOGIN STRING STORAGE
 
CONPATCH(PCR464+14,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,0D0)
        CL      R0,HIHST,,              : NTN > HIHST NUMBER ?
        JLE     PCR466,,                : NO, THEN RETURN TO MAIN
 
INSP10                                  : R7 HAS INDEX TO CALLED ADDRESS HERE
        LB      R1,DTESAX+3,R7,         : GET DIGIT 5TH AND 6TH OF CLDADR
        SLLS    R1,8
        LB      R0,DTESAX+4,R7,         : GET DIGIT 7TH AND 8TH OF CLDADR
        OR      R1,R0
        SRLS    R1,4                    : DROP 8TH DIGIT, R1 <- PNIC
        CHI     R1,207                  : IS IT DTE CHARGABLE CALL ?
        JN      PCR490,,                : NO, THEN GO FOR CALLED NTN USERNAME
 
INSP20  XR      R4,R4
        XR      R1,R1
INSP30  LB      R0,DTESAV+1,R7,R4       : CONVERT ADDRESS TO ASCII CODE
        NHI     R0,0F0
        SRLS    R0,4
        AHI     R0,30
        STB     R0,INSNUI+1,R1          : STORE IT
        AIS     R1,1                    : POSITION <-- POSITION + 1
        CLB     R1,DTESAV,R7,           : WAS IT THE LAST DIGIT ?
        JE      INSP40                  : YES, THEN GO FOR ':'
 
        LB      R0,DTESAV+1,R7,R4
        NHI     R0,0F
        AHI     R0,30
        STB     R0,INSNUI+1,R1          : STORE IT
        AIS     R1,1                    : POSITION <-- POSITION + 1
        CLB     R1,DTESAV,R7,           : WAS IT THE LAST DIGIT ?
        JEFS    INSP40                  : YES, THEN GO FOR ':'
        AIS     R4,1                    : COUNT UP BYTE POSITION
        J       INSP30                  : GO FOR NEXT ADDRESS BYTE
 
INSP40  LHI     R3,3A                   : STORE ':'
        STB     R3,INSNUI+1,R1
        AIS     R1,1
 
        XR      R4,R4
INSP50  LB      R0,DTESAX+5,R7,R4       : CONVERT 5TH AND 6TH BYTES TO
        SRLS    R0,4                    : DESTINATION HOST NUMBER
        AHI     R0,30
        STB     R0,INSNUI+1,R1
        AIS     R1,1
        LB      R0,DTESAX+5,R7,R4
        NHI     R0,0F
        AHI     R0,30
        STB     R0,INSNUI+1,R1
        AIS     R1,1
        AIS     R4,1
        CHI     R4,2                    : CONVERT COMPLETED ?
        JL      INSP50                  : NO, THEN GO FOR NEXT BYTE
 
	LHI	R3,3B			: STORE <semi-colon>
	STB	R3,INSNUI+1,R1
	AIS	R1,1
	LHI	R3,0D			: STORE <cr>
	STB	R3,INSNUI+1,R1
	AIS	R1,1			: HERE, R1 HAS LENGTH OF L-STRINGS
        STB     R1,INSNUI               : STORE THE LENGTH
 
        LA      R8,INSNUI
        LHL     R1,IPORT
        J       PCR450,,                : GO FOR LOGIN
 
ENDPATCH(SUPPORT CALLING DTE CHARGABLE CALL FOR INS-P USER)
 