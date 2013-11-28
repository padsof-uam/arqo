#include <stdio.h>
#include <stdlib.h>
#include "arqo4.h"
#include <omp.h>

double compute(int size);
int main(int argc, char** argv)
{
	int i,num_threads, size, num_tries;
	double acc = 0;

	parse_args(argc, argv, &num_threads, &size, &num_tries);	
	omp_set_num_threads(num_threads);

	for(i = 0; i < num_tries; i++)
		acc += compute(size);

	printf("%lf\n", acc / num_tries);
	
	

	return 0;
}

double compute(int size)
{
	float *A=NULL, *B=NULL;
	long long k=0;
	struct timeval fin,ini;
	float sum=0;
	double t;

	A = generateVector(size);
	B = generateVector(size);
	if ( !A || !B )
	{
		printf("Error when allocationg matrix\n");
		freeVector(A);
		freeVector(B);
		abort();
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

	t = ((fin.tv_sec*1000000+fin.tv_usec)-(ini.tv_sec*1000000+ini.tv_usec))*1.0/1000000.0;
	freeVector(A);
	freeVector(B);

	return t;
}
