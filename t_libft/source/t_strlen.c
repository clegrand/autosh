/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   t_strlen.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/03 15:37:27 by clegrand          #+#    #+#             */
/*   Updated: 2014/12/29 20:38:04 by clegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include "libft.h"

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		printf("Start: %s\n", av[1]);
		printf("Libc : %d\n", (int)strlen(av[1]));
		printf("Ft   : %d\n", (int)ft_strlen(av[1]));
	}
	return (0);
}
