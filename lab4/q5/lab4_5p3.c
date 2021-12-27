#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main()
{
	void *handle;
	void (*matadd)  (int [8][8], int [8][8], int [8][8], int);
	void (*matsub)  (int [8][8], int [8][8], int [8][8], int);
	void (*matmult) (int [8][8], int [8][8], int [8][8], int);
	void (*mattrans)(int [8][8], int [8][8], int);
	char *error;
  	handle = dlopen("./libmat.so", RTLD_LAZY);
  	if(!handle) 
	{
		fprintf(stderr, "%s\n", dlerror());
		return 0;
	}
	matadd = dlsym(handle, "matadd");
	matsub = dlsym(handle, "matsub");
	matmult = dlsym(handle, "matmult");
 	mattrans = dlsym(handle, "mattrans");

	int a[8][8], b[8][8], c[8][8];
	int n, tmp;
	printf("Enter the values: ");
	printf("n:"); scanf("%d", &n);
	printf("a:");
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			scanf("%d", &tmp);
			a[i][j] = tmp;
		}
	}
	printf("b:");		
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++)
		{
			scanf("%d", &tmp);
			b[i][j] = tmp;
		}
	}
	matadd(a, b, c, n);
	printf("(a + b):\n");
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++) printf("%d ", c[i][j]);
		printf("\n");	
	}
	matsub(a, b, c, n);
	printf("(a - b):\n");
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++) printf("%d ", c[i][j]);
		printf("\n");
	}
	matmult(a, b, c, n);
	printf("(a * b):\n");
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++) printf("%d ", c[i][j]);
		printf("\n");  
	}
	mattrans(a, c, n);
	printf("Transpose(a):\n");
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++) printf("%d ", c[i][j]);                  
		printf("\n");  
	}
}