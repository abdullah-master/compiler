yacc -d cc_10.y
--
flex cc_10.l
--
gcc lex.yy.c y.tab.c -lfl
--
./a.out
---
