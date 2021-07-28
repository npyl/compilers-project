%{
    #include <stdio.h>
    #include <stdlib.h>

    #define YYERROR_VERBOSE 1       /* this should give us more detailed error-messages instead of just "error: syntax error" */

    extern int     yylineno;
    extern char*   yytext;
    extern int     yyleng;

    extern FILE* yyin;

    extern int yylex();

    int yyerror(const char *s);
%}

%token      T_INT           "INT"
%token      T_CHAR          "CHAR"
%token      T_VOID          "VOID"

%token      T_DOT           "."
%token      T_COMMA         ","
%token      T_PARNTH_OP     "(" // parenthesis open
%token      T_PARNTH_CL     ")" // parenthesis close
%token      T_SEMICOLON     ";"
%token      T_BRACKT_OP     "["
%token      T_BRACKT_CL     "]"

%token      T_PROGRAM       "program start"

%token      T_MAIN_START    "main start"
%token      T_MAIN_END      "main end"

%token      T_FUNC_START    "func"
%token      T_FUNC_END      "func end"
%token      T_RETURN        "return"

%token      T_VARS          "vars"

%token      T_WHILE_START   "while start"
%token      T_WHILE_END     "while end"

%token      T_FOR_START     "for start"
%token      T_FOR_END       "for end"

%token      T_IF_START      "if start"
%token      T_THEN          "then"
%token      T_ELSE          "else"
%token      T_ELSEIF        "elseif"
%token      T_IF_END        "if end"

%token      T_SWITCH_START  "switch"
%token      T_CASE          "case"
%token      T_DEFAULT       "default"
%token      T_SWITCH_END    "switch end"

%token      T_PRINT         "print"

%token      T_BREAK         "break"

%token      T_STRUCT_START  "struct"
%token      T_STRUCT_END    "end struct"

%token      T_TYPEDEF       "typedef"

%token      T_WORD          "any other element must be treated as a word"
%token      T_UNKNOWN       "Unknown"
%token      T_SPACE         "space"
%token      T_TAB           "tab"
%token      T_NEW_LINE      "new line"

%token      T_COMM_LINE     "one line comment"
%token      T_COMM_MULT     "multiline comment"     // multi-line comment

%token      T_EOF           0   "EOF"               // 0 is required

%%

// Program:        T_PROGRAM  T_SPACE program_name T_SEMICOLON T_NEW_LINE block_list T_EOF {printf("Found program!\n");}
//                 ;
// program_name:   T_WORD
//                 ;

Function:           BEGIN T_SPACE func_name T_PARNTH_OP parameter_list T_PARNTH_CL T_NEW_LINE block_list return_statement END
                    ;
func_name:          T_WORD
                    ;
parameter_list:     %empty
                    |   func_parameter
                    ;
func_parameter:     type T_SPACE parameter_name
                    |   func_parameter T_COMMA T_SPACE func_parameter
                    ;
return_statement:   T_TAB T_RETURN T_NEW_LINE
                    ;
parameter_name:     T_WORD
                    ;

Main:               %empty
;
Struct:             %empty
                    ;

/* block */
block_list:         %empty
                    |   block_list block
                    ;
block:              Function | Main | Struct
                    ;

/* general rules */
BEGIN:          T_MAIN_START | T_FUNC_START | T_WHILE_START | T_FOR_START | T_IF_START | T_SWITCH_START | T_STRUCT_START
                ;

END:            T_MAIN_END | T_FUNC_END | T_WHILE_END | T_FOR_END | T_IF_END | T_SWITCH_END | T_STRUCT_END
                | END T_NEW_LINE
                ;

type:           T_INT | T_CHAR | T_VOID;

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

    yyparse();

    fclose(yyin);

    return 0;
}

int yyerror (const char *msg) {
   fprintf (stderr, "error: %s in line: %i with %s\n", msg, yylineno, yytext);
}

void print_token(int token_id)
{
    if      (token_id == T_EOF)
        printf("End of source file!\n");
    else if (token_id == T_UNKNOWN)
        printf("Unknown token!\n");
    else if (token_id == T_PROGRAM)
        printf("Start of program!\n");
    else
        printf("%s at %d\n", yytext, token_id);
}