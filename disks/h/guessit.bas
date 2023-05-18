1 PRINT TAB(26)"GUESS-IT"
2 PRINTTAB(20)"CREATIVE COMPUTING"
3 PRINT TAB(18)"MORRISTOWN, NEW JERSEY"
4 PRINT
5 PRINT
10 PRINT
20 G1=0:C1=0
50 A1=RND(1)
70 H=5
80 DIM P(10,10)
90 FOR K=1 TO H
100 P(K,0)=1
110 P(0,K)=1/(K+1)
120 NEXT K
130 FOR I=1 TO H
140 FOR J=I TO H
150 P(I,J)=(1+J*P(J,I-1)*(1-P(J-1,I)))/(1+(J+2)*P(J,I-1))
160 P(J,I)=(1+I*P(I,J-1)*(1-P(I-1,J)))/(1+(I+1)*P(I,J-1))
170 NEXT J
180 NEXT I
190 Z=11
200 DIM U(Z),N(Z)
210 PRINT"DO YOU WANT INSTRUCTIONS-TYPE YES OR NO"
220 INPUT A$
230 IF A$="YES" THEN 1730
240 IF A$<>"NO" THEN 210
250 PRINT
260 G1=G1+1
270 FOR J=2 TO Z
280 U(J)=0
290 NEXT J
300 E=0:T=0:C=0:P=0:L=0
310 GOSUB 1630
320 REM N(1) TO N(H)= COMP HAND N(H+1)=TO N(Z)= OTHER HAND
330 D=(Z)
340 PRINT"YOUR HAND IS"
350 PRINT
360 FOR I=H+1 TO Z-1
370 PRINT N(I);
380 NEXT I
390 PRINT
400 PRINT
410 PRINT"DO YOU WANT TO GO FIRST";
420 INPUT A$
430 IF A$="YES" THEN 470
440 IF A$<>"NO" THEN 390
450 K=1
460 GOTO 480
470 K=0
480 K=K+1
490 M=H-C
500 N=H-P
510 PRINT
520 IF K=(INT(K/2))*2 THEN 860
530 PRINT
540 PRINT"DO YOU WANT TO GUESS THE DOWN NUMBER";
550 INPUT A$
560 IF A$="YES" THEN 1250
570 IF A$<>"NO" THEN 530
580 PRINT
590 PRINT"WHAT NUMBER DO YOU WANT TO ASK ABOUT";
600 INPUT E
610 FOR I=1 TO Z
620 IF E=U(I) THEN 650
630 NEXT I
640 GOTO 670
650 PRINT E;" WAS ASKED BEFORE TRY AGAIN"
660 GOTO 580
670 FOR J=1 TO H
680 IF N(J)=E THEN 800
690 NEXT J
700 PRINT
710 PRINT;"IS NOT IN MY HAND"
720 IF M=0 THEN 1460
730 IF N=0 THEN 1440
740 Y=((M+1)*P(M,N-1)-M*P(M-1,N))/(1+(M+1)*P(M,N-1))
750 IF RND(1)<Y THEN 1380
760 GOSUB 1220
770 IF (H-P)=1 THEN 1460
780 P=P+1
790 GOTO 480
800 PRINT
810 PRINT E;"IS IN MY HAND"
820 C=C+1
830 GOSUB 1220
840 GOTO 480
850 REM COMP SEQ STARTS
860 IF T<>0 THEN 1410
870 IF H-C<>0 THEN 890
880 GOTO 1460
890 IF H-P<>0 THEN910
900 GOTO 1460
910 IF (2*H-2)-(P+C)<>0 THEN 930
920 GOTO 1460
930 REM RND DECISION TO BLUFF OR NOT ON ASKING FOR CARD
940 IF RND(1)>1/(1+(N+1)*P(N,M-1)) THEN 1060
950 PRINT
960 A=INT(H*RND(1))+1
970 FOR J=1 TO Z
980 IF N(A)=U(J) THEN 960
990 NEXT J
1000 PRINT"DO YOU HAVE";N(A)
1010 C=C+1
1020 INPUT A$
1030 E=N(A)
1040 GOSUB 1220
1050 GOTO 480
1060 GOSUB 1170
1070 PRINT
1080 PRINT"DO YOU HAVE ";N(A)
1090 INPUT A$
1100 IF A$="YES" THEN 1130
1110 T=1
1120 GOTO 480
1130 E=N(A)
1140 P=P+1
1150 GOSUB 1220
1160 GOTO 480
1170 A=INT((H+1)*RND(1))+(H+1)
1180 FOR J=1 TO Z
1190 IF N(A)=U(J) THEN GOTO 1170
1200 NEXT J
1210 RETURN
1220 L=L+1
1230 U(L)=E
1240 RETURN
1250 PRINT
1260 PRINT"WHAT DO YOU THINK THE DOWN NUMBER IS"
1270 INPUT B
1280 PRINT
1290 PRINT"THE DOWN NUMBER IS";N(Z)
1300 IF B=N(Z) THEN 1360
1310 PRINT
1320 PRINT"YOUR  GUESS OF";B;" IS NOT CORRECT-YOU LOSE"
1330 C1=C1+1
1340 GOTO 1520
1350 PRINT
1360 PRINT"YOUR GUESS OF";B;"IS CORRECT - YOU WIN"
1370 GOTO 1520
1380 PRINT"I THINK YOU WERE  NOT BLUFFING WHEN YOU ASKED ABOUT";E
1390 G=E
1400 GOTO 1480
1410 PRINTN(A);"WAS NOT A BLUFF"
1420 G=N(A)
1430 GOTO 1480
1440 G=N(Z)
1450 GOTO 1480
1460 GOSUB 1170
1470 G=N(A)
1480 PRINT"I GUESS THE DOWN NUMBER IS";G
1490 IF G=N(Z) THEN 1590
1500 PRINT
1510 PRINT"THE DOWN NUMBER IS";N(Z);"I WAS WRONG... YOU WIN"
1520 PRINT"DO YOU WANT TO PLAY AGAIN";
1530 INPUT A$
1540 IF A$="YES" THEN 250
1550 IF A$<>"NO" THEN 1520
1560 PRINT
1570 PRINT"YOU PLAYED";G1;"GAMES.  YOU LOST";C1;"YOU WON";G1-C1
1580 STOP
1590 PRINT
1600 PRINT"THE DOWN NUMBER IS";N(Z);"I WAS CORRECT...YOU LOSE"
1610 C1=C1+1
1620 GOTO 1520
1630 FOR I=1 TO Z
1640 N(I)=I
1650 NEXT I
1660 FOR I=1 TO Z
1670 R=INT(RND(1)*((Z+1)-I))+I
1680 W=N(R)
1690 N(R)=N(I)
1700 N(I)=W
1710 NEXT I
1720 RETURN
1730 PRINT
1740 PRINT"THE OBJECT OF THIS GAME IS TO GUESS AN UNKNOWN NUMBER"
1750 PRINT"CALLED THE 'DOWN NUMBER'.  THE GAME IS PLAYED WITH THE"
1760 PRINT"NUMBERS 1 TO";Z;".  YOU WILL BE GIVEN A HAND OF ";H
1770 PRINT"RANDOMLY SELECTED NUMBERS BETWEEN 1 AND";Z;". THE "
1780 PRINT"COMPUTER WILL HAVE A SIMILAR HAND.  THE DOWN NUMBER WILL "
1785 PRINT"ALWAYS BE THE NUMBER NOT IN EITHER PLAYER HANDS."
1790 PRINT
1800 PRINT"YOU ALTERNATE MOVES WITH THE COMPUTER. ON ANY MOVE THERE"
1810 PRINT"ARE TWO OPTIONS- GUESS THE DOWN NUMBER OR ASK ABOUT SOME "
1820 PRINT"NUMBER."
1830 PRINT
1840 PRINT"WHEN A PLAYER GUESSES THE DOWN NUMBER THE GAME STOPS."
1850 PRINT"IF THE GUESS IS CORRECT THAT PLAYER WINS."
1860 PRINT"IF THE GUESS IS NOT CORRECT THAT PLAYER LOSES."
1870 PRINT
1880 PRINT"ALL QUESTIONS ABOUT NUMBERS IN THE OTHER PLAYERS HAND"
1890 PRINT"MUST BE ANSWERED TRUTHFULLY.  A PLAYER MAY'BLUFF' BY"
1900 PRINT"ASKING ABOUT A NUMBER IN HIS OWN HAND.  THE COMPUTER"
1910 PRINT"WILL SOMETIMES DO THIS."
1920 PRINT
1930 PRINT"A NUMBER MAY BE ASKED ABOUT ONLY ONCE."
1940 PRINT
1950 PRINT"GOOD LUCK"
1960 GOTO 250
1970 END
