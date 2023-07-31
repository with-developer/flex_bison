/*
* Declearations for a calucator fb3-1
*/

extern int yylineno;
void yyerror(char *s, ...); /* valist: variable argument list */

struct ast {
    int nodetype;
    struct ast *l;
    struct ast *r;   
};

struct numval {
    int nodetype; /* type K for constant */
    double number;
};

struct ast *newast(int nodetype, struct ast *l, struct ast *r);
struct ast *newnum(double d);

double eval(struct ast *);

void treefree(struct ast *);