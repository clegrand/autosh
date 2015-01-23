/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   t_striter.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/05 14:36:06 by clegrand          #+#    #+#             */
/*   Updated: 2014/12/29 20:19:05 by clegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include "libft.h"

void	ft_sfonct(char *c)
{
	if ('a' <= *c && *c <= 'z')
		*c = 'C';
	else
		*c = 'c';
}

int		main(int ac, char **av)
{
	if (ac > 1)
	{
		char *str;

		str = strdup(av[1]);
		printf("Start: %s\n", str);
		ft_striter(str, &ft_sfonct);
		printf("End  : %s\n", str);
	}
	return (0);
}
