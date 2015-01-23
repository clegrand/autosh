#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include "libft.h"
#define BUF	100

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		int		fd;
		char	mbuf[BUF + 1];

		if ((fd = open("f_putnbr_fd", O_RDWR | O_CREAT)) == -1)
		{
			write(2, "Open error\n", 11);
			return (1);
		}
		read(fd, mbuf, BUF);
		ft_putnbr_fd(atoi(av[1]), fd);
		write(fd, "\n", 1);
		printf("Send %d\n", atoi(av[1]));
		if (close(fd) == -1)
		{
			write(2, "Not close !\n", 12);
		}
	}
	return (0);
}
