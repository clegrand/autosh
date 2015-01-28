# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoft_printf.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/12/16 13:57:59 by clegrand          #+#    #+#              #
#    Updated: 2015/01/28 15:52:32 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

source ../sourcesh/screen_func.sh
source ../sourcesh/meta_skin.sh
source ../sourcesh/lib_base.sh
source ../sourcesh/timer.sh

ERED='echo \033[0;91m'
BROWN='\033[0;33m'
EBROWN='echo \033[0;33m'
ENC='echo \033[0;37m'

NAME='ft_printf'
VER='(V3.68.M2)'
BY='By clegrand'
PATHO="c_${NAME}_"
GIT="vogsphere@vogsphere.42.fr:intra/2014/activities/${NAME}/"

tput civis
if [ -e ../${PATHO}$1 ]; then
	clear
	printf "${GREEN}$1 exist ! ${NC}\n"
else
	printf "${BROWN}Directory ${PURPLE}${PATHO}$1 ${BROWN}does not exist, you want to create git file ? y: for yes${NC}\n"
	read -s -n 1 git
	if [ ${git} = y ]; then
		git clone ${GIT}$1 ../${PATHO}$1
		if [ $? = 0 ]; then
			clear
			printf "${GREEN}Great: git succes ! ${PURPLE}${PATHO}$1 ${GREEN}created ${NC}\n"
			PROJ=../${PATHO}$1
			grep $1 -v $(cat ${PATHO}/auteur)
			if [ $? = 0 ]; then
				printf "${RED}[Error author]> ${NC}File author incorect: ${RED}$1 ${NC}and ${RED}$(cat ${PROJ}/auteur) ${NC}!\n"
			fi
		else
			printf "${RED}[Error git]> ${NC}Fail git, check good arg: ${RED}$1 ${NC}:|\n"
			PROJ=$1
		fi
	else
		clear
		PROJ=$1
	fi
fi

# option default
MENU=(F-Files N-Norme M-Make U-Function D-Delete)
NORME_SIZE=11
MAKE_SIZE=10
FUNCT_SIZE=12
DELET_SIZE=11
DSRC='*'
DINC='inc'
DLIB='libft'
DLINC='includes'
LIBH='libft.h'

#other option
VEREF=''
AREA='2'
LPRINTF='libftprintf.a'
REFFILE="ref_base_${NAME}.c"
TESTFILE="test_${NAME}${AREA}.c"
EXEFILE="exe_${NAME}"
EXESAVE="save_${NAME}.txt"
AEXESAVE="all_${EXESAVE}"
FILE_NORME="norme_${NAME}.txt"
REF="\"error\""
PRINTFH='ft_printf.h'

if [ -e .t_auto${NAME}.sh ]; then
	printf "${RED}You are crash auto${NAME}.sh in the last exe ${NC}\n"
fi

printf "/Hi ! I help auto${NAME}.sh for check last version
\\Please d'ont tuch me, thanks :)_____.
Actual version ${VER}" > .t_auto${NAME}.sh
chmod 644 .t_auto${NAME}.sh

printf "${BLUE}$(meta_title "SH OF TEST FOR $(printf "${NAME}" | tr "a-z" "A-Z")")${NC}\n"
printf "$(screen_center "! HELLO :) ! ${BROWN}> $(cat -e ${PROJ}/auteur) < ${NC}${VER}")\n"
printf "$(meta_menu "${MENU[@]}")\n"
printf "Choice test or 'q' for quit auto ${NAME}\n"
read -s -n 1 choice
echo

