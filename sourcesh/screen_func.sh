# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    screen_func.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/23 19:21:09 by clegrand          #+#    #+#              #
#    Updated: 2015/01/23 20:59:45 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UP='\033[A'
LEFT='\033[D'
RIGHT='\033[C'
DOWN='\033[B'

function screen_lines
{
	echo $(resize | grep "^LINES=" | cut -d '=' -f 2 | cut -d ';' -f 1)
	if [[ $? != 0 ]]; then
		return 1
	fi
	return 0
}

function screen_columns
{
	echo $(resize | grep "^COLUMNS=" | cut -d '=' -f 2 | cut -d ';' -f 1)
	if [[ $? != 0 ]]; then
		return 1
	fi
	return 0
}

# TESTS

#lines=$(screen_lines)
#columns=$(screen_columns)
#
#echo "lines=${lines} columns=${columns}"

function screen_delturn
{
	local -i i
	i=0
	while [[ $i -lt $1 ]]; do
		echo "${LEFT} ${LEFT}\c"
		i=$((i+1))
	done
}

function screen_deline
{
	echo $(screen_delturn $(screen_lines))
	return 0
}

function screen_delinecho
{
	echo "$(screen_deline)\c"
	echo "$*\c"
	return 0
}

# TESTS

#echo "Hey !!!\c"
#sleep 3
#echo "$(screen_delturn 3)\c"
#echo "???\c"
#sleep 1
#echo "$(screen_deline)"
#sleep 1
#echo "Bonjour\c"
#sleep 3
#echo "$(screen_delinecho Hello World \!)\c"
#sleep 2
#echo "$(screen_delinecho "Bye :)")"

#exit 0
