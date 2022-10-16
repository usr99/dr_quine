#include <stdio.h>

/*
	Print source code of the program
*/
void print(const char* f)
{
	printf(f, 10, 9, 34, f);
}

int main()
{
	/*
		Textual representation of the program
	*/
	char* f = "#include <stdio.h>%1$c%1$c/*%1$c%2$cPrint source code of the program%1$c*/%1$cvoid print(const char* f)%1$c{%1$c%2$cprintf(f, 10, 9, 34, f);%1$c}%1$c%1$cint main()%1$c{%1$c%2$c/*%1$c%2$c%2$cTextual representation of the program%1$c%2$c*/%1$c%2$cchar* f = %3$c%4$s%3$c;%1$c%2$cprint(f);%1$c}%1$c";
	print(f);
}
