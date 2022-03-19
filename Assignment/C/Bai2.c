#include <stdio.h>

int main()
{
    int a, b;

    scanf("%d%d", &a, &b);

    printf("a + b = %d, ", a+b);
    printf("a - b = %d, ", a-b);
    printf("a * b = %d, ", a*b);
    if(b==0)
    {
        printf("a / b doesn't exist, ");
        printf("reminder doesn't exist, ");
    }
    else
    {
        printf("a / b = %d, ", a/b);
        printf("reminder %d", a%b);
    }
    return 0;

}