/* libmain - flex run-time support library "main" function */

/* @Header: /home/daffy/u0/vern/flex/RCS/libmain.c,v 1.4 95/09/27 12:47:55 vern Exp @ */

extern int yylex(void);

int
main(int argc,
     char *argv[])
{
    while (yylex() != 0) ;

    return 0;
}
