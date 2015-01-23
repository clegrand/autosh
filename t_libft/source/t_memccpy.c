#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 4)
	{
		char *strsrc;
		char *strdst1;
		char *strdst2;

		strsrc = strdup(av[1]);

		strdst1 = strdup(av[2]);
		printf("Start: Dst: %s, Src: %s, Int: %d (%c), Num: %d\n", strdst1, strsrc, atoi(av[3]), (char)atoi(av[3]), atoi(av[4]));
		printf("Libc : %s, ", (char *)memccpy(strdst1, strsrc, atoi(av[3]), (size_t) atoi(av[4])));
		printf("End: %s\n", strdst1);

		strdst2 = strdup(av[2]);
		printf("Ft   : %s, ", (char *)ft_memccpy(strdst2, strsrc, atoi(av[3]), (size_t) atoi(av[4])));
		printf("End: %s\n", strdst2);

		free(strsrc);
		free(strdst1);
		free(strdst2);
	}
	return (0);
}
