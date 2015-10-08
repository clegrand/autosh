#! /bin/bash

# source meta_skin.sh
# source lib_base.sh

# [1: Size for function meta_alert]
function u_launch
{
	printf "${PURPLE}$(meta_alert "Launcher" $1)${NC} Exec: ${PURPLE}${BEFORE[@]}${NC} ./${NAME} ${PURPLE}${AFTER[@]}${NC}:\n"
	printf "${BLUE}$(meta_message "Launch ${NAME}")${NC}\n"
	tput cnorm
	${BEFORE[@]} ${PROJ}/${NAME} ${AFTER[@]}
	ret=$?
	tput civis
	printf "${BLUE}$(meta_end "End ${NAME}")${NC}\n"
	if [[ ${ret} -ne 0 ]]; then
		printf "${YELLOW}$(meta_alert "Exec error" $1)${NC} Execute of ${YELLOW}${NAME}${NC} return [${YELLOW}${ret}${NC}]\n"
		return 1
	else
		printf "${GREEN}$(meta_alert "Exec ok" $1)${NC} Execute of ${GREEN}${NAME}${NC} success [${GREEN}0${NC}]\n"
	fi
	return 0
}

