PROGRAM LOOP(TTY);
VAR
   A:INTEGER;
BEGIN
  REWRITE (TTY);
   FOR A:= 1 TO 20 DO
   WRITE(TTY,'NOW IS THE TIME FOR ALL GOOD MEN TO THE');
   WRITELN(TTY,' AID OF THEIR COUNTRY.');
END.