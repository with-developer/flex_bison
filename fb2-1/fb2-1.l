/* just like Uinx wc */
%option noyywrap
%{
int chars=0;
int words=0;
int lines=0;
%}

%%

[a-zA-Z]+ { words++; chars += strlen(yytext); /* yytext는 앞의 패턴과 일치하는 문자열이다. */}
\n	{ chars++; lines++; }
.	{ chars++; }

%%

int main(int argc, char **argv)
{
	if (argc > 1) {
		if ( !( yyin = fopen( argv[1], "r" ) ) ) {
			perror(argv[1]);
			return (1);
		}
	}
	yylex(); /* %%와 %% 사이에 있는 패턴 규칙대로 매칭, 동작하는 함수 */
	printf("%8d%8d%8d\n",lines, words, chars);
	return 0;
}