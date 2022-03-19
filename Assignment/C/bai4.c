#include <stdio.h>

int main()
{
    int F5, i, j;
    F5 = 0;

    for(i = 0; i <= 12; i++ )
        for(j = i; j <=10; j++ )
            F5 += (i+j);
        
    printf("%d", F5);

    return 0;

}