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
		printf "$1"
		i=$((i+1))
	done
	return 0
}

# Test

#if [[ $# -lt 2 ]]; then
#	printf "Please enter arguments\n"
#else
#	printf "I enter \"%s\" and \'%d\' for lib_set\n" $1 $2
#	printf "Result is:\n%s\n" `lib_set $1 $2`
#fi

#exit 0
