# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    screen_func.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/23 19:21:09 by clegrand          #+#    #+#              #
#    Updated: 2015/01/27 20:24:25 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UP='\033[A'
LEFT='\033[D'
RIGHT='\033[C'
DOWN='\033[B'

LIN_DEF='80'
COL_DEF='80'

#source ../sourcesh/lib_base.sh

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

function screen_turn_left {
    local -i num_left
    if [ $# -ge 1 ]; then
        num_left=$1
    else
        num_left=$(screen_lines)
    fi
    lib_set "$LEFT" $num_left
    return 0
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

function screen_center
{
	local merge
	local -i char
	size=$((($(screen_columns)/2)-(${#1}/2)))
	if [[ -n $2 ]]; then
		merge=("$2")
	else
		merge=(' ')
	fi
	printf "`lib_set "${merge:0:1}" ${size}`$1`lib_set "${merge:0:1}" $((${size}+$((($(screen_columns)%2)-1))))`\n"
}

# TESTS

#printf "`screen_center "Salut tout le monde"`\n"
#printf "`screen_center "Salut tout le monde" '|i||'`\n"
#printf "`screen_center "{end of test}" "8"`\n"

#exit 0
