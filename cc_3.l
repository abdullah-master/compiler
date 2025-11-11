%{
#include <stdio.h>
int count = 0;
%}

%option noyywrap

%%
([ \t\n])*[aA][a-zA-Z]*([ \t\n]+|$)   { count++; }     // Word starts with A/a
.                                     { /* ignore others */ }
%%

int main() {
    printf("Enter a sentence:\n");
    yylex();
    printf("\nNumber of words starting with 'A' or 'a': %d\n", count);
    return 0;
}

