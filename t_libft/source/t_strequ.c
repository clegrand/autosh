#include <stdio.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 2)
	{
		printf("Str1: %s, Str2: %s\n", av[1], av[2]);
		printf("End  : %d\n", ft_strequ(av[1], av[2]));
	}
	return (0);
}
