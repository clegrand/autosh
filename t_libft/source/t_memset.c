#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 3)
	{
		char *string1;
		char *string2;

		string1 = strdup(av[1]);
		printf("Start: %s, Convert:%d (%c), Number:%d\n", string1, atoi(av[2]), atoi(av[2]), atoi(av[3]));
		printf("Libc : %s | ", (char*) memset(string1, atoi(av[2]), (size_t) atoi(av[3])));
		printf("End: %s\n", string1);
		string2 = strdup(av[1]);
		printf("Ft   : %s | ", (char*) ft_memset(string2, atoi(av[2]), (size_t) atoi(av[3])));
		printf("End: %s\n", string2);
		free(string1);
		free(string2);
	}
	return (0);
}
