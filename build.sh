#!/bin/sh

flex lexer.l
bison -v -d syntax.y
gcc -c syntax.tab.c lex.yy.c
gcc syntax.tab.o lex.yy.o -o parser