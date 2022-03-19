#include <stdio.h>

int main()
{
    FILE *f;
    char str[10000];
    f=fopen("README2.md", "r");  //file README2.md can o trong folder

    fscanf(f, "%[^\0]", str);

    printf("%s", str);
    
    return 0;
}