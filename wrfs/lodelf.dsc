

TO LOAD THE ELF SLOT FROM DISK FOLLOW THE INSTRUCTIONS
BELOW....BEAR IN MIND THAT YOU   MAY NOT !!! MAKE TYPOS.


1.   LOG INTO  ISISTECH:121;PW (CR)
2.   ENTER SLOT # (NO CR)


THE FOLLOWING COMMANDS ARE ENTERED AT THE   *   PROMPT.

3.   ENTER   H   (NO CR).....THIS HALTS THE SLOT
4.   ENTER   I   (NO CR).....THIS INITIALIZES THE SLOT
5.   ENTER   A   (NO CR).....THIS SETS UP THE MAC
6.   ENTER   LL 7,1,0E0000,100  (CR)    .....LOADS SEGMENT E
7.   ENTER   ?LMAC (CR)   .....LOADS THE MAC AREA
8.   ENTER   LL 7,2,0,3400   (CR)   .....LOADS NEXT SEGMENT
9.   ENTER   LL 7,36,10000,4E00 (CR)   .....LOADS NEXT SEGMENT
10.  ENTER   LL 7,84,20000,10000   (CR)   .....LOADS NEXT SEGMENT
11.  ENTER   LL 7,184,30000,10000  (CR)   .....LOADS NEXT SEGMENT
12.  ENTER   LL 7,284,40000,9D00   (CR)   .....LOADS NEXT SEGMENT



13.   ENTER   E   (NO CR)   AT THE   *   PROMPT TO BRING UP THE SLOT
 
14.   ENTER   ?HOST   (CR)   AT THE   *   PROMPT UNTIL THE HOST ANSWERS.
 
15.   ENTER   Z  (NO CR)  FOLLOWED BY ANOTHER   Z  (NO CR)  TO EXIT SLOT

   