%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "lexer.h"

    extern int     yylineno;
    extern char*   yytext;
    extern int     yyleng;
%}

%option yylineno
%option noyywrap
%option case-insensitive

/* Iσοδυναμίες Κλάσεων */
LETTER                      [a-zA-z]
DIGIT                       [0-9]
ALPHA                       {LETTER} | {DIGIT}

%%

"INT"                       { return T_INT; }
"CHAR"                      { return T_CHAR; }
"VOID"                      { return T_VOID; }

"."                         { return T_DOT; }
","                         { return T_COMMA; }
"("                         { return T_PARNTH_OP; }
")"                         { return T_PARNTH_CL; }
";"                         { return T_SEMICOLON; }
"["                         { return T_BRACKT_OP; }
"]"                         { return T_BRACKT_CL; }

"PROGRAM"                   { return T_PROGRAM; }

"STARTMAIN"                 { return T_MAIN_START; }
"ENDMAIN"                   { return T_MAIN_END; }

"FUNCTION"                  { return T_FUNC_START; }
"END_FUNCTION"              { return T_FUNC_END; }
"RETURN"                    { return T_RETURN; }

"VARS"                      { return T_VARS; }

"WHILE"                     { return T_WHILE_START; }
"ENDWHILE"                  { return T_WHILE_END; }

"FOR"                       { return T_FOR_START; }
"ENDFOR"                    { return T_FOR_END; }

"IF"                        { return T_IF_START; }
"THEN"                      { return T_THEN; }
"ELSE"                      { return T_ELSE; }
"ELSEIF"                    { return T_ELSEIF; }
"ENDIF"                     { return T_IF_END; }

"SWITCH"                    { return T_SWITCH_START; }
"CASE"                      { return T_CASE; }
"DEFAULT"                   { return T_DEFAULT; }
"ENDSWITCH"                 { return T_SWITCH_END; }

"PRINT"                     { return T_PRINT; }

"BREAK"                     { return T_BREAK; }

"STRUCT"                    { return T_STRUCT_START; }
"ENDSTRUCT"                 { return T_STRUCT_END; }

"TYPEDEF"                   { return T_TYPEDEF; }

"//"                        { return T_COMM_LINE; }
"/*"                        { return T_COMM_START; }
"*/"                        { return T_COMM_END; }

"\n"                        { return T_NEW_LINE; }

[[:alpha:]]+                { return T_WORD; }
" "                         { return T_SPACE; }
<<EOF>>                     { return T_EOF; }

.                           { return T_UNKNOWN; }

%%