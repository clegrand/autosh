#! /dev/bash

# source meta_skin.sh

function p_init
{
	O_MODE=("${PROJ}" "${BEFORE[@]}" "${AFTER[@]}" "${ORIGIN_AUTHOR}")
	return 0
}

# 1: Choice change option | [2: Size for function meta_alert]
function p_select
{
	local p_string
	if [[ $1 -le ${#O_MODE[@]} ]] && [[ $1 -ne 0 ]]; then
		printf "$(meta_alert "${O_MENU[$(($1-1))]}" $2) "
		tput cnorm
		read p_modif
		tput civis
		O_MODE[$(($1-1))]="${p_modif}"
	fi
	return 0
}

# Modifiable option
function p_regle
{
	PROJ="${O_MODE[0]}"
	BEFORE="${O_MODE[1]}"
	AFTER="${O_MODE[2]}"
	ORIGIN_AUTHOR="${O_MODE[3]}"
	return 0
}

# [1: Size for function meta_alert]
function p_menu
{
	local -i i
	local tabcat
	printf "$(meta_menu "${O_MENU[@]}")\n"
	i=0
	while [[ $i -lt ${#O_MESSAGE[@]} ]]; do
		tabcat="${O_MENU[$i]}>${O_MESSAGE[$i]}"
		printf "${TAB_COLOR[$i]}$(auto_message 1 $1 "${tabcat}")${NC}\n"
		printf "$(meta_alert "Actual" $1) ${WHITE2}${O_MODE[$i]}${NC}\n"
		i=$(($i+1))
	done
	printf "Select option number or other for quit\n"
	read -s -n 1 o_choice
	printf "${WHITE2}\n"
	p_select ${o_choice} $1
	printf "${NC}\n"
	p_regle
	return 0
}
