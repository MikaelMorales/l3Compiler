58450000  RALO(Lb,69)
5a070000  RALO(Ob,7)
4c000056  LDLO(L0,86)
4c040061  LDLO(L1,97)
4c080073  LDLO(L2,115)
4c0c0001  LDLO(L3,1)
5c100f28  BALO(L4,L3,202)
4c140000  LDLO(L5,0)
4c1809d8  LDLO(L6,2520)
6c181014  BSET(L6,L4,L5)
5c180f28  BALO(L6,L3,202)
4c1c09f0  LDLO(L7,2544)
6c1c1814  BSET(L7,L6,L5)
5c1c1408  BALO(L7,L5,2)
4c200003  LDLO(L8,3)
5c240ccc  BALO(L9,L3,51)
6c0c2414  BSET(L3,L9,L5)
4c240018  LDLO(L9,24)
5c282720  BALO(L10,L9,200)
4c2c032e  LDLO(L11,814)
6c2c2814  BSET(L11,L10,L5)
4c300376  LDLO(L12,886)
6c30280c  BSET(L12,L10,L3)
4c340005  LDLO(L13,5)
4c3803a6  LDLO(L14,934)
4c3c0002  LDLO(L15,2)
6c38283c  BSET(L14,L10,L15)
4c400007  LDLO(L16,7)
6c2c2820  BSET(L11,L10,L8)
4c440009  LDLO(L17,9)
4c480396  LDLO(L18,918)
4c4c0004  LDLO(L19,4)
6c48284c  BSET(L18,L10,L19)
4c50000b  LDLO(L20,11)
4c540106  LDLO(L21,262)
6c542834  BSET(L21,L10,L13)
4c58000d  LDLO(L22,13)
4c5c039e  LDLO(L23,926)
4c600006  LDLO(L24,6)
6c5c2860  BSET(L23,L10,L24)
4c64034e  LDLO(L25,846)
6c642840  BSET(L25,L10,L16)
4c6803d6  LDLO(L26,982)
4c6c0008  LDLO(L27,8)
6c68286c  BSET(L26,L10,L27)
6c2c2844  BSET(L11,L10,L17)
4c70000a  LDLO(L28,10)
6c542870  BSET(L21,L10,L28)
4c740146  LDLO(L29,326)
6c742850  BSET(L29,L10,L20)
4c780186  LDLO(L30,390)
4c7c000c  LDLO(L31,12)
6c78287c  BSET(L30,L10,L31)
6c542858  BSET(L21,L10,L22)
4c80000e  LDLO(L32,14)
6c382880  BSET(L14,L10,L32)
4c84037e  LDLO(L33,894)
4c88000f  LDLO(L34,15)
6c842888  BSET(L33,L10,L34)
4c8c0010  LDLO(L35,16)
6c54288c  BSET(L21,L10,L35)
4c900011  LDLO(L36,17)
6c2c2890  BSET(L11,L10,L36)
4c9403c6  LDLO(L37,966)
4c980012  LDLO(L38,18)
6c942898  BSET(L37,L10,L38)
4c9c0013  LDLO(L39,19)
6c64289c  BSET(L25,L10,L39)
4ca00014  LDLO(L40,20)
6c3828a0  BSET(L14,L10,L40)
4ca4014e  LDLO(L41,334)
4ca80015  LDLO(L42,21)
6ca428a8  BSET(L41,L10,L42)
4cac01f6  LDLO(L43,502)
4cb00016  LDLO(L44,22)
6cac28b0  BSET(L43,L10,L44)
4cb40017  LDLO(L45,23)
6c5428b4  BSET(L21,L10,L45)
4cb80c14  LDLO(L46,3092)
57902800  MOVE(O4,L10)
40b80000  CALL(L46)
54bb8000  MOVE(L46,O0)
4cbc06b8  LDLO(L47,1720)
40bc0000  CALL(L47)
54bf8000  MOVE(L47,O0)
4cc0016e  LDLO(L48,366)
34bcc149  JNE(L47,L48,329)
54c41800  MOVE(L49,L6)
54c80c00  MOVE(L50,L3)
4ccc06b8  LDLO(L51,1720)
40cc0000  CALL(L51)
54cf8000  MOVE(L51,O0)
4cd009a0  LDLO(L52,2464)
57900400  MOVE(O4,L1)
57940800  MOVE(O5,L2)
5798cc00  MOVE(O6,L51)
40d00000  CALL(L52)
54d38000  MOVE(L52,O0)
30d0700f  JEQ(L52,L28,15)
24d0c80c  XOR(L52,L50,L3)
08d4d070  MUL(L53,L52,L28)
24d8d40c  XOR(L54,L53,L3)
18dccc3c  LSR(L55,L51,L15)
4ce00060  LDLO(L56,96)
04e4dce0  SUB(L57,L55,L56)
68e8c414  BGET(L58,L49,L5)
5790c400  MOVE(O4,L49)
5794d800  MOVE(O5,L54)
5798e400  MOVE(O6,L57)
40e80000  CALL(L58)
54eb8000  MOVE(L58,O0)
54c8e800  MOVE(L50,L58)
3bffffe9  JI(-23)
54b8c800  MOVE(L46,L50)
34b80c02  JNE(L46,L3,2)
48140000  HALT(L5)
5cbc3c0c  BALO(L47,L15,3)
6c20bc14  BSET(L8,L47,L5)
6c1cbc0c  BSET(L7,L47,L3)
4cc00cb8  LDLO(L48,3256)
57901c00  MOVE(O4,L7)
5794bc00  MOVE(O5,L47)
5798b800  MOVE(O6,L46)
40c00000  CALL(L48)
54bf8000  MOVE(L47,O0)
4cc00aec  LDLO(L48,2796)
5790bc00  MOVE(O4,L47)
40c00000  CALL(L48)
54c38000  MOVE(L48,O0)
34c00c22  JNE(L48,L3,34)
5cc49b20  BALO(L49,L38,200)
6c30c414  BSET(L12,L49,L5)
6c84c40c  BSET(L33,L49,L3)
6c54c43c  BSET(L21,L49,L15)
6c5cc420  BSET(L23,L49,L8)
6c84c44c  BSET(L33,L49,L19)
4cc80366  LDLO(L50,870)
6cc8c434  BSET(L50,L49,L13)
4ccc03ae  LDLO(L51,942)
6cccc460  BSET(L51,L49,L24)
6c38c440  BSET(L14,L49,L16)
6c64c46c  BSET(L25,L49,L27)
6c84c444  BSET(L33,L49,L17)
6c30c470  BSET(L12,L49,L28)
6c54c450  BSET(L21,L49,L20)
4cd00336  LDLO(L52,822)
6cd0c47c  BSET(L52,L49,L31)
6c84c458  BSET(L33,L49,L22)
6cccc480  BSET(L51,L49,L32)
6c30c488  BSET(L12,L49,L34)
4cd40326  LDLO(L53,806)
6cd4c48c  BSET(L53,L49,L35)
4cd8010e  LDLO(L54,270)
6cd8c490  BSET(L54,L49,L36)
4cdc0c14  LDLO(L55,3092)
5790c400  MOVE(O4,L49)
40dc0000  CALL(L55)
54df8000  MOVE(L55,O0)
4cdc0854  LDLO(L55,2132)
57900000  MOVE(O4,L0)
40dc0000  CALL(L55)
54c38000  MOVE(L48,O0)
3bffff6f  JI(-145)
4cc40bc0  LDLO(L49,3008)
57901c00  MOVE(O4,L7)
5794bc00  MOVE(O5,L47)
40c40000  CALL(L49)
54c78000  MOVE(L49,O0)
4cc80aec  LDLO(L50,2796)
5790bc00  MOVE(O4,L47)
40c80000  CALL(L50)
54cb8000  MOVE(L50,O0)
54ccc400  MOVE(L51,L49)
54d0c800  MOVE(L52,L50)
4cd40aec  LDLO(L53,2796)
5790cc00  MOVE(O4,L51)
40d40000  CALL(L53)
54d78000  MOVE(L53,O0)
34d4d0eb  JNE(L53,L52,235)
4cd80854  LDLO(L54,2132)
57900000  MOVE(O4,L0)
40d80000  CALL(L54)
54db8000  MOVE(L54,O0)
4cd80aec  LDLO(L54,2796)
5790cc00  MOVE(O4,L51)
40d80000  CALL(L54)
54db8000  MOVE(L54,O0)
4cdc0a08  LDLO(L55,2568)
57900400  MOVE(O4,L1)
5794d800  MOVE(O5,L54)
40dc0000  CALL(L55)
54df8000  MOVE(L55,O0)
5cdc4720  BALO(L55,L17,200)
4ce0016e  LDLO(L56,366)
6ce0dc14  BSET(L56,L55,L5)
4ce4038e  LDLO(L57,910)
6ce4dc0c  BSET(L57,L55,L3)
4ce803ae  LDLO(L58,942)
6ce8dc3c  BSET(L58,L55,L15)
6c2cdc20  BSET(L11,L55,L8)
6c2cdc4c  BSET(L11,L55,L19)
6c30dc34  BSET(L12,L55,L13)
6c74dc60  BSET(L29,L55,L24)
6c5cdc40  BSET(L23,L55,L16)
6ca4dc6c  BSET(L41,L55,L27)
4cec0c14  LDLO(L59,3092)
5790dc00  MOVE(O4,L55)
40ec0000  CALL(L59)
54ef8000  MOVE(L59,O0)
4cec0854  LDLO(L59,2132)
57900000  MOVE(O4,L0)
40ec0000  CALL(L59)
54ef8000  MOVE(L59,O0)
5cec6320  BALO(L59,L24,200)
4cf00366  LDLO(L60,870)
6cf0ec14  BSET(L60,L59,L5)
6c64ec0c  BSET(L25,L59,L3)
6c5cec3c  BSET(L23,L59,L15)
6c38ec20  BSET(L14,L59,L8)
4cf401d6  LDLO(L61,470)
6cf4ec4c  BSET(L61,L59,L19)
6c54ec34  BSET(L21,L59,L13)
4cf80c14  LDLO(L62,3092)
5790ec00  MOVE(O4,L59)
40f80000  CALL(L62)
54fb8000  MOVE(L62,O0)
4cf80bc0  LDLO(L62,3008)
57901c00  MOVE(O4,L7)
5794cc00  MOVE(O5,L51)
40f80000  CALL(L62)
54fb8000  MOVE(L62,O0)
4cfc0854  LDLO(L63,2132)
57907400  MOVE(O4,L29)
40fc0000  CALL(L63)
54ff8000  MOVE(L63,O0)
54fcf800  MOVE(L63,L62)
6500fc00  BTAG(L64,L63)
1505000c  LSL(L65,L64,L3)
2509040c  XOR(L66,L65,L3)
343508a1  JNE(L13,L66,161)
4d0c0854  LDLO(L67,2132)
5790a400  MOVE(O4,L41)
410c0000  CALL(L67)
54ff8000  MOVE(L63,O0)
4cfc0854  LDLO(L63,2132)
57900000  MOVE(O4,L0)
40fc0000  CALL(L63)
54ff8000  MOVE(L63,O0)
4cfc0aec  LDLO(L63,2796)
5790cc00  MOVE(O4,L51)
40fc0000  CALL(L63)
54ff8000  MOVE(L63,O0)
5d000f28  BALO(L64,L3,202)
4d04118c  LDLO(L65,4492)
6d050014  BSET(L65,L64,L5)
2cfc0c8d  JLE(L63,L3,141)
4d041158  LDLO(L65,4440)
57900c00  MOVE(O4,L3)
41040000  CALL(L65)
55078000  MOVE(L65,O0)
2cfc2084  JLE(L63,L8,132)
4d041158  LDLO(L65,4440)
57902000  MOVE(O4,L8)
41040000  CALL(L65)
55078000  MOVE(L65,O0)
2cfc347b  JLE(L63,L13,123)
4d041158  LDLO(L65,4440)
57903400  MOVE(O4,L13)
41040000  CALL(L65)
55078000  MOVE(L65,O0)
2cfc4072  JLE(L63,L16,114)
4d041158  LDLO(L65,4440)
57904000  MOVE(O4,L16)
41040000  CALL(L65)
55078000  MOVE(L65,O0)
2cfc4469  JLE(L63,L17,105)
4d041158  LDLO(L65,4440)
57904400  MOVE(O4,L17)
41040000  CALL(L65)
55078000  MOVE(L65,O0)
2cfc5060  JLE(L63,L20,96)
4d041158  LDLO(L65,4440)
57905000  MOVE(O4,L20)
41040000  CALL(L65)
55078000  MOVE(L65,O0)
4d041078  LDLO(L65,4216)
57905800  MOVE(O4,L22)
5794fc00  MOVE(O5,L63)
57990000  MOVE(O6,L64)
41040000  CALL(L65)
55078000  MOVE(L65,O0)
4d040854  LDLO(L65,2132)
57900000  MOVE(O4,L0)
41040000  CALL(L65)
54d78000  MOVE(L53,O0)
64d4cc00  BTAG(L53,L51)
14d8d40c  LSL(L54,L53,L3)
24dcd80c  XOR(L55,L54,L3)
3434dc05  JNE(L13,L55,5)
4ce00854  LDLO(L56,2132)
57900000  MOVE(O4,L0)
40e00000  CALL(L56)
3bffff73  JI(-141)
68e0cc14  BGET(L56,L51,L5)
5ce43f28  BALO(L57,L15,202)
4ce81138  LDLO(L58,4408)
6ce8e414  BSET(L58,L57,L5)
6ce0e40c  BSET(L56,L57,L3)
2cd00c42  JLE(L52,L3,66)
4ce810cc  LDLO(L58,4300)
5790e000  MOVE(O4,L56)
57940c00  MOVE(O5,L3)
40e80000  CALL(L58)
54eb8000  MOVE(L58,O0)
2cd0203a  JLE(L52,L8,58)
4ce810cc  LDLO(L58,4300)
5790e000  MOVE(O4,L56)
57942000  MOVE(O5,L8)
40e80000  CALL(L58)
54eb8000  MOVE(L58,O0)
2cd03432  JLE(L52,L13,50)
4ce810cc  LDLO(L58,4300)
5790e000  MOVE(O4,L56)
57943400  MOVE(O5,L13)
40e80000  CALL(L58)
54eb8000  MOVE(L58,O0)
2cd0402a  JLE(L52,L16,42)
4ce810cc  LDLO(L58,4300)
5790e000  MOVE(O4,L56)
57944000  MOVE(O5,L16)
40e80000  CALL(L58)
54eb8000  MOVE(L58,O0)
2cd04422  JLE(L52,L17,34)
4ce810cc  LDLO(L58,4300)
5790e000  MOVE(O4,L56)
57944400  MOVE(O5,L17)
40e80000  CALL(L58)
54eb8000  MOVE(L58,O0)
2cd0501a  JLE(L52,L20,26)
4ce810cc  LDLO(L58,4300)
5790e000  MOVE(O4,L56)
57945000  MOVE(O5,L20)
40e80000  CALL(L58)
54eb8000  MOVE(L58,O0)
4ce81078  LDLO(L58,4216)
57905800  MOVE(O4,L22)
5794d000  MOVE(O5,L52)
5798e400  MOVE(O6,L57)
40e80000  CALL(L58)
54eb8000  MOVE(L58,O0)
5ce80f20  BALO(L58,L3,200)
4cec03e6  LDLO(L59,998)
6cece814  BSET(L59,L58,L5)
4cf00c14  LDLO(L60,3092)
5790e800  MOVE(O4,L58)
40f00000  CALL(L60)
54f38000  MOVE(L60,O0)
4cf00854  LDLO(L60,2132)
57900000  MOVE(O4,L0)
40f00000  CALL(L60)
54e78000  MOVE(L57,O0)
68e4cc0c  BGET(L57,L51,L3)
54cce400  MOVE(L51,L57)
3bffff43  JI(-189)
57803c00  MOVE(O0,L15)
3bfffff0  JI(-16)
57803c00  MOVE(O0,L15)
3bffffee  JI(-18)
57803c00  MOVE(O0,L15)
3bffffec  JI(-20)
57803c00  MOVE(O0,L15)
3bffffea  JI(-22)
57803c00  MOVE(O0,L15)
3bffffe8  JI(-24)
57803c00  MOVE(O0,L15)
3bffffe6  JI(-26)
4d040854  LDLO(L65,2132)
57900000  MOVE(O4,L0)
41040000  CALL(L65)
3bffffab  JI(-85)
4d040854  LDLO(L65,2132)
57900000  MOVE(O4,L0)
41040000  CALL(L65)
3bffffa7  JI(-89)
4d040854  LDLO(L65,2132)
57900000  MOVE(O4,L0)
41040000  CALL(L65)
3bffffa3  JI(-93)
4d040854  LDLO(L65,2132)
57900000  MOVE(O4,L0)
41040000  CALL(L65)
3bffff9f  JI(-97)
4d040854  LDLO(L65,2132)
57900000  MOVE(O4,L0)
41040000  CALL(L65)
3bffff9b  JI(-101)
4d040854  LDLO(L65,2132)
57900000  MOVE(O4,L0)
41040000  CALL(L65)
3bffff97  JI(-105)
690cfc14  BGET(L67,L63,L5)
4d100a08  LDLO(L68,2568)
57900400  MOVE(O4,L1)
57950c00  MOVE(O5,L67)
41100000  CALL(L68)
55138000  MOVE(L68,O0)
4d100854  LDLO(L68,2132)
57905400  MOVE(O4,L21)
41100000  CALL(L68)
55138000  MOVE(L68,O0)
6910fc0c  BGET(L68,L63,L3)
54fd1000  MOVE(L63,L68)
3bffff50  JI(-176)
57803c00  MOVE(O0,L15)
3bffff88  JI(-120)
4ccc09a0  LDLO(L51,2464)
57900400  MOVE(O4,L1)
57940800  MOVE(O5,L2)
5798bc00  MOVE(O6,L47)
40cc0000  CALL(L51)
54cf8000  MOVE(L51,O0)
30cc7007  JEQ(L51,L28,7)
18ccbc3c  LSR(L51,L47,L15)
4cd00060  LDLO(L52,96)
04d4ccd0  SUB(L53,L51,L52)
54c41000  MOVE(L49,L4)
54c8d400  MOVE(L50,L53)
3bfffeae  JI(-338)
54b80c00  MOVE(L46,L3)
3bfffec5  JI(-315)
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
4c040854  LDLO(L1,2132)
57900000  MOVE(O4,L0)
40040000  CALL(L1)
54038000  MOVE(L0,O0)
4c000001  LDLO(L0,1)
28031405  JLT(L0,I5,5)
4c000a68  LDLO(L0,2664)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
3c000000  TCAL(L0)
24071400  XOR(L1,I5,L0)
04080004  SUB(L2,L0,L1)
4c000a68  LDLO(L0,2664)
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
4c000a68  LDLO(L0,2664)
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
4c040854  LDLO(L1,2132)
57900000  MOVE(O4,L0)
3c040000  TCAL(L1)
4c000002  LDLO(L0,2)
57800000  MOVE(O0,L0)
3bffffee  JI(-18)
58040000  RALO(Lb,4)
5a050000  RALO(Ob,5)
4c000005  LDLO(L0,5)
64071000  BTAG(L1,I4)
4c080001  LDLO(L2,1)
140c0408  LSL(L3,L1,L2)
24040c08  XOR(L1,L3,L2)
34000403  JNE(L0,L1,3)
57100800  MOVE(I4,L2)
44000000  RET
68031008  BGET(L0,I4,L2)
4c040aec  LDLO(L1,2796)
57900000  MOVE(O4,L0)
40040000  CALL(L1)
54038000  MOVE(L0,O0)
4c040002  LDLO(L1,2)
00080400  ADD(L2,L1,L0)
57100800  MOVE(I4,L2)
44000000  RET
58080000  RALO(Lb,8)
5a060000  RALO(Ob,6)
54031400  MOVE(L0,I5)
4c080005  LDLO(L2,5)
640c0000  BTAG(L3,L0)
4c100001  LDLO(L4,1)
14140c10  LSL(L5,L3,L4)
24181410  XOR(L6,L5,L4)
34081817  JNE(L2,L6,23)
4c1c001a  LDLO(L7,26)
54041c00  MOVE(L1,L7)
4c08000a  LDLO(L2,10)
30040803  JEQ(L1,L2,3)
57100400  MOVE(I4,L1)
44000000  RET
4c080000  LDLO(L2,0)
680c0008  BGET(L3,L0,L2)
68131008  BGET(L4,I4,L2)
57931000  MOVE(O4,I4)
57940c00  MOVE(O5,L3)
40100000  CALL(L4)
54138000  MOVE(L4,O0)
4c14000a  LDLO(L5,10)
30101405  JEQ(L4,L5,5)
4c080001  LDLO(L2,1)
680c0008  BGET(L3,L0,L2)
54000c00  MOVE(L0,L3)
3bffffe8  JI(-24)
4c00000a  LDLO(L0,10)
57100000  MOVE(I4,L0)
44000000  RET
4c1c000a  LDLO(L7,10)
54041c00  MOVE(L1,L7)
3bffffea  JI(-22)
580c0000  RALO(Lb,12)
54031000  MOVE(L0,I4)
54071400  MOVE(L1,I5)
4c080005  LDLO(L2,5)
640c0400  BTAG(L3,L1)
4c100001  LDLO(L4,1)
14140c10  LSL(L5,L3,L4)
24181410  XOR(L6,L5,L4)
34081803  JNE(L2,L6,3)
57100000  MOVE(I4,L0)
44000000  RET
4c1c0000  LDLO(L7,0)
6820041c  BGET(L8,L1,L7)
4c240002  LDLO(L9,2)
5c28240c  BALO(L10,L9,3)
6c20281c  BSET(L8,L10,L7)
6c002810  BSET(L0,L10,L4)
682c0410  BGET(L11,L1,L4)
54002800  MOVE(L0,L10)
54042c00  MOVE(L1,L11)
3bffffef  JI(-17)
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
4c1c0854  LDLO(L7,2132)
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
58060000  RALO(Lb,6)
5a070000  RALO(Ob,7)
4c000000  LDLO(L0,0)
68071400  BGET(L1,I5,L0)
2f18040e  JLE(I6,L1,14)
68071400  BGET(L1,I5,L0)
4c080002  LDLO(L2,2)
000c0804  ADD(L3,L2,L1)
4c040001  LDLO(L1,1)
68131404  BGET(L4,I5,L1)
5c14080c  BALO(L5,L2,3)
6c0c1400  BSET(L3,L5,L0)
6c101404  BSET(L4,L5,L1)
4c000cb8  LDLO(L0,3256)
57931000  MOVE(O4,I4)
57941400  MOVE(O5,L5)
579b1800  MOVE(O6,I6)
3c000000  TCAL(L0)
44000000  RET
58100000  RALO(Lb,16)
5a070000  RALO(Ob,7)
54031400  MOVE(L0,I5)
4c080005  LDLO(L2,5)
640c0000  BTAG(L3,L0)
4c100001  LDLO(L4,1)
14140c10  LSL(L5,L3,L4)
24181410  XOR(L6,L5,L4)
34081888  JNE(L2,L6,136)
4c1c001a  LDLO(L7,26)
54041c00  MOVE(L1,L7)
4c08000a  LDLO(L2,10)
3004086c  JEQ(L1,L2,108)
4c00000a  LDLO(L0,10)
30040065  JEQ(L1,L0,101)
54031400  MOVE(L0,I5)
4c080005  LDLO(L2,5)
640c0000  BTAG(L3,L0)
4c100001  LDLO(L4,1)
14140c10  LSL(L5,L3,L4)
24181410  XOR(L6,L5,L4)
3408185b  JNE(L2,L6,91)
4c1c001a  LDLO(L7,26)
54041c00  MOVE(L1,L7)
4c08000a  LDLO(L2,10)
30040828  JEQ(L1,L2,40)
4c00000a  LDLO(L0,10)
30040021  JEQ(L1,L0,33)
4c000aec  LDLO(L0,2796)
57931400  MOVE(O4,I5)
40000000  CALL(L0)
54038000  MOVE(L0,O0)
34031803  JNE(L0,I6,3)
57131400  MOVE(I4,I5)
44000000  RET
4c000003  LDLO(L0,3)
4c040005  LDLO(L1,5)
4c080001  LDLO(L2,1)
4c0c0002  LDLO(L3,2)
5c100c0c  BALO(L4,L3,3)
4c0c0000  LDLO(L3,0)
6c00100c  BSET(L0,L4,L3)
6f141008  BSET(I5,L4,L2)
4c000cb8  LDLO(L0,3256)
57931000  MOVE(O4,I4)
57941000  MOVE(O5,L4)
579b1800  MOVE(O6,I6)
40000000  CALL(L0)
54038000  MOVE(L0,O0)
640c0000  BTAG(L3,L0)
14100c08  LSL(L4,L3,L2)
240c1008  XOR(L3,L4,L2)
34040c06  JNE(L1,L3,6)
4c000c6c  LDLO(L0,3180)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
579b1800  MOVE(O6,I6)
3c000000  TCAL(L0)
57100000  MOVE(I4,L0)
44000000  RET
4c000c6c  LDLO(L0,3180)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
579b1800  MOVE(O6,I6)
3c000000  TCAL(L0)
4c080002  LDLO(L2,2)
5c0c0b28  BALO(L3,L2,202)
4c100000  LDLO(L4,0)
4c140f04  LDLO(L5,3844)
6c140c10  BSET(L5,L3,L4)
4c140001  LDLO(L5,1)
6c000c14  BSET(L0,L3,L5)
68180014  BGET(L6,L0,L5)
4c1c0aec  LDLO(L7,2796)
57901800  MOVE(O4,L6)
401c0000  CALL(L7)
541f8000  MOVE(L7,O0)
04201c08  SUB(L8,L7,L2)
00240820  ADD(L9,L2,L8)
54282400  MOVE(L10,L9)
542f1000  MOVE(L11,I4)
34281417  JNE(L10,L5,23)
4c300f8c  LDLO(L12,3980)
57931000  MOVE(O4,I4)
57941800  MOVE(O5,L6)
57982c00  MOVE(O6,L11)
40300000  CALL(L12)
541f8000  MOVE(L7,O0)
4c200b38  LDLO(L8,2872)
57900c00  MOVE(O4,L3)
57941c00  MOVE(O5,L7)
40200000  CALL(L8)
54238000  MOVE(L8,O0)
4c24000a  LDLO(L9,10)
30202405  JEQ(L8,L9,5)
4c080001  LDLO(L2,1)
680c0008  BGET(L3,L0,L2)
54000c00  MOVE(L0,L3)
3bffffae  JI(-82)
4c000c6c  LDLO(L0,3180)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
579b1800  MOVE(O6,I6)
3c000000  TCAL(L0)
04302808  SUB(L12,L10,L2)
00340830  ADD(L13,L2,L12)
5c38080c  BALO(L14,L2,3)
6c343810  BSET(L13,L14,L4)
6c2c3814  BSET(L11,L14,L5)
54283000  MOVE(L10,L12)
542c3800  MOVE(L11,L14)
3bffffe2  JI(-30)
4c1c000a  LDLO(L7,10)
54041c00  MOVE(L1,L7)
3bffffa6  JI(-90)
4c000c6c  LDLO(L0,3180)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
579b1800  MOVE(O6,I6)
3c000000  TCAL(L0)
4c080002  LDLO(L2,2)
5c0c0b28  BALO(L3,L2,202)
4c100000  LDLO(L4,0)
4c141048  LDLO(L5,4168)
6c140c10  BSET(L5,L3,L4)
4c140001  LDLO(L5,1)
6c000c14  BSET(L0,L3,L5)
68180014  BGET(L6,L0,L5)
4c1c0b38  LDLO(L7,2872)
57900c00  MOVE(O4,L3)
57941800  MOVE(O5,L6)
401c0000  CALL(L7)
541f8000  MOVE(L7,O0)
4c20000a  LDLO(L8,10)
301c2005  JEQ(L7,L8,5)
4c080001  LDLO(L2,1)
680c0008  BGET(L3,L0,L2)
54000c00  MOVE(L0,L3)
3bffff79  JI(-135)
4c000c6c  LDLO(L0,3180)
57931000  MOVE(O4,I4)
57971400  MOVE(O5,I5)
579b1800  MOVE(O6,I6)
3c000000  TCAL(L0)
4c1c000a  LDLO(L7,10)
54041c00  MOVE(L1,L7)
3bffff79  JI(-135)
58060000  RALO(Lb,6)
4c000001  LDLO(L0,1)
68071000  BGET(L1,I4,L0)
4c080000  LDLO(L2,0)
680c0408  BGET(L3,L1,L2)
68071408  BGET(L1,I5,L2)
680b1400  BGET(L2,I5,L0)
24100c00  XOR(L4,L3,L0)
00141008  ADD(L5,L4,L2)
34140416  JNE(L5,L1,22)
4c14001a  LDLO(L5,26)
54101400  MOVE(L4,L5)
4c14000a  LDLO(L5,10)
30101409  JEQ(L4,L5,9)
4c00000a  LDLO(L0,10)
30100004  JEQ(L4,L0,4)
4c00000a  LDLO(L0,10)
57100000  MOVE(I4,L0)
44000000  RET
4c00001a  LDLO(L0,26)
57100000  MOVE(I4,L0)
44000000  RET
24100800  XOR(L4,L2,L0)
04000c10  SUB(L0,L3,L4)
34000404  JNE(L0,L1,4)
4c00000a  LDLO(L0,10)
57100000  MOVE(I4,L0)
44000000  RET
4c00001a  LDLO(L0,26)
57100000  MOVE(I4,L0)
44000000  RET
4c14000a  LDLO(L5,10)
54101400  MOVE(L4,L5)
3bffffeb  JI(-21)
58070000  RALO(Lb,7)
5a070000  RALO(Ob,7)
4c040005  LDLO(L1,5)
640b1400  BTAG(L2,I5)
4c0c0001  LDLO(L3,1)
1410080c  LSL(L4,L2,L3)
2408100c  XOR(L2,L4,L3)
34040825  JNE(L1,L2,37)
4c04001a  LDLO(L1,26)
54000400  MOVE(L0,L1)
4c04000a  LDLO(L1,10)
30000419  JEQ(L0,L1,25)
4c04000a  LDLO(L1,10)
30000402  JEQ(L0,L1,2)
44000000  RET
4c000000  LDLO(L0,0)
68071400  BGET(L1,I5,L0)
680b1800  BGET(L2,I6,L0)
4c0c0002  LDLO(L3,2)
5c100c00  BALO(L4,L3,0)
6c041000  BSET(L1,L4,L0)
4c040001  LDLO(L1,1)
6c081004  BSET(L2,L4,L1)
680b1404  BGET(L2,I5,L1)
68171804  BGET(L5,I6,L1)
4c180f8c  LDLO(L6,3980)
57931000  MOVE(O4,I4)
57940800  MOVE(O5,L2)
57981400  MOVE(O6,L5)
40180000  CALL(L6)
540b8000  MOVE(L2,O0)
5c140c0c  BALO(L5,L3,3)
6c101400  BSET(L4,L5,L0)
6c081404  BSET(L2,L5,L1)
57101400  MOVE(I4,L5)
44000000  RET
4c000005  LDLO(L0,5)
64071800  BTAG(L1,I6)
4c080001  LDLO(L2,1)
140c0408  LSL(L3,L1,L2)
24040c08  XOR(L1,L3,L2)
34000402  JNE(L0,L1,2)
44000000  RET
3bffffe4  JI(-28)
4c04000a  LDLO(L1,10)
54000400  MOVE(L0,L1)
3bffffdc  JI(-36)
58030000  RALO(Lb,3)
4c000001  LDLO(L0,1)
68071000  BGET(L1,I4,L0)
4c000000  LDLO(L0,0)
68080400  BGET(L2,L1,L0)
340b1404  JNE(L2,I5,4)
4c00000a  LDLO(L0,10)
57100000  MOVE(I4,L0)
44000000  RET
4c00001a  LDLO(L0,26)
57100000  MOVE(I4,L0)
44000000  RET
58030000  RALO(Lb,3)
5a070000  RALO(Ob,7)
2f171010  JLE(I5,I4,16)
4c000000  LDLO(L0,0)
68071800  BGET(L1,I6,L0)
57931800  MOVE(O4,I6)
57971000  MOVE(O5,I4)
40040000  CALL(L1)
54038000  MOVE(L0,O0)
4c000003  LDLO(L0,3)
4c040001  LDLO(L1,1)
240b1004  XOR(L2,I4,L1)
00040800  ADD(L1,L2,L0)
4c001078  LDLO(L0,4216)
57900400  MOVE(O4,L1)
57971400  MOVE(O5,I5)
579b1800  MOVE(O6,I6)
3c000000  TCAL(L0)
4c000002  LDLO(L0,2)
57100000  MOVE(I4,L0)
44000000  RET
58060000  RALO(Lb,6)
5a050000  RALO(Ob,5)
4c000003  LDLO(L0,3)
4c040001  LDLO(L1,1)
5c080720  BALO(L2,L1,200)
4c0c03e6  LDLO(L3,998)
4c100000  LDLO(L4,0)
6c0c0810  BSET(L3,L2,L4)
4c0c0c14  LDLO(L3,3092)
57900800  MOVE(O4,L2)
400c0000  CALL(L3)
540b8000  MOVE(L2,O0)
240b1404  XOR(L2,I5,L1)
000c0800  ADD(L3,L2,L0)
340f1007  JNE(L3,I4,7)
5c000720  BALO(L0,L1,200)
4c04037e  LDLO(L1,894)
6c040010  BSET(L1,L0,L4)
4c040c14  LDLO(L1,3092)
57900000  MOVE(O4,L0)
3c040000  TCAL(L1)
5c000720  BALO(L0,L1,200)
4c040106  LDLO(L1,262)
6c040010  BSET(L1,L0,L4)
4c040c14  LDLO(L1,3092)
57900000  MOVE(O4,L0)
3c040000  TCAL(L1)
58020000  RALO(Lb,2)
5a060000  RALO(Ob,6)
4c000001  LDLO(L0,1)
68071000  BGET(L1,I4,L0)
4c0010cc  LDLO(L0,4300)
57900400  MOVE(O4,L1)
57971400  MOVE(O5,I5)
3c000000  TCAL(L0)
58040000  RALO(Lb,4)
5a050000  RALO(Ob,5)
4c000002  LDLO(L0,2)
5c040320  BALO(L1,L0,200)
4c000106  LDLO(L0,262)
4c080000  LDLO(L2,0)
6c000408  BSET(L0,L1,L2)
4c0002fe  LDLO(L0,766)
4c080001  LDLO(L2,1)
6c000408  BSET(L0,L1,L2)
4c000c14  LDLO(L0,3092)
57900400  MOVE(O4,L1)
3c000000  TCAL(L0)
58010000  RALO(Lb,1)
5a050000  RALO(Ob,5)
4c001158  LDLO(L0,4440)
57931400  MOVE(O4,I5)
3c000000  TCAL(L0)