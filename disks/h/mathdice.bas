10 PRINT TAB(31);"MATH DICE"
20 PRINT TAB(15);"CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY"
30 PRINT:PRINT:PRINT
40 PRINT "THIS PROGRAM GENERATES SUCCESSIVE PICTURES OF TWO DICE."
50 PRINT "WHEN TWO DICE AND AN EQUAL SIGN FOLLOWED BY A QUESTION"
60 PRINT "MARK HAVE BEEN PRINTED, TYPE YOUR ANSWER AND THE RETURN KEY."
70 PRINT "TO CONCLUDE THE LESSON, TYPE CONTROL-C AS YOUR ANSWER."
80 PRINT
90 PRINT
100 N=N+1
110 D=INT(6*RND(1)+1)
120 PRINT" ----- "
130 IF D=1 THEN 200
140 IF D=2 THEN 180
150 IF D=3 THEN 180
160 PRINT "I * * I"
170 GOTO 210
180 PRINT "I *   I"
190 GOTO 210
200 PRINT "I     I"
210 IF D=2 THEN 260
220 IF D=4 THEN 260
230 IF D=6 THEN 270
240 PRINT "I  *  I"
250 GOTO 280
260 PRINT "I     I"
265 GOTO 280
270 PRINT "I * * I"
280 IF D=1 THEN 350
290 IF D=2 THEN 330
300 IF D=3 THEN 330
310 PRINT "I * * I"
320 GOTO 360
330 PRINT "I   * I"
340 GOTO 360
350 PRINT "I     I"
360 PRINT " ----- "
370 PRINT
375 IF N=2 THEN 500
380 PRINT "   +"
381 PRINT
400 A=D
410 GOTO 100
500 T=D+A
510 PRINT "      =";
520 INPUT T1
530 IF T1=T THEN 590
540 PRINT "NO, COUNT THE SPOTS AND GIVE ANOTHER ANSWER."
541 PRINT "      =";
550 INPUT T2
560 IF T2=T THEN 590
570 PRINT "NO, THE ANSWER IS";T
580 GOTO 600
590 PRINT "RIGHT!"
600 PRINT
601 PRINT "THE DICE ROLL AGAIN..."
610 PRINT
615 N=0
620 GOTO 100
999 END
