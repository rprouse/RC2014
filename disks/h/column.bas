100 PRINT TAB(26);"COLUMN"
110 PRINT TAB(20);"CREATIVE COMPUTING"
120 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
130 PRINT:PRINT:PRINT
140 PRINT "THIS PROGRAM WILL SHOW YOU A CARD TRICK. AFTER THE FIRST DEAL"
150 PRINT "PICK A CARD AND TYPE THE NUMBER OF THE COLUMN CONTAINING IT."
160 PRINT "THE DEALER WILL THEN PICK UP THE CARDS, A COLUMN AT A TIME,"
170 PRINT "AND WILL DEAL THEM OUT AGAIN HORIZONTALLY. WHEN HE FINISHES"
180 PRINT "EACH TIME, TYPE THE NUMBER OF THE THE NEW COLUMN CONTAINING YOUR"
190 PRINT "CARD. FOLLOWING THE LAST DEAL THE DEALER WILL TURN OVER THE"
200 PRINT "CARDS, ONE AT A TIME, UNTIL HE REACHES THE ONE YOU PICKED."
210 PRINT:PRINT:PRINT
220 DIM A(21),B(21)
230 FOR X=1 TO 21
240 J=0
250 T=INT(52*(RND(1)))
270 FOR Y=1 TO X-1
280 IF A(Y)=T THEN 250
290 NEXT Y
300 A(X)=T
310 NEXT X
320 N=0
330 FOR I=1 TO 3
340 FOR Z=1 TO 21
350 IF A(Z)=4*(INT(A(Z)/4)) THEN 470
360 IF A(Z)-2=4*(INT(A(Z)/4)) THEN 440
370 IF A(Z)-3=4*(INT(A(Z)/4)) THEN 410
380 C$="SPADES"
390 D$=""
400 GOTO 490
410 C$="HEARTS"
420 D$=""
430 GOTO 490
440 C$="CLUBS"
450 D$=""
460 GOTO 490
470 C$="DIAMON"
480 D$="DS"
490 N=N+1
500 IF N <> 4 THEN 530
510 PRINT
520 N=1
530 IF A(Z) > 35 THEN 580
540 PRINT TAB((N-1)*25);INT(A(Z)/4)+2;"OF ";C$;D$;
550 IF J=5 THEN 900
560 IF J=10 THEN 980
570 GOTO 710
580 IF INT(A(Z)/4)=9 THEN 670
590 IF INT(A(Z)/4)=10 THEN 650
600 IF INT(A(Z)/4)=11 THEN 630
610 A$="JACK"
620 GOTO 680
630 A$="QUEEN"
640 GOTO 680
650 A$="KING"
660 GOTO 680
670 A$="ACE"
680 PRINT TAB((N-1)*25);A$;" OF ";C$;D$;
690 IF J=5 THEN 900
700 IF J=10 THEN 980
710 NEXT Z
720 PRINT:PRINT
730 PRINT "WHICH COLUMN CONTAINS YOUR CARD";
740 INPUT K
750 IF K<1 OR K > 3 THEN PRINT:PRINT "(1-3)":GOTO 730
760 PRINT:PRINT
770 T=1
780 S=K+2-3*INT((K+1)/3)
790 GOSUB 940
800 S=K
810 GOSUB 940
820 S=K+1-3*INT(K/3)
830 GOSUB 940
840 FOR C=1 TO 21
850 A(C)=B(C)
860 NEXT C
870 NEXT I
880 J=5
890 FOR Z=1 TO 11+INT(10*RND(1)+1):N=0:GOTO 350
900 PRINT:NEXT Z:PRINT
910 PRINT "OOPS!!! YOUR CARD IS THE";
920 N=1
930 J=10:Z=11:GOTO 350
940 FOR R=S TO S+18 STEP 3
950 B(T)=A(R)
960 T=T+1
970 NEXT R:RETURN
980 PRINT ".":PRINT
990 PRINT "DO YOU WANT TO SEE IT AGAIN";:INPUT T$
1000 IF T$="YES" THEN PRINT:PRINT:GOTO 230
1010 END
