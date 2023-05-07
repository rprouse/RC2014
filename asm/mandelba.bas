10 width 255
100 for py=0 to 21
110 for px=0 to 31
120 xz = px*3.5/32-2.5
130 yz = py*2/22-1
140 x = 0
150 y = 0
160 for i=0 to 14
170 if x*x+y*y > 4 then goto 220
180 xt = x*x - y*y + xz
190 y = 2*x*y + yz
200 x = xt
210 next i
220 let ink$ = str$(184-(7*(i-1)))
225 let clr$ = right$(ink$,len(ink$)-1)
230 print chr$(27);"[38;5;";clr$;"m";
235 print chr$(27);"[48;5;";clr$;"m";
237 print "##";
240 next px
245 gosub 1000
250 print ""
260 next py

999 end

1000 rem Reset colors
1010 print chr$(27);"[39m";
1020 print chr$(27);"[49m";
1030 return
