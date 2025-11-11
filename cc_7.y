
%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER

%%
program:
        program expr '\n'   { printf("Result: %d\n", $2); }
        | /* empty */
        ;

expr:
        NUMBER              { $$ = $1; }
        | expr expr '+'    { $$ = $1 + $2; }
        | expr expr '-'    { $$ = $1 - $2; }
        | expr expr '*'    { $$ = $1 * $2; }
        | expr expr '/'    { $$ = $1 / $2; }
        ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}

