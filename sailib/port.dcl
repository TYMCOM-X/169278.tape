
forward external boolean procedure !PORTX(boolean enablePorts);

COMMENT	enable/disable port-handling PRINT trap.
	!portx(true) enables trap code
	!portx(false) disables trap code
	Return value is whether the trap used to be on.
	!portx(!portx(anything)) is a no-op

	While the trap is on, any CPRINT done with a channel number
of the form "1b0+portNumber" will output to the specified port.  If
you had any Print traps on at the time of the call, they are carefully
remembered, and all "channel" numbers not formed as above will still
procede to your print trapping routines.  If you did not, PRINT and
CPRINT should perform correctly for all of the legitimate values of
"channel", but identical behavior for illegal values is not guaranteed.
;

    