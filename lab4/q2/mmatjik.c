#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <float.h>
#include <math.h>
#include <time.h>

clock_t clock(void);

float A[1000][1000], B[1000][1000], C[1000][1000];

int main(int argc, char *argv[]) 
{
	FILE *am, *bm, *cm;
	int n;
	float mel, sum; 
	double total_t;
	clock_t start_t, end_t;
	start_t = clock();
	if (argc == 5) 
	{
		printf("START TIME - TIME BEFORE THE START OF FILE CREATION = %lf clock cycles\n", (double)start_t);

		am = fopen(argv[1], "r");
		bm = fopen(argv[2], "r");
		cm = fopen(argv[3], "w");
		n = atoi(argv[4]);
		
		for (int i = 0; i < n; i++)
		{
			for (int j = 0; j < n; j++) 
			{
				fscanf(am, "%f ",&mel);
				A[i][j] = mel;
				fscanf(bm, "%f ",&mel);
				B[i][j] = mel;
			}
		}
		for (int j = 0; j < n; j++)
		{
			for (int i = 0; i < n; i++) 
			{
				sum = 0.0;
				for (int k = 0; k < n; k++)
				{
					sum += A[i][k]*B[k][j];
				}
				C[i][j] += sum;
			}
		}
		for (int i = 0; i < n; i++)
		{
			for (int j = 0; j < n; j++) 
			{
		      	fprintf(cm, "%f ", C[i][j]);
		  	}
		}
		end_t = clock();
		total_t = (double)((double)end_t - (double)start_t) / (double)CLOCKS_PER_SEC;
		printf("TOTAL TIME TAKEN BY CPU FOR %s FILE CREATION: %lf secs\n", argv[3], total_t);
	}
	else 
	{
		printf("Wrong arguments - use the format: \n$ mmatijk filenameA filenameB filenameC N\n");
	}
}
