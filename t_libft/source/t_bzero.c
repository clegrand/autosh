#include <strings.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 2)
	{
		char *string1;
		char *string2;

		string1 = strdup(av[1]);
		write(1, "Start: ", 7);
		write(1, string1, strlen(string1));
		write(1, " | Number:", 10);
		write(1, av[2], strlen(av[2]));
		bzero(string1, atoi(av[2]));
		write(1, "\n", 1);
		write(1, "Libc : ", 7);
		write(1, string1, atoi(av[2]) + 1);
		write(1, "\n", 1);

		string2 = strdup(av[1]);
		ft_bzero(string2, atoi(av[2]));
		write(1, "Ft   : ", 7);
		write(1, string2, atoi(av[2]) + 1);
		write(1, "\n", 1);

		free(string1);
		free(string2);
	}
	return (0);
}
