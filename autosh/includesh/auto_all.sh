#! /bin/bash

# source meta_skin.sh

# 1: Commande make | [2: Size for function meta_alert]
function auto_make
{
	make -C ${PROJ} $1
	if [[ $? -ne 0 ]]; then
		printf "${RED}$(meta_alert "Make $1 error" $2)${NC} Make $1 for ${RED}${NAME}${NC} failed\n"
		return 1
	else
		printf "${GREEN}$(meta_alert "Make $1 ok" $2)${NC} Make $1 for ${GREEN}${NAME}${NC} success\n"
	fi
	return 0
}

# 1: Number of argument in array | [2: Size for function meta_array] | 2|[3]: This array ("title>texte")
function auto_message
{
	local -i i max
	local -a array
	array=("$@")
	if [[ $# -eq $(($1+1)) ]]; then
		array=("${array[@]:1}")
		i=0
		max=0
		while [[ $i -lt $1 ]]; do
			if [[ ${#array[$i]/>*/} -gt ${max} ]]; then
				max=${#array[$i]/>*/}
			fi
			i=$(($i+1))
		done
	elif [[ $# -eq $(($1+2)) ]]; then
		array=("${array[@]:2}")
		max=$2
	else
		return 1
	fi
	i=0
	while [[ $i -lt ${#array[@]} ]]; do
		printf "$(meta_alert "${array[$i]/>*/}" ${max}) ${array[$i]/*>/}\n"
		i=$(($i+1))
	done
	return 0
}
