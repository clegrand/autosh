#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "libft.h"

int main(void)
{
	void **pptr;
	void *ptr;

	ptr = malloc(1);
	pptr = malloc(1);
	*pptr = ptr;
	printf("Start: %p\n", *pptr);
	ft_memdel(pptr);
	printf("End  : %p\n", *pptr);
	printf("Start: %p\n", NULL);
	ft_memdel(NULL);
	printf("End  : No 'Segfault' :)\n");
	return (0);
}
