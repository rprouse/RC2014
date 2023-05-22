10 PRINT TAB(26);"SHOOT"
20 PRINT TAB(20);"CREATIVE COMPUTING"
30 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
40 PRINT:PRINT:PRINT
110 INPUT "DO YOU WANT INSTRUCTIONS";A$
120 IF LEFT$(A$,1)<>"Y" GOTO 440
130 PRINT
140 PRINT " IT IS THE FINAL HOUR OF MAN. YOU AND A WARRING NATION"
150 PRINT "HAVE ENTERED INTO A LAST CONTEST. ALL THE LIFE NOW LEFT ON"
160 PRINT "EARTH ARE YOU AND YOUR ENEMY. BOTH HE AND YOU HAVE FOUND THE"
170 PRINT "LAST REMAINING ATOMIC MISSILE SILO MATRICES ESTABLISHED BY"
180 PRINT "THE NOW-DEAD SUPERPOWERS. HE, LIKE YOU, WISHES NOT TO DIE"
190 PRINT "BUT TO LIVE IN PEACE."
200 PRINT " HOWEVER IT HAS BECOME APPARENT THAT HE FEELS HIS PEACE"
210 PRINT "THREATENED AND IS PREPARING AN ATTACK. BOTH YOU AND HE HAVE"
220 PRINT "SCANNERS THAT WILL WARN YOU OF HIS MOVEMENTS AND TRACK THE"
230 PRINT "FLIGHT OF HIS ATOMIC MISSILES, THUS HE IS WORKING SLOWLY."
240 PRINT "THE ENEMY, LIKE YOURSELF, HAS A MISSILE GRID NEARLY"
250 PRINT "IDENTICAL IN STRUCTURE AND OPERATION TO YOURS, BECAUSE YOU"
260 PRINT "ARE THE ONLY ONE LEFT, IT WILL BE NECESSARY TO FIRE ALL YOUR"
270 PRINT "MISSILES MANUALLY. ONCE THE FUSE IS SET, YOU MUST FLEE THE"
280 PRINT "AREA AND GET TWO GRID UNITS AWAY. YOU MAY NEVER RETURN TO"
290 PRINT "THIS SPOT, OR A SPOT WHERE A MISSILE HAS LANDED; THE"
300 PRINT "RADIATION IS INTENSE AND WOULD MEAN AN INSTANT, PAINFUL"
310 PRINT "DEATH."
320 PRINT " SO THE STAGE HAS BEEN SET. THERE IS PEACE UNTIL THE"
330 PRINT "SIGN THAT THE ENEMY HAS MOVED TO HIS MISSILE RANGE. HE WILL"
340 PRINT "FIRE EVERY TIME YOU WILL, AND DO SO UNTIL ONE OF YOU IS"
350 PRINT "DESTROYED."
360 PRINT " EACH TIME A ROUND OF MISSILES HAS BEEN FIRED, THE"
370 PRINT "SCANNERS WILL REPORT THE STATUS OF BOTH YOUR'S AND THE ENEMY'S"
380 PRINT "GRID TERRITORY. IT WILL SHOW ALL AREAS THAT HAVE HAD EITHER"
390 PRINT "A MISSILE HIT OR A MISSILE FIRED FROM IT. WITH THIS"
400 PRINT "CONTINUALLY UPDATED MAP, YOU MAY BE ABLE TO INDUCTIVELY"
410 PRINT "DISCOVER OR TRAP YOUR OPPONENT. BEWARE, HE WILL BE TRYING TO"
420 PRINT "DO THE SAME TO YOU."
430 PRINT
440 G$="  -12345678910"
450 C$="SCANNER COMPUTER: "
460 S$=""
470 FOR X=1 TO 14
480 S$=S$+" "
490 NEXT X
510 DIM I(10,10),H(10,10),T(8,2),P(8,2)
520 DATA 10,10 , 1,1 , 10,1 , 1,10 , 10,9 , 9,10 , 1,2 , 2,1
530 DATA -2,-2 , 0,-2, 2,-2, 2,0 , 2,2 , 0,2 ,-2,2 ,-2,0
540 R=INT(RND(1)*8+1)
550 FOR X=1 TO R
560 READ A,B
570 NEXT X
580 FOR X=1 TO 10
590 FOR Y=1 TO 10
600 I(X,Y)=0
610 H(X,Y)=0
620 NEXT Y
630 NEXT X
640 IF A=2 GOTO 690
650 FOR X=1 TO 8
660 READ C,D
670 IF C=2 GOTO 690
680 NEXT X
690 FOR X=1 TO 8
700 FOR Y=1 TO 2
710 READ P(X,Y)
720 NEXT Y
730 NEXT X
740 PRINT C$;"ENEMY ACTIVITY ON GRID AT";A;",";B
750 PRINT
760 INPUT "YOUR STARTING CO-ORDINATES";E,F
770 IF E<1 OR E>10 OR F<1 OR F>10 GOTO 760
780 Z=1
790 I(E,F)=1
800 H(A,B)=1
810 PRINT
820 GOTO 1490
830 INPUT "MISSILE CO-ORDINATES";M,N
840 IF M<1 OR M>10 OR N<1 OR N>10 GOTO 830
850 INPUT "WHERE TO MOVE TO";S,T
860 IF S<1 OR S>10 OR T<1 OR T>10 GOTO 850
870 IF I(S,T) = 1 GOTO 850
880 FOR X=1 TO 8
890 IF P(X,1)+E=S AND P(X,2)+F=T GOTO 920
900 NEXT X
910 GOTO 850
920 PRINT
930 L=1
940 FOR X=1 TO 8
950 IF P(X,1)+E>10 OR P(X,1)+E<1 OR P(X,2)+F>10 OR P(X,2)+F<1 GOTO 1000
960 IF  I(P(X,1)+E,P(X,2)+F)=1 GOTO 1000
970 T(L,1)=P(X,1)+E
980 T(L,2)=P(X,2)+F
990 L=L+1
1000 NEXT X
1010 L=L-1
1020 IF L<>1 GOTO 1060
1030 C=T(L,1)
1040 D=T(L,2)
1050 GOTO 1090
1060 G=INT(RND(1)*L+1)
1070 C=T(G,1)
1080 D=T(G,2)
1090 L=1
1100 FOR X=1 TO 8
1110 IF P(X,1)+A>10ORP(X,1)+A<1 OR P(X,2)+B>10ORP(X,2)+B<1 THEN 1160
1120 IF H(P(X,1)+A,P(X,2)+B)=1 GOTO 1160
1130 T(L,1)=P(X,1)+A
1140 T(L,2)=P(X,2)+B
1150 L=L+1
1160 NEXT X
1170 L=L+1
1180 IF L<>0 GOTO 1220
1190 PRINT C$;"THE ENEMY HAS CORNERED HIMSELF IN!!"
1200 Z=0
1204 C=E
1207 D=F
1210 GOTO 1290
1220 IF L<>1 GOTO 1260
1230 J=T(1,1)
1240 K=T(1,2)
1250 GOTO 1290
1260 G=INT(RND(1)*L+1)
1270 J=T(G,1)
1280 K=T(G,2)
1290 I(E,F)=1
1300 H(A,B)=1
1310 I(C,D)=1
1320 H(M,N)=1
1330 IF M<>J OR D<>T GOTO 1390
1340 PRINT C$J"HEY! YOU GOT HIM!!"
1350 Z=0
1360 IF C<>S OR D<>T GOTO 1390
1370 PRINT C$;"YOU MOVED RIGHT UNDER HIS MISSILE!!"
1380 Z=0
1390 E=S
1400 F=T
1410 A=J
1420 B=K
1430 FOR X=1 TO 8
1440 IF P(X,1)+E>10ORP(X,1)+E<1 OR P(X,2)+F>10ORP(X,2)+F<1 GOTO 1460
1450 IF I(P(X,1)+E,P(X,2)+F)=0 GOTO 1490
1460 NEXT X
1470 PRINT C$;"FOOL! YOU HAVE BOXED YOURSELF INTO A CORNER!!"
1480 Z=0
1490 PRINT " YOUR TERRITORY ","ENEMY TERRITORY"
1500 PRINT
1510 PRINT G$;S$;G$
1520 FOR X=1 TO 10
1530 IF X=10 GOTO 1560
1540 PRINT X;
1550 GOTO 1570
1560 PRINT "10 ";
1570 FOR Y=1 TO 10
1580 IF I(X,Y)=1 GOTO 1610
1590 PRINT ":";
1600 GOTO 1620
1610 PRINT "*";
1620 NEXT Y
1630 PRINT " ";S$;
1640 IF X=10 GOTO 1670
1650 PRINT X;
1660 GOTO 1680
1670 PRINT "10 ";
1680 FOR Y=1 TO 10
1690 IF H(X,Y)=1 GOTO 1720
1700 PRINT ":";
1710 GOTO 1730
1720 PRINT "*";
1730 NEXT Y
1740 PRINT
1750 NEXT X
1760 PRINT
1770 IF Z=1 GOTO 830
1780 END