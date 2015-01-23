#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 3)
	{
		char *string1;
		char *string2;

		string1 = strdup(av[1]);
		printf("Start: s1: %s, s2: %s, n: %d\n", string1, av[2], atoi(av[3]));
		printf("Libc : %s | ", strncat(string1, av[2], atoi(av[3])));
		printf("End: %s\n", string1);
		string2 = strdup(av[1]);
		printf("Ft   : %s | ", ft_strncat(string2, av[2], atoi(av[3])));
		printf("End: %s\n", string2);

		free(string1);
		free(string2);
	}

	return (0);
}
