#include <string.h>
#include <stdio.h>
#include <stdlib.h>

size_t ft_strlcat(char *dst, char *src, size_t size);

int main(int ac, char **av)
{
	if(ac > 3)
	{
		char *strsrc;
		char *strdst1;
		char *strdst2;

		strsrc = strdup(av[1]);
		strdst1 = strdup(av[2]);

		printf("Start: Src: %s, Dst: %s, Num: %d\n", strsrc, strdst1, atoi(av[3]));
		printf("Libc : %d | ", (int)strlcat(strdst1, strsrc, (size_t)atoi(av[3])));
		printf("End: %s\n", strdst1);

		strdst2 = strdup(av[2]);
		printf("Ft   : %d | ", (int)ft_strlcat(strdst2, strsrc, (size_t)atoi(av[3])));
		printf("End: %s\n", strdst2);

		free(strsrc);
		free(strdst1);
		free(strdst2);
	}
	return (0);
}
