5 WIDTH 255
10 MAXITER = 20
20 LET C$ = " .,'~!^:;[/<&?oxOX#  "
30 FOR Y = -39 TO 39
40 FOR X = -39 TO 39
50 CREAL = X / 20
70 CIMAG = Y / 20
80 ZREAL = CREAL
90 ZIMAG = CIMAG
95 COUNT = 1
100 ZM = ZREAL * ZREAL
105 ZN = ZIMAG * ZIMAG
107 ZL = ZM + ZN
110 IF ZL > 4 THEN GOTO 170
120 ZR2 = ZM - ZN + CREAL
130 ZIMAG = ZREAL * ZIMAG * 2 + CIMAG
140 ZREAL = ZR2
150 COUNT = COUNT + 1
160 IF COUNT < MAXITER THEN GOTO 100
170 PRINT MID$(C$, 1 + COUNT, 1);
180 NEXT X
185 PRINT ""
190 NEXT Y