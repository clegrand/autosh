# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    lib_base.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/25 15:42:00 by clegrand          #+#    #+#              #
#    Updated: 2015/01/25 15:44:24 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# $1=string_repeat $2=number_repeat
function lib_set
{
	local -i i
	i=0
	while [[ $i -lt $2 ]]; do
		echo "$1\c"
		i=$((i+1))
	done
	return 0
}
