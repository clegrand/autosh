# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoft_printf.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/12/16 13:57:59 by clegrand          #+#    #+#              #
#    Updated: 2015/01/22 16:47:38 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NC='\033[0;37m'
GREEN='\033[0;32m'
RED='\033[0;31m'
ERED='echo \033[0;91m'
BLUE='\033[0;36m'
BROWN='\033[0;33m'
EBROWN='echo \033[0;33m'
PURPLE='\033[1;34m'
ENC='echo \033[0;37m'

NAME='ft_printf'
VER='(V3.65.M2)'
PATHO="c_${NAME}_"
GIT="vogsphere@vogsphere.42.fr:intra/2014/activities/${NAME}/"

if [ -e ../${PATHO}$1 ]; then
	echo "${GREEN}$1 exist ! ${NC}"
else
	echo "${BROWN}Directory ${PURPLE}${PATHO}$1 ${BROWN}does not exist, you want to create git file ? y: for yes${NC}"
	read -s -n 1 git
	if [ ${git} = y ]; then
		git clone ${GIT}$1 ../${PATHO}$1
		if [ $? = 0 ]; then
			echo "${GREEN}Great: git succes ! ${PURPLE}${PATHO}$1 ${GREEN}created ${NC}"
			PROJ=../${PATHO}$1
			grep $1 -v $(cat ${PATHO}/auteur)
			if [ $? = 0 ]; then
				echo "${RED}[Error author]> ${NC}File author incorect: ${RED}$1 ${NC}and ${RED}$(cat ${PROJ}/auteur) ${NC}!"
			fi
		else
			echo "${RED}[Error git]> ${NC}Fail git, check good arg: ${RED}$1 ${NC}:|"
			PROJ=$1
		fi
	else
		PROJ=$1
	fi
fi

# option default
DSRC='*'
DINC='inc'
DLIB='libft'
DLINC='includes'

#other option
VEREF=''
AREA='2'
LPRINTF='libftprintf.a'
REFFILE="ref_base_${NAME}.c"
TESTFILE="test_${NAME}${AREA}.c"
EXEFILE="exe_${NAME}"
EXESAVE="save_${NAME}.txt"
AEXESAVE="all_${EXESAVE}"
REF="\"error\""

if [ -e .t_auto${NAME}.sh ]; then
	echo "${RED}You are crash auto${NAME}.sh in the last exe ${NC}"
fi

echo "/Hi ! I help auto${NAME}.sh for check last version
\\Please d'ont tuch me, thanks :)_____.
Actual version ${VER}" > .t_auto${NAME}.sh
chmod 644 .t_auto${NAME}.sh

echo "${BLUE}//SH OF TEST\\ for ${NAME} ${NC}${VER}"
echo "${BLUE}\\__________// ${NC}"
echo "HELLO :) ! ${BROWN}> $(cat -e ${PROJ}/auteur) <${NC}"
echo "${BLUE}\n f-Files ${GREEN} n-Norme ${BROWN} m-Make ${RED} o-Fonct ${PURPLE} d-Delet ${BLUE}"
echo "\\_______/${GREEN}\\_______/${BROWN}\\______/${RED}\\_______/${PURPLE}\\_______/ ${NC}"
echo "Choice test or 'q' for quit auto ${NAME}"
read -s -n 1 choice
echo

