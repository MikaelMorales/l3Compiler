58180000  RALO(Lb,24)
5a070000  RALO(Ob,7)
4c000015  LDLO(L0,21)
4c040056  LDLO(L1,86)
4c080061  LDLO(L2,97)
4c0c0073  LDLO(L3,115)
4c100001  LDLO(L4,1)
5c141328  BALO(L5,L4,202)
4c180000  LDLO(L6,0)
4c1c0670  LDLO(L7,1648)
6c1c1418  BSET(L7,L5,L6)
5c1c1328  BALO(L7,L4,202)
4c200688  LDLO(L8,1672)
6c201c18  BSET(L8,L7,L6)
5c201808  BALO(L8,L6,2)
4c240005  LDLO(L9,5)
5c2810cc  BALO(L10,L4,51)
6c102818  BSET(L4,L10,L6)
4c284e21  LDLO(L10,20001)
4c2c000e  LDLO(L11,14)
5c302f20  BALO(L12,L11,200)
4c2c0236  LDLO(L11,566)
6c2c3018  BSET(L11,L12,L6)
4c2c030e  LDLO(L11,782)
6c2c3010  BSET(L11,L12,L4)
4c34031e  LDLO(L13,798)
4c380002  LDLO(L14,2)
6c343038  BSET(L13,L12,L14)
4c3403a6  LDLO(L13,934)
4c3c0003  LDLO(L15,3)
6c34303c  BSET(L13,L12,L15)
4c34037e  LDLO(L13,894)
4c400004  LDLO(L16,4)
6c343040  BSET(L13,L12,L16)
4c440396  LDLO(L17,918)
6c443024  BSET(L17,L12,L9)
4c44034e  LDLO(L17,846)
4c480006  LDLO(L18,6)
6c443048  BSET(L17,L12,L18)
4c440007  LDLO(L17,7)
6c2c3044  BSET(L11,L12,L17)
4c2c0366  LDLO(L11,870)
4c440008  LDLO(L17,8)
6c2c3044  BSET(L11,L12,L17)
4c2c0106  LDLO(L11,262)
4c440009  LDLO(L17,9)
6c2c3044  BSET(L11,L12,L17)
4c44000a  LDLO(L17,10)
6c343044  BSET(L13,L12,L17)
4c340336  LDLO(L13,822)
4c48000b  LDLO(L18,11)
6c343048  BSET(L13,L12,L18)
4c3401fe  LDLO(L13,510)
4c48000c  LDLO(L18,12)
6c343048  BSET(L13,L12,L18)
4c34000d  LDLO(L13,13)
6c2c3034  BSET(L11,L12,L13)
4c340784  LDLO(L13,1924)
57903000  MOVE(O4,L12)
40340000  CALL(L13)
54338000  MOVE(L12,O0)
4c300350  LDLO(L12,848)
40300000  CALL(L12)
54338000  MOVE(L12,O0)
4c34016e  LDLO(L13,366)
34303485  JNE(L12,L13,133)
54141c00  MOVE(L5,L7)
541c1000  MOVE(L7,L4)
4c300350  LDLO(L12,848)
40300000  CALL(L12)
54338000  MOVE(L12,O0)
4c340638  LDLO(L13,1592)
57900800  MOVE(O4,L2)
57940c00  MOVE(O5,L3)
57983000  MOVE(O6,L12)
40340000  CALL(L13)
54378000  MOVE(L13,O0)
3034440f  JEQ(L13,L17,15)
24341c10  XOR(L13,L7,L4)
08483444  MUL(L18,L13,L17)
244c4810  XOR(L19,L18,L4)
18503038  LSR(L20,L12,L14)
4c540060  LDLO(L21,96)
04585054  SUB(L22,L20,L21)
685c1418  BGET(L23,L5,L6)
57901400  MOVE(O4,L5)
57944c00  MOVE(O5,L19)
57985800  MOVE(O6,L22)
405c0000  CALL(L23)
545f8000  MOVE(L23,O0)
541c5c00  MOVE(L7,L23)
3bffffe9  JI(-23)
540c1c00  MOVE(L3,L7)
4c1406a0  LDLO(L5,1696)
57900800  MOVE(O4,L2)
57940c00  MOVE(O5,L3)
40140000  CALL(L5)
54178000  MOVE(L5,O0)
5c144320  BALO(L5,L16,200)
4c1c010e  LDLO(L7,270)
6c1c1418  BSET(L7,L5,L6)
6c2c1410  BSET(L11,L5,L4)
4c1c01ee  LDLO(L7,494)
6c1c1438  BSET(L7,L5,L14)
6c2c143c  BSET(L11,L5,L15)
4c1c0784  LDLO(L7,1924)
57901400  MOVE(O4,L5)
401c0000  CALL(L7)
54178000  MOVE(L5,O0)
4c140a88  LDLO(L5,2696)
57902800  MOVE(O4,L10)
57942000  MOVE(O5,L8)
57980c00  MOVE(O6,L3)
40140000  CALL(L5)
540f8000  MOVE(L3,O0)
54140c00  MOVE(L5,L3)
540c2000  MOVE(L3,L8)
641c1400  BTAG(L7,L5)
14201c10  LSL(L8,L7,L4)
24282010  XOR(L10,L8,L4)
34242846  JNE(L9,L10,70)
68140c18  BGET(L5,L3,L6)
4c1c06a0  LDLO(L7,1696)
57900800  MOVE(O4,L2)
57941400  MOVE(O5,L5)
401c0000  CALL(L7)
54178000  MOVE(L5,O0)
68140c10  BGET(L5,L3,L4)
540c1400  MOVE(L3,L5)
64140c00  BTAG(L5,L3)
141c1410  LSL(L7,L5,L4)
24201c10  XOR(L8,L7,L4)
34242006  JNE(L9,L8,6)
4c0004ec  LDLO(L0,1260)
57900400  MOVE(O4,L1)
40000000  CALL(L0)
54038000  MOVE(L0,O0)
48180000  HALT(L6)
68280c18  BGET(L10,L3,L6)
4c2c07d1  LDLO(L11,2001)
2c2c2830  JLE(L11,L10,48)
4c3006a0  LDLO(L12,1696)
57900800  MOVE(O4,L2)
57941000  MOVE(O5,L4)
40300000  CALL(L12)
542f8000  MOVE(L11,O0)
4c2c00c9  LDLO(L11,201)
2c2c2819  JLE(L11,L10,25)
4c3006a0  LDLO(L12,1696)
57900800  MOVE(O4,L2)
57941000  MOVE(O5,L4)
40300000  CALL(L12)
542f8000  MOVE(L11,O0)
2c00280e  JLE(L0,L10,14)
4c2c06a0  LDLO(L11,1696)
57900800  MOVE(O4,L2)
57941000  MOVE(O5,L4)
402c0000  CALL(L11)
542f8000  MOVE(L11,O0)
4c2c06a0  LDLO(L11,1696)
57900800  MOVE(O4,L2)
57942800  MOVE(O5,L10)
402c0000  CALL(L11)
542f8000  MOVE(L11,O0)
682c0c10  BGET(L11,L3,L4)
540c2c00  MOVE(L3,L11)
3bffffdb  JI(-37)
4c2c06a0  LDLO(L11,1696)
57900800  MOVE(O4,L2)
57942800  MOVE(O5,L10)
402c0000  CALL(L11)
3bfffff8  JI(-8)
2c00280b  JLE(L0,L10,11)
4c3006a0  LDLO(L12,1696)
57900800  MOVE(O4,L2)
57941000  MOVE(O5,L4)
40300000  CALL(L12)
54338000  MOVE(L12,O0)
4c3006a0  LDLO(L12,1696)
57900800  MOVE(O4,L2)
57942800  MOVE(O5,L10)
40300000  CALL(L12)
3bffffed  JI(-19)
4c3006a0  LDLO(L12,1696)
57900800  MOVE(O4,L2)
57942800  MOVE(O5,L10)
40300000  CALL(L12)
3bffffe8  JI(-24)
57803800  MOVE(O0,L14)
3bffffd4  JI(-44)
682c1418  BGET(L11,L5,L6)
5c30380c  BALO(L12,L14,3)
6c2c3018  BSET(L11,L12,L6)
6c0c3010  BSET(L3,L12,L4)
68341410  BGET(L13,L5,L4)
540c3000  MOVE(L3,L12)
54143400  MOVE(L5,L13)
3bffffb0  JI(-80)
4c340638  LDLO(L13,1592)
57900800  MOVE(O4,L2)
57940c00  MOVE(O5,L3)
57983000  MOVE(O6,L12)
40340000  CALL(L13)
54378000  MOVE(L13,O0)
30344406  JEQ(L13,L17,6)
18343038  LSR(L13,L12,L14)
4c300060  LDLO(L12,96)
04483430  SUB(L18,L13,L12)
541c4800  MOVE(L7,L18)
3bffff73  JI(-141)
540c1000  MOVE(L3,L4)
3bffff8a  JI(-118)
58070000  RALO(Lb,7)
70000000  BREA(L0)
4c040001  LDLO(L1,1)
14080004  LSL(L2,L0,L1)
24000804  XOR(L0,L2,L1)
4c0bffff  LDLO(L2,-1)
34080004  JNE(L2,L0,4)
4c00000a  LDLO(L0,10)
57100000  MOVE(I4,L0)
44000000  RET
4c080101  LDLO(L2,257)
1c0c0800  AND(L3,L2,L0)
34040c06  JNE(L1,L3,6)
4c040002  LDLO(L1,2)
14080004  LSL(L2,L0,L1)
24000804  XOR(L0,L2,L1)
57100000  MOVE(I4,L0)
44000000  RET
4c080181  LDLO(L2,385)
4c0c01c1  LDLO(L3,449)
1c100c00  AND(L4,L3,L0)
34081012  JNE(L2,L4,18)
70080000  BREA(L2)
140c0804  LSL(L3,L2,L1)
24080c04  XOR(L2,L3,L1)
4c0c007f  LDLO(L3,127)
1c10080c  AND(L4,L2,L3)
4c08003f  LDLO(L2,63)
1c0c0800  AND(L3,L2,L0)
24000c04  XOR(L0,L3,L1)
4c080006  LDLO(L2,6)
140c0008  LSL(L3,L0,L2)
24000c04  XOR(L0,L3,L1)
20040010  OR(L1,L0,L4)
4c000002  LDLO(L0,2)
14080400  LSL(L2,L1,L0)
24040800  XOR(L1,L2,L0)
57100400  MOVE(I4,L1)
44000000  RET
4c0801e1  LDLO(L2,481)
1c100800  AND(L4,L2,L0)
340c101b  JNE(L3,L4,27)
70080000  BREA(L2)
140c0804  LSL(L3,L2,L1)
24080c04  XOR(L2,L3,L1)
4c0c007f  LDLO(L3,127)
1c10080c  AND(L4,L2,L3)
70080000  BREA(L2)
14140804  LSL(L5,L2,L1)
24081404  XOR(L2,L5,L1)
1c14080c  AND(L5,L2,L3)
4c08001f  LDLO(L2,31)
1c0c0800  AND(L3,L2,L0)
24000c04  XOR(L0,L3,L1)
4c08000c  LDLO(L2,12)
140c0008  LSL(L3,L0,L2)
24000c04  XOR(L0,L3,L1)
24081004  XOR(L2,L4,L1)
4c0c0006  LDLO(L3,6)
1410080c  LSL(L4,L2,L3)
24081004  XOR(L2,L4,L1)
20040008  OR(L1,L0,L2)
20000414  OR(L0,L1,L5)
4c040002  LDLO(L1,2)
14080004  LSL(L2,L0,L1)
24000804  XOR(L0,L2,L1)
57100000  MOVE(I4,L0)
44000000  RET
70080000  BREA(L2)
140c0804  LSL(L3,L2,L1)
24080c04  XOR(L2,L3,L1)
4c0c007f  LDLO(L3,127)
1c10080c  AND(L4,L2,L3)
70080000  BREA(L2)
14140804  LSL(L5,L2,L1)
24081404  XOR(L2,L5,L1)
1c14080c  AND(L5,L2,L3)
70080000  BREA(L2)
14180804  LSL(L6,L2,L1)
24081804  XOR(L2,L6,L1)
1c18080c  AND(L6,L2,L3)
4c08000f  LDLO(L2,15)
1c0c0800  AND(L3,L2,L0)
24000c04  XOR(L0,L3,L1)
4c080012  LDLO(L2,18)
140c0008  LSL(L3,L0,L2)
24000c04  XOR(L0,L3,L1)
24081004  XOR(L2,L4,L1)
4c0c000c  LDLO(L3,12)
1410080c  LSL(L4,L2,L3)
24081004  XOR(L2,L4,L1)
240c1404  XOR(L3,L5,L1)
4c100006  LDLO(L4,6)
14140c10  LSL(L5,L3,L4)
240c1404  XOR(L3,L5,L1)
20040008  OR(L1,L0,L2)
20000c18  OR(L0,L3,L6)
20080400  OR(L2,L1,L0)
4c000002  LDLO(L0,2)
14040800  LSL(L1,L2,L0)
24080400  XOR(L2,L1,L0)
57100800  MOVE(I4,L2)
44000000  RET
58060000  RALO(Lb,6)
4c000002  LDLO(L0,2)
18071000  LSR(L1,I4,L0)
4c0000ff  LDLO(L0,255)
28000406  JLT(L0,L1,6)
4c000001  LDLO(L0,1)
18080400  LSR(L2,L1,L0)
74080000  BWRI(L2)
57100000  MOVE(I4,L0)
44000000  RET
4c000fff  LDLO(L0,4095)
28000411  JLT(L0,L1,17)
4c000181  LDLO(L0,385)
4c080001  LDLO(L2,1)
4c0c0006  LDLO(L3,6)
1810040c  LSR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
2010000c  OR(L4,L0,L3)
18001008  LSR(L0,L4,L2)
74000000  BWRI(L0)
4c000101  LDLO(L0,257)
4c0c007f  LDLO(L3,127)
1c10040c  AND(L4,L1,L3)
20040010  OR(L1,L0,L4)
18000408  LSR(L0,L1,L2)
74000000  BWRI(L0)
57100400  MOVE(I4,L1)
44000000  RET
4c01ffff  LDLO(L0,131071)
28000418  JLT(L0,L1,24)
4c0001c1  LDLO(L0,449)
4c080001  LDLO(L2,1)
4c0c000c  LDLO(L3,12)
1810040c  LSR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
2010000c  OR(L4,L0,L3)
18001008  LSR(L0,L4,L2)
74000000  BWRI(L0)
4c000101  LDLO(L0,257)
4c0c0006  LDLO(L3,6)
1810040c  LSR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
4c10007f  LDLO(L4,127)
1c140c10  AND(L5,L3,L4)
200c0014  OR(L3,L0,L5)
18140c08  LSR(L5,L3,L2)
74140000  BWRI(L5)
1c0c0410  AND(L3,L1,L4)
2004000c  OR(L1,L0,L3)
18000408  LSR(L0,L1,L2)
74000000  BWRI(L0)
57100400  MOVE(I4,L1)
44000000  RET
4c0001e1  LDLO(L0,481)
4c080001  LDLO(L2,1)
4c0c0012  LDLO(L3,18)
1810040c  LSR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
2010000c  OR(L4,L0,L3)
18001008  LSR(L0,L4,L2)
74000000  BWRI(L0)
4c000101  LDLO(L0,257)
4c0c000c  LDLO(L3,12)
1810040c  LSR(L4,L1,L3)
200c1008  OR(L3,L4,L2)
4c10007f  LDLO(L4,127)
1c140c10  AND(L5,L3,L4)
200c0014  OR(L3,L0,L5)
18140c08  LSR(L5,L3,L2)
74140000  BWRI(L5)
4c0c0006  LDLO(L3,6)
1814040c  LSR(L5,L1,L3)
200c1408  OR(L3,L5,L2)
1c140c10  AND(L5,L3,L4)
200c0014  OR(L3,L0,L5)
18140c08  LSR(L5,L3,L2)
74140000  BWRI(L5)
1c0c0410  AND(L3,L1,L4)
2004000c  OR(L1,L0,L3)
18000408  LSR(L0,L1,L2)
74000000  BWRI(L0)
57100400  MOVE(I4,L1)
44000000  RET
58020000  RALO(Lb,2)
4c000002  LDLO(L0,2)
18071800  LSR(L1,I6,L0)
28071008  JLT(L1,I4,8)
2b140404  JLT(I5,L1,4)
4c00001a  LDLO(L0,26)
57100000  MOVE(I4,L0)
44000000  RET
4c00000a  LDLO(L0,10)
57100000  MOVE(I4,L0)
44000000  RET
4c00000a  LDLO(L0,10)
57100000  MOVE(I4,L0)
44000000  RET
58020000  RALO(Lb,2)
4c000001  LDLO(L0,1)
24071400  XOR(L1,I5,L0)
00000718  ADD(L0,L1,I6)
57100000  MOVE(I4,L0)
44000000  RET
58020000  RALO(Lb,2)
4c000001  LDLO(L0,1)
24071800  XOR(L1,I6,L0)
04031404  SUB(L0,I5,L1)
57100000  MOVE(I4,L0)
44000000  RET
58030000  RALO(Lb,3)
5a060000  RALO(Ob,6)
4c000001  LDLO(L0,1)
2c031412  JLE(L0,I5,18)
4c00016e  LDLO(L0,366)
4c0404ec  LDLO(L1,1260)
57900000  MOVE(O4,L0)
40040000  CALL(L1)
54038000  MOVE(L0,O0)
4c000001  LDLO(L0,1)
28031405  JLT(L0,I5,5)
4c000700  LDLO(L0,1792)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
3c000000  TCAL(L0)
24071400  XOR(L1,I5,L0)
04080004  SUB(L2,L0,L1)
4c000700  LDLO(L0,1792)
57931000  MOVE(O4,I4)
57940800  MOVE(O5,L2)
3c000000  TCAL(L0)
4c000002  LDLO(L0,2)
57800000  MOVE(O0,L0)
3bfffff1  JI(-15)
58040000  RALO(Lb,4)
5a060000  RALO(Ob,6)
4c03ffed  LDLO(L0,-19)
2803141b  JLT(L0,I5,27)
4c000001  LDLO(L0,1)
24071400  XOR(L1,I5,L0)
4c080014  LDLO(L2,20)
0c0c0408  DIV(L3,L1,L2)
14040c00  LSL(L1,L3,L0)
24080400  XOR(L2,L1,L0)
4c000700  LDLO(L0,1792)
57931000  MOVE(O4,I4)
57940800  MOVE(O5,L2)
40000000  CALL(L0)
54038000  MOVE(L0,O0)
4c000001  LDLO(L0,1)
24071400  XOR(L1,I5,L0)
4c080014  LDLO(L2,20)
100c0408  MOD(L3,L1,L2)
24040c00  XOR(L1,L3,L0)
24080400  XOR(L2,L1,L0)
04040008  SUB(L1,L0,L2)
24080400  XOR(L2,L1,L0)
00000b10  ADD(L0,L2,I4)
4c040002  LDLO(L1,2)
14080004  LSL(L2,L0,L1)
24000804  XOR(L0,L2,L1)
4c0404ec  LDLO(L1,1260)
57900000  MOVE(O4,L0)
3c040000  TCAL(L1)
4c000002  LDLO(L0,2)
57800000  MOVE(O0,L0)
3bffffee  JI(-18)
580a0000  RALO(Lb,10)
5a050000  RALO(Ob,5)
4c000001  LDLO(L0,1)
54040000  MOVE(L1,L0)
600b1000  BSIZ(L2,I4)
140c0800  LSL(L3,L2,L0)
24100c00  XOR(L4,L3,L0)
2c10040c  JLE(L4,L1,12)
18140400  LSR(L5,L1,L0)
681b1014  BGET(L6,I4,L5)
4c1c04ec  LDLO(L7,1260)
57901800  MOVE(O4,L6)
401c0000  CALL(L7)
541f8000  MOVE(L7,O0)
4c1c0003  LDLO(L7,3)
24200400  XOR(L8,L1,L0)
0024201c  ADD(L9,L8,L7)
54042400  MOVE(L1,L9)
3bfffff2  JI(-14)
4c000002  LDLO(L0,2)
57100000  MOVE(I4,L0)
44000000  RET
58020000  RALO(Lb,2)
5a090000  RALO(Ob,9)
4c000001  LDLO(L0,1)
4c040804  LDLO(L1,2052)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
579b1800  MOVE(O6,I6)
579f1c00  MOVE(O7,I7)
57a00000  MOVE(O8,L0)
3c040000  TCAL(L1)
58070000  RALO(Lb,7)
5a090000  RALO(Ob,9)
4c000005  LDLO(L0,5)
64071800  BTAG(L1,I6)
4c080001  LDLO(L2,1)
140c0408  LSL(L3,L1,L2)
24040c08  XOR(L1,L3,L2)
3400040b  JNE(L0,L1,11)
340b2003  JNE(L2,I8,3)
57131400  MOVE(I4,I5)
44000000  RET
4c000002  LDLO(L0,2)
5c04000c  BALO(L1,L0,3)
4c000000  LDLO(L0,0)
6f200400  BSET(I8,L1,L0)
6f140408  BSET(I5,L1,L2)
57100400  MOVE(I4,L1)
44000000  RET
4c000000  LDLO(L0,0)
68071800  BGET(L1,I6,L0)
240c0408  XOR(L3,L1,L2)
18071c08  LSR(L1,I7,L2)
08100c04  MUL(L4,L3,L1)
24041008  XOR(L1,L4,L2)
240c0408  XOR(L3,L1,L2)
00040f20  ADD(L1,L3,I8)
240c0408  XOR(L3,L1,L2)
24071008  XOR(L1,I4,L2)
10100c04  MOD(L4,L3,L1)
24141008  XOR(L5,L4,L2)
68131808  BGET(L4,I6,L2)
0c180c04  DIV(L6,L3,L1)
14041808  LSL(L1,L6,L2)
240c0408  XOR(L3,L1,L2)
4c040804  LDLO(L1,2052)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
57981000  MOVE(O6,L4)
579f1c00  MOVE(O7,I7)
57a00c00  MOVE(O8,L3)
40040000  CALL(L1)
54078000  MOVE(L1,O0)
4c0c0002  LDLO(L3,2)
5c100c0c  BALO(L4,L3,3)
6c141000  BSET(L5,L4,L0)
6c041008  BSET(L1,L4,L2)
57101000  MOVE(I4,L4)
44000000  RET
58040000  RALO(Lb,4)
5a090000  RALO(Ob,9)
4c000005  LDLO(L0,5)
64071800  BTAG(L1,I6)
4c080001  LDLO(L2,1)
140c0408  LSL(L3,L1,L2)
24040c08  XOR(L1,L3,L2)
34000403  JNE(L0,L1,3)
57131400  MOVE(I4,I5)
44000000  RET
4c000000  LDLO(L0,0)
68071800  BGET(L1,I6,L0)
4c0007dc  LDLO(L0,2012)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
579b1c00  MOVE(O6,I7)
579c0400  MOVE(O7,L1)
40000000  CALL(L0)
54038000  MOVE(L0,O0)
68071808  BGET(L1,I6,L2)
4c0c08c4  LDLO(L3,2244)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
57980400  MOVE(O6,L1)
579f1c00  MOVE(O7,I7)
400c0000  CALL(L3)
54078000  MOVE(L1,O0)
4c0c07dc  LDLO(L3,2012)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
57980400  MOVE(O6,L1)
579f1000  MOVE(O7,I4)
400c0000  CALL(L3)
54078000  MOVE(L1,O0)
4c0c0968  LDLO(L3,2408)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
57980000  MOVE(O6,L0)
579c0400  MOVE(O7,L1)
57a00800  MOVE(O8,L2)
3c0c0000  TCAL(L3)
58080000  RALO(Lb,8)
5a090000  RALO(Ob,9)
4c000005  LDLO(L0,5)
64071800  BTAG(L1,I6)
4c080001  LDLO(L2,1)
140c0408  LSL(L3,L1,L2)
24040c08  XOR(L1,L3,L2)
34000410  JNE(L0,L1,16)
340b2003  JNE(L2,I8,3)
57131c00  MOVE(I4,I7)
44000000  RET
4c000002  LDLO(L0,2)
5c04000c  BALO(L1,L0,3)
4c000000  LDLO(L0,0)
6f200400  BSET(I8,L1,L0)
6f140408  BSET(I5,L1,L2)
4c000968  LDLO(L0,2408)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
57980400  MOVE(O6,L1)
579f1c00  MOVE(O7,I7)
57a00800  MOVE(O8,L2)
3c000000  TCAL(L0)
64071c00  BTAG(L1,I7)
140c0408  LSL(L3,L1,L2)
24040c08  XOR(L1,L3,L2)
34000410  JNE(L0,L1,16)
340b2003  JNE(L2,I8,3)
57131800  MOVE(I4,I6)
44000000  RET
4c000002  LDLO(L0,2)
5c04000c  BALO(L1,L0,3)
4c000000  LDLO(L0,0)
6f200400  BSET(I8,L1,L0)
6f140408  BSET(I5,L1,L2)
4c000968  LDLO(L0,2408)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
579b1800  MOVE(O6,I6)
579c0400  MOVE(O7,L1)
57a00800  MOVE(O8,L2)
3c000000  TCAL(L0)
4c000000  LDLO(L0,0)
68071800  BGET(L1,I6,L0)
680f1c00  BGET(L3,I7,L0)
24100c08  XOR(L4,L3,L2)
000c1320  ADD(L3,L4,I8)
24100408  XOR(L4,L1,L2)
0004100c  ADD(L1,L4,L3)
240c0408  XOR(L3,L1,L2)
24071008  XOR(L1,I4,L2)
10100c04  MOD(L4,L3,L1)
24141008  XOR(L5,L4,L2)
68131808  BGET(L4,I6,L2)
681b1c08  BGET(L6,I7,L2)
0c1c0c04  DIV(L7,L3,L1)
14041c08  LSL(L1,L7,L2)
240c0408  XOR(L3,L1,L2)
4c040968  LDLO(L1,2408)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
57981000  MOVE(O6,L4)
579c1800  MOVE(O7,L6)
57a00c00  MOVE(O8,L3)
40040000  CALL(L1)
54078000  MOVE(L1,O0)
4c0c0002  LDLO(L3,2)
5c100c0c  BALO(L4,L3,3)
6c141000  BSET(L5,L4,L0)
6c041008  BSET(L1,L4,L2)
57101000  MOVE(I4,L4)
44000000  RET
58050000  RALO(Lb,5)
5a080000  RALO(Ob,8)
4c000001  LDLO(L0,1)
34031809  JNE(L0,I6,9)
4c040003  LDLO(L1,3)
4c080002  LDLO(L2,2)
5c0c080c  BALO(L3,L2,3)
4c080000  LDLO(L2,0)
6c040c08  BSET(L1,L3,L2)
6f140c00  BSET(I5,L3,L0)
57100c00  MOVE(I4,L3)
44000000  RET
4c040002  LDLO(L1,2)
5c08040c  BALO(L2,L1,3)
4c0c0000  LDLO(L3,0)
6f18080c  BSET(I6,L2,L3)
6f140800  BSET(I5,L2,L0)
04031804  SUB(L0,I6,L1)
4c040a88  LDLO(L1,2696)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
57980000  MOVE(O6,L0)
40040000  CALL(L1)
54038000  MOVE(L0,O0)
4c0408c4  LDLO(L1,2244)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
57980800  MOVE(O6,L2)
579c0000  MOVE(O7,L0)
3c040000  TCAL(L1)
