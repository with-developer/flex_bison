%{
#include "fb1-5.tab.h"
%}


%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
[0-9]+\.[0-9]+  { yylval.double_val = atof(yytext); return NUMBER; } /* 소수점을 판별할 수 있는 정규식 추가 */
[0-9]+ { yylval.double_val = atoi(yytext); return NUMBER; } /* float 형태로 반환할 수 있도록 yylval.float_val 형태로 선언 */
\n  { return EOL; }
"(" { return OP; }
")" { return CP; }
"//".* { /* ignore comments */ }
[ \t] { /* ignore whitespace */ }
.   { printf("Mystery character %c\n", *yytext); }
%%