while [ ${choice} != q ]; do
	if [ ${choice} = f ]; then # IF FILES
		clear
		printf "${TAB_COLOR[0]}$(meta_title ${MENU[0]})${NC}"
		# THEN FILES
		ls -R ${PROJ}/*
	elif [ ${choice} = n ]; then # IF NORME
		clear
		echo "${TAB_COLOR[1]}$(meta_title ${MENU[1]})${RED}"
		# THEN NORME
		norminette ${PROJ}/. | grep -v "^Norme: " | grep -v ": Norminette can't check this file.$" > FileTestNorme &
		pid_norme=$!
		i=0
		kill -0 ${pid_norme}
		printf "${BROWN}Wait please, I check norme for your ${PURPLE}${PROJ}${BROWN} ${NC}"
		while [[ $? = 0 ]]; do
			printf "${TAB_COLOR2[$(($i%${#TAB_COLOR2[*]}))]}$(time_wait $i)${NC}"
			sleep 0.2
			i=$((i+1))
			kill -0 ${pid_norme} 2> /dev/null
		done
		echo
		printf "${RED}$(cat FileTestNorme)${NC}\n"
		if [ -s FileTestNorme ]; then
			printf "${RED}$(meta_alert "Error norme" ${NORME_SIZE})${NC} In project ${RED}${NAME} ${NC}! X(\n"
		else
			printf "${GREEN}$(meta_alert "Norme ok !" ${NORME_SIZE})${NC} Norme of ${GREEN}${NAME} ${NC}OK ! :)\n"
		fi
		printf "${BROWN}$(meta_alert "File number" ${NORME_SIZE})${NC} I find ${BROWN}$(find ${PROJ}/. -name "*.c" | wc -l | tr -d ' ') ${NC}.c and ${BROWN}$(find ${PROJ}/. -name "*.h" | wc -l | tr -d ' ' ) ${NC}.h\n"
	elif [ ${choice} = m ]; then # IF MAKE"
		clear
		printf "${TAB_COLOR[2]}$(meta_title ${MENU[2]})${NC}\n"
		# THEN MAKE
		check=0
		grep -- '-Wall' ${PROJ}/Makefile > line.txt
		if [ $? = 0 ]; then
			check=$(($check+1))
		fi
		grep -- '-Wextra' ${PROJ}/Makefile >> line.txt
		if [ $? = 0 ]; then
			check=$(($check+1))
		fi
		grep -- '-Werror' ${PROJ}/Makefile >> line.txt
		if [ $? = 1 ] || [ $check -le 1 ]; then
			printf "${RED}$(meta_alert "Error flag" ${MAKE_SIZE})${NC} Flag ${RED}-Wall ${NC}or ${RED}-Wextra ${NC}or ${RED}-Werror ${NC}not exist, check this:\n${RED}$(cat line.txt) ${NC}\nIn Makefile\n"
		fi
		Make -C ${PROJ} re
		if [ $? = 0 ]; then
			printf "${GREEN}$(meta_alert "Make ok !" ${MAKE_SIZE})${NC} Make re of ${GREEN}${NAME}${NC} OK :)\n"
		else
			printf "${RED}$(meta_alert "Error make" ${MAKE_SIZE})${NC}make re of ${RED}${NAME} ${NC} not compil :(\n"
		fi
	elif [ ${choice} = u ]; then # IF FUNCT
		clear
		printf "${TAB_COLOR[3]}$(meta_title ${MENU[3]})${NC}\n"
		# THEN FUNCT
		printf "${BLUE}Do you want to create a test ? ${PURPLE}$(ls -1 | grep ${TESTFILE} | wc -l | tr -d ' ') ${BLUE}actual ${NC}y: for yes\n"
		read -s -n 1 choice
		inclibh=$(find ${PROJ} -name ${LIBH})
		incprintfh=$(find ${PROJ} -name ${PRINTFH})
		libprintfa=$(find ${PROJ} -name libftprintf.a)
		if [ ${choice} = y ]; then
			printf "${BLUE}Enter argument for ${NAME} or 'q' for quit and 'return' for execute: ${PURPLE}\n"
			tput cnorm
			read -a tabarg
			i=0
			while [ "${tabarg[0]}" != 'q' ]; do
				${ENC}
				while [ -e $i${TESTFILE} ]; do
					i=$(($i+1))
				done
				cp ${VEREF}${REFFILE} $i${TESTFILE}
				sed -i -e "s/${REF}/${tabarg[*]}/g" $i${TESTFILE}
				rm -f $i${TESTFILE}-e
			gcc $j${TESTFILE} -L${libprintfa%libftprintf.a} -lftprintf -I ${inclibh%${LIBH}} -I ${incprintfh%${PRINTFH}} -o $j${EXEFILE}
				if [ $? = 1 ]; then
					printf "${RED}$(meta_alert "Error compil" ${FUNCT_SIZE})${NC} Your compil of ${RED}${tabarg[*]} ${NC}failed :(\n"
					rm -f $i${TESTFILE}
				else
					./${EXEFILE}
					printf "${GREEN}$(meta_alert "File created" ${FUNCT_SIZE})${NC} Compil succes, ${GREEN}$i${TESTFILE} ${NC}created :)\n"
				fi
				printf "${BLUE}\nOk, now enter other argument for ${NAME} or 'q' for quit: ${PURPLE}\n"
				read -a tabarg
			done
			tput civis
			${ENC}
		fi
		make -C ${PROJ}
		j=0
		BEGTIME=`date +%s`
		rm -f ${AEXESAVE}
		touch ${AEXESAVE}
		while [ -e $j${TESTFILE} ]; do
			printf "${BLUE}$(meta_message "$j${EXEFILE}")${NC}\n"
			gcc $j${TESTFILE} -L${libprintfa%libftprintf.a} -lftprintf -I ${inclibh%${LIBH}} -I ${incprintfh%${PRINTFH}} -o $j${EXEFILE}
			if [ $? = 1 ]; then
				printf "${RED}$(meta_alert "Error compil" ${FUNCT_SIZE})${NC} Your compil of ${RED}$j${TESTFILE} ${NC}failed :(\n"
			else
				printf "${PURPLE}%s${NC}\n" "$(grep "#define FT_ARG" $j${TESTFILE} | cut -c15-100)"
				./$j${EXEFILE}
				#./$j${EXEFILE} > ${EXESAVE}
				#cat ${EXESAVE}
				#cat ${EXESAVE} >> ${AEXESAVE}
				if [ $? != 0 ]; then
					printf "${RED}$(meta_alert "Funct abort" ${FUNCT_SIZE})${NC} Programme ${RED}$j${TESTFILE} ${NC}abort\n"
				fi
			fi
			printf "${BLUE}\\$(lib_set '_' $((${#j}+${#EXEFILE})))${NC}\n"
			j=$(($j+1))
		done
		ENDTIME=`date +%s`
		sh detect2.sh ${PROJ}/${LPRINTF} > funcuse.txt
		if [ $(cat funcuse.txt | wc -l) != 0 ]; then
			printf "${BROWN}$(cat funcuse.txt)\n$(meta_alert "Use function" ${FUNCT_SIZE})${NC} The ${BROWN}${LPRINTF} ${NC}use ${BROWN}$(cat funcuse.txt | wc -l | tr -d ' ') ${NC}unknow function\n"
		fi
		printf "${BROWN}$(meta_alert "Time execute" ${FUNCT_SIZE})${NC} Time: ${BROWN}$(((ENDTIME-BEGTIME)/60)):$(((ENDTIME-BEGTIME)%60)) ${NC}for this test\n"
		#MAX=$(ls -1 ?*${TESTFILE} | wc -l | tr -d ' ')
		#TEST=$(cat -e ${AEXESAVE} | grep "return of ft_printf and printf are identic" | wc -l | tr -d ' ')
		#if [ ${TEST} -gt $((${MAX}*(2/3))) ]; then
		#	echo "${GREEN}[Test return ]> ${NC}You are validate ${GREEN}${TEST}/${MAX} ${NC}return test"
		#else
		#	echo "${RED}[Test return ]> ${NC}You are validate ${RED}${TEST}/${MAX} ${NC}return test"
		#fi
	elif [ ${choice} = d ]; then # IF DELET
		clear
		printf "${TAB_COLOR[4]}$(meta_title ${MENU[4]})${NC}\n"
		# THEN DELET
		Make -C ${PROJ} fclean
		if [ $? = 0 ]; then
			printf "${GREEN}$(meta_alert "Make fclean" ${DELET_SIZE})${NC} Make fclean of ${GREEN}${NAME}${NC} OK :)\n"
		else
			printf "${RED}$(meta_alert "Error make" ${DELET_SIZE})${NC} Error: make fclean of ${RED}${NAME}${NC} :(\n"
		fi
		rm -f *${EXEFILE}
	elif [ ${choice} = p ]; then # OPTION
		clear
		printf "$(meta_message "OPTION ${VER}")\n"
		printf "\nChange name of header for ${NAME} ? Actual ${PURPLE}${PRINTFH}${NC} y: for yes\n"
		read -s -n 1 path
		if [ ${path} = y ]; then
			printf "Select new name of header file of ${NAME}:\n"
			tput cnorm
			read PRINTFH
			tput civis
		fi
		printf "\nChange name of header for your lib ? Actual ${PURPLE}${LIBH}${NC} y: for yes\n"
		read -s -n 1 path
		if [ ${path} = y ]; then
			printf "Select new name of header file of your lib:\n"
			tput cnorm
			read LIBH
			tput civis
		fi
		printf "\nChange path of project ? Actual ${PURPLE}${PROJ}${NC} y: for yes\n"
		read -s -n 1 path
		if [ ${path} = y ]; then
			printf "Select path of project:\n"
			tput cnorm
			read PROJ
			tput civis
		fi
		clear
	else
		clear
		printf "${GRAY}$(lib_set '_' $(screen_columns))${NC}"
		printf "${RED}Command not found ${NC}\n"
	fi
	if [ .t_auto${NAME}.sh -ot auto${NAME}.sh ] || [ -f ${PROJ}/${LPRINTF} ] || [ -f ${PROJ}/libft/libft.a ]; then
		printf "\n$(meta_message "MESSAGE")\n"
		if [ .t_auto${NAME}.sh -ot auto${NAME}.sh ]; then
			printf "${BROWN}$(meta_alert "MAJ Available !")${NC} Choice 'q' and relanch auto${NAME} for quit version ${BROWN}$(grep "V" .t_auto${NAME}.sh | cut -d"(" -f2 | cut -d")" -f1) ${NC}and use version ${BROWN}$(grep "VER='" auto${NAME}.sh | sed -n 1p | cut -d"(" -f2 | cut -d")" -f1) ${NC}\n"
		fi
		if [ -f ${PROJ}/${LPRINTF} ]; then
			printf "${GREEN}$(meta_alert "OPEN lib")${NC} The lib ${GREEN}${LPRINTF} ${NC}exist in ${GREEN}${PROJ} ${NC}\n"
		fi
		if [ -f ${PROJ}/libft/libft.a ]; then
			printf "${GREEN}$(meta_alert "OPEN libft.a")${NC} The lib ${GREEN}libft.a ${NC}is available\n"
		fi
	fi
	printf "$(meta_menu "${MENU[@]}")\n"
	printf "${WHITE2}$(meta_alert "$(cat ${PROJ}/auteur)" 8)${NC} New choice or 'q' for quit\n"
	read -s -n 1 choice
	echo
done
rm -f .t_auto${NAME}.sh
printf "\n${BLUE2}$(screen_center " GOOD BYE :) And see you soon ! ||||| ${VER} " "|")${NC}\n"
printf "${BLUE}$(lib_set '|' $(($(screen_columns)-${#BY}-3))) ${GRAY}${BY}${BLUE} |${NC}\n"

tput cnorm
exit 0
