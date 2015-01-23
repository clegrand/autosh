#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 3)
	{
		char *strsrc;
		char *strdst1;
		char *strdst2;

		strsrc = strdup(av[1]);
		strdst1 = strdup(av[2]);

		printf("Start: Src: %s, Dst: %s, Num : %d\n", strsrc, strdst1, atoi(av[3]));
		printf("Libc : %d\n", memcmp(strdst1, strsrc, (size_t) atoi(av[3])));

		strdst2 = strdup(av[2]);
		printf("Ft   : %d\n", ft_memcmp(strdst2, strsrc, (size_t) atoi(av[3])));

		free(strsrc);
		free(strdst1);
		free(strdst2);
	}
	return (0);
}
