%{
#include <stdio.h>
#include <string.h>
%}

%%
"old_word"   { printf("new_word"); }
.            { putchar(yytext[0]); }
%%

int yywrap(void) {
    return 1;
}

int main() {
    FILE *input_file = fopen("your_input_file.txt", "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file;

    yylex();

    fclose(input_file);

    return 0;
}