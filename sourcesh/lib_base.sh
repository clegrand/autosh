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

# $*=words
function lib_lenmax
{
    local -i m tmp
    local -a words
    words=$*
    m=0
    for word in ${words[@]}; do
        tmp=${#word}
        if [ $tmp -gt $m ]; then
            m=$tmp
        fi
    done
    echo $m
    return 0
}

# $1: current $2: max [$3: min]
function lib_limit
{
    local -i m
    if [ $# -lt 2 ]; then
        return 1
    elif [ $# -gt 2 ]; then
        m=$3
    else
        m=0
    fi
    i=$(($1-$m))
    echo $((($1%$2)+$m))
    return 0
}

# $1: file_content
function lib_filename
{
    local name
    if [ $# -lt 1 ]; then
        return 1
    fi
    name="$(basename "$1")"
    if [ "${name:0:1}" == '.' ]; then
        name="${name:1}"
    fi
    echo "${name%.*}"
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
