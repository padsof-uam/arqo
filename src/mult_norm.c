#include "arqo3.h"
void compute(num **a, num **b,num** result, int n);

int main( int argc, char *argv[])
{
    int n;
    num **m = NULL;
    num **k = NULL;
    struct timeval fin, ini;
    num **res = NULL;

    printf("Word size: %ld bits\n", 8 * sizeof(num));

    if ( argc != 2 )
    {
        printf("Error: ./%s <matrix size>\n", argv[0]);
        return -1;
    }
    n = atoi(argv[1]);
    m = generateMatrix(n);
    k = generateMatrix(n);
    res = generateEmptyMatrix(n);

    if ( !m || !k || !res)
    {
        return -1;
    }



    gettimeofday(&ini, NULL);

    /* Main computation */
    compute(m, k, res, n);
    /* End of computation */

    gettimeofday(&fin, NULL);
    printf("Execution time: %f\n", ((fin.tv_sec * 1000000 + fin.tv_usec) - (ini.tv_sec * 1000000 + ini.tv_usec)) * 1.0 / 1000000.0);

    free(m);
    return 0;
}


void compute(num **a, num **b, num** result, int n)
{
    num sum;
    int i, j, k;

    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            sum = 0;

            for(k = 0; k < n; k++)
            	sum += a[i][k] * b[k][j];

            result[i][j] = sum;
        }
    }
}
