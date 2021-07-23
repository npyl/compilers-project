/*
 * Token IDs for every token
 */
#define     T_EOF           0

/* types */
#define     T_INT           1
#define     T_CHAR          2
#define     T_VOID          3

/* operators */
#define     T_DOT           101
#define     T_COMMA         102
#define     T_PARNTH_OP     103 // parenthesis open
#define     T_PARNTH_CL     104 // parenthesis close
#define     T_SEMICOLON     105
#define     T_BRACKT_OP     106
#define     T_BRACKT_CL     107

/* keywords */
#define     T_PROGRAM       1000

#define     T_MAIN_START    1001
#define     T_MAIN_END      1002

#define     T_FUNC_START    1003
#define     T_FUNC_END      1004
#define     T_RETURN        1005

#define     T_VARS          1006

#define     T_WHILE_START   1007
#define     T_WHILE_END     1008

#define     T_FOR_START     1009
#define     T_FOR_END       1010

#define     T_IF_START      1011
#define     T_THEN          1012
#define     T_ELSE          1013
#define     T_ELSEIF        1014
#define     T_IF_END        1015

#define     T_SWITCH_START  1016
#define     T_CASE          1017
#define     T_DEFAULT       1018
#define     T_SWITCH_END    1019

#define     T_PRINT         1020

#define     T_BREAK         1021

#define     T_STRUCT_START  1022
#define     T_STRUCT_END    1023

#define     T_TYPEDEF       1024

/* everything else */
#define     T_WORD          500
#define     T_UNKNOWN       501     // for errors
#define     T_SPACE         502

#define     T_COMM_LINE     503     // one-line comment
#define     T_COMM_MULT_LN  504     // multi-line comment