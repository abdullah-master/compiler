
%{
#include <stdio.h>

char convert_case(char c) {
    if (c >= 'a' && c <= 'z')
        return c - 'a' + 'A';    
    else if (c >= 'A' && c <= 'Z')
        return c - 'A' + 'a';    
    return c;                    
}
%}

%%
[a-zA-Z]    { putchar(convert_case(yytext[0])); }
.|\n        { putchar(yytext[0]); }
%%
int main() {
    printf("Enter text to change its case:\n");
    yylex();        
    return 0;
}

int yywrap() {
    return 1;       
}

