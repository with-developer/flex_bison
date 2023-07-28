/* English -> American */

%%
"colour"        {printf("color");}
"flavour"       {printf("flavor");}
"clever"        {printf("smart");}
"smart"         {printf("elegent");}
"conservative"  {printf("liberal");}
.               {printf("%s",yytext);}
%%