#include "get_next_line.h"
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int		main(int ac, char **av)
{
	int				fd;
	int				check;
	char			**lfile;

	if (!(lfile = (char **)malloc(sizeof(*lfile))))
		return (2);
	if(ac > 1)
	{
		if ((fd = open(av[1], O_RDONLY | O_CREAT)) == -1)
			return (2);
	}
	else
		fd = 0;
	while ((check = get_next_line(fd, lfile)))
	{
		if (check == -1)
			return (1);
		printf("%s\n", *lfile);
		free(*lfile);
	}
	if (fd)
		close(fd);
	return (0);
}
