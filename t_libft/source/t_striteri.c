#include <string.h>
#include <stdio.h>
#include "libft.h"

void	ft_sfonct(unsigned int i, char *c)
{
	i = i % 26;
	*c = (char)i + 'A';
}

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		char *str;

		str = strdup(av[1]);
		printf("Start: %s\n", str);
		ft_striteri(str, &ft_sfonct);
		printf("End  : %s\n", str);
	}
	return (0);
}
