;; ENTER BOSS HOST # (0 TO DISABLE) [FOLLOWED BY CTRL-D (^D)]
$A[BHOST:
;; ENTER TEST HOST #  [FOLLOWED BY CNTRL-D (^D)]
$A[HOSTNO:
;; ENTER 1 TO STOP ON CRASH:  [FOLLOWED BY CNTL-D (^D)]
$A[CRSTOP:
;; ENTER 1 TO REFLECT GREEN BALLS [FOLLOWED BY CNTL-D (^D)]
$A[RECHO:
;; ENTER 1 TO PERMIT NONTEXT P1 MESSAGES [FOLLOWED BY CNTL-D (^D)]
$A[ANYMSG:
0[
 TITLE THROUGHPUT TESTING HOST         VERSION 15.00
111,60;%
;@(NTS)TPUT99.TYM
;@(ISIS2)START.LIB
;@(ISIS2)FRING.LIB
;@(ISIS2)BID.LIB
;@(ISIS2)CRASH.LIB
;@(NTS)TPUT99.NAD
;@(ISIS2)FINISH.LIB
 LO RING
 LO CRASH
 LO BID
;; ENTER OUTPUT FILENAME FOLLOWED BY CNTRL-D
1;F
CTA,CTASIZ;PSEG0,S0SIZE;PSEG1,S1SIZE;P%P%Q
  