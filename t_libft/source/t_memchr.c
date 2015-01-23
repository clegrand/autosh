#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 3)
	{
		char *strsrc;

		strsrc = strdup(av[1]);

		printf("Start: Str: %s, Char: %d (%c), Num : %d\n", strsrc , atoi(av[2]), (char)atoi(av[2]), atoi(av[3]));
		printf("Libc : %s\n", (char *) memchr(strsrc, atoi(av[2]), (size_t)atoi(av[3])));
		printf("Ft   : %s\n", (char *) ft_memchr(strsrc, atoi(av[2]), (size_t)atoi(av[3])));

		free(strsrc);
	}
	return (0);
}
