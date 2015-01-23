#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int		main(int ac, char **av)
{
	int n;

	if (ac > 1)
	{
		n = (int)*av[1];
		printf("Num  : %d (%c)\n", n, *av[1]);
		printf("Libc : %d\n", isdigit(n));
		printf("Out  : %d\n", ft_isdigit(n));
	}
	return (0);
}
