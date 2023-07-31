/* calculator with AST */

%{
#include <stdio.h>
#include <stdlib.h>
#include "fb3-1.h"
%}
/*
stdio:  Standard Input/Output
stdlib: Standard Library - 커널에 무언가 요청해서 얻을 수 있는 기능을 가지고 있음.
unistd: Unix Standard - 유닉스 표준(POSIX)
fcntl.h: File System Control - fopen, fclose
*/
%union {
    struct ast *a;
    double d;
}

%token <d> NUMBER;
%token EOL;

%type <a> exp factor term

%%
calclist : /* nothing */
    | calclist exp EOL{
        printf("= %4.4g\n", eval($2));
        treefree($2);
        printf("> ");
    }
    | calclist EOL { printf("> ");}
    ;

exp: factor
    | exp '+' factor { $$ = newast('+', $1, $3);}
    | exp '-' factor { $$ = newast('-', $1, $3);}
    ;

factor: term
    | factor '*' term { $$ = newast('*', $1, $3);}
    | factor '/' term { $$ = newast('/', $1, $3);}

term: NUMBER { $$ = newnum($1);}
    | '|' term { $$ = newast('|', $2, NULL);}
    | '(' exp ')' { $$ = $2; }
    | '-' term { $$ = newast('M', $2, NULL);}
%%