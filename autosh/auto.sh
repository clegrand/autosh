#! /bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    auto.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/02/13 14:09:25 by clegrand          #+#    #+#              #
#    Updated: ----/--/-- --:--:-- by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [[ -z $SOURCESH ]]; then
	SOURCESH="sourcesh"
fi
if [[ -z $INCLUDESH ]]; then
	INCLUDESH="includesh"
fi

source $SOURCESH/screen_func.sh
source $SOURCESH/meta_skin.sh
source $SOURCESH/lib_base.sh
source $SOURCESH/timer.sh
source $INCLUDESH/auto_all.sh
source $INCLUDESH/auto_norme.sh
source $INCLUDESH/auto_function.sh
source $INCLUDESH/auto_option.sh

NAME="$(basename "${0%.*}")"
NAME="${NAME#auto}"
VER="(V3.2.${NAME})"
BY='By clegrand'

# option default
O_MENU=(1-Path 2-Before 3-After 4-Author)
O_MESSAGE=("Change relative or absolute path for project" "Change before option for execute" "Change after option for execute" "Original author for check auteur file")
MENU=(F-Files N-Norme M-Make U-Function D-Delete)
AUT='auteur'
if [[ $# -ne 0 ]]; then
	PROJ=$1
else
	PROJ=.
fi

# size default
N_SIZE=11
M_SIZE=13
U_SIZE=11
D_SIZE=17
P_SIZE=10
LOG_SIZE=8

# File default
DTMP='.auto_tmp'
FILEAUTHOR="${DTMP}/author.txt"
FILENORME="${DTMP}/norme.txt"
FILENM="${DTMP}/nm.txt"
TAB_DELET=(${DTMP})

# Other option
BEFORE=('')
AFTER=('')
ORIGIN_AUTHOR="${USER}"
TAB_NM=('^$') # Allowed functions
WAR_NM=('^printf$' '^dprintf$' '^puts$') # Non autorized functions

tput civis

printf "${BLUE}$(meta_title "SH OF TEST FOR $(echo "${NAME}" | tr "a-z" "A-Z")")${NC}\n"

while true; do
	MENU_CHOICE='qp'
	meta_menu_choice "Choice test or 'Q' for quit ${NAME}" "${MENU[@]}"
	clear
	case $MENU_CHOICE in
		"${MENU[0]}")
			printf "$(meta_color 0)$(meta_title ${MENU[0]})${NC}\n"
			ls -R ${PROJ}/*
			;;
		"${MENU[1]}")
			printf "$(meta_color 1)$(meta_title ${MENU[1]})${NC}\n"
			mkdir -p ${DTMP}
			n_author ${N_SIZE}
			n_norminette ${N_SIZE}
			if [[ -e ${PROJ}/${NAME} ]]; then
				n_nm ${N_SIZE}
			fi
			;;
		"${MENU[2]}")
			printf "$(meta_color 2)$(meta_title ${MENU[2]})${NC}\n"
			auto_make re ${M_SIZE}
			;;
		"${MENU[3]}")
			printf "$(meta_color 3)$(meta_title ${MENU[3]})${NC}\n"
			auto_make "" ${U_SIZE}
			if [[ $? -eq 0 ]]; then
				echo
				u_launch ${U_SIZE}
			fi
			;;
		"${MENU[4]}")
			printf "$(meta_color 4)$(meta_title ${MENU[4]})${NC}\n"
			auto_make fclean ${D_SIZE}
			rm -rf ${TAB_DELET[@]}
			printf "${GREEN}$(meta_alert "Delete tmp dir" ${D_SIZE})${NC} File: ${GREEN}${TAB_DELET[@]}${NC} deleted\n"
			;;
		'p')
			printf "${WHITE2}$(meta_title "OPTION ${VER}")${NC}\n"
			p_init
			p_menu ${P_SIZE}
			;;
		?)
			break
			;;
	esac
done

printf "\n${BLUE2}$(screen_center " GOOD BYE :) And see you soon ! ||||| ${VER} " "|")${NC}\n"
printf "${BLUE}$(lib_set '|' $(($(screen_columns)-${#BY}-3))) ${GRAY}${BY}${BLUE} |${NC}\n"
tput cnorm

exit 0
