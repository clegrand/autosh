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
source ../sourcesh/meta_skin.sh

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

function time_result
{
	local -i max good
	if [[ $3 -gt 0 ]]; then
		max=$3
	else
		max=$(screen_columns)
	fi
	if [[ $1 -gt $2 ]] || [[ $2 -eq 0 ]]; then
		printf "${BG_WHITE}$(lib_set ' ' max)${NC}\n"
		return 1
	fi
	good=$(echo "scale=5;(${max}/$2)*$1" | bc | cut -d '.' -f 1)
	printf "${BG_GREEN}$(lib_set ' ' ${good})${BG_RED}$(lib_set ' ' $((${max}-${good})))${NC}\n"
	return 0
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
#printf "$(time_result 4 3)\n"
#printf "$(time_result 4 3 5)\n"
#printf "$(time_result 4 3 2)\n"
#printf "$(time_result 2 4)\n"
#printf "$(time_result 2 4 2)\n"
#printf "$(time_result 220 830)\n"
#printf "$(time_result 220 830 50)\n"
#printf "$(time_result 767 830)\n"
#
#exit 0
