#! /bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoft.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/02/13 14:09:25 by clegrand          #+#    #+#              #
#    Updated: ----/--/-- --:--:-- by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

source ../sourcesh/screen_func.sh
source ../sourcesh/meta_skin.sh
source ../sourcesh/lib_base.sh
source ../sourcesh/timer.sh
source includesh/auto_all.sh
source includesh/auto_norme.sh
source includesh/auto_function.sh
source includesh/auto_option.sh

NAME='auto'
VER="(V3.1.${NAME})"
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
DTMP='auto_tmp'
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
printf "$(meta_menu "${MENU[@]}")\n"
printf "Choice test or 'Q' for quit ${NAME}\n"
read -s -n 1 choice
echo

while [[ "${choice}" != "q" ]]; do
	clear
	if [[ "${choice}" = "f" ]] || [[ "${choice}" = "F" ]]; then
		printf "${TAB_COLOR[0]}$(meta_title ${MENU[0]})${NC}\n"
		ls -R ${PROJ}/*
	elif [[ "${choice}" = "n" ]] || [[ "${choice}" = "N" ]]; then
		printf "${TAB_COLOR[1]}$(meta_title ${MENU[1]})${NC}\n"
		mkdir -p ${DTMP}
		n_author ${N_SIZE}
		n_norminette ${N_SIZE}
		if [[ -e ${PROJ}/${NAME} ]]; then
			n_nm ${N_SIZE}
		fi
	elif [[ "${choice}" = "m" ]] || [[ "${choice}" = "M" ]]; then
		printf "${TAB_COLOR[2]}$(meta_title ${MENU[2]})${NC}\n"
		auto_make re ${M_SIZE}
	elif [[ "${choice}" = "u" ]] || [[ "${choice}" = "U" ]]; then
		printf "${TAB_COLOR[3]}$(meta_title ${MENU[3]})${NC}\n"
		auto_make "" ${U_SIZE}
		if [[ $? -eq 0 ]]; then
			echo
			u_launch ${U_SIZE}
		fi
	elif [[ "${choice}" = "d" ]] || [[ "${choice}" = "D" ]]; then
		printf "${TAB_COLOR[4]}$(meta_title ${MENU[4]})${NC}\n"
		auto_make fclean ${D_SIZE}
		rm -rf ${TAB_DELET[@]}
		printf "${GREEN}$(meta_alert "Delete tmp dir" ${D_SIZE})${NC} File: ${GREEN}${TAB_DELET[@]}${NC} deleted\n"
	elif [[ "${choice}" = "p" ]] || [[ "${choice}" = "P" ]]; then
		printf "${WHITE2}$(meta_title "OPTION ${VER}")${NC}\n"
		p_init
		p_menu ${P_SIZE}
	else
		printf "${GRAY}$(lib_set '_' $(screen_columns))${NC}"
		printf "${RED}Command not found [${choice}]${NC}\n"
	fi
	printf "\n$(meta_menu "${MENU[@]}")\n"
	printf "${WHITE2}$(meta_alert "`cat -e ${PROJ}/${AUT}`" ${LOG_SIZE})${NC} Choice test or 'Q' for quit ${NAME}\n"
	read -s -n 1 choice
done

printf "\n${BLUE2}$(screen_center " GOOD BYE :) And see you soon ! ||||| ${VER} " "|")${NC}\n"
printf "${BLUE}$(lib_set '|' $(($(screen_columns)-${#BY}-3))) ${GRAY}${BY}${BLUE} |${NC}\n"
tput cnorm

exit 0
