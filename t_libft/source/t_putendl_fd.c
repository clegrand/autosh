#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include "libft.h"
#define BUF	100

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		int		fd;
		char	mbuf[BUF + 1];

		if ((fd = open("f_putendl_fd", O_CREAT | O_RDWR)) == -1)
		{
			write(2, "Open error\n", 11);
			return (1);
		}
		read(fd, mbuf, BUF);
		ft_putendl_fd(av[1], fd);
		printf("Send: %s\n", av[1]);
		if (close(fd) == -1)
		{
			write(2, "Not close !\n", 12);
			return (1);
		}
	}
	return (0);
}
