#include <stdlib.h>
#include <stdio.h>
#include "libft.h"

#define FT_TEST "\v42\t\n"

int	main(int ac, char **av)
{
	if(ac > 1)
	{
		printf("Start: str: %s\n", av[1]);
		printf("Libc: %d\n", atoi(av[1]));
		printf("Ft  : %d\n", ft_atoi(av[1]));
		if (atoi(av[1]) == ft_atoi(av[1]))
			printf("OK ! :)\n");
		else
			printf("BAD ! :(\n");
	}
	else
	{
		printf("Start: str: %s\n", FT_TEST);
		printf("Libc: %d\n", atoi(FT_TEST));
		printf("Ft  : %d\n", ft_atoi(FT_TEST));
		if (atoi(FT_TEST) == ft_atoi(FT_TEST))
			printf("OK ! :)\n");
		else
			printf("BAD ! :(\n");
	}

	return (0);
}
