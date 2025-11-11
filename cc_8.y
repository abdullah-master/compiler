%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
program:
      program expr '\n'   { printf("Result: %d\n", $2); }
    | program '\n'
    | program error '\n'  { yyerror("Invalid expression"); yyerrok; }
    | /* empty */
    ;

expr:
      NUMBER              { $$ = $1; }
    | expr '+' expr       { $$ = $1 + $3; }
    | expr '-' expr       { $$ = $1 - $3; }
    | expr '*' expr       { $$ = $1 * $3; }
    | expr '/' expr
        {
            if ($3 == 0) {
                yyerror("Division by zero");
                $$ = 0;
            } else {
                $$ = $1 / $3;
            }
        }
    ;
%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter arithmetic expressions:\n");
    yyparse();
    return 0;
}

