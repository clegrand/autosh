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

LIN_DEF='80'
COL_DEF='80'

function screen_lines
{
	local -i lines
	lines=`tput lines`
#	echo $(resize | grep "^LINES=" | cut -d '=' -f 2 | cut -d ';' -f 1)
	if [[ $lines -eq 0 ]]; then
		echo $LIN_DEF
		return 1
	fi
	echo $lines
	return 0
}

function screen_columns
{
	local -i columns
	columns=`tput cols`
#	echo $(resize | grep "^COLUMNS=" | cut -d '=' -f 2 | cut -d ';' -f 1)
	if [[ ${columns} -eq 0 ]]; then
		echo "${COL_DEF}"
		return 1
	fi
	echo ${columns}
	return 0
}

# TESTS

#lines=$(screen_lines)
#columns=$(screen_columns)
#echo "lines=${lines} columns=${columns}"

function screen_delturn
{
	local -i i
	i=0
	while [[ $i -lt $1 ]]; do
		printf "${LEFT} ${LEFT}"
		i=$((i+1))
	done
}

function screen_deline
{
	printf "$(screen_delturn $(screen_lines))"
	return 0
}

function screen_delinecho
{
	printf "$(screen_deline)"
	printf "$*"
	return 0
}

# TESTS

#printf "Hey !!!"
#sleep 3
#printf "$(screen_delturn 3)"
#printf "???"
#sleep 1
#printf "$(screen_deline)\n"
#sleep 1
#printf "Bonjour"
#sleep 3
#printf "$(screen_delinecho Hello World \!)"
#sleep 2
#printf "$(screen_delinecho "Bye :)")\n"

#exit 0
