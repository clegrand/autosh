#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 3)
	{
		printf("s1 : %s, s2 : %s, n: %d\n", av[1], av[2], atoi(av[3]));
		printf("End  : %d\n", ft_strnequ(av[1], av[2], (size_t)atoi(av[3])));
	}
	return (0);
}
