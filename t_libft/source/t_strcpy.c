#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 2)
	{
		char *string1;
		char *string2;

		string1 = strdup(av[1]);
		printf("Start: dst: %s, src: %s\n", string1, av[2]);
		printf("Libc : %s | ", strcpy(string1, av[2]));
		printf("End: %s\n", string1);
		string2 = strdup(av[1]);
		printf("Ft   : %s | ", ft_strcpy(string2, av[2]));
		printf("End: %s\n", string2);

		free(string1);
		free(string2);
	}

	return (0);
}
