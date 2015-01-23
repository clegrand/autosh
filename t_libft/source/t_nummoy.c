/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   t_nummoy.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/12/30 11:46:05 by clegrand          #+#    #+#             */
/*   Updated: 2014/12/30 11:59:38 by clegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdio.h>
#include <stdlib.h>

int					main(int ac, char **av)
{
	int					*tab;
	int					i;

	if (ac > 1)
	{
		if (!(tab = (int *)malloc(sizeof(int) * (ac - 1))))
			return (1);
		i = 0;
		printf("Moy of:");
		while (i < ac - 1)
		{
			printf(" %d", atoi(av[i + 1]));
			tab[i] = atoi(av[i + 1]);
			i++;
		}
		printf("\nIs    : %lld\n", ft_nummoy(tab, ac - 1));
	}
	return (0);
}
