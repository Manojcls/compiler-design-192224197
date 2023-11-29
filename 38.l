%{
#include<stdio.h>
#include <stdio.h>
#include <string.h>
int word_count = 0;
char target_word[100]; 
%}

%%
[a-zA-Z]+   {
                if (strcmp(yytext, target_word) == 0) {
                    word_count++;
                }
            }
.           ; // Ignore other characters

%%

int main() {
    printf("Enter a sentence:\n");
    scanf("%s", target_word);

    printf("Enter the word to count:\n");
    scanf("%s", target_word);

    printf("Enter the sentence:\n");
    yylex();

    printf("Frequency of '%s': %d\n", target_word, word_count);
    return 0;
}
int yywrap()
{
 return 1;}
