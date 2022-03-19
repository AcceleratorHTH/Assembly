#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int **matr, r = 0, c = 0;



void matrix_create(int l1, int l2)
{
	int i, j;
    if (l1+1 > r || l2+1 > c)
	{
		for (i = 0; i < r; i++)
			free(matr[i]);			//lam sach memory
		free(matr);
	
		matr = (int **)malloc((l1+1) * sizeof(int*));
		for (i = 0; i < l1+1; i++)
			matr[i] = (int *)malloc((l2+1) * sizeof(int));

		r = l1+1;
		c = l2+1;
    }

    for (i = 0; i <= l1; i++)
	matr[i][l2] = 0;
    for (j = 0; j <= l2; j++)
	matr[l1][j] = 0;
}


void LCS(char *S, char *T, char **lcs)
{
    int l1, l2, i, j;
	l1 = strlen(S);
	l2 = strlen(T);

    matrix_create(l1, l2);

    int max_len, max_index_i;
	max_len = 0;
	max_index_i = -1;

    for (i = l1-1; i >= 0; i--)
	{
    	for (j = l2-1; j >= 0; j--)
		{
    	    if (S[i] != T[j])
			{
				matr[i][j] = 0;
				continue;
    		}

    	    matr[i][j] = matr[i+1][j+1] + 1;
    	    if (matr[i][j] > max_len)
			{
				max_len = matr[i][j];
				max_index_i = i;
    	    }
    	}
    }

    if (lcs != NULL)
	{
		*lcs = malloc(sizeof(char) * (max_len+1));
		strncpy(*lcs, S+max_index_i, max_len);
		(*lcs)[max_len] = '\0';
		if (strlen(*lcs) != 0)
			printf("The longest common substring is: %s", *lcs);
		else
			printf("No common substring");
	}
    	
}


int main()
{
	char S[1000], T[1000];
	char *pqt;

	printf("S = ");
    scanf("%[^\n]", S);
	printf("T = ");
    scanf("%*c%[^\n]", T); 
	printf("\n");
    
    LCS(S, T, &pqt);

    return 0;
}
