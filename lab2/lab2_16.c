#include <stdio.h>
int main() {
	int ln=0, dot, pow1=1, bi_str[17];
	double rn=0, num;
	float pow2=2;
	char b_str[17];
	printf("Do not forget to put a dot(write 16 characters).\n");
	printf("Enter a Real Number in binary form :");
	//Input everything as chars of 0's and 1's.
	fgets(b_str, 17, stdin);
	//Rewrite char input as string of 0's and 1's and also dot.
	for(int i=0; i<17; i++) {
		if (b_str[i] == '1')
			bi_str[i] = 1;
		else if (b_str[i] == '.') {
			dot = i;
			bi_str[i] == 0;
		}
		else
			bi_str[i] = 0;
	}
	//Computing left (integer) part of number.
	for(int i=dot-1; i>=0; i--) {
		ln = ln + bi_str[i] * pow1;
		pow1 = pow1 * 2;
	}
	//Computing right (fractional) part of number.
	for(int i=dot+1; i<17; i++) {
		rn = rn + bi_str[i] / pow2;
		pow2 = pow2 * 2;
	}
	num = ln + rn;
	printf("Real number in Decimal form : %f", num);
	printf("\n");
	return 0;
}

