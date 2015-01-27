# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    meta_skin.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/25 14:30:46 by clegrand          #+#    #+#              #
#    Updated: 2015/01/27 19:56:41 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Color
BLACK='\033[0;30m'
GRAY='\033[1;30m'
RED='\033[0;31m'
RED2='\033[1;31m'
GREEN='\033[0;32m'
GREEN2='\033[1;32m'
YELLOW='\033[0;33m'
YELLOW2='\033[1;33m'
BLUE3='\033[0;34m'
PURPLE='\033[1;34m'
BLUE='\033[0;36m'
BLUE2='\033[1;36m'
WHITE='\033[0;37m'
WHITE2='\033[1;37m'
NC='\033[0m' # Reset color

# Background color
BG_BLACK='\033[0;40m'
BG_GRAY='\033[1;40m'
BG_RED='\033[0;41m'
BG_RED2='\033[1;41m'
BG_GREEN='\033[1;42m'
BG_YELLOW='\033[1;43m'
BG_BLUE2='\033[0;44m'
BG_BLUE3='\033[1;44m'
BG_BLUE='\033[1;46m'
BG_WHITE='\033[1;47m'

# Variant of color
TAB_COLOR=(${BLUE} ${GREEN} ${YELLOW} ${RED} ${PURPLE})
TAB_COLOR2=(${BLUE} ${GREEN} ${YELLOW} ${RED} ${YELLOW} ${GREEN})
TAB_COLOR3=(${WHITE} ${WHITE2} ${BLUE2} ${BLUE} ${BLUE3} ${GREEN} ${GREEN2} ${YELLOW2} ${YELLOW} ${RED} ${RED2} ${PURPLE} ${GRAY})
TAB_COLOR4=(${BG_WHITE} ${BG_BLUE} ${BG_BLUE2} ${BG_BLUE3} ${BG_GREEN} ${BG_YELLOW} ${BG_RED} ${BG_RED2} ${BG_GRAY} ${BG_BLACK})
TAB_COLOR5=(${WHITE} ${BG_WHITE})

# OPTIONS
BORDER='on' #on: Active border line
LEF_BOR_DEF=5 #Default size for left border
ALE_DEF=15 #Default size for align
COLOR_MENU=(${TAB_COLOR[*]}) #Defaut variant of color

# . source_file.sh
source ../sourcesh/screen_func.sh
source ../sourcesh/lib_base.sh

# Create menu Meta version
function meta_menu
{
	local -a tab_arg
	local -i i max
	tab_arg=("$@")
	i=0
	max=0
	while [[ $i -lt ${#tab_arg[*]} ]]; do
		printf "${COLOR_MENU[$((($i%${#COLOR_MENU[*]})))]} ${tab_arg[$i]} ${NC}"
		max=$((${max}+${#tab_arg[$i]}+2))
		i=$((i+1))
	done
	if [[ $(($(screen_columns)-max)) -gt 0 ]] && [[ "${BORDER}" = "on" ]]; then
		printf "${GRAY}.$(lib_set '_' $(($(screen_columns)-max-1)))${NC}\n"
	else
		printf "\n"
	fi
	i=0
	while [[ $i -lt ${#tab_arg[*]} ]]; do
		printf "${COLOR_MENU[$((($i%${#COLOR_MENU[*]})))]}\\$(lib_set '_' ${#tab_arg[$i]})/${NC}"
		i=$((i+1))
	done
	printf "\n"
	return ${max}
}

# $1=message $2=left_border(optional)
function meta_message
{
	local -i left_border
	if [[ $2 -gt 0 ]]; then
		left_border=$2
	else
		left_border=${LEF_BOR_DEF}
	fi
	if [[ "${BORDER}" = "on" ]]; then
		printf "`lib_set '_' ${left_border}`/$1\\$(lib_set '_' $(($(screen_columns)-${#1}-2-${left_border})))"
	else
		printf "/$1\\\n"
	fi
	return 0
}

# $1=message $2=size_max(optional)
function meta_alert
{
	local -i max
	local arg
	if [[ $2 -gt 0 ]]; then
		max=$2
	else
		max=${#1}
	fi
	arg=$1
	printf "[${arg:0:${max}}$(lib_set ' ' $((${max}-${#arg})))]>\n"
	return 0
}

function meta_title
{
	printf "$(screen_center "/$1\\" '_')\n"
	printf "$(screen_center "\\$(lib_set '_' ${#1})/")\n"
	return 0
}

# Test

#printf "${WHITE2}Menu:${NC}\n"
#if [[ $# -gt 0 ]]; then
#	printf "$(meta_menu "$@")\n"
#else
#	printf "$(meta_menu 1-Hi 2-Hey 3-Install 4-Uninstall 5-Bye 6-Version "7-Other test")\n"
#fi
#printf "${WHITE2}$(meta_message "Fin d'affichage du menu" $#)${NC}\n"
#printf "${WHITE2}$(meta_message "Fin d'affichage du menu")${NC}\n"
#printf "${WHITE2}$(meta_title "Test d'un titre")${NC}"
#i=0
#arg=("$@")
#while [[ $i -lt $(($#-1)) ]]; do
#	color=${TAB_COLOR3[$(($i%${#TAB_COLOR3[*]}))]}
#	printf "${color}$(meta_alert "${arg[$i]}" $#)${NC} Super ${color}${arg[$i]}${NC} ever\n"
#	i=$((i+1))
#done
#echo "$(meta_alert ${arg[$i]}) Super commentary ever"

#exit 0
