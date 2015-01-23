#include <stdlib.h>
#include <stdio.h>
#include "libft.h"

int	main(int ac, char **av)
{
	if(ac > 1)
	{
		printf("Verif: %d\n", atoi(av[1]));
		printf("Out  : %s\n", ft_itoa(atoi(av[1])));
	}

	return (0);
}
