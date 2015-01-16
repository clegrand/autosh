/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ref_ft_printf.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/12/31 12:13:27 by clegrand          #+#    #+#             */
/*   Updated: 2015/01/08 20:50:00 by clegrand         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <locale.h>
#include "ft_printf.h"

#define FT_WHITE "\033[1;37m"
#define FT_RED "\033[0;31m"
#define FT_GREEN "\033[0;32m"
#define FT_NC "\033[0m"
#define FT_ARG "error"

int					main(void)
{
	int					ret_ft;
	int					bas_ft;

	setlocale(LC_ALL, "en_US.UTF-8");
	printf("%sprintf:%s\n", FT_WHITE, FT_NC);
	bas_ft = printf(FT_ARG);
	printf("\n%sft_printf:%s\n", FT_WHITE, FT_NC);
	ret_ft = ft_printf(FT_ARG);
	if (ret_ft == bas_ft)
		printf("\n%sreturn of ft_printf and printf are identic [%d]%s\n", FT_GREEN, ret_ft, FT_NC);
	else
		printf("\n%sreturn bad number: printf: return [%d] and ft_printf: return [%d]%s\n", FT_RED, bas_ft, ret_ft, FT_NC);
	return (0);
}
