#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int		main(int ac, char **av)
{
	unsigned int	i;
	char			**sstr;

	if (ac > 2)
	{
		printf("Start: s:%s, c: '%c'\n", av[1], *av[2]);
		if (!(sstr = ft_strsplit(av[1], *av[2])))
		{
			printf("NULL");
			return (1);
		}
		i = -1;
		while (sstr[++i] && *sstr[i])
			printf("End  : %s\n", sstr[i]);
		free(sstr);
	}
	return (0);
}
