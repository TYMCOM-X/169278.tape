File 1)	DSK:TRAP	created: 1150 15-FEB-89
File 2)	DSK:NOCMDL.TRP	created: 1000 04-JAN-89

1)1	:RPORT                                                  :1 BYTE
1)	:Pointer to command list 1 - CFLP1			:2 bytes
****
2)1	:Pointer to command list 1 - CFLP1			:2 bytes
**************
1)1	:DCB							:2 bytes
****
2)1	:RPORT							:1 byte
2)	:DCB							:2 bytes
**************
1)1	:COLLECT RPORT = 1 BYTE
1)	        STB     RPORT,TRAP,RARG,
1)	        AIS     RARG,1
1)	:
1)	:COLLECT FREE LIST POINTER 1 = 2 BYTES
****
2)1	:COLLECT FREE LIST POINTER 1 = 2 BYTES
**************
1)1	:COLLECT DCB = 2 BYTES
****
2)1	:COLLECT RPO RT = 1 BYTE
2)		STB	RPORT,TRAP,RARG,	:Store RPORT(Reg.1) to TRAP
2)		AIS	RARG,1			:Increase index to the next entry
2)	:
2)	:COLLECT DCB = 2 BYTES
**************
1)1		CHI	RWORK,20		:Are we at the end of TRAP?
1)		JLFS	EXIT01			:No - Increase index.
****
2)1		CLH	RWORK,20		:Are we at the end of TRAP?
2)		JLFS	EXIT01			:No - Increase index.
**************
1)1		AIS	RWORK,1			:Decrease by 1
1)		STH	RWORK,LKLEFT,,		:and update it.
****
2)1		SIS	RWORK,1			:Decrease by 1
2)		STH	RWORK,LKLEFT,,		:and update it.
**************
   