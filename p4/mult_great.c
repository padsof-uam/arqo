#include "arqo4.h"
#include <omp.h>

#ifdef PARAL_1
#define OMP_FOR_1 _Pragma("omp parallel for reduction(+:sum)") for
#else
#define OMP_FOR_1 for
#endif
#ifdef PARAL_2
#define OMP_FOR_2 _Pragma("omp parallel for private(k, sum)") for
#else
#define OMP_FOR_2 for
#endif
#ifdef PARAL_3
#define OMP_FOR_3 _Pragma("omp parallel for private(j, k, sum)") for
#else
#define OMP_FOR_3 for
#endif

void compute(float **a, float **b, float **kt, float **result, int n);

int main(int argc, char *argv[])
{
    int n;
    float **m = NULL;
    float **k = NULL;
    float **kt = NULL;
    struct timeval fin, ini;
    float **res = NULL;
    int n_threads = 1;

    if ( argc != 3 )
    {
        printf("Error: ./%s <matrix size> <threads>\n", argv[0]);
        return -1;
    }

    n_threads = atoi(argv[2]);
    n = atoi(argv[1]);
    m = generateMatrix(n);
    k = generateMatrix(n);
    kt = generateEmptyMatrix(n);
    res = generateEmptyMatrix(n);

    if ( !m || !k || !res || !kt)
    {
        return -1;
    }

    omp_set_num_threads(n_threads);

    gettimeofday(&ini, NULL);

    /* Main computation */
    compute(m, k, kt, res, n);
    /* End of computation */

    gettimeofday(&fin, NULL);
#ifdef OUTPUT_RESULT
    int i, j;
    for(i = 0; i < n; i++)
    {
        for(j = 0; j < n; j++)
            printf("%.1f ", res[i][j]);
        printf("\n");
    }
#else
    printf("%f", ((fin.tv_sec * 1000000 + fin.tv_usec) - (ini.tv_sec * 1000000 + ini.tv_usec)) * 1.0 / 1000000.0);
#endif
    free(m);
    return 0;
}


void compute(float **a, float **b, float **kt, float **result, int n)
{
    float sum;
    int i, j, k;

    // Transpose
    for (i = 0; i < n; i++)
        for (j = 0; j < n; j++)
            kt[i][j] = b[j][i];

    OMP_FOR_3(i = 0; i < n; i++)
    {
        OMP_FOR_2(j = 0; j < n; j++)
        {
            sum = 0;
            OMP_FOR_1(k = 0; k < n; k++)
            {
                sum += a[i][k] * kt[j][k];
            }

            result[i][j] = sum;
        }
    }
}
