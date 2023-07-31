ac : ac.l ac.y fb3-1.h
	bison -d ac.y
	flex -o ac.lex.c ac.l
	gcc -o $@ ac.tab.c ac.lex.c acfn.c

clean:
	rm ac.exe ac.lex.c ac.tab.c ac.tab.h