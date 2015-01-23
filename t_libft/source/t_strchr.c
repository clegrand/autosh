#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 2)
	{
		char *str1;
		char *str2;

		str1 = strdup(av[1]);
		str2 = strdup(av[1]);
		printf("Num  : %d (%c), ", atoi(av[2]), atoi(av[2]));
		printf("Start: %s\n", str1);
		printf("Libc : %s\n", strchr(str1, atoi(av[2])));
		printf("Ft   : %s\n", ft_strchr(str2, atoi(av[2])));
		free(str1);
		free(str2);
	}
	return (0);
}
