void mattrans(int a[8][8], int c[8][8], int n){
	for(int i = 0; i < n; i++)
	{
		for(int j = 0; j < n; j++) c[i][j] = a[n - i - 1][n - j - 1];
	}
}
