#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int main(void)
{
	char **pptr;
	char *ptr;

	ptr = (char *)malloc(sizeof(*ptr));
	pptr = (char **)malloc(sizeof(**pptr));
	*pptr = ptr;
	printf("Start: %p\n", *pptr);
	ft_strdel(pptr);
	printf("End  : %p\n", *pptr);
	printf("Start: %p\n", NULL);
	ft_strdel(NULL);
	printf("End  : No 'SegFault'\n");
	return (0);
}
