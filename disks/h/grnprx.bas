10 PRINT TAB(26);"GRNPRX"
20 PRINT TAB(20);"CREATIVE COMPUTING"
30 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
40 PRINT:PRINT:PRINT
1020 DIM P(9),F(4),G(4),H(82)
1030 REM
1040 FOR X=1 TO 9
1043 READ P(X)
1045 NEXT X
1050 FOR I=1 TO 4
1060 READ G(I),F(I)
1080 LET G(I)=G(I)/2.04545
1090 LET F(I)=(F(I)+.61/2.04545)
1100 NEXT I
1110 FOR X=1 TO 82:READ H(X):NEXT X
1115 REM
1120 DEF FNA(X)=INT(X*2.04545+.05)
1130 DEF FNT(T)=INT(T*10+.5)/10
1133 DEF FNC(T)=-(INT(T*R)+2)*(INT(T*R)+2<82)-82*(82<INT(T*R)+2)
1134 DEF FNB(T)=-(INT(T*R)+1)*(INT(T*R)+1<82)-82*(82<INT(T*R)+1)
1135 DEF FNP(T)=INT(H(FNB(T))+FNQ(T)*FNR(T)+.5)
1136 DEF FNQ(T)=H(FNC(T))-H(FNB(T))
1137 DEF FNR(T)=T*R-INT(T*R)
1140 REM
1150 LET D=2
1200 PRINT
1210 PRINT "WELCOME TO THE PUC GRAN PRIX"
1220 PRINT
1250 REM
1260 PRINT "DO YOU WANT A COURSE DESCRIPTION";
1270 INPUT A$
1280 IF LEFT$(A$,1)<>"Y" THEN 1910
1300 PRINT
1320 PRINT TAB(23);"2";TAB(66);"1"
1330 PRINT TAB(21);"CC0XPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX0CC"
1340 PRINT TAB(12);"85-100 CC (800)";TAB(69);"C"
1350 PRINT TAB(18);"C";TAB(70);"C"
1360 PRINT TAB(15);"3 0";TAB(21);"PUC GRAN PRIX RACE";TAB(70);"C"
1370 PRINT TAB(16);"X";TAB(69);"C"
1375 PRINT TAB(15);"X";TAB(67);"CC"
1380 PRINT TAB(14);"X";TAB(38);"SS";TAB(59);"(2800) C 50-"
1390 PRINT TAB(13);"X";TAB(22);"SSSSSSS    SSS  SSSOXXXXXXXXXXXXXXXX";
1395 PRINT "XPXXOC   70"
1400 PRINT TAB(12);"X       SS       SSSSSSS       7";
1405 PRINT TAB(64);"8"
1410 PRINT TAB(11);"X (1900)0 6    90-110"
1420 PRINT TAB(10);"X       X"
1430 PRINT TAB(9);"X       X"
1433 PRINT TAB(28);"DISTANCES IN YARDS, EG. ";
1435 PRINT "(800) = 800 YDS."
1440 PRINT TAB(8);"X       X";TAB(20);"SPEEDS IN MPH, ";
1445 PRINT "EG. 85 TO 100 MPH."
1450 PRINT "       P     X"
1460 PRINT "      X       X"
1470 PRINT "     X       X"
1480 PRINT "   X       X"
1490 PRINT " 4 0(1500) X"
1500 PRINT "  H       X"
1510 PRINT "  H      X"
1520 PRINT "20-H   0 5"
1530 PRINT " 35 H  H"
1535 PRINT "     HH"
1540 PRINT
1550 PRINT
1560 PRINT "1 TO 2 IS A STRAIGHTAWAY 800 YARDS LONG"
1570 PRINT "2 TO 3 IS A CURVE 200 YARDS LONG"
1580 PRINT "     THE BREAKAWAY SPEED RANGE IS 85 TO 100 MPH"
1590 PRINT "3 TO 4 IS A STRAIGHTAWAY 500 YARDS LONG"
1600 PRINT "     IT ENDS AT POSITION 1500 YARDS FROM STARTING";
1605 PRINT " GRID"
1610 PRINT "4 TO 5 IS A HAIRPIN CURVE 100 YARDS LONG"
1620 PRINT "     THE BREAKAWAY SPEED RANGE IS 20 TO 35 MPH"
1630 PRINT "5 TO 6 IS ANOTHER STRAIGHTAWAY 300 YARDS LONG"
1640 PRINT "     IT ENDS AT POSITION 1900 YARDS FROM THE GRID"
1650 PRINT "6 TO 7 IS A SET OF 'S' CURVES 500 YARDS LONG"
1660 PRINT "     THE SPEED RANGE IS 90-110 MPH"
1670 PRINT "7 TO 8 IS THE FINAL STRAIGHTAWAY OF 400 YARDS"
1680 PRINT "     IT ENTERS THE LAST CURVE AT 2800 YARDS"
1690 PRINT "8 TO 9 IS THE FINAL CURVE OF 400 YARDS"
1700 PRINT "     THE BREAKAWAY SPEED RANGE IS 50 TO 70 MPH"
1710 PRINT
1720 PRINT "THE TOTAL LENGTH OF ONE LAP IS 3200 YARDS"
1730 PRINT
1820 PRINT "DURING THE STRAIGHTAWAYS YOU WILL BE ABLE TO CONTROL THE"
1830 PRINT "ACCELERATION AND BRAKING OF THE CAR.  THE CURVES WILL BE";
1835 PRINT " TAKEN"
1840 PRINT "AT WHATEVER SPEED YOU ENTER THEM."
1842 PRINT "BELOW THE BREAKAWAY SPEED, THE CURVES MAY BE TAKEN WITH ";
1844 PRINT "NO DIFFICULTY."
1850 PRINT "ABOVE THE FASTEST SPEED INDICATED, YOU WILL CRASH!!"
1860 PRINT "WITHIN THE SPEED RANGE, THERE IS THE POSSIBILITY THAT YOU";
1865 PRINT " MIGHT"
1870 PRINT "LOSE TIME OR SPEED BY SWINGING UIDE OR BY SPINNING OUT."
1880 PRINT "THE FASTER YOU TAKE THE CURVES, THE GREATER THE RISKS--"
1890 PRINT "AND THE LESS THE TIME!!!!"
1905 PRINT
1906 PRINT
1907 PRINT "YOUR TASK IS TO TRANSVERSE THE TRACK IN A MINIMUM OF TIME"
1908 PRINT "WITHOUT CRASHING!!!"
1909 PRINT
1910 PRINT "YOUR CAR MAY BE ONE OF THE FOLLOWING:"
1911 PRINT "1. PORSCHE"
1912 PRINT "2. FERRARI"
1913 PRINT "3. MASERATI"
1914 PRINT "4. LOTUS FORD"
1915 PRINT "WHICH CAR WOULD YOU LIKE";
1916 INPUT Z
1917 ON Z GOTO 1920,1923,1926,1929
1918 PRINT "WE DON'T HAVE THAT CAR IN STOCK, PLEASE CHOOSE AGAIN.";
1919 GOTO 1916
1920 M=15
1921 LET B=-20
1922 GOTO 1931
1923 M=10
1924 B=-25
1925 GOTO 1931
1926 M=12
1927 B=-22
1928 GOTO 1931
1929 M=8
1930 B=-30
1931 PRINT "YOUR CAR HAS A MAXIMUM ACCELERATION OF ";M;"MPH/SEC."
1932 PRINT "AND A MAXIMUM BRAKING OF ";B;"MPH/SEC."
1933 PRINT "YOU WILL RACE AGAINST ONE OF THE FOLLOWING:"
1934 PRINT "1. U.S. POSTAL DELIVERY TRUCK"
1935 PRINT "2. 1970 BEAT PONTIAC GTO"
1936 PRINT "3. 1966 WELL USED FORD MUSTANG"
1937 PRINT "4. LOTUS FORD"
1938 PRINT "5. 1974 FERRARA"
1939 PRINT "6. THE PHYSICS SUPERCHARGED LIGHTBEAM SPECIAL"
1940 PRINT "CHOOSE ONE OPPONENT BY ENTERING NUMBER";
1941 INPUT R1
1942 IF R1>0 AND R1<6 THEN 1946
1943 IF R1=6 THEN 1948
1944 PRINT "WHICH CAR DID YOU SAY";
1945 GOTO 1941
1946 LET R=2*R1-5
1947 GOTO 1949
1948 LET R=2.5E+08
1949 LET R=(90+2*R)/100+7*RND(1)/100
1950 PRINT
3000 REM
3002 REM           BEGIN THE RACE!!
3004 REM
3010 LET J=1
3020 PRINT "ELAPSED TIME","SPEED","POSITION","OPPONENT'S","ACC";
3025 PRINT "ELERATION"
3030 PRINT "  SECONDS"," MPH"," YARDS"," POSITION"
3040 PRINT
3070 X=0:S=0:T=0:T9=0:X9=0
3080 REM
3100 IF J<9 THEN 3200
3130 PRINT
3160 PRINT "COMPLETED LAP";",ELAPSED TIME";FNT(T);"SEC."
3166 PRINT "YOUR OPPONENT FINISHED IN ";80/R;"SECONDS"
3167 LET K1=FNT(T)-80/R
3168 IF K1>0 THEN 3171
3169 PRINT "CONGRATULATIONS, YOU WON BY "J-K1;"SECONDS"
3170 GOTO 8600
3171 PRINT "SORRY, YOU LOST BY ";K1;"SECONDS"
3172 GOTO 8600
3200 IF FNP(T)>3200 THEN 3203
3201 PRINT "  ";FNT(T),"  ";FNA(S),"  ";INT(X),"  ";FNP(T),"  ";
3202 GOTO 3210
3203 PRINT "  ";FNT(T),"  ";FNA(S),"  ";INT(X),"  FINISH","  ";
3210 INPUT A1
3220 LET A=A1/2.04545
3230 IF A1>=0 THEN 3600
3240 IF A1>=B THEN 3300
3250 PRINT "MAXIMUM BRAKING IS ";B;"MPH/SEC"
3260 GOTO 3200
3300 LET T1=-S/A
3310 IF T1>D THEN 3500
3320 LET X1=X+S*T1+A/2+T1*T1
3330 IF X1>P(J+1) THEN 3400
3340 PRINT "YOU STOPPED";INT(P(J+1)-X1);"YARDS FROM POINT";J+1
3350 LET S=0
3360 LET X=X1
3370 LET T=T+T1
3380 GOTO 3100
3400 LET Y=P(J+1)-X
3402 IF A<>0 THEN 3410
3404 LET T=T+Y/S
3406 GOTO 3440
3410 LET S1=SQR(S*S+2*A*Y)
3420 LET T=T-(S-S1)/A
3430 LET S=S1
3440 LET J=J+1
3450 GOTO 8000
3500 LET X1=X+S*D+A/2*D*D
3510 IF X1>P(J+1) THEN 3400
3520 LET T=T+D
3530 LET S=S+A*D
3540 LET X=X1
3550 GOTO 3100
3600 IF A1 <= M THEN 3700
3610 PRINT "MAXIMUM ACCELERATION IS ";M;"MPH/SEC"
3620 GOTO 3200
3700 LET X1=X+S*D+A/2*D*D
3710 IF X1>P(J+1) THEN 3400
3720 GOTO 3500
8000 REM *** SUB CURVE ***
8010 REM
8020 LET I=INT(J/2)
8030 LET T1=(P(J+1)-P(J))/S
8040 LET S1=G(I)+(F(I)-G(I))*RND(1)
8050 IF S>S1 THEN 8100
8055 PRINT "CURVE";J;-J-I;", SPEED";FNA(S);"MPH"
8060 LET J=J+1
8070 LET X=P(J)
8080 LET T=T+T1
8090 GOTO 3100
8100 IF S>S1+(F(I)-S1)/2 THEN 8200
8110 LET T2=T1*RND(1)*.4
8120 PRINT "SPEED IN CURVE";FNA(S);"MPH, TOOK CURVE WIDE, LOST";
8125 PRINT FNT(T2);"SEC."
8130 LET T1=T1+T2
8140 GOTO 8060
8200 IF S>F(I) THEN 8300
8210 LET S2=S-S*RND(1)+.9
8220 LET T1=T1*S/S2
8230 PRINT "SPUN OUT AT";FNA(S);"MPH, LOST SPEED AND TIME"
8240 LET S=S2
8250 GOTO 8060
8300 PRINT "LOST CONTROL AT";FNA(S);"MPH.  YOUR CAR CRASHED!!"
8305 PRINT "YOUR OPPONENT FINISHED IN ";82/R;"SECONDS!"
8330 REM
8600 PRINT
8605 PRINT "DO YOU WISH TO TRY AGAIN";
8610 INPUT A$
8620 IF LEFT$(A$,1)="Y" THEN 1910
9000 REM
9010 DATA 0,800,1000,1500,1600,1900,2400,2800,3200
9020 DATA 85,100
9030 DATA 20,35
9040 DATA 90,110
9050 DATA 50,70
9060 REM
9070 DATA 0,1,3,9,21,39,62,87,120,156,196,244,293,351,410
9080 DATA 479,550,625,700,758,800,847,894,942,990,1030,1080
9090 DATA 1135,1200,1260,1330,1382,1425,1470,1490,1505,1519
9100 DATA 1539,1548,1563,1578,1512,1610,1632,1658,1683,1718
9110 DATA 1758,1800,1850,1890,1943,1997,2050,2104,2057,2210
9120 DATA 2294,2317,2370,2420,2480,2535,2600,2670,2725,2768,2799,2830
9130 DATA 2861,2892,2920,2951,2982,3013,3044,3075,3106,3137,3168,3199
9140 DATA 10000
