10 PRINT TAB(26);"NOMAD"
20 PRINT TAB(20);"CREATIVE COMPUTING"
30 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
1160 DIM K$(30),D(2,2),R(30,30),E(30,30),P(8,2),C(30)
1170 DIM W(30)
1180 DIM N$(30)
1190 REM GOSUB RULES
1200 GOSUB 3340
1210 REM RANDOM NUMBERS
1220 DEF FNA(X)=INT(RND(1)*X)+1
1230 REM # OF ROADS
1240 READ N
1250 FOR R=1 TO N
1260 REM # OF INTERSEC
1270 READ Q
1280 C(R)=ABS(Q)
1290 IF Q<0 THEN 1320
1300 W(R)=1
1310 GOTO 1330
1320 W(R)=-1
1330 REM DIREC, ROAD
1340 FOR J=1 TO C(R)
1350 READ E(R,J),R(R,J)
1360 NEXT J
1370 NEXT R
1380 REM NAME?
1390 PRINT "WHAT IS YOUR NAME";
1400 INPUT N$
1410 REM OPENING STATEMENT
1420 PRINT
1430 PRINT "*GOOD LUCK*"
1440 REM GRAMMAS HOUSE
1450 H1=FNA(N)
1460 H2=FNA(C(H1))
1470 REM DRUNK DRIVERS
1490 REM POLICE
1500 FOR A=1 TO 8
1510 P(A,1)=FNA(N)
1520 P(A,2)=FNA(C(P(A,1)))
1530 NEXT A
1540 REM LRAC NILKNARF NAMGREB LODGE
1550 R=1
1560 J=0
1570 I=1
1580 REM GOSUB CHECK
1590 GOSUB 2520
1600 REM GOSUB TELEGRAM
1610 GOSUB 2570
1620 REM ADD INCREMENT
1630 J=J+I
1640 REM NEED REPAIR?
1650 IF FNA(10)=1 THEN 2940
1660 REM DEAD END?
1670 IF J>C(R) OR J=0 THEN 3060
1680 REM DIRECTION
1690 IF I=-1 THEN 1720
1700 D=E(R,J)
1710 GOTO 1730
1720 D=9-E(R,J)
1730 REM ROAD CROSSING
1740 C=R(R,J)
1750 REM SKIP LINE
1760 PRINT
1770 REM GOSUB *DIREC, ROAD ON* PRINT
1780 GOSUB 2680
1790 REM AT GRAMMAS?
1800 IF H1=R AND R(R,J)=R(H1,H2) THEN 2880
1810 IF H1=R(R,J) AND R=R(H1,H2) THEN 2880
1820 REM JUNCTION
1830 PRINT "JUNCTION: ROAD #";R;" & #";C
1840 REM ASK WHAT WAY TO TURN
1850 PRINT "FORWARD, LEFT, RIGHT OR U-TURN";
1860 INPUT I$
1880 IF LEFT$(I$,1)="F" THEN 2080
1890 IF LEFT$(I$,1)="R" THEN 1970
1900 IF LEFT$(I$,1)="L" THEN 1990
1910 IF LEFT$(I$,1)="U" THEN 1950
1920 REM GOOFED
1930 PRINT "**YOU GOOFED**"
1940 GOTO 1850
1950 I=1*I
1960 GOTO 2080
1970 I=W(R)*I
1980 GOTO 2000
1990 I=-1*W(R)*I
2000 FOR A=1 TO C(C)
2010 IF R(C,A)=R THEN 2040
2020 NEXT A
2030 GOTO 4210
2040 R=C
2050 J=A
2060 REM DARE?
2070 IF FNA(4)=1 THEN 2360
2080 REM SPEED
2090 PRINT "SPEED";
2100 INPUT S
2110 REM DANGEROUSITY CRASH CHECKS
2120 IF S>100 THEN 3190
2130 IF S<30 THEN 3220
2140 REM ILLEGAL?
2150 IF S>55 THEN 3090
2160 REM DRUNK DRIVERS DRIVE.
2170 FOR A=1 TO 2
2180 IF D(A,1)=0 THEN 2210
2190 D(A,1)=FNA(N)
2200 D(A,2)=FNA(C(D(A,1)))
2210 NEXT A
2220 REM HIT BY DRUNK DRIVER?
2230 FOR A=1 TO 2
2240 IF D(A,1)=0 THEN 2270
2250 IF D(A,1)=R AND R(R,J)=R(D(A,1),D(A,2)) THEN 2910
2260 IF D(A,1)=R(R,J) AND R(D(A,1),D(A,2))=R THEN 2910
2270 NEXT A
2280 REM IS DRIVER CAUGHT?
2290 FOR A=1 TO 2
2300 IF D(A,1)=0 THEN 2340
2310 FOR B=1 TO 8
2320 IF D(A,1)=P(B,1) AND D(A,2)=P(B,2) THEN 2400
2330 NEXT B
2340 NEXT A
2350 GOTO 1620
2360 REM SPEED DARE PRINT
2370 ON FNA(3) GOTO 2380,2400,2420
2380 PRINT "I DARE YOU TO SPEED ** (DAREDEVIL)"
2390 GOTO 2430
2400 PRINT "*SPEEDING* IS FUN (SO DO IT)!!"
2410 GOTO 2430
2420 PRINT "*SPEED*   I DARE YOU   *SPEED*   I DARE YOU"
2430 GOTO 2080
2440 REM DRUNK CAUGHT
2450 PRINT "A DRUNK DRIVER HAS BEEN CAUGHT.  THE POLICEMAN WHO"
2460 PRINT "ARRESTED HIM WILL BE TESTIFYING AT COURT FOR"
2470 PRINT "THE REST OF THE GAME."
2480 PRINT
2490 D(A,1)=0:D(A,2)=0:P(B,1)=0:P(B,2)=0
2500 GOTO 1620
2510 REM CHECK
2520 FOR A=1 TO 8
2530 IF H1=P(A,1) AND R(H1,H2)=R(P(A,1),P(A,2)) THEN 1440
2540 IF H1=R(P(A,1),P(A,2)) AND R(H1,H2)=P(A,1) THEN 1440
2550 NEXT A
2560 RETURN
2570 REM TELEGRAM PRINT-UP
2580 PRINT
2590 PRINT "DEAR ";N$;","
2600 PRINT "HOW ARE YOU?  I LIVE AT THE CORNER"
2610 PRINT "OF ROAD #";H1;" & #";R(H1,H2);"!!!"
2620 PRINT "COME ON OVER."
2630 PRINT "                     LOVE,"
2640 PRINT "                     GRAMMA"
2650 PRINT "((TELEGRAMMA CORP. TELEGRAM CO.))"
2660 PRINT
2670 RETURN
2680 REM *DIREC, ROAD ON* PRINT-UP
2690 PRINT "GOING ";
2700 ON D GOTO 2710,2730,2750,2770,2790,2810,2830,2850
2710 PRINT "NORTH";
2720 GOTO 2860
2730 PRINT "WEST";
2740 GOTO 2860
2750 PRINT "NORTHEAST";
2760 GOTO 2860
2770 PRINT "SOUTHEAST";
2780 GOTO 2860
2790 PRINT "NORTHWEST";
2800 GOTO 2860
2810 PRINT "SOUTHWEST";
2820 GOTO 2860
2830 PRINT "EAST";
2840 GOTO 2860
2850 PRINT "SOUTH";
2860 PRINT " ON ROAD #";R
2872 RETURN
2880 REM AT GRAMMAS *PRINT*
2890 PRINT "YOU MADE IT TO GRAMMAS HOUSE!!!!!!! !!"
2900 GOTO 3240
2910 REM DRUNK HIT YOUR CAR *PRINT*
2920 PRINT "KERSPLATT--DRUNK DRIVER HIT YOUR CAR."
2930 GOTO 3240
2940 REM CAR NEEDS FIXING *PRINT-UP*
2950 ON FNA(5) GOTO 2960,2980,3000,3020,3040
2960 PRINT "POP...FLAT TIRE"
2970 GOTO 3050
2980 PRINT "FLIP...YOUR CAR DID A SUMERSALT"
2990 GOTO 3050
3000 PRINT "*OUT OF GAS*"
3010 GOTO 3050
3020 PRINT "SMOOSH...BUS FLATTENED YOUR CAR."
3030 GOTO 3050
3040 PRINT "POP...BULLDOG ATE YOUR TIRE!"
3050 GOTO 3240
3060 REM DEAD END PRINT
3070 PRINT "*DEAD END*"
3080 GOTO 3240
3090 REM SPEEDING
3100 PRINT "*SPEEDING*"
3110 REM CAUGHT BY POLICE?
3120 FOR X=1 TO 8
3130 IF P(X,1)=R AND P(X,1)=J THEN 3170
3140 NEXT X
3150 PRINT "NOT CAUGHT"
3160 GOTO 2160
3170 PRINT "CAUGHT SPEEDING BY THE POLICE!!"
3180 GOTO 3240
3190 REM TOO FAST *CRASH*
3200 PRINT "KERSMOUSHIIEEEE...WENT TOO FAST !!!!"
3210 GOTO 3240
3220 REM TOO SLOW *CRASH*
3230 PRINT "-*<(KRUNCH)>*-  TOO SLOW...CAR BEHIND RAN INTO YOU!"
3240 REM AGAIN?
3250 PRINT
3260 PRINT "AGAIN";
3270 INPUT I$
3290 IF LEFT$(I$,1)="Y" THEN 1380
3300 REM CLOSING STATEMENT
3310 PRINT
3320 PRINT "*SEE YOU*"
3330 GOTO 4210
3340 REM RULES?
3350 PRINT "RULES";
3360 INPUT I$
3380 IF LEFT$(I$,1)="N" THEN 3950
3390 PRINT
3400 PRINT "GRAMMA NOMAD IS A NICE OLD LADY WHO HAS NOT QUITE"
3410 PRINT "MADE UP HER MIND WHERE SHE WANTS TO LIVE."
3420 PRINT "SHE HAS NARROWED IT DOWN TO SOMEWHERE IN GARBONZO CITY"
3430 PRINT "AND ON A STREET CORNER."
3440 PRINT
3450 PRINT "AT THE BEGINNING, THE MAILMAN GIVES YOU A TELEGRAM WRITTEN"
3460 PRINT "BY GRAMMA TELLING YOU WHERE SHE LIVES."
3470 PRINT "(I WILL READ IT TO YOU)."
3480 PRINT
3490 PRINT "YOU GET INTO YOUR CAR IT LRAC NILKNARF NAMGREB LODGE."
3500 PRINT "FROM THEEEEERE YOU GO TO GRAMMAS HOUSE."
3510 PRINT
3520 PRINT "YOU TRY TO GET THERE WITHOUT:"
3530 PRINT "CRASHUPS"
3540 PRINT "TICKETS"
3550 PRINT "FLAT TIRES"
3560 PRINT "RUNNING OUT OF GAS"
3570 PRINT "DEAD ENDS"
3580 PRINT
3590 PRINT "THERE IS AN 8-MAN POLICE FORCE ENFORCING THE LAWS"
3600 PRINT "OF GARBONZO CITY."
3610 PRINT
3620 PRINT "THERE ARE 2-DRUNKS ON THE STREETS OF GARBONZO"
3630 PRINT "CITY."
3640 PRINT
3650 PRINT "IF A POLICEMAN CATCHES A DRUNK, HE HAS TO"
3660 PRINT "TESTIFY IN COURT"
3670 PRINT "(WHICH TAKES THE REST OF THE GAME)"
3680 PRINT
3690 PRINT "IF A DRUNK DRIVER HITS YOU, YOU LOSE."
3700 PRINT
3810 PRINT "AT EACH JUNCTION, I WILL TELL YOU:"
3820 PRINT "THE DIRECTION YOU ARE GOING"
3830 PRINT "THE ROAD YOU ARE ON"
3840 PRINT "THE ROAD CROSSING"
3850 PRINT
3860 PRINT "I WILL ASK YOU:"
3870 PRINT "THE WAY YOU WANT TO TURN (IE LEFT)"
3880 PRINT "SPEED (IN MPH)"
3890 PRINT
3900 PRINT "AN OVERPASS IS NOT A JUNCTION, SO IT IS"
3910 PRINT "MERELY SKIPPED OVER. IT IS UNANNOUNCED."
3920 PRINT
3930 PRINT "*THAT IS ALL*"
3940 PRINT
3950 RETURN
3960 REM DATA LINES
3970 DATA 18
3980 DATA -8,8,2,8,4,8,5,8,11,8,7,8,8,8,9,8,10
3990 DATA 3,7,17,7,18,7,1
4000 DATA 2,7,17,7,18
4010 DATA 3,7,18,7,11,7,1
4020 DATA 7,8,8,8,9,8,10,7,18,7,11,7,1,1,6
4030 DATA -2,7,18,7,5
4040 DATA 2,7,1,7,11
4050 DATA 8,7,16,7,15,7,5,7,14,7,13,7,1,7,12,7,11
4060 DATA 8,7,16,7,15,7,5,7,14,7,13,7,1,7,12,7,11
4070 DATA 8,7,16,7,15,7,5,7,14,7,13,7,1,7,12,7,11
4080 DATA -7,4,4,4,5,4,1,4,7,8,8,8,9,8,10
4090 DATA -3,8,8,8,9,8,10
4100 DATA -3,8,8,8,9,8,10
4110 DATA -3,8,8,8,9,8,10
4120 DATA -3,8,8,8,9,8,10
4130 DATA -3,8,8,8,9,8,10
4140 DATA -2,8,2,8,3
4150 DATA -5,8,2,8,3,8,4,8,5,1,6
4160 DATA 0,0,0,0,0,0,0
4210 END