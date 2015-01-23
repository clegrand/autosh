#include "libft.h"
#include <stdio.h>
#include <stdlib.h>

int			main(int ac, char **av)
{
	t_list	*lst;
	
	if (ac)
	{
		printf("File : %s, Size : %d\n", av[1], (int)ft_strlen(av[1]));
		if (!(lst = ft_lstnew((void *)av[1], ft_strlen(av[1]))))
		{
			printf("t_list is NULL\n");
			return (-1);
		}
		printf("Out  : %s\n", (char *)lst->content);
		if (!ft_strlen(av[1]))
		{
			printf("\033[32mGOOD : No segfault\n\033[00m");
			return (0);
		}
		if (ft_strcmp(lst->content, av[1]) && !lst->next)
			printf("\033[31mFAILED !: Size of content or content\n\033[00m");
		else
			printf("\033[32mGOOD :)\n\033[00m");
		free(lst);
	}
	return (0);
}
