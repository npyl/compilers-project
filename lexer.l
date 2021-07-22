%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "lexer.h"
%}

%option noyywrap
%option case-insensitive

%%


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