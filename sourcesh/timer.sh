# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    timer.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/27 20:11:15 by clegrand          #+#    #+#              #
#    Updated: 2015/12/20 16:38:14 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# . source_file.sh
if [[ -z $SOURCESH ]]; then
	SOURCESH=.
fi
source $SOURCESH/lib_base.sh
source $SOURCESH/screen_func.sh
source $SOURCESH/meta_skin.sh

TIME_DEFAULT=0.2
TIME_F='time_wait'

# 1: Stage of animation
function time_wait
{
	if [[ $1 -eq 0 ]]; then
		printf "(   )"
	elif [[ $((($1%4)+1)) -eq 1 ]]; then
		printf "(o  )"
	elif [[ $((($1%4)+1)) -eq 2 ]] || [[ $((($1%4)+1)) -eq 4 ]]; then
		printf "( o )"
	else
		printf "(  o)"
	fi
	printf "$(screen_turn_left 5)"
}

# 1: Result | 2: Max result | [3: Max field]
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

# 1: Pid | 2: Funciton animation | [3: Check time]
function time_waitpid
{
	local -i i
	local time
	if [[ $# -lt 2 ]]; then
		return 1
	fi
	if [[ $(echo "scale=5;$3" | bc | tr -d '.') -gt 0 ]]; then
		time=$3
	else
		time=${TIME_DEFAULT}
	fi
	i=0
	printf "$($2 $i)"
	sleep $time
	kill -0 $1 2> /dev/null
	while [[ $? -eq 0 ]]; do
		i=$(($i+1))
		printf "$($2 $i)"
		sleep $time
		kill -0 $1 2> /dev/null
	done
    wait $1
	return $?
}

# 1: Pid | [2: Check time]
function time_defaultpid
{
    time_waitpid $1 $TIME_F $2
    return $?
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
