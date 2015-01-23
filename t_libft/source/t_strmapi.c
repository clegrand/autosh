#include <string.h>
#include <stdio.h>
#include "libft.h"

char	ft_sfonct(unsigned int i, char c);

char	ft_sfonct(unsigned int i, char c)
{
	if (c >= 'Z')
		return ((char)(i % 10 + '0'));
	return ((char)(i % 26 + 'A'));
}

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		char *str;

		str = strdup(av[1]);
		printf("Start: %s\n", str);
		printf("Out  : %s\n", ft_strmapi(str, &ft_sfonct));
		printf("End  : %s\n", str);
	}
	return (0);
}
