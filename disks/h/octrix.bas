1 PRINT TAB(27)"OCTRIX"
2 PRINT TAB(20)"CREATIVE COMPUTING"
3 PRINT TAB(18)"MORRISTOWN, NEW JERSEY"
5 PRINT
6 PRINT
7 PRINT
10 DIM A(32),P(4,9),C$(255),Q(4,11),T$(72)
11 DIM N$(72),Y(72)
40 RESTORE
50 FOR X=0 TO7
60 READY$(X)
70 NEXT X
80 FOR X=0 TO 3
90 READ X$(X)
100 NEXT X
110 DATA"ACE","TWO","THREE","FOUR","FIVE","SIX","SEVEN","EIGHT"
120 DATA"CLUBS","DIAMONDS","HEARTS","SPADES"
130 FOR X=0 TO 9
140 READ T$(X)
150 DATA "A","2","3","4","5","6","7","8","LOW","HIGH"
160 NEXT X
170 PRINT"TEACH GAME(Y OR N)";
180 INPUT Z$
190 IF Z$<>"Y" THEN 380
200 PRINT"  THIS  IS A GAME CALLED OCTRIX.  EACH PLAYER IS DEALT 8"
210 PRINT"CARDS RANGING FROM ACE THROUGH EIGHT.  THE CARDS ARE"
220 PRINT"RANKED ACCORDING TO BRIDGE SUITS WITH THE ACE OF CLUBS THE"
230 PRINT"LOWEST AND THE EIGHT OF SPADES HIGHEST.  THE OBJECT IS TO"
240 PRINT"WIN AS MANY OF THE EIGHT TRICKS AS POSSIBLE.  EACH TRICK "
250 PRINT"PLAYED DETERMINES THE PLAY OF THE NEXT TRICK.  IF THE HIGH "
260 PRINT"AND LOW CARDS PLAYED MATCH COLOR THE NEXT TRICK WILL BE "
270 PRINT"HIGH AND IF THEY DO NOT MATCH IT WILL BE LOW.  IT IS IM-"
280 PRINT"PORTANT TO SET STRATEGY TO WIN CONSECUTIVE TRICKS IN THAT "
290 PRINT"SCORING IS 1 POINT PER TRICK, 4 FOR TWO IN A ROW,9 FOR 3, UP"
300 PRINT"TO 64 FOR ALL EIGHT."
305 PRINT
310 PRINT"    RESPOND TO THE INPUT PROMPT WITH THE CARD YOU WANT TO"
320 PRINT"PLAY IN A TWO CHARACTER FORMAT WITH THE VALUE(A-8) AS THE "
330 PRINT"FIRST CHARACTER, AND SUIT(C,D,H,S) AS THE SECOND CHARACTER."
340 PRINT"    (TO SEE THE REMAINING CARDS, ENTER A'P' IN"
350 PRINT"    RESPONSE TO THE 'WHAT CARD' QUERY)"
360 PRINT
370 PRINT"THAT'S IT, GOOD LUCK!!"
380 REM
390 FOR X=1 TO 15
400 READ Z
410 M$=M$+CHR$(Z)
420 NEXT X
430 DATA 35,35,35,35,13,72,72,72,72,13,73,73,73,73,13
440 Z9=88
450 PRINT"HOW MANY POINTS (0 ENTRY GIVES STANDARD 88)";
460  INPUT Z
470 IF Z=0 THEN 490
480 Z9=Z
490 FOR X=0 TO 31
500 A(X)=X
510 NEXT X
520 PRINT"HOW MANY PLAYERS";
530 INPUT N
540 N=INT(N)
550 IF N>4 THEN 570
560 IF N>0 THEN 590
570 PRINT"ONLY ONE TO FOUR PLAYERS ALLOWED, RE-ENTER"
580 GOTO 520
590 FOR X=0 TO N-1
600 Q(X,0)=0
610 PRINT"ENTER PLAYER'S NAME";
620 INPUT N$(X)
630 Y=LEN(N$(X))
640 FOR Z=1 TO Y
650 T$=MID$(N$(X),1,Z-1)
660 IF T$=" " THEN 680
670 NEXT Z
680 IF Z>1 THEN 710
690 PRINT"DON'T START NAME WITH SPACE,RE-";
700 GOTO 610
710 S$(X)=MID$(N$(X),1,Z-1)
720 NEXT X
730 FOR J=0 TO 127
740 C$(J)=" "
750 NEXT J
760 IF N=4 THEN 850
770 IF N=1 THEN 810
780 PRINT"SHOULD I PLAY TOO(Y OR N)";
790 INPUT Z$
800 IF Z$<>"Y" THEN 850
810 S$(N)="COMPUTER"
820 N$(N)="I"
830 Q(N,0)=0
840 N=N+1
850 FOR I=0 TO 31
860 X=A(I)
870 Y=INT(RND(1)*(32-I)+I)
880 A(I)=A(Y)
890 A(Y)=X
900 NEXT I
910 FOR Y=0 TO 7
920 FOR X=0 TO N-1
930 P(X,Y)=A(Y*4+X)
940 C$(X*32+P(X,Y))="*"
950 NEXT X
960 NEXT Y
970 H=1
980 GOSUB 1680
990 FOR R=1 TO 7
1000 PRINT"TRICK #";R;"("T$(8+H)" CARD WINS)"
1010 FOR X=0 TO N-1
1020 IF S$(X)="COMPUTER"THEN 2090
1030 Z=Z*Z
1040 PRINT"WHAT CARD, "S$(X)
1050 PRINT M$;
1060 INPUT E$
1070 IF E$<>"P" THEN 1100
1080 GOSUB 1680
1090 GOTO 1040
1100 Y=LEN(E$)
1110 IF Y=2 THEN 1140
1120 PRINT"BAD INPUT,RE-ENTER"
1130 GOTO 1050
1140 Y$=MID$(E$,1,1)
1150 Z$=MID$(E$,2,1)
1160 IF VAL(Y$)>0 THEN 1190
1170 IF Y$<>"A" THEN 1120
1180 Y$="1"
1190 Y=VAL(Y$)
1200 IF Y=0 THEN 1120
1210 IF Y>8 THEN 1120
1220 Z=0
1230 Q(X,10)=0
1240 IF Z$="C" THEN 1320
1250 Z=3
1260 IF Z$="S" THEN 1320
1270 Q(X,10)=1
1280 Z=1
1290 IF Z$="D" THEN 1320
1300 Z=2
1310 IF Z$<>"H" THEN 1120
1320 Y=(Y-1)*4+Z
1330 IF C$(X*32+Y)<>"*" THEN 1120
1340 Q(X,9)=Y
1350 NEXT X
1360 GOSUB 1880
1370 NEXT R
1380 FOR X=0 TO N-1
1390 FOR Z=0 TO 31
1400 IF C$(32*X+Z)="*" THEN 1430
1410 NEXT Z
1420 PRINT"BAD SCAN"
1430 C$(32*X+Z)=" "
1440 Q(X,9)=Z
1450 NEXT X
1460 R=8
1470 GOSUB 1880
1480 H1=0
1490 PRINT"THAT HAND ";
1500 FOR X=0 TO N-1
1510 Q(X,9)=0
1520 Y=0
1530 Z=0
1540 FOR R=1 TO 8
1550 Z=Z+Q(X,R)
1560 Q(X,R)=0
1570 IF Q(X,R+1)<>0 THEN 1600
1580 Y=Y+Z*Z
1590 Z=0
1600 NEXT R
1610 Q(X,0)=Q(X,0)+Y
1620 PRINT N$(X)" SCORED ";Y;"POINTS FOR A";Q(X,0);"TOTAL"
1630 IF Q(H1,0)>Q(X,0) THEN 1650
1640 H1=X
1650 NEXT X
1660 IF Q(H1,0)>=Z9 THEN 2450
1670 GOTO 850
1680 FOR S=0 TO N-1
1681 S8=0
1682 S9=23-(LEN(S$(S))+7)
1684 IF INT(S9/2)*2<>S9 THEN S8=1
1686 S9=INT(S9/2)
1690 PRINT SPC(9+S9);S$(S);"'S HAND";SPC(S9+S8);
1700 NEXT S
1710 PRINT
1720 FOR S=0 TO N-1
1730 PRINT"         CLB    DIA    HRT   SPD";
1740 NEXT S
1750 PRINT
1760 FOR S=0 TO 7
1770 FOR Y=0 TO N-1
1780 Z=Y*32+S*4
1790 PRINT"!";T$(S);"     !";C$(Z);"     !";C$(Z+1);"     !";C$(Z+2);
1791 PRINT"     !";C$(Z+3);" !";
1800 NEXT Y
1810 PRINT T$(S)
1820 NEXT S
1830 PRINT
1840 RETURN
1880 L1=0:H1=0
1890 FOR X=0 TO N-1
1900 Y=INT(Q(X,9)/4)
1910 Z=Q(X,9)-Y*4
1920 PRINT N$(X)" PLAYED THE "Y$(Y)" OF "X$(Z)
1930 C$(X*32+Q(X,9))=" "
1940 IF Q(X,9)>Q(L1,9) THEN 1960
1950 L1=X
1960 IF Q(X,9)<Q(H1,9) THEN 1980
1970 H1=X
1980 NEXT X
1990 IF H=1 THEN 2030
2000 Q(L1,R)=1
2010 PRINT N$(L1)" WON TRICK #";R
2020 GOTO 2050
2030 Q(H1,R)=1
2040 PRINT N$(H1)" WON TRICK #";R
2050 H=0
2060 IF Q(L1,10)<>Q(H1,10) THEN 2080
2070 H=1
2080 RETURN
2090 L1=0:L2=0:H1=0:H2=0
2100 FOR S=0 TO N-2
2110 FOR S1=0 TO 7
2120 IF P(S,S1)>P(L1,L2) THEN 2160
2130 IF C$(S*43+P(S,S1))=" " THEN 2160
2140 L1=S
2150 L2=S1
2160 IF P(S,S1)<P(H1,H2) THEN 2200
2170 IF C$(S*32+P(S,S1))=" " THEN 2200
2180 H1=S
2190 H2=S1
2200 NEXT S1
2210 NEXT S
2220 FOR S=R-1 TO 7
2230 IF H=1 THEN 2280
2240 IF P(N-1,S)<P(L1,L2) THEN 2260
2250 GOTO 2290
2260 IF RND(1)>.3 THEN 2380
2270 GOTO 2300
2280 IF P(N-1,S)>P(H1,H2) THEN 2260
2290 NEXT S
2300 H1=32
2310 Y=INT(RND(1)*16+H*16)
2320 FOR S1=R-1 TO 7
2330 L1=ABS(P(N-1,S1)-Y)
2340 IF H1<L1 THEN 2370
2350 H1=L1
2360 S=S1
2370 NEXT S1
2380 Q(X,9)=P(N-1,S)
2390 P(N-1,S)=P(N-1,R-1)
2400 Z=Q(X,9)-(INT(Q(X,9)/4)*4)
2410 IF Z<2 THEN 2430
2420 Z=ABS(Z-3)
2430 Q(X,10)=Z
2440 GOTO 1360
2450 IF H1>N-2 THEN 2510
2460 FOR X=H1+1 TO N-1
2470 IF Q(H1,0)>Q(X,0) THEN 2500
2480 PRINT"GAME TIED AFTER REGULATION, ENTERING SUDDEN DEATH"
2490 GOTO 850
2500 NEXT X
2510 PRINT N$(H1)"WON THE GAME, CONGRATULATIONS "S$(H1)
2520 END
