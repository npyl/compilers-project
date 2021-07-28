%{
    #include <stdio.h>
    #include <ctype.h>
    #include <stdlib.h>
    #include "syntax.tab.h"

    static void skip_single_line_comment(void);
    static void skip_multiple_line_comment(void);

    int digits_only(const char *s);
%}

%option yylineno
%option noyywrap
%option case-insensitive

/* Iσοδυναμίες Κλάσεων */
LETTER                      [a-zA-Z]
DIGIT                       [0-9]
ALPHA                       ({LETTER}|{DIGIT})
WORD                        {ALPHA}*

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
"RETURN"                    { return T_RETURN; }
"END_FUNCTION"              { return T_FUNC_END; }

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

"//"                        { skip_single_line_comment(); }
"/*"                        { skip_multiple_line_comment(); }

"\n"                        { return T_NEW_LINE; }

{WORD}                      {
                              if (digits_only(yytext)) 
                                return T_NUMBER; 
                              else 
                                return T_WORD; 
                            }
" "                         { return T_SPACE; }
"\t"|"    "                 { /* ignore tabs */ }
<<EOF>>                     { return T_EOF; }

.                           { return T_UNKNOWN; }

%%

static void
skip_single_line_comment(void)
{
  int c;

  /* Read until we find \n or EOF */
  while((c = input()) != '\n' && c != EOF)
    ;

  /* Maybe you want to place back EOF? */
  if(c == EOF)
    unput(c);
}

static void
skip_multiple_line_comment(void)
{
  int c;

  for(;;)
  {
    switch(input())
    {
      /* We expect ending the comment first before EOF */
      case EOF:
        fprintf(stderr, "Error unclosed comment, expect */\n");
        exit(-1);
        goto done;
      break;
      /* Is it the end of comment? */
      case '*':
        if((c = input()) == '/')
          goto done;
        unput(c);
        break;
      default:
        /* skip this character */
        break;
    }
  }

done:
  /* exit entry */ ;
}

int digits_only(const char *s)
{
    while (*s) {
        if (isdigit(*s++) == 0) return 0;
    }

    return 1;
}