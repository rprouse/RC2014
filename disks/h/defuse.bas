1 PRINT TAB(26);"DEFUSE"
2 PRINT TAB(20);"CREATIVE COMPUTING"
3 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
4 PRINT:PRINT:PRINT
10 PRINT "YOU ARE IN A GOVERNMENT EXPERIMENTAL BUILDING WITH"
20 PRINT "1,000,000 ROOMS IN IT. THE BUILDING IS 100 ROOMS"
30 PRINT "LONG(0-99), 100 ROOMS WIDE(0-99), AND 100 ROOMS HIGH(0-99)."
40 PRINT:PRINT "IN IT A BOMB IS HIDDEN. THE BOMB SENDS OUT SIGNALS THAT"
50 PRINT "GET STRONGER AS YOU GET CLOSER. YOU HAVE 200 SECONDS"
60 PRINT "TO DEACTIVATE IT."
70 PRINT:A=INT(100*RND(1)):B=INT(100*RND(1))
80 C=INT(100*RND(1)):IF A>0 THEN 90
85 IF B>0 THEN 90
87 IF C=0 THEN 80
90 D=0:E=0:F=0:G=0
100 PRINT "SIGNAL";TAB(15);"L";TAB(20);"W";TAB(25);"H";
105 PRINT TAB(35);"SEC.";TAB(50);"COORDINATES(L,W,H)"
110 PRINT 10000-ABS((A/100+B+C*100)-(D/100+E+F*100));
112 PRINT TAB(14);D;TAB(19);E;TAB(24);F;TAB(35);G;TAB(50);
120 INPUT D,E,F:G=G+10:IF A<>D THEN 130
125 IF B<>E THEN 130
127 IF C=F THEN 170
130 IF G=200 THEN 140
135 GOTO 180
140 PRINT "BOOOOOOMMM!!!":PRINT "YOU BLEW IT. THE BUILDING BLEW UP."
145 PRINT "THE BOMB WAS LOCATED AT THE COORDINATES(L,W,H):";A;B;C:PRINT
150 PRINT "WANT TO PLAY AGAIN";
160 INPUT Z$:IF LEFT$(Z$,1)="Y" THEN 70
165 GOTO 999
170 PRINT "BOMB DEACTIVATED AT";G;" SECONDS!!!":GOTO 150
180 IF D>99 THEN 200
183 IF D<0 THEN 200
185 IF E>99 THEN 200
187 IF E<0 THEN 200
190 IF F>99 THEN 220
195 IF F<0 THEN 230
197 GOTO 110
200 PRINT "YOU WALKED OUT A WINDOW ON THE";:IF F<4 THEN 240
205 PRINT F;"TH FLOOR!!!"
210 PRINT "YOU WERE KILLED AND";200-G;" SECONDS LATER THE BUILDING"
215 PRINT "BLEW UP!!!":GOTO 150
220 PRINT "YOU ARE NOW";F*9;" FEET IN THE AIR!!!":GOTO 210
230 PRINT "YOU ARE NOW";-1*(F*9)"FEET UNDERGROUND!!!":GOTO 210
240 ON F GOTO 250,260,270
250 PRINT " 1ST FLOOR!!!":GOTO 210
260 PRINT " 2ND FLOOR!!!":GOTO 210
270 PRINT " 3RD FLOOR!!!":GOTO 210
999 END
