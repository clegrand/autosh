#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 1)
	{
		char *string1;
		char *string2;

		string1 = strdup(av[1]);
		printf("Start: s1: %s, s2: %s\n", string1, av[2]);
		printf("Libc: %s | ", strcat(string1, av[2]));
		printf("End  :%s\n", string1);
		string2 = strdup(av[1]);
		printf("Ft  : %s | ", ft_strcat(string2, av[2]));
		printf("End  :%s\n", string2);

		free(string1);
		free(string2);
	}

	return (0);
}
