%{
#include <stdio.h>
#include <stdlib.h>
%}

NUM         [0-9]+
WS          [ \t\n]

%%

{NUM}       { printf("Number: %s\n", yytext); yylval = atoi(yytext); return NUM; }
{WS}        ; // Ignore whitespace

"+"         { printf("Addition\n"); return '+'; }
"-"         { printf("Subtraction\n"); return '-'; }
"*"         { printf("Multiplication\n"); return '*'; }
"/"         { printf("Division\n"); return '/'; }
"="         { printf("Equal\n"); return '='; }
.           { printf("Invalid character: %s\n", yytext); }

%%

int main() {
    int token;
    printf("Enter a simple arithmetic expression:\n");

    while ((token = yylex()) != 0) {
        // Process tokens
        if (token == NUM) {
            printf("Operand: %d\n", yylval);
        } else {
            printf("Operator: %c\n", (char)token);
        }
    }

    return 0;
}
