#include <stdio.h>

int main()
{
    int x, t[20], i = 1, n, sum = 0;

    scanf("%d", &x);

    while (x != 0)
        {
            t[i] = x%10;
            i++;
            x = x/10;
        }
    n = i -1;
    
    printf("\n");
    for(i = n ; i > 1; i--)
        printf("%d, ", t[i]);
    printf("%d.", t[1]);
    for(i = n; i > 0; i--)
        sum += t[i];
    printf("\n%d", sum);
    

}
