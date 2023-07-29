fb1-5:	fb1-5.l fb1-5.y
	bison -d fb1-5.y
	flex fb1-5.l
	gcc -o $@ fb1-5.tab.c lex.yy.c -lfl

clean:
	rm fb1-5.tab.* fb1-5.exe lex.yy.c