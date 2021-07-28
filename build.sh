#!/bin/sh

bison -v -d syntax.y
flex lexer.l
gcc -c syntax.tab.c lex.yy.c
gcc syntax.tab.o lex.yy.o -o parser