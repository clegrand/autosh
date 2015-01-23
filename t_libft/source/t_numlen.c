/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   t_numlen.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/12/30 11:21:31 by clegrand          #+#    #+#             */
/*   Updated: 2014/12/30 11:45:10 by clegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdio.h>
#include <stdlib.h>

int					main(int ac, char **av)
{
	if (ac > 1)
	{
		printf("Num: %d\n", atoi(av[1]));
		printf("End: %d\n", ft_numlen(atoi(av[1])));
	}
	return (0);
}
