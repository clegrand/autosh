#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		printf("Num : %d\n", atoi(av[1]));
		ft_putnbr(atoi(av[1]));
		write(1, "\n", 1);
	}
	return (0);
}
