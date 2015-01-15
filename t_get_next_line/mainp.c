/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main4.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/20 12:44:20 by clegrand          #+#    #+#             */
/*   Updated: 2014/11/20 15:07:10 by clegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include "get_next_line.h"

int main(void)
{
	char *line;

	if (get_next_line(42, &line) == -1)
		printf("OK: return -1 :)");
	else
		printf("ERROR: return bad number :(");
	return (0);
}
