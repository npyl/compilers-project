#!/bin/sh

flex ./lexer.l
gcc lex.yy.c -lfl