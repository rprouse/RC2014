5 PRINT TAB(26);"ROTATE"
8 PRINT TAB(20);"CREATIVE COMPUTING"
10 PRINT TAB(18);"MORRISTOWN, NEW JERSEY":PRINT:PRINT:PRINT
11 DIM B(16),B$(16)
12 INPUT "INSTRUCTIONS";A$:PRINT:IF LEFT$(A$,1)="N" THEN 140
15 PRINT "IN THIS GAME THE BOARD IS LAID OUT AS FOLLOWS:"
25 FOR I=1 TO 16:B(I)=I:NEXT
30 PRINT:FOR I=1 TO 13 STEP 4
35 PRINT TAB(2);B(I);TAB(6);B(I+1);TAB(10);B(I+2);TAB(14);B(I+3)
40 NEXT I:PRINT
45 PRINT "BOARD POSITIONS ARE OCCUPIED RANDOMLY BY THE LETTERS A TO P."
50 PRINT "THE OBJECT OF THE GAME IS TO ORDER THE LETTERS BY ROTATING"
55 PRINT "ANY FOUR LETTERS CLOCKWISE ONE POSITION.  YOU SPECIFY THE"
60 PRINT "UPPER LEFT POSITION OF THE FOUR YOU WISH TO ROTATE, I.E.,"
65 PRINT "VALID MOVES ARE 1, 2, 3, 5, 6, 7, 9, 10 AND 11."
70 PRINT "CONSEQUENTLY, IF THE BOARD LOOKED LIKE:"
75 FOR I=1 TO 16:B$(I)=CHR$(I+64):NEXT:B$(2)="C":B$(3)="G"
80 B$(6)="B":B$(7)="F":GOSUB 400
85 PRINT "AND YOU ROTATED POSITION 2, THE BOARD WOULD BE:"
90 FOR I=2 TO 7:B$(I)=CHR$(I+64):NEXT I:GOSUB 400
95 PRINT "AND YOU WOULD WIN !":PRINT
100 PRINT "YOU ALSO GET ONE 'SPECIAL' MOVE PER GAME WHICH YOU MAY OR"
105 PRINT "MAY NOT NEED.  THE SPECIAL MOVE ALLOWS YOU TO EXCHANGE"
110 PRINT "ANY TWO ADJACENT LETTERS IN A ROW.  TO MAKE THIS MOVE,"
115 PRINT "INPUT A '-1' AS YOUR MOVE AND YOU WILL BE ASKED FOR THE"
120 PRINT "POSITIONS OF THE TWO LETTERS TO EXCHANGE. REMEMBER --"
125 PRINT "ONLY ONE SPECIAL MOVE PER GAME!":PRINT
130 PRINT "TO GIVE UP AT ANY TIHE, TYPE A '0'.":PRINT:PRINT "GOOD LUCK !":PRINT
140 FOR I=1 TO 16:B$(I)="0":NEXT I
150 FOR I=1 TO 16
160 T$=CHR$(INT(16*RND(1)+65))
165 FOR J=1 TO I
170 IF B$(J)=T$ THEN 160
175 NEXT J
180 B$(I)=T$:NEXT I
190 M=0:S=0:PRINT "HERE'S THE STARTING BOARD...":GOSUB 400
200 INPUT "POSITION TO ROTATE";I:IF I=0 THEN PRINT:PRINT:GOTO 140
205 IF I=-1 THEN 510
210 IF I=4 OR I=8 OR I>12 THEN PRINT "ILLEGAL.  AGAIN...":GOTO 200
220 M=M+1:T$=B$(I)
230 B$(I)=B$(I+4):B$(I+4)=B$(I+5):B$(I+5)=B$(I+1):B$(I+1)=T$
240 GOSUB 400
305 FOR I=1 TO 16
310 IF CHR$(I*64)<>B$(I) THEN 200
315 NEXT I
320 PRINT:PRINT "YOU ORDERED THE BOARD IN";M;" MOVES.":M1=M1+M:G=G+1
325 PRINT CHR$(7):FOR I=1 TO 15
330 PRINT:INPUT "PLAY AGAIN";A$:IF LEFT$(A$,1)="Y" THEN 140
340 PRINT:PRINT "YOU PLAYED";G;" GAMES AND ORDERED THE BOARD IN AN AVERAGE"
350 PRINT "OF";M1/G;" MOVES PER GAME.":PRINT:GOTO 999
400 PRINT:FOR I=1 TO 13 STEP 4
410 PRINT B$(I)" "B$(I+1)" "B$(I+2)" "B$(I+3)
420 NEXT I:PRINT:RETURN
510 INPUT "EXCHANGE WHICH TWO POSITIONS";X,Y
520 IF X<>Y+11 AND X<>Y-1 THEN PRINT "ILLEGAL. AGAIN...":GOTO 510
530 S=S+1:IF S>1 THEN PRINT "ONLY ONE SPECIAL MOVE PER GAME.":GOTO 200
540 T$=B$(X):B$(X)=B$(Y):B$(Y)=T$:GOTO 240
999 END
