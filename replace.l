%{ 
#include<stdio.h> 
#include<string.h> 

char replace_with [] = "eat"; 
char replace [] ="go"; 

%} 


%% 
[a-zA-Z]+ { if(strcmp(yytext, replace)==0) 
				fprintf(yyout, "%s", replace_with); 
				else
					fprintf(yyout, "%s", yytext);} 
.		 fprintf(yyout, "%s", yytext); 
%% 


int yywrap() 
{ 
	return 1; 
} 

int main() 
{ 
	yyin=fopen("input2.txt", "r"); 

	yyout=fopen("output2.txt", "w"); 
	
		yylex(); 
}