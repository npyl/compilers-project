/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_SYNTAX_TAB_H_INCLUDED
# define YY_YY_SYNTAX_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_EOF = 0,
    T_INT = 258,
    T_CHAR = 259,
    T_VOID = 260,
    T_DOT = 261,
    T_COMMA = 262,
    T_PARNTH_OP = 263,
    T_PARNTH_CL = 264,
    T_SEMICOLON = 265,
    T_BRACKT_OP = 266,
    T_BRACKT_CL = 267,
    T_PROGRAM = 268,
    T_MAIN_START = 269,
    T_MAIN_END = 270,
    T_FUNC_START = 271,
    T_FUNC_END = 272,
    T_RETURN = 273,
    T_VARS = 274,
    T_WHILE_START = 275,
    T_WHILE_END = 276,
    T_FOR_START = 277,
    T_FOR_END = 278,
    T_IF_START = 279,
    T_THEN = 280,
    T_ELSE = 281,
    T_ELSEIF = 282,
    T_IF_END = 283,
    T_SWITCH_START = 284,
    T_CASE = 285,
    T_DEFAULT = 286,
    T_SWITCH_END = 287,
    T_PRINT = 288,
    T_BREAK = 289,
    T_STRUCT_START = 290,
    T_STRUCT_END = 291,
    T_TYPEDEF = 292,
    T_WORD = 293,
    T_NUMBER = 294,
    T_QUOTE = 295,
    T_UNKNOWN = 296,
    T_SPACE = 297,
    T_NEW_LINE = 298
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SYNTAX_TAB_H_INCLUDED  */
