
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[\t ]+          ;       /* skip spaces/tabs */
\n              { return '\n'; }
.               { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}

