#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 3)
	{
		printf("Start: s: %s, start: %d, len: %d\n", av[1], atoi(av[2]), atoi(av[3]));
		printf("End  : %s\n", ft_strsub(av[1], (unsigned char)atoi(av[2]), (size_t)atoi(av[3])));
	}
	return (0);
}
