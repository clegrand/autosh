#include "get_next_line.h"
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define M_ERROR(message, type)	printf("Error: %s\n", message); \
								return (type);

int		ft_intchr(int const *tab, int n, size_t size)
{
	if (tab && size)
		return(ft_intchr(tab + 1, n, size - 1) + (*tab == n ? 1 : 0));
	return (0);
}

unsigned int	ft_intsupchr(int *tab, int n, unsigned int size)
{
	int					*ntab;
	unsigned int		i;
	unsigned int		nsize;

	nsize = size - ft_intchr(tab, n, size);
	if (!tab && !(ntab = (int *)malloc(sizeof(*ntab) * nsize)))
		return (0);
	i = 0;
	while (size--)
	{
		if (*tab != n)
		{
			*ntab = tab[i];
			ntab++;
		}
		i++;
	}
	tab = ntab - nsize;
	return (size);
}

int				main(int ac, char **av)
{
	int				*fd;
	int				check;
	char			**lfile;
	unsigned int	*line;
	unsigned int	i;
	unsigned int	cfd;

	if (!(lfile = (char **)malloc(sizeof(*lfile))) || !(fd = (int *)malloc(sizeof(*fd) * (ac - 1 > 0 ? ac - 1 : 1))) || !(line = (unsigned int *)malloc(sizeof(*line) * (ac - 1 > 0 ? ac - 1 : 1))))
	{
		M_ERROR("Allocation of **line or/and fd failed", 2)
	}
	i = 0;
	while(ac > (int)++i)
	{
		if ((fd[i - 1] = open(av[i], O_RDONLY | O_CREAT)) == -1)
		{
			M_ERROR("Open file failed", 2)
		}
	}
	if (ac == 1)
	{
		i = 2;
		*fd = 0;
	}
	cfd = 0;
	while (cfd < i)
		line[cfd++] = 0;
	cfd = 0;
	i--;
	while (ft_intchr(fd, -1, (size_t)i) != (int)i)
	{
		while (fd[cfd] == -1)
			cfd = (cfd + 1) % i;
		check = get_next_line(fd[cfd], lfile);
		if (check == -1)
		{
			M_ERROR("Fonction return -1", 1)
		}
		if (check)
			printf("Line %d, file %d: %s(eol)\n", ++line[cfd], fd[cfd], *lfile);
		if (!check)
		{
			close(fd[cfd]);
			fd[cfd] = -1;
		}
		cfd = (cfd + 1) % i;
	}
	printf("END: %s(EOF)\n", *lfile);
	return (0);
}
