#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 3)
	{
		printf("Start: s1: %s, s2: %s, n: %d\n", av[1], av[2], atoi(av[3]));
		printf("Libc : %d\n", strncmp(av[1], av[2], (size_t)atoi(av[3])));
		printf("Ft   : %d\n", ft_strncmp(av[1], av[2], (size_t)atoi(av[3])));
	}
	return (0);
}
