find dup bet int("12/29/91") int("02/01/92") and sver 1 and hn lt 5 and ne 2.
find SRGN neq MDHK MDAUS BTAUS BTHK NIS.
select elm ge 0.
sort dup.
report start.
section initial.
section getrec.
section heading.
 on start print "   Date      Count     Mean  ELM  StdDev ELM  Hi ELM    Lo ELM".
section print.
section totals.
 on change Dup  print Dup  tot 1  mean ELM  stdev ELM  Max ELM  min ELM FORMAT
                      D2   I6       F9.2       F9.2      I11      I11   END.
section final.
report end.
    