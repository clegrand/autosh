#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		printf("Num  : %d (%c)\n", atoi(av[1]), (char)atoi(av[1]));
		printf("Libc : %d\n", isascii(atoi(av[1])));
		printf("Out  : %d\n", ft_isascii(atoi(av[1])));
	}
	return (0);
}
