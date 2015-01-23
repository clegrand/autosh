#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 2)
	{
		char *strdst1;
		char *strdst2;

		strdst1 = strdup(av[1]);

		printf("Start: Dst: %s, Src: %s, Num: %d\n", strdst1 + (strlen(av[1]) / 2), strdst1, atoi(av[2]));
		printf("Libc : %s | ", (char *) memmove(strdst1 + (strlen(av[1]) / 2), strdst1, (size_t) atoi(av[2])));
		printf("End: %s\n", strdst1);
		strdst2 = strdup(av[1]);
		printf("Ft   : %s | ", (char *) ft_memmove(strdst2 + (strlen(av[1]) / 2), strdst2, (size_t) atoi(av[2])));
		printf("End: %s\n", strdst2);

		free(strdst1);
		free(strdst2);
	}
	return (0);
}
