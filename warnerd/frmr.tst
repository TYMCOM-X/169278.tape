;;
;;      SET RELATIVE LINK NUMBER (0-31) IN THE FOLLOWING SYMBOL COMMAND.
;;
$A[CTLID:
((CTLID+2)/2)-1[CTRHW:
CTRHW*2[CTRHA:
((CTLID+$A16)/$A16)-1[CTRBH:
CTRBH*2[CTRBA:
CTLID-(CTRBH*$A16)[CTRBN:
CTLID#
CTRHW#
CTRHA#
CTRBA#
CTRBN#
CTRBH#
F128.F+CTRBA] HC 1^(($A16-CTRBN)-1)
P128.F+CTRBA] HC 1^(($A16-CTRBN)-1)
xsstat+CTRHA]       HC      0505
XSSTAT+CTRHA,2[
F128.F,4[
P128.F,4[
xsstat+ctlid,1:w
xpstat+CTRHA] HC      0505
xpstat+ctlid,1:w
xsstat+CTRHA]       HC      0303
xsstat+ctlid,1:w
f128.f,4:w
xsstat+CTRHA]       HC      0404
xsstat+ctlid,1:w
xpstat+CTRHA]       HC      0404
xpstat+ctlid,1:w
xsstat+CTRHA]       HC      0606
xsstat+ctlid,1:w
xsstat+CTRHA]       HC      0404
xsstat+ctlid,1:w
xsstat+CTRHA]       HC      0707
xsstat+ctlid,1:w
p128.f,4:w
xpstat+CTRHA]       HC      0606
xpstat+ctlid,1:w
xsstat+CTRHA]       HC      0808
xsstat+ctlid,1:w
:w p128.f,0
xsstat+CTRHA]       HC      0505
xsstat+ctlid,1:w
xpstat+CTRHA] HC      0303
xpstat+ctlid,1:w
   