while [ ${choice} != q ]; do
	if [ ${choice} = f ]; then # IF FILES
		clear
		echo "${BLUE} f-Files ._________________________________."
		echo "\\_______/ ${NC}"
		# THEN FILES
		ls -R ${PROJ}/*
	elif [ ${choice} = n ]; then # IF NORME
		clear
		echo "${GREEN}._______. n-Norme .________________________."
		echo "         \\_______/ ${RED}"
		# THEN NORME
		norminette ${PROJ}/. | grep -v "^Norme: " | grep -v ": Norminette can't check this file.$"
		if [ $? = 0 ]; then
			echo "[Error norme]> ${NC}In project ${RED}${NAME} ${NC}! X("
		else
			echo "${GREEN}[Norme ok ! ]> ${NC}Norme of ${GREEN}${NAME} ${NC}OK ! :)"
		fi
		echo "${BROWN}[File number]> ${NC}I find ${BROWN}$(find ${PROJ}/. -name "*.c" | wc -l | tr -d ' ') ${NC}.c and ${BROWN}$(find ${PROJ}/. -name "*.h" | wc -l | tr -d ' ' ) ${NC}.h"
	elif [ ${choice} = m ]; then # IF MAKE"
		clear
		echo "${BROWN}.________________. m-Make .________________."
		echo "                  \\______/ ${NC}"
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
			echo "${RED}[Error flag]> ${NC}Flag ${RED}-Wall ${NC}or ${RED}-Wextra ${NC}or ${RED}-Werror ${NC}not exist, check this:\n${RED}$(cat line.txt) ${NC}\nIn Makefile"
		fi
		Make -C ${PROJ} re
		if [ $? = 0 ]; then
			echo "${GREEN}Make re of ${NAME} OK :) ${NC}"
		else
			echo "${RED}[Error make]> ${NC}make re of ${RED}${NAME} ${NC} not compil :("
		fi
	elif [ ${choice} = o ]; then # IF FUNCT
		clear
		echo "${RED}.________________________. o-Fonct ._______."
		echo "                          \\_______/ ${NC}"
		# THEN FUNCT
		echo "${BLUE}Do you want to create a test ? ${PURPLE}$(ls -1 | grep ${TESTFILE} | wc -l | tr -d ' ') ${BLUE}actual ${NC}y: for yes"
		read -s -n 1 choice
		if [ ${choice} = y ]; then
			echo "${BLUE}Enter argument for ${NAME} or 'q' for quit and 'return' for execute: ${PURPLE}"
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
				gcc $i${TESTFILE} -L${PROJ} -lftprintf -I ${PROJ}/${DINC} -I ${PROJ}/${DLIB}/${DLINC} -o ${EXEFILE}
				if [ $? = 1 ]; then
					echo "${RED}[Error compil]> ${NC}Your compil of ${RED}${tabarg[*]} ${NC}failed :("
					rm -f $i${TESTFILE}
				else
					./${EXEFILE}
					echo "${GREEN}[File created]> ${NC}Compil succes, ${GREEN}$i${TESTFILE} ${NC}created :)"
				fi
				echo "${BLUE}\nOk, now enter other argument for ${NAME} or 'q' for quit: ${PURPLE}"
				read -a tabarg
			done
			${ENC}
		fi
		make -C ${PROJ}
		j=0
		BEGTIME=`date +%s`
		rm -f ${AEXESAVE}
		touch ${AEXESAVE}
		while [ -e $j${TESTFILE} ]; do
			echo "${BLUE}/$j${EXEFILE}\\_____ ${NC}"
			gcc $j${TESTFILE} -L${PROJ} -lftprintf -I ${PROJ}/${DINC} -I ${PROJ}/${DLIB}/${DLINC} -o $j${EXEFILE}
			if [ $? = 1 ]; then
				echo "${RED}[Error compil]> ${NC}Your compil of ${RED}$j${TESTFILE} ${NC}failed :("
			else
				echo "${PURPLE}$(grep "#define FT_ARG" $j${TESTFILE} | cut -c15-100) ${NC}"
				./$j${EXEFILE}
				#./$j${EXEFILE} > ${EXESAVE}
				#cat ${EXESAVE}
				#cat ${EXESAVE} >> ${AEXESAVE}
				if [ $? != 0 ]; then
					echo "${RED}[Funct abort ]> ${NC}Programme ${RED}$j${TESTFILE} ${NC}abort"
				fi
			fi
			echo "${BLUE}\\__________ ${NC}"
			j=$(($j+1))
		done
		ENDTIME=`date +%s`
		sh detect2.sh ${PROJ}/${LPRINTF} > funcuse.txt
		if [ $(cat funcuse.txt | wc -l) != 0 ]; then
			echo "${BROWN}$(cat funcuse.txt)\n[Use function]> ${NC}The ${BROWN}${LPRINTF} ${NC}use ${BROWN}$(cat funcuse.txt | wc -l | tr -d ' ') ${NC}unknow function"
		fi
		echo "${BROWN}[Time execute]> ${NC}Time: ${BROWN}$(((ENDTIME-BEGTIME)/60)):$(((ENDTIME-BEGTIME)%60)) ${NC}for this test"
		#MAX=$(ls -1 ?*${TESTFILE} | wc -l | tr -d ' ')
		#TEST=$(cat -e ${AEXESAVE} | grep "return of ft_printf and printf are identic" | wc -l | tr -d ' ')
		#if [ ${TEST} -gt $((${MAX}*(2/3))) ]; then
		#	echo "${GREEN}[Test return ]> ${NC}You are validate ${GREEN}${TEST}/${MAX} ${NC}return test"
		#else
		#	echo "${RED}[Test return ]> ${NC}You are validate ${RED}${TEST}/${MAX} ${NC}return test"
		#fi
	elif [ ${choice} = d ]; then # IF DELET
		clear
		echo "${PURPLE}._________________________________. d-Delet"
		echo "                                   \\_______/ ${NC}"
		# THEN DELET
		Make -C ${PROJ} fclean
		if [ $? = 0 ]; then
			echo "${GREEN}Make fclean of ${NAME} OK :) ${NC}"
		else
			echo "${RED}Error: make fclean of ${NAME} :( ${NC}"
		fi
		rm -f *${EXEFILE}
	elif [ ${choice} = p ]; then # OPTION
		clear
		echo "/OPTION ${VER}\\____________________________"
		echo "\nChange path of ${NAME} ? y: for yes"
		read -s -n 1 path
		if [ ${path} = y ]; then
			echo "Select path of ${NAME} source:"
			read DSRC
			echo "Select path of ${NAME} includes:"
			read DINC
		fi
		echo "\nChange test of ${NAME} ? y: for yes"
		read -s -n 1 path
		if [ ${path} = y ]; then
			echo "Select ver ref file of ${NAME}"
			read VER
			echo "Select area ref file of ${NAME}"
			read AREA
		fi
		echo "\nChange path of libft ? y: for yes"
		read -s -n 1 path
		if [ ${path} = y ];then
			echo "Select path of libft source:"
			read DSRCLIB
			echo "Select path of libft includes:"
			read DINCLIB
		fi
		echo "\nChange path of project ? y: for yes"
		read -s -n 1 path
		if [ ${path} = y ]; then
			echo "Select path of project:"
			read PROJ
		fi
		clear
	else
		clear
		echo "____________________________________________"
		echo "${RED}Command not found ${NC}"
	fi
	if [ .t_auto${NAME}.sh -ot auto${NAME}.sh ] || [ -f ${PROJ}/${LPRINTF} ] || [ -f ${PROJ}/libft/libft.a ]; then
		echo "\n/MESSAGE\\___________________________________"
		if [ .t_auto${NAME}.sh -ot auto${NAME}.sh ]; then
			echo "${BROWN}[MAJ Available !]> ${NC}Choice 'q' and relanch auto${NAME} for quit version ${BROWN}$(grep "V" .t_auto${NAME}.sh | cut -d"(" -f2 | cut -d")" -f1) ${NC}and use version ${BROWN}$(grep "VER='" auto${NAME}.sh | sed -n 1p | cut -d"(" -f2 | cut -d")" -f1) ${NC}"
		fi
		if [ -f ${PROJ}/${LPRINTF} ]; then
			echo "${GREEN}[OPEN lib       ]> ${NC}The lib ${GREEN}${LPRINTF} ${NC}exist in ${GREEN}${PROJ} ${NC}"
		fi
		if [ -f ${PROJ}/libft/libft.a ]; then
			echo "${GREEN}[OPEN libft.a   ]> ${NC}The lib ${GREEN}libft.a ${NC}is available"
		fi
	fi
	echo "${BLUE}\n f-Files ${GREEN} n-Norme ${BROWN} m-Make ${RED} o-Fonct ${PURPLE} d-Delet ${BLUE}"
	echo "\\_______/${GREEN}\\_______/${BROWN}\\______/${RED}\\_______/${PURPLE}\\_______/ ${NC}"
	echo "$(cat ${PROJ}/auteur)> New choice or 'q' for quit"
	read -s -n 1 choice
	echo
done
rm -f .t_auto${NAME}.sh
echo "${BLUE}\nGOOD BYE :) And see you soon ! ${NC}${VER}"
