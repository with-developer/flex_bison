/*
 * Declarations for a calculator fb3-1
 */

extern int yylineno;
void yyerror(char *s, ...); /* valist : variable argument list */

struct symbol {
	char *name; /* variable name */
	double value; /* double word */
	struct ast *func; /* stmt of the function */
	struct symlist *syms; /* list of dummy args */
};

#define NHASH 9997

struct symbol *lookup(char*);

struct symlist {
	struct symbol *sym;
	struct symlist *next;
};

struct symlist *newsymlist(struct symbol *sym, struct symlist *next);
void symlistfree(struct symlist *sl);

enum bifs { 
	B_sqrt = 1,
	B_exp,
	B_log,
	B_print
};

struct ast {
	int nodetype;
	struct ast *l;
	struct ast *r;
};

struct fncall {
	int nodetype; /* type F */
	struct ast *l;
	enum bifs functype;
};

struct ufncall {
	int nodetype;
	struct ast *l;
	struct symbol *s;
};

struct flow {
	int nodetype; /* type I or W */
	struct ast *cond;
	struct ast *tl;
	struct ast *el;
};

struct numval {
	int nodetype;	/* type K for constant */
	double number;
};

struct symref {
	int nodetype; /* nodetype N */
	struct symbol *s;
};

struct symasgn {
	int nodetype;
	struct symbol *s;
	struct ast *v; /* value */
};

struct ast *newast(int nodetype, struct ast *l, struct ast *r);
struct ast *newcmp(int cmptype, struct ast *l,  struct ast *r);
struct ast *newfunc(int functype, struct ast *l);
struct ast *newcall(struct symbol *s, struct ast *l);
struct ast *newref(struct symbol *s);
struct ast *newasgn(struct symbol *s, struct ast *v);
struct ast *newnum(double d);
struct ast *newflow(int nodetype, struct ast *cond, struct ast *tl, struct ast *tr);

void dodef(struct symbol *name, struct symlist *syms, struct ast *stmts);

double eval(struct ast *);

void treefree(struct ast *);
