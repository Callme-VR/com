%{
#include "y.tab.h"
#include <stdio.h>
%}

%%

[0-9]+(\.[0-9]+)?     { yylval.val = atof(yytext); return NUMBER; }
"+"                   { return PLUS; }
"-"                   { return MINUS; }
"*"                   { return MUL; }
"/"                   { return DIV; }
"("                   { return LPAREN; }
")"                   { return RPAREN; }
[ \t]+                { /* skip whitespace */ }
\n                    { return '\n'; }
.                     { printf("Unexpected character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
