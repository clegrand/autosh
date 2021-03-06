# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    meta_skin.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/25 14:30:46 by clegrand          #+#    #+#              #
#    Updated: 2016/09/19 17:03:54 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# . source_file.sh
if [[ -z $SOURCESH ]]; then
	SOURCESH=.
fi
source $SOURCESH/screen_func.sh
source $SOURCESH/lib_base.sh

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
RIG_BOR_DEF=5 #Default size for right border
ALE_DEF=15 #Default size for align
COLOR_MENU=(${TAB_COLOR[*]}) #Defaut variant of color
MENU_CHOICE='q'

# . source_file.sh
if [[ -z $SOURCESH ]]; then
	SOURCESH=.
fi

source ${SOURCESH}/screen_func.sh
source ${SOURCESH}/lib_base.sh

# 1: loop_selection [; 2: color_tab]
function meta_color
{
    local -a tab_color_select
    if [ $# -lt 1 ]; then
        return 1
    elif [ $# -gt 1 ]; then
        tab_color_select=("$@")
        tab_color_select=("${tab_color_select[@]:1}")
    else
        tab_color_select=(${COLOR_MENU[@]})
    fi
    echo ${tab_color_select[$(lib_limit $1 ${#tab_color_select[@]})]}
    return 0
}

# Create menu Meta version
function meta_menu
{
	local -a tab_arg
	local -i i max
	tab_arg=("$@")
	i=0
	max=0
	while [[ $i -lt ${#tab_arg[*]} ]]; do
		printf "$(meta_color $i) ${tab_arg[$i]} ${NC}"
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
		printf "$(meta_color $i)\\$(lib_set '_' ${#tab_arg[$i]})/${NC}"
		i=$((i+1))
	done
	printf "\n"
	return ${max}
}

function meta_menu_choice {
    local -a index_tab title_tab index_title_tab
    local choice ck i mes tmp_choice
    if [ $# -gt 0 ]; then
        mes=$1
        shift 1
    else
        return 1
    fi
    i=1
    index_tab=()
    title_tab=()
    index_title_tab=()
    while [ $# -gt 0 ]; do
        index_tab=(${index_tab[@]} $(echo ${1:0:1} | tr "[:upper:]" "[:lower:]"))
        index_title_tab=(${index_title_tab[@]} "$1")
        if [ $i -le 10 ]; then
            title_tab=(${title_tab[@]} "$(($i%10))-$1")
        else
            title_tab=(${title_tab[@]} "$1")
        fi
        i=$((i+1))
        shift 1
    done
    ck=0
    while [ $ck -ne 1 ]; do
        ck=1
        printf "$(meta_menu "${title_tab[@]}")\n"
        printf "$WHITE2$(meta_alert "$USER")$NC $mes\n"
        read -n 1 -s -- choice
        case $choice in
            [0-9])
                if [ "$choice" == '0' ]; then
                    choice=10
                fi
                if [ $choice -gt ${#title_tab[@]} ]; then
                    ck=0
                else
                    choice=$(($choice-1))
                fi
                ;;
            [a-z]|[A-Z])
                ck=0
                i=$((${#index_tab[@]}-1))
                tmp_choice=$(echo $choice | tr "[:upper:]" "[:lower:]")
                while [ $i -ge 0 ]; do
                    if [ "$tmp_choice" == "${index_tab[$i]}" ]; then
                        choice=$i
                        ck=1
                        break
                    fi
                    i=$(($i-1))
                done
                i=0
                while [ $i -lt ${#MENU_CHOICE} ]; do
                    if [ "$tmp_choice" == "${MENU_CHOICE:$i:1}" ]; then
                        MENU_CHOICE="$choice"
                        return 0
                    fi
                    i=$(($i+1))
                done
                ;;
            ?)
                ck=0
                ;;
        esac
        if [ $ck -ne 1 ]; then
            printf "\n$RED$(meta_alert "Bad choice")$NC $choice\n"
        fi
    done
    MENU_CHOICE="${index_title_tab[$choice]}"
    return 0
}

# [$1: message;] !*%2: title; *%2: exec
function meta_menus
{
    local -a index_tab title_tab exec_tab
    local choice ck i mes tmp_choice
    if [ $(($#%2)) -ne 0 ]; then
        mes=$1
        shift 1
    else
        mes=""
    fi
    i=1
    index_tab=()
    title_tab=()
    exec_tab=()
    while [ $# -gt 0 ]; do
        index_tab=(${index_tab[@]} $(echo ${1:0:1} | tr "[:upper:]" "[:lower:]"))
        if [ $i -le 10 ]; then
            title_tab=(${title_tab[@]} "$(($i%10))-$1")
        else
            title_tab=(${title_tab[@]} "$1")
        fi
        exec_tab=(${exec_tab[@]} "$2")
        i=$((i+1))
        shift 2
    done
    ck=0
    while [ $ck -ne 1 ]; do
        ck=1
        printf "$(meta_menu "${title_tab[@]}")\n"
        printf "$WHITE2$(meta_alert "$USER")$NC $mes\n"
        read -n 1 -s -- choice
        case $choice in
            [0-9])
                if [ "$choice" == '0' ]; then
                    choice=10
                fi
                if [ $choice -gt ${#title_tab[@]} ]; then
                    ck=0
                else
                    choice=$(($choice-1))
                fi
                ;;
            [a-z]|[A-Z])
                ck=0
                i=$((${#index_tab[@]}-1))
                tmp_choice=$(echo $choice | tr "[:upper:]" "[:lower:]")
                while [ $i -ge 0 ]; do
                    if [ "$tmp_choice" == "${index_tab[$i]}" ]; then
                        choice=$i
                        ck=1
                        break
                    fi
                    i=$(($i-1))
                done
                i=0
                while [ $i -lt ${#MENU_CHOICE} ]; do
                    if [ "$tmp_choice" == "${MENU_CHOICE:$i:1}" ]; then
                        MENU_CHOICE="$choice"
                        return 0
                    fi
                    i=$(($i+1))
                done
                ;;
            ?)
                ck=0
                ;;
        esac
        if [ $ck -ne 1 ]; then
            printf "\n$RED$(meta_alert "Bad choice")$NC $choice\n"
        fi
    done
    MENU_CHOICE="$choice"
    ${exec_tab[$choice]}
    return $?
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

# !*%2: title | *%2: description
function meta_alerts
{
    local -i i m
    local -a tab tmp
    i=0
    if [ $(($#%2)) -ne 0 ]; then
        return 1
    fi
    tmp=()
    tab=("$@")
    while [ $i -lt ${#tab[@]} ]; do
        tmp=(${tmp[@]} ${tab[$i]})
        i=$((i+2))
    done
    i=0
    m=$(lib_lenmax ${tmp[@]})
    while [ $i -lt ${#tmp[@]} ]; do
        printf "$(meta_color $i)$(meta_alert "$1" $m)$NC $2\n"
        shift 2
        i=$((i+1))
    done
    return 0
}

# 1: Title
function meta_title
{
	printf "$(screen_center "/$1\\" '_')\n"
	printf "$(screen_center "\\$(lib_set '_' ${#1})/")\n"
	return 0
}

# 1: End title | [2: Size of right border]
function meta_end
{
	local -i in_border columns
	local text
	text=" $1 "
	columns=$(screen_columns)
	if [[ $2 -gt 0 ]]; then
		in_border=$2
	else
		in_border=${RIG_BOR_DEF}
	fi
	if [[ ${BORDER} = 'on' ]] && [[ $(((${in_border}*2)+${#text})) -le ${columns} ]]; then
		columns=$((${columns}-(${in_border}*2)-${#text}))
	else
		columns=0
	fi
	printf "$(lib_set '_' $((${columns}+${in_border})))${text}$(lib_set '_' ${in_border})\n"
}

# 1: pid
function meta_wait {
    local -i ret
    if [ $# -lt 1 ]; then
        return 1
    fi
    time_defaultpid $1
    ret=$?
    if [ $ret -eq 0 ]; then
        printf "$GREEN(OK!)$NC\n"
    else
        printf "$RED(KO!)$NC\n"
    fi
    return $ret
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
