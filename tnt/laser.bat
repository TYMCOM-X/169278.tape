echo off
if %1 == on goto laser
if %1 == ON goto laser
goto stdn
:laser
mode com2:96,n,8,1,p
mode lpt1:=com2
goto end
:stdn
mode LPT1: > nul
:end
   