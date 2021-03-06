.	<<	TSI.CBL	>>
The following section will describe the pinouts for the communications
ports on the TSI IOC board.  There are five (5) female connectors on the
front edge of the IOC board as follows:
.begin box

		TOP
              +------+
	      |  []  |   -->  Port 0 (DMA)      25 pin female connector
	      |  []  |   -->  Port 1 (DMA)      25 pin female connector
	      |      |
	      |  []  |   -->  Console port       9 pin female connector
              |      |	      
	      |  []  |   -->  Port 3 (Non-DMA)  15 pin female connector
	      |  []  |   -->  Port 2 (Non-DMA)  15 pin female connector
	      +------+
	       BOTTOM

.end box
.fill
.break

The pinout for the Console cable is as follows:
.begin box

	Pin   Signal 
	---   ------
	
	  1
	  2
	  3
	  4
	  5
	  7
	  8
	  9
	
.end box
.break
.fill

The pinouts for the DMA channels (ports 0 and 1) are as follows:
.begin box
     
           V.35                      V.24
	Pin   Signal        	  Pin   Signal
	---   ------              ---   ------
	
	  4   RTS                  
	  5   RLSD
	  6   DSR
	  7   GND	
	  9   TC (A)
	 10   TC (B)
	 11   TD (A)
	 12   TD (B)
	 21   RD (A)
	 22   RD (B)
	 23   RC (A)
	 24   RC (B)
	
	
	
.end box
.break
.fill

The pinouts for the Non-DMA channels (ports 0 and 1) are as follows:
.begin box

	Pin   Signal
	---   ------
	
	  2   TD
	  3   RD
	  4   RTS
	  5   CTS
	  6   DSR
	  7   S.GND
	  8   DCD
	 12   RC
	 14   DTR
	 15   TC
.end box
.break
.fill


Connections to these ports use standard cables:

       9-pin Console  port  Part# 160319-001
      15-pin Non-DMA  port  Part# 160321-001
      25-pin DMA      port  Part# 
      25-pin DMA V.35 port  Part# 160053-xxx





   