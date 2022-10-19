#include <stdio.h>
#include <stdlib.h>

int main()
{
	int i = 5;
	i--;

	char filename[10];
	sprintf(filename, "Sully_%d.c", i);

	FILE* outfd = fopen(filename, "w");
	if (!outfd)
		return 1;

	const char* source = "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$cint main()%1$c{%1$c%2$cint i = %5$d;%1$c%2$ci--;%1$c%1$c%2$cchar filename[10];%1$c%2$csprintf(filename, %3$cSully_%%d.c%3$c, i);%1$c%1$c%2$cFILE* outfd = fopen(filename, %3$cw%3$c);%1$c%2$cif (!outfd)%1$c%2$c%2$creturn 1;%1$c%1$c%2$cconst char* source = %3$c%4$s%3$c;%1$c%2$cfprintf(outfd, source, 10, 9, 34, source, i);%1$c%2$cfclose(outfd);%1$c%1$c%2$cchar command[100];%1$c%2$csprintf(command, %3$cgcc %%1$s -o Sully_%%2$d%3$c, filename, i);%1$c%2$csystem(command);%1$c%2$cif (i)%1$c%2$c{%1$c%2$c%2$csprintf(command, %3$c./Sully_%%d%3$c, i);%1$c%2$c%2$csystem(command);%1$c%2$c}%1$c%2$creturn 0;%1$c}%1$c";
	fprintf(outfd, source, 10, 9, 34, source, i);
	fclose(outfd);

	char command[100];
	sprintf(command, "gcc %1$s -o Sully_%2$d", filename, i);
	system(command);
	if (i)
	{
		sprintf(command, "./Sully_%d", i);
		system(command);
	}
	return 0;
}
