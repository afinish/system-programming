#include <stdio.h>
#include <malloc.h>

int main()
{
	int *p, m = 1, n = 1;
	p = malloc(32);
	for(int i = 0; i < n; i++) 
	{
		p = malloc(32);
		if(i < m) free(p);
	}
	return(0);
}
