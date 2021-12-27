#include<stdio.h>
int main() {
	int ln, a, b=0, b_str[16], C=0;
	float rn;
	double num;
	printf("Enter a Real Number in Decimal form :");
	scanf("%lf",&num);
	//Rewriting our number as integer part and whole number minus integer part.
	ln = num;
	rn = num - ln;
	//Rewriting integer part in binary form.
	while(ln != 0) {
		b_str[b] = ln % 2;
		ln = ln / 2;
		C++;
		b++;
	}
	printf("Real number in binary form :");
	//Rewriting integer
	for(int i=C-1; i>=0; i--)
		printf("%d",b_str[i]);
	printf(".");
	//Computing fractional part in binary form.
	for(int i=0; i<8; i++) {
		rn = rn * 2;
		a = rn;
		printf("%d", a);
		if(a==1)
			rn = rn - a;
	}
	printf("\n");
	return 0;
}
