%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "lexer.h"
%}

%option noyywrap
%option case-insensitive

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

"PROGRAM"                   { printf("Found program start!\n"); return T_PROGRAM; }

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

" "                         { return T_SPACE; }
<<EOF>>                     { printf("End of file\n"); return T_EOF; }

.                           { printf("Unknown token!\n"); return T_UNKNOWN; }

%%

int main(int argc, char* argv[])
{
    int token;
    if (argc > 1)
    {
        yyin = fopen(argv[1], "r");
        if (yyin == NULL)
        {
            perror("Error opening file");
            return -1;
        }
    }

    /* read for tokens until T_EOF */
    do
    {
        token = yylex();
    }
    while (token != T_EOF);

    fclose(yyin);
    yyterminate();
}