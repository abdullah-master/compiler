%{
#include <stdio.h>

int comments = 0, keywords = 0, identifiers = 0, words = 0, lines = 0, spaces = 0;
%}

%option noyywrap

%%
"/*"[^*]*"*/"   { comments++; }
"//".*  { comments++; }
[ \t]+                       { spaces += yyleng; }
\n                           { lines++; }
"int"|"float"|"char"|"double"|"while"|"for"|"return"  { keywords++; words++; }
[a-zA-Z_][a-zA-Z0-9_]*       { identifiers++; words++; }
.                       { /* ignore other characters */ }
%%

int main() {
    yylex();
    printf("\nComments   : %d\n", comments);
    printf("Keywords   : %d\n", keywords);
    printf("Identifiers: %d\n", identifiers);
    printf("Lines      : %d\n", lines);
    printf("Spaces     : %d\n", spaces);
    printf("Words      : %d\n", words);
    return 0;
}

