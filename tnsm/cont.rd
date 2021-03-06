

   The previous Annexe 14 has to be reviewed in consequencies of
the meeting between AF and BT (03/01/90).

   All bugs described in this Annexe will be removed from it because BT
stated that they have to be fixed and therefore cannot be in an 
contractual document.
   A list of these bugs will be separately written and regularly 
updated.



                 Annexe    14
                 -------------

1.1.1
Standard IBM documentation and equipments lists agreed by both parts 
will be used as a reference for the behaviour of Tymnet interfaces and
AF applications and equipments.In case this documentation does not
fully specify certain IBM functions,Tymnet is free to adopt any
implementation which is permitted in the documentation and equipment
lists.
This lists will be updated in case of new Tymnet code integrating new
features.

1.1.2.1  End to end acknowledgement of data:
The end to end acknowledgement of data from host to terminal is the only
requirement.This means that a message from the host must be acknowledged
by the terminal if the feature is required.

BTT must offer the capability to define at the generation an end to end
acknowledgement terminal by terminal.

1.1.2.2 Display of TMCS messages:
TMCS messages from SNA interfaces must be equivallent to TMCS messages
from BSC interfaces.

1.1.2.3 Device activation/deactivation:
Tymnet must offer the capability to declare in HIF and TIF tymfiles
- inactive terminals and PUs for BSC interfaces
- Inactive LUs and PUs for SNA interfaces
- Inactive PUs for SDLC interfaces

These devices could be activable and inactivable through monitor
commands.

1.1.3.1 256 LUs generation :
The restriction is 256 LUs per interface due to the memory size of an 
engine.
This restriction is acceptable to AF IBM pilot network.
However 256 LUs per PUs will be necessary to AF for their global IBM
network.

1.1.4.1 SNA virtual mode:LU1-LU3 conversion
TYmnet network must be able to convert the basic lu1 SCS data stream
as required by AF to 3270 data stream for printer connection.

1.1.4.2 RU mapping in SNA virtual mode
The mapping of the SNA information must be done according to the
specifications agreed by both parts during the meeting (03/01/90).


:s bte.i/ancelet
annex 14
    