#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include "libft.h"

int main(int ac, char **av)
{
	if (ac > 1)
	{
		write(1, "Num  : ", 7);
		write(1, av[1], strlen(av[1]));
		write(1, "\n", 1);
		write(1, "Out  : ", 7);
		write(1, ft_strnew(atoi(av[1])), atoi(av[1]));
		write(1, "\n", 1);
	}
	return (0);
}
