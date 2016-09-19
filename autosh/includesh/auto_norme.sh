#! /bin/bash

# source meta_skin.sh
# source lib_base.sh
# source timer.sh

# [1: Size for function meta_alert]
function n_author
{
	local -i ret
	local author
	printf "${YELLOW}$(meta_alert "Auteur" $1) "
	cat -e ${PROJ}/${AUT} > ${FILEAUTHOR}
	#time_wait $! 'time_wait'
	#printf "$(screen_delturn 5)"
	#cat ${FILEAUTHOR} | grep "\$$" > /dev/null
	#ret=$?
	#printf "${ret}\n"
	#if [[ ${ret} -eq 0 ]]; then
		author=$(cat ${FILEAUTHOR})
		author=${author/\$}
		[[ "${author}" = "${ORIGIN_AUTHOR}" ]]
		ret=$?
	#fi
	if [[ ${ret} -ne 0 ]]; then
		printf "${RED}(Ko!)${NC}\n"
		printf "${RED2}$(meta_message "Error author")${RED}\n"
		cat -e ${PROJ}/${AUT}
		printf "${RED2}$(meta_end "End ${FILEAUTHOR##*/}")${NC}\n"
		printf "${RED}$(meta_alert "Error author" $1)${NC} Error format or ${RED}${AUT}${NC} file does not exist\n"
		return 1
	else
		printf "${GREEN}(Ok!)${NC}\n"
		printf "${GREEN}$(meta_alert "Author ok" $1)${NC} File ${GREEN}${AUT}${NC} exist and content ${GREEN}$(cat ${PROJ}/${AUT})${NC}\n"
	fi
	return 0
}

# [1: Size for function meta_alert]
function n_norminette
{
	norminette ${PROJ}/* | grep -v "^Warning: Not a valid file$" | grep -B 1 -v "^Norme: " > ${FILENORME} &
	printf "${YELLOW}$(meta_alert "Norminette" $1) "
	time_waitpid $! 'time_wait'
	printf "$(screen_delturn 5)"
	cat ${FILENORME} | grep -v "^Norme: " > /dev/null
	if [[ $? -eq 0 ]]; then
		printf "${RED}(Ko!)${NC}\n"
		printf "${RED2}$(meta_message "Error norme")${RED}\n"
		cat ${FILENORME}
		printf "${RED2}$(meta_end "End ${FILENORME##*/}")${NC}\n"
		printf "${RED}$(meta_alert "Error norme" $1)${NC} You have ${RED}$(grep -v "Norme: " ${FILENORME} | grep -v "^--$" | wc -l | tr -d ' ')${NC} error\n"
		return 1
	else
		printf "${GREEN}(Ok!)${NC}\n"
		printf "${GREEN}$(meta_alert "Norme ok" $1)${NC} Your norme of ${GREEN}${NAME}${NC} is good\n"
	fi
	return 0
}

# [1: Size for function meta_alert]
function n_nm
{
	local -i i line ret
	nm ${PROJ}/${NAME} > ${FILENM} &
	printf "${YELLOW}$(meta_alert "Nm" $1) "
	time_waitpid $! 'time_wait'
	printf "$(screen_delturn 5)"
	# Reference of this line (down): detect2.sh
	cat ${FILENM} | grep U | grep -v ft_ | cut -d _ -f2- | sort -u > ${FILENM}
	cat ${FILENM} > ${FILENM}-tmp
	i=0
	while [[ $i -lt ${#TAB_NM[@]} ]]; do
		cat ${FILENM}-tmp | grep -v "${TAB_NM[$i]}" > ${FILENM}-speed
		cat ${FILENM}-speed > ${FILENM}-tmp
		i=$(($i+1))
	done
	rm -f ${FILENM}-speed
	line=$(cat ${FILENM}-tmp | wc -l | tr -d ' ')
	if [[ ${line} -gt 0 ]]; then
		i=0
		ret=0
		while [[ $i -lt ${#WAR_NM[@]} ]]; do
			cat ${FILENM}-tmp | grep "${WAR_NM[$i]}" > /dev/null
			if [[ $? -eq 0 ]]; then
				ret=$((ret+1))
			fi
			i=$(($i+1))
		done
		if [[ ${ret} -gt 0 ]]; then
			printf "${RED}(Ko!)${NC}\n"
			printf "${RED2}$(meta_message "Wanted function")${RED}\n"
			cat ${FILENM}-tmp
			printf "${RED2}$(meta_end "End ${FILENM##*/}")${NC}\n"
			printf "${RED}$(meta_alert "Nm result" $1)${NC} You have use ${RED}$((${line}-${ret}))${NC} unknow function and ${RED}${ret}${NC} wanted function\n"
			rm -f ${FILENM}-tmp
			return 1
		fi
		printf "${YELLOW}(End)${NC}\n"
		printf "${YELLOW}$(meta_message "NM file")${NC}\n"
		cat ${FILENM}-tmp
		printf "${YELLOW}$(meta_end "End ${FILENM##*/}")${NC}\n"
		printf "${YELLOW}$(meta_alert "Nm result" $1)${NC} You have ${YELLOW}$(cat ${FILENM}-tmp | wc -l | tr -d ' ')${NC} unknow function\n"
		rm -f ${FILENM}-tmp
		return 1
	else
		printf "${GREEN}(Ok!)${NC}\n"
		printf "${GREEN}$(meta_alert "Function ok" $1)${NC} You use in ${GREEN}${NAME}${NC} correct function\n"
	fi
	rm -f ${FILENM}-tmp
	return 0
}
