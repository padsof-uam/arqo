#include <stdio.h>
#include <stdlib.h>
#include "arqo4.h"
#include <omp.h>

int main(int argc, char** argv)
{
	int num_threads, size;
	float *A=NULL, *B=NULL;
	long long k=0;
	struct timeval fin,ini;
	float sum=0;

	parse_args(argc, argv, &num_threads, &size);	
	omp_set_num_threads(num_threads);
	
	A = generateVector(size);
	B = generateVector(size);
	if ( !A || !B )
	{
		printf("Error when allocationg matrix\n");
		freeVector(A);
		freeVector(B);
		return -1;
	}
	
	gettimeofday(&ini,NULL);
	/* Bloque de computo */
	sum = 0;
	for(k=0;k<M;k++)
	{
		sum = sum + A[k]*B[k];
	}
	/* Fin del computo */
	gettimeofday(&fin,NULL);

	printf("Resultado: %f\n",sum);
	printf("Tiempo: %f\n", ((fin.tv_sec*1000000+fin.tv_usec)-(ini.tv_sec*1000000+ini.tv_usec))*1.0/1000000.0);
	freeVector(A);
	freeVector(B);

	return 0;
}
