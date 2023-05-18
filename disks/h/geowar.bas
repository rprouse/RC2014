1 PRINT TAB(26);"GEOWAR"
2 PRINT TAB(20);"CREATIVE COMPUTING"
3 PRINT TAB(18);"MORRISTOWN, NEW JERSEY"
4 PRINT:PRINT:PRINT
5 PRINT "DO YOU WANT A DESCRIPTION OF THE GAME";
6 INPUT I$
7 IF I$="NO" THEN 46
8 PRINT
9 PRINT "     THE FIRST QUADRANT OF A REGULAR COORDINATE GRAPH WILL";
10 PRINT " SERVE AS"
11 PRINT "THE BATTLEFIELD.  FIVE ENEMY INSTALLATIONS ARE LOCATED";
12 PRINT " WITHIN A"
13 PRINT "30 BY 30 UNIT AREA.  NO TARGET IS INSIDE THE 10 BY 10 ";
14 PRINT "UNIT AREA"
15 PRINT "ADJACENT TO THE ORIGIN, AS THIS IS THE LOCATION OF OUR ";
16 PRINT "BASE. WHEN"
17 PRINT "THE MACHINE ASKS FOR THE DEGREE OF THE SHOT, RESPOND ";
18 PRINT "WITH A NUMBER"
19 PRINT "BETWEEN 1 AND 90."
20 PRINT
21 PRINT TAB(51),"SCARE**********"
22 PRINT "    1. A DIRECT HIT IS A HIT WITHIN 1 DEGREE OF";
23 PRINT TAB(51),"*             *"
24 PRINT "        THE TARGET.",TAB(51),"*  HIT******  *"
25 PRINT "    2. A HIT MUST PASS BETWEEN THE FIRST SET OF";
26 PRINT TAB(51),"*  *       *  *"
27 PRINT "         INTEGRAL POINTS NW AND SE OF THE TARGET.";
28 PRINT TAB(51),"*  *   D   *  *"
29 PRINT "    3. A SCARE MUST PASS BETWEEN THE NEXT SET OF";
30 PRINT TAB(51), "*  *       *  *"
31 PRINT "         INTEGRAL POINTS NW AND SE OF THE TARGET,";
32 PRINT TAB(51),"*  ******HIT  *"
33 PRINT "         AND CAUSES THE ENEMY TO RELOCATE A ";
34 PRINT TAB(51),"*             *"
35 PRINT "         MAXIMUM OF 1 UNIT IN ANY DIRECTION.";
36 PRINT TAB(51),"**********SCARE"
37 PRINT
38 PRINT
39 PRINT "    MISSLES HAVE INFINITE RANGE AND MAY HIT MORE THAN ";
40 PRINT "ONE TARGET."
41 PRINT "A MISSILE THAT NEARLY MISSES AN INSTALLATION (A SCARE) ";
42 PRINT "WILL BE"
43 PRINT "IMMEDIATELY SHOT DOWN.  ANY HITS BEFORE THIS TIME WILL ";
44 PRINT "NOT BE COUNTED"
45 PRINT "UNLESS A DIRECT HIT WAS MADE."
46 PRINT
47 PRINT
48 PRINT "READY TO GO";
49 INPUT R$
50 IF R$="NO" THEN 192
51 PRINT "GOOD LUCK!"
52 PRINT
53 DIM C(10),H(20),D(10),S(20),F(5)
54 DEF FNV(V1)=INT((180/3.14159)*ATN(V1)+.5)
55 X=250
56 X1=RND(1)
57 G2=0
58 S2=0
59 D2=0
60 H2=0
61 FOR K=1 TO 10
62 GOSUB 154
63 IF INT(K/2)<>K/2 THEN 70
64 IF C(K-1)>10 THEN 70
65 IF C(K)>10 THEN 70
66 FOR L=K-1 TO K
67 GOSUB 154
68 NEXT L
69 GOTO 63
70 NEXT K
71 S=0
72 FOR L=1 TO 5
73 D(L)=FNV(C(2*L)/C(2*L-1))
74 NEXT L
75 A=2
76 L1=10
77 T5=5
78 D5=0
79 H5=0
80 GOSUB 147
81 PRINT
82 PRINT "ENTER DEGREE OF SHOT"
83 D1=0
84 H1=0
85 FOR Q=1 TO 5
86 F(Q)=20
87 NEXT Q
88 INPUT D
89 IF D>=90 THEN 81
90 ON SGN(D)+2 GOTO 177,192
91 S=S+1
92 FOR A=2 TO 10 STEP 2
93 IF D>S(A) THEN 103
94 IF D<S(A-1) THEN 103
95 IF D>H(A) THEN 105
96 IF D<H(A-1) THEN 105
97 IF D>D(A/2)+1 THEN 101
98 IF D<D(A/2)-1 THEN 101
99 D1=D1+1
100 GOTO 102
101 H1=H1+1
102 F(D1+H1)=A
103 NEXT A
104 GOTO 108
105 IF D1>0 THEN 110
106 GOSUB 138
107 GOTO 81
108 IF D1+H1<>0 THEN 112
109 IF T5=1 THEN 159
110 PRINT "NO LUCK -- TRY AGAIN."
111 GOTO 81
112 IF D1>0 THEN 118
113 IF H1>1 THEN 116
114 PRINT "**CONGRATULATIONS**  A HIT."
115 GOTO 124
116 PRINT "**CONGRATULATIONS**";H1;"HITS."
117 GOTO 124
118 PRINT "****BULLS EYE**** ";
119 IF D1>1 THEN 123
120 IF H1>0 THEN 123
121 PRINT " A DIRECT HIT!"
122 GOTO 124
123 PRINT D1+H1;" HITS -- A DIRECT HIT ON";D1;" OF THEM!"
124 T5=T5-(D1+H1)
125 D5=D5+D1
126 H5=H5+H1
127 IF T5=0 THEN 167
128 FOR J=1 TO H1+D1
129 Z=F(J)
130 D(Z/2)=0
131 H(Z)=0
132 H(Z-1)=0
133 S(Z)=0
134 S(Z-1)=0
135 NEXT J
136 PRINT 5-T5;" DOWN --";T5;" TO GO."
137 GOTO 81
138 PRINT "A NEAR HIT.  ENEMY HAS RELOCATED."
139 FOR R=1 TO 2
140 X2=INT(RND(1)*100)
141 IF ABS(C(A-(R-1))-X2)>1 THEN 140
142 IF C(A-(R-1))<=2 THEN 140
143 C(A-(R-1))=X2
144 NEXT R
145 D(A/2)=FNV(C(A)/C(A-1))
146 L1=A
147 FOR I=A TO L1 STEP 2
148 H(I-1)=FNV((C(I)-1)/(C(I-1)+1))
149 H(I)=FNV((C(I)+1)/(C(I-1)-1))
150 S(I-1)=FNV((C(I)-2)/(C(I-1)+2))
151 S(I)=FNV((C(I)+2)/(C(I-1)-2))
152 NEXT I
153 RETURN
154 R=INT(RND(1)*100)
155 IF R>30 THEN 154
156 IF R<3 THEN 154
157 C(K)=R
158 RETURN
159 FOR Z1=1 TO 5
160 IF D(Z1)>1 THEN 162
161 NEXT Z1
162 IF D<D(Z1) THEN 165
163 PRINT "TOO HIGH -- TRY AGAIN."
164 GOTO 81
165 PRINT "TOO LOW -- TRY AGAIN."
166 GOTO 81
167 PRINT
168 PRINT "GAME TOTALS:";H5;" HITS AND";D5;" DIRECT HITS ON";S;" SHOTS."
170 PRINT "READY FOR A NEW GAME";
171 G2=G2+1
172 S2=S2+S
173 D2=D2+D5
174 H2=H2+H5
175 INPUT G$
176 IF G$="NO" THEN 184
177 PRINT
178 PRINT
179 PRINT
180 PRINT "FIVE NEW INSTALLATIONS HAVE BEEN BUILT AT DIFFERENT ";
181 PRINT "LOCATIONS."
182 PRINT "GOOD LUCK!"
183 GOTO 61
184 PRINT
185 PRINT
186 PRINT "TOTALS FOR";G2;" GAMES:";H2;" HITS AND";D2
187 PRINT " DIRECT HITS ON";S2;" SHOTS."
188 PRINT "AN AVERAGE OF";S2/(D2+H2);" SHOTS PER TARGET."
192 END
