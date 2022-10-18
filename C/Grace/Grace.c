#include <stdio.h>

#define SRC_CODE "#include <stdio.h>%1$c%1$c#define SRC_CODE %3$c%4$s%3$c%1$c#define NOMAIN(a, b, x, X, e, f) int a##b##e##f() { FILE* file = fopen(%3$cGrace_kid.c%3$c, %3$cw%3$c); if (file) { fprintf(file, SRC_CODE, 10, 9, 34, SRC_CODE); fclose(file); } }%1$c#define START() NOMAIN(m, a, X, X, i, n)%1$c%1$c/*%1$c%2$cEntrypoint of the program%1$c*/%1$cSTART()%1$c"
#define NOMAIN(a, b, x, X, e, f) int a##b##e##f() { FILE* file = fopen("Grace_kid.c", "w"); if (file) { fprintf(file, SRC_CODE, 10, 9, 34, SRC_CODE); fclose(file); } }
#define START() NOMAIN(m, a, X, X, i, n)

/*
	Entrypoint of the program
*/
START()
