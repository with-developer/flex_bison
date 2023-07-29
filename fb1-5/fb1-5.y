/* simplest version of calculator */

%{
#include <stdio.h>
%}

%union {
    double double_val;
    /* Add func: NUMBER 변수를 실수형으로 처리하기 위해 double타입의 double_val을 union으로 선언
        flex_and_bison 71페이지를 참고했습니다. */ 
}

/* declare tokens */
%token <double_val> NUMBER // NUMBER 토큰의 값이 %union 내의 double_val 필드에 저장되도록 합니다.
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP
%type <double_val> exp factor term // exp, factor, term 함수의 반환값이 %union 내의 double_val 필드에 저장되도록 합니다.

%%
calclist : /* nothing */
    | calclist exp EOL { printf("= %lf\n", $2); } // %lf로 결과값을 출력합니다.
    | calclist EOL {}
    ;

exp: factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor: term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    ;

term: NUMBER
    | ABS term { $$ = $2 >= 0? $2 : - $2; }
    | OP exp CP { $$ = $2; }
    ;

%%

int main(int argc, char **argv){
    yyparse();
    return 0;
}

yyerror(char *s){
    fprintf(stderr, "error: %s\n", s);
}