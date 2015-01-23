#include <string.h>
#include <stdio.h>
#include "libft.h"

char	ft_sfonct(char c);

char	ft_sfonct(char c)
{
	if (c >= 'Z')
		return ('+');
	return ('-');
}

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		char *str;

		str = strdup(av[1]);
		printf("Start: %s\n", str);
		printf("Out  : %s\n", ft_strmap(str, &ft_sfonct));
		printf("End  : %s\n", str);
	}
	return (0);
}
