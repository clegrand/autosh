# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    timer.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/27 20:11:15 by clegrand          #+#    #+#              #
#    Updated: 2015/01/27 21:40:22 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

source ../sourcesh/screen_func.sh

function time_wait
{
	if [[ $1 -eq 0 ]]; then
		printf "(   )"
	elif [[ $((($1%4)+1)) -eq 1 ]]; then
		printf "$(screen_delturn 5)"
		printf "(o  )"
	elif [[ $((($1%4)+1)) -eq 2 ]] || [[ $((($1%4)+1)) -eq 4 ]]; then
		printf "$(screen_delturn 5)"
		printf "( o )"
	else
		printf "$(screen_delturn 5)"
		printf "(  o)"
	fi
}

# TESTS
#
#i=0
#while [[ $i -lt 50 ]]; do
#	printf "$(time_wait $i)"
#	sleep 0.1
#	i=$((i+1))
#done
#echo
#
#exit 0
