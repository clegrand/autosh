#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		printf("Start: %s(end)\n", av[1]);
		printf("End  : %s(end)\n", ft_strtrim(av[1]));
	}
	return (0);
}
