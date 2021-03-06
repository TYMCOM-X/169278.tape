;;**********************************************************************
;;*                                                                    *
;;*  File     : ACOM01.PAT                                             *
;;*  Customer : FIRN                                                   *
;;*  Comments : Original file - MCI.PAT                                *
;;*           : Use in all FIRN ACOM 2.03/2.04 code                    *
;;*                                                                    *
;;**********************************************************************

;; patch obviates end user from needing to enter control-r
;; and control-x at log-in. P.O'H. 5/8/85
;;
stc060]j p1end
p1end]jal r6,sndtc       ;; finish what was started
p1end+4]lis r10,0e       ;; STP type reverse x-enable
p1end+6]lis r11,1        ;; turn it ON
p1end+8]jal r6,sndtc     ;; send it
p1end+0c]lis r10,0c      ;; STP type x-enable
p1end+0e]lis r11,1       ;; turn it ON (not really necessary)
p1end+10]jal r6,sndtc    ;; send it
p1end+14]j stc060+4      ;; return
p1end+18]p1end:
   