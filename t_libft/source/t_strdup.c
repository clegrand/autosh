/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   t_strdup.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/03 16:04:32 by clegrand          #+#    #+#             */
/*   Updated: 2014/11/06 18:13:17 by clegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <string.h>
#include <stdio.h>
#include "libft.h"

int main(int ac, char **av)
{
	if(ac > 1)
	{
		printf("Libc: %s\n", strdup(av[1]));
		printf("Ft  : %s\n", ft_strdup(av[1]));
	}

	return (0);
}
