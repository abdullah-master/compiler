%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
int yylex(void);
%}

%token FOR LPAREN RPAREN LBRACE RBRACE SEMICOLON ASSIGN IDENTIFIER NUMBER LT GT PLUS
%%
program:
        for_loop
        ;

for_loop:
        FOR LPAREN initialization SEMICOLON condition SEMICOLON update RPAREN LBRACE body RBRACE
        {
            printf("Valid for-loop structure!\n");
        }
        ;

initialization:
        IDENTIFIER ASSIGN NUMBER
        ;

condition:
        IDENTIFIER LT NUMBER
      | IDENTIFIER GT NUMBER
        ;

update:
        IDENTIFIER ASSIGN IDENTIFIER
      | IDENTIFIER ASSIGN NUMBER
      | IDENTIFIER ASSIGN IDENTIFIER PLUS NUMBER
      | IDENTIFIER ASSIGN IDENTIFIER PLUS IDENTIFIER
        ;

body:
        /* empty body for simplicity */
        ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

int main(void)
{
    printf("Enter a for-loop statement:\n");
    return yyparse();
}

