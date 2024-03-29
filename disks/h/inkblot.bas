100 PRINT TAB(26);"INKBLOT"
105 PRINT TAB(20);"CREATIVE COMPUTING"
110 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
115 PRINT:PRINT:PRINT
120 REM *** WORKS BY PLOTTING ELLIPSES AND THEIR MIRROR IMAGES
130 DIM A (12,13),B$(36),A$(36)
140 REM *** CHOOSE FROM 5 TO 12 ELLIPSES
150 M=INT(8*RND(1))+5
160 REM *** CREATE SIZE, LOCATION AND ANGLE OF M ELLIPSES
170 FOR L = 1 TO M
180 A(L,1) = 34*RND(1)
190 A(L,2) = 80*RND(1)
200 A(L,3) = (15*RND(1)+2)^2
210 A(L,4) = (15*RND(1)+2)^2
220 T=3.14159*RND(1)
230 A(L,5) = COS(T)
240 A(L,6) = SIN(T)
250 A(L,7) = A(L,5)*A(L,6)
260 A(L,5) = A(L,5)*A(L,5)
270 A(L,6) = A(L,6)*A(L,6)
280 A(L,8) = A(L,1)*A(L,1)*A(L,6)
290 A(L,9) = A(L,1)*A(L,1)*A(L,5)
300 A(L,10) = A(L,1)*A(L,7)
310 A(L,11) = -2*A(L,1)*A(L,6)
320 A(L,12) = -2*A(L,1)*A(L,5)
330 A(L,13) = A(L,6)/A(L,4)+A(L,5)/A(L,3)
340 NEXT L
350 REM *** PRINT TOP BORDER; B$ CONTAINS 36 DOLLAR SIGNS
360 B$="$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
370 PRINT B$;B$
380 PRINT B$;B$
390 REM *** LOOP Y IS Y-COORDINATE OF PLOT; EACH TIME Y LOOP
400 REM *** IS EXECUTED, A LINE IS PRINTED
410 FOR Y = 79.9 TO 0 STEP -1.6
420 A$="$$                                  "
430 REM *** LOOP E CHECKS THE EQUATION OF EACH ELLIPSE TO SEE
440 REM *** IF IT INTERSECTS THE LINE TO BE PRINTED
450 FOR E=1 TO M
460 Y1=Y-A(E,2)
470 Y2=Y1*Y1
480 Y3=Y1*A(E,10)
490 Y4=Y1*A(E,7)
500 B=(A(E,12)+Y4)/A(E,3)+(-Y4+A(E,11))/A(E,4)
510 C=(Y2*A(E,6)+A(E,9)-Y3)/A(E,3)+(Y2*A(E,5)+A(E,8)+Y3)/A(E,4)-1
520 REM *** R IS THE RADICAL IN THE STANDARD QUADRATIC FORMULA
530 R=B*B-4*A(E,13)*C
540 IF R<0 THEN 690
550 R=SQR(R)
560 REM *** FIND WHERE THE LINE INTERSECTS IN THE ELLIPSE
570 R1=INT(-(B+R)/2/A(E,13)+1)
580 IF R1>34 THEN 690
590 R2=INT((R-B)/2/A(E,13))
600 IF R2<1 THEN 690
610 IF R2<35 THEN 630
620 R2=34
630 IF R1>0 THEN 660
640 R1=1
650 REM *** FILL IN THE LINE WHERE IT CROSSES THE ELLIPSE
660 FOR J=R1+2 TO R2+2
670 A$=LEFT$(A$,J-1)+"$"+RIGHT$(A$,LEN(A$)-J)
680 NEXT J
690 NEXT E
700 REM *** PRINT LINE
710 PRINT A$;
720 FOR K=36 TO 1 STEP -1
730 PRINT MID$(A$,K,1);
740 NEXT K
745 PRINT
750 NEXT Y
760 REM *** PRINT BOTTOM BORDER
770 PRINT B$;B$
780 PRINT B$;B$
790 END
