%{
#include <stdio.h>
int line_num=0;
%}

%%
^.*com$     { line_num++;
		printf("Line  %d ends with 'com'\n",line_num); }
^.+$        { line_num++;}
\n {}
%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }

