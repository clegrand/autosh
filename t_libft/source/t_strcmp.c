#include <string.h>
#include <stdio.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 2)
	{
		printf("Start: s1: %s, s2: %s\n", av[1], av[2]);
		printf("Libc : %d\n", strcmp(av[1], av[2]));
		printf("Out  : %d\n", ft_strcmp(av[1], av[2]));
	}
	return (0);
}
