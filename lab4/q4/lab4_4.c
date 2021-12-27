#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main()
{
	int x[8], y[8], z[8]; 
	int n, k, s;

	printf("Enter the values: ");
	printf("n:"); scanf("%d", &n);
	
	printf("x:");
	for(int i = 0; i < n; i++) scanf("%d", &x[i]);
	printf("y:");
	for(int i = 0; i < n; i++) scanf("%d", &y[i]);
	
	printf("k:"); scanf("%d", &k);
	printf("s:"); scanf("%d", &s);	

	addvec(x, y, z, n);
	printf("\nVector addition: ");
	for(int i = 0; i < n; i++) printf("%d ", z[i]);

	subvec(x, y, z, n);
	printf("\nVector subtraction: ");
	for(int i = 0; i < n; i++) printf("%d ", z[i]);

	multvec(x, y, z, n);
	printf("\nVector multiplication: ");
	for(int i = 0; i < n; i++) printf("%d ", z[i]);

	divvec(x, y, z, n);
	printf("\nVector division: ");
	for(int i = 0; i < n; i++) printf("%d ", z[i]);

	mulkvec(x, k, z, n);
	printf("\nMultiplication by k: ");
	for(int i = 0; i < n; i++) printf("%d ", z[i]);

	divkvec(x, k, z, n);
	printf("\nDivision by k: ");
	for(int i = 0; i < n; i++) printf("%d ", z[i]);

	sortvec(x, s, z, n);
	printf("\nVector sorting: ");
	for(int i = 0; i < n; i++) printf("%d ", z[i]);
	printf("\n");
}
