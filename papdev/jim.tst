File 1)	DSK:ROTARY.FTF	created: 2149 04-MAR-94
File 2)	DSK:SOTARY.FTF	created: 1442 09-MAR-94

1)1	        INTEGER GRCNT,RCOUNT,TRCNT
1)	        REAL MTTR,ELM,SUBELM,SUBMTR,GRELM,GRMTR,SUBPCT,GRPCT
****
2)1	        INTEGER GRCNT,RCOUNT,TRCNT,TNUM,TKTS,REFS,WHATDB,TEST
2)	        INTEGER HN
2)	        REAL MTTR,ELM,SUBELM,SUBMTR,GRELM,GRMTR,SUBPCT,GRPCT
**************
1)1	25      CALL DBOPEN('(TNT)BASE4')
1)	        OPEN(8,'(TNT)USRNOS.DAT',INPUT)
****
2)1	25      CALL DBOPEN('(TNT)BASE4','(TNT)BASE7')
2)	        OPEN(8,'(TNT)USRNOS.DAT',INPUT)
**************
1)1	        RCOUNT=0
****
2)1	        TEST=2
2)	         RCOUNT=0
**************
1)1	        CALL DBVAL(54,ELM)
1)	        MTTR=MTTR+ELM
****
2)1	        CALL DBVAL(54,ELM,1,TNUM)
2)	        MTTR=MTTR+ELM
**************
1)1	        NUMBER=0
****
2)1	        TEST=1
2)	        CALL DBFIND(43,1,CKT)
2)	        CALL DBNREC(NUMBER)
2)	        IF(NUMBER.EQ.0) GOTO 36
2)	        CALL DBMAP(2,'TNUM','TNUM')
2)	        CALL DBSRCH('MAINT',1,'NETCO')
2)	        CALL DBNREC(REFS)
2)	        IF(REFS.EQ.0) GOTO 35
2)	        CALL DBMAP(1,'TNUM','TNUM')
2)	        CALL DBNREC(TKTS)
2)	        IF(TKTS.EQ.0) GOTO 34
2)	        DO 34 I=1,TKTS
2)	        CALL DBGREC($1000,I)
2)	        CALL DBVAL(1,TNUM,53,HN)
2)	        IF (HN.EQ.2) TYPE 33,TNUM
2)	33      FORMAT(/1X,I8,3X,'**********')
2)	        IF (HN.NE.2) TYPE 35,TNUM
2)	34      CONTINUE
2)	35      FORMAT(/1X,I8)
2)	        CALL DBSET(1)
2)	        CALL DBFIND(43,1,CKT)
2)	        CALL DBNREC(NUMBER)
2)	        IF(NUMBER.EQ.0) GOTO 36
2)	        CALL DBMAP(2,'TNUM','TNUM')
2)	        CALL DBSRCH('MAINT',1,'NCCTS')
2)	        CALL DBNREC(REFS)
2)	        IF(REFS.EQ.0) GOTO 36
2)	        CALL DBMAP(1,'TNUM','TNUM')
File 1)	DSK:ROTARY.FTF	created: 2149 04-MAR-94
File 2)	DSK:SOTARY.FTF	created: 1442 09-MAR-94

2)	        CALL DBNREC(TKTS)
2)	        IF(TKTS.EQ.0) GOTO 36
2)	        DO 37 I=1,TKTS
2)	        CALL DBGREC($1000,I)
2)	        CALL DBVAL(1,TNUM,53,HN)
2)	        IF (HN.EQ.2) TYPE 33,TNUM
2)	        IF (HN.NE.2) TYPE 35,TNUM
2)	36      CALL DBSET(1)
2)	37      CONTINUE
2)	        REFS=0
2)	        TKTS=0
2)	        I=0
2)	        NUMBER=0
**************
1)1	        CALL DBCLOSE
****
2)1	        CALL DBCSET(WHATDB)
2)	        TYPE 1010,TNUM,WHATDB,NUMBER,REFS,TKTS,I,TEST
2)	1010    FORMAT(/1X,I8,I3,I3,I3,I3,I3,I3)
2)	        CALL DBCLOSE
**************
