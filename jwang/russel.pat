:
: FILENAME RUSSEL.PAT,  ***ANOTHER PATCH RUSSEL.TYM SHOULD BE 
:      ASSEMBLED BEFORE THIS PATCH.
:*****************************************************************
: VERSION 3.01.
:
: TASK: 1. CHECK THE FLAG 'FRLINK' TO SEE IF THIS IS THE FRANK-RUSSEL
:          LINK. IF NOT, STOP THIS SPECIAL PROCESS.
:           NOTE: THIS PATCH FUCTION WILL BE BASED ON LINK.
:       2. CHECK THE DNIC OF CALLED ADDRESS TO SEE IF IT IS A CALL TO
:          JAPAN NIS. IF NOT, STOP THIS SPECIAL PROCESS.
:       3. INSERT 'PROTOCOL ID' + 'USERNAME' + <3B> + 'PASSWORD' + '<C/R>'
:          INTO CUD.
:          NOTE: DESTINATION XCOM MAY NEED TO BE PATCHED TO REMOVE THIS
:                EXTRA 'PROTOCOL ID' BEFORE PASS THE CALL REQUEST TO HOST.

PATCH(870206,1700,JWANG,PA0PTR,,14)
REG1    WC      0       :DEFINE TEMPORARY SAVE AREAS
REG2    WC      0
REG3    WC      0
REG4    WC      0
REG5    WC      0
CONPATCH(PCR500,,6)
        J       PA1PTR,,
CONPATCH(PA1PTR,,154)
        L       R5,TEMP,,
        L       R6,TEMP1,,
:**********************************************************
:  TASK 1. CHECK IF THIS IS THE FRANK RUSSEL LINK
:***************************************************************
        TBT     RL,FRLINK,,
        JE      PCR500+8,,      :IF NOT FRANK RUSSEL, STOP
:**************************************************************
:  TASK 2. CHECK IF THE CALL IS TO JAPAN NIS
:**************************************************************
        ST      R0,REG1,,
        ST      R8,REG2,,
        ST      R4,REG3,,
        ST      R7,REG4,,
        ST      R1,REG5,,
        LHL     R4,IPORT
        SLLS    R4,3
        LB      R8,DTESAX+1,R4, :FIRST BYTE DNIC
        SLLS    R8,8
        LB      R0,DTESAX+2,R4, :SECOND BYTE OF DNIC
        OR      R0,R8
        LHL     R8,JPDNIC       :GET NIS DNIC
        CR      R0,R8           :CHECK IF THIS IS A CALL TO NIS
        JE      FRANK           :YES,START SPECIAL PROCESS
        L       R0,REG1,,
        L       R8,REG2,,
        L       R4,REG3,,
        L       R7,REG4,,
        L       R1,REG5,,
        J       PCR500+8,,
:***************************************************************
:  TASK 3. INSERT PID AND USERNAME AND PASSWORD
:          LFRPID,FRUSRN,FRPWSD ARE DEFINED IN RUSSEL.TYM
:****************************************************************
FRANK   LIS     R7,2            :2 BYTES FOR SEMICOLON AND C/R
        LB      R0,FRPID,,
        AR      R7,R0           :PLUS LENGTH OF PID
        LB      R0,FRUSRN,,
        AR      R7,R0           :PLUS LENGTH OF USERNAME
        LB      R0,FRPSWD,,
        AR      R7,R0           :PLUS LENGTH OF PASSWORD
        AR      R7,R6           :PLUS ORIGINAL CUD LENGTH
        LR      R0,R7
        AIS     R0,2            :PLUS IIX C089 MESSAGE TYPE --2 BYTES
:-----------------------------------------------------------------------
: HERE IS TO BUILD IIX C089 HEADER
:-----------------------------------------------------------------------
        LHL     R1,FACBUF
        JAL     R4,WCI,,
        LHI     R0,EXM9
        JAL     R4,WCI,,
        LR      R0,R7           :REAL LENGTH OF CUD
        JAL     R4,WCI,,
:--------------------------------------------------------------------------
: COPY PROTOCOL ID FROM FRPID
:-------------------------------------------------------------------------
        LB      R7,FRPID,,
        LIS     R8,0
CPPID   LB      R0,FRPID+1,R8,
        JAL     R4,WCI,,
        AIS     R8,1
        CR      R8,R7
        JL      CPPID
:-----------------------------------------------------------------------
: COPY USERNAME FROM FRUSRN AND THEN ADD SEMICOLON
:----------------------------------------------------------------------
        LB      R7,FRUSRN,,
        LIS     R8,0
CPUSRN  LB      R0,FRUSRN+1,R8,
        JAL     R4,WCI,,
        AIS     R8,1
        CR      R8,R7
        JL      CPUSRN
        LHI     R0,3B           :ADD SEMICOLON
        JAL     R4,WCI,,
:--------------------------------------------------------------------------
: COPY PASSWORD FROM FRPWSD AND THEN ADD <C/R>
:------------------------------------------------------------------------
        LB      R7,FRPSWD,,
        LIS     R8,0
CPPWSD  LB      R0,FRPSWD+1,R8,
        JAL     R4,WCI,,
        AIS     R8,1
        CR      R8,R7
        JL      CPPWSD
        LHI     R0,0D           :ADD <C/R>
        JAL     R4,WCI,,
:--------------------------------------------------------------------------
: COPY ORIGINAL CUD TO FACBUF
:------------------------------------------------------------------------
CPREST  JAL     R4,PICKCH,,
        JAL     R4,WCI,,
        LR      R6,R6
        JN      CPREST
        L       R0,REG1,,
        L       R8,REG2,,
        L       R4,REG3,,
        L       R7,REG4,,
        L       R1,REG5,,
        J       PCR520+4,,
ENDPATCH(INSERT PID AND USERNAME AND PASSWORD INTO CUD)
  