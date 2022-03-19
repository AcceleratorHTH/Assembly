#include <stdio.h>

int main()
{
    char str[256];

    FILE *f;
    f=fopen("README.md", "w");

    scanf("%[^\n]", str);
    
    fprintf(f, "%s", str);

    fclose(f);
    return 0;

}