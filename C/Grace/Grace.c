#include <stdio.h>

#define SOURCE "#include <stdio.h>%1$c%1$c#define SOURCE %3$c%4$s%3$c%1$c#define CODE FILE* file = fopen(%3$cGrace_kid.c%3$c, %3$cw%3$c); if (file) { fprintf(file, SOURCE, 10, 9, 34, SOURCE); fclose(file); }%1$c#define FT(x) int main() { CODE }%1$c%1$c/*%1$c%2$cEntrypoint of the program%1$c*/%1$cFT(xxxxxxxx)%1$c"
#define CODE FILE* file = fopen("Grace_kid.c", "w"); if (file) { fprintf(file, SOURCE, 10, 9, 34, SOURCE); fclose(file); }
#define FT(x) int main() { CODE }

/*
	Entrypoint of the program
*/
FT(xxxxxxxx)
