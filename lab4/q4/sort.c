void sortvec(int *x, int s, int *z, int n)
{
	if(s == 1 || s == 0)
	{
		int tmp;
		for (int i = 0; i < n; i++)
		{
			for (int j = 0; j < n; j++)
			{
				if (x[j] > x[i])
				{
					tmp = x[i];
					x[i] = x[j];
					x[j] = tmp;
				}
			}
		}
		if(s == 1) for (int i = 0; i < n; i++) z[i] = x[i];
		else if (s == 0)
		{
			int i = 0; 
			for (int j = n - 1; j >= 0; j--)
			{
				z[i] = x[j];
				i++;
			}
		}
	}
}
