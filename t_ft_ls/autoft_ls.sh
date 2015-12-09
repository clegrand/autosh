#! /usr/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoft_ls.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/20 21:50:57 by clegrand          #+#    #+#              #
#    Updated: ----/--/-- --:--:-- by clegrand         ###   ########.fr        #
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

VER='(V3.81)'
PATHO='c_ft_ls_'

if [ -e ../${PATHO}$1 ]; then
	echo "${GREEN}$1 exist ! ${NC}"
else
	echo "${BROWN}Directory ${PURPLE}${PATHO}$1 ${BROWN}not exist, you want to create git file ? ${NC}"
	read git
	if [ ${git} = y ]; then
		\git clone vogsphere@vogsphere.42.fr:intra/2014/activities/ft_ls/$1 ../${PATHO}$1
		if [ $? = 0 ]; then
			echo "${GREEN}Great: git succes ! ${PURPLE}${PATHO}$1 ${GREEN}created ${NC}"
		else
			echo "${RED}Fail git ${NC}"
		fi
	fi
fi

# option default
DSRC='src'
DINC='includes'
DSRCLIB=''
DINCLIB='includes'
FLAGS='-1'
PROJ=../${PATHO}$1

if [ -e .t_autoft_ls.sh ]; then
	echo "${RED}You are crash autoft_ls.sh in the last exe ${NC}"
fi

echo "/Hi ! I help autoft_ls.sh for check last version
\\Please d'ont tuch me, thanks :)_____.
Actual version ${VER}" > .t_autoft_ls.sh
chmod 444 t_autoft_ls.sh

${EBROWN}
grep ./ft_ls ~/.zshrc
${ENC}

echo "${BLUE}//AUTO FT_LS\\ ${NC}${VER}"
echo "${BLUE}\\__________// ${NC}"
echo "HELLO :) ! ${BROWN}> $(cat -e ${PROJ}/auteur) <${NC}"
echo "${BLUE}\n f-Files ${GREEN} n-Norme ${BROWN} m-Make ${RED} o-Fonct ${PURPLE} d-Delet ${BLUE}"
echo "\\_______/${GREEN}\\_______/${BROWN}\\______/${RED}\\_______/${PURPLE}\\_______/ ${NC}"
echo "Choice test or 'q' for quit auto ft_ls:"
read  choice
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
		grep printf ${PROJ}/${DSRC}/*.c
		grep printf ${PROJ}/${DINC}/*.h
		norminette ${PROJ}/${DSRC}/*.c | grep -v "Norme: "
		if [ $? = 0 ]; then
			echo "ERROR norme in project ft_ls ! X("
		else
			echo "${GREEN}Norme of ft_ls OK ! :) ${RED}"
		fi
		norminette ${PROJ}/${DINC}/*.h | grep -v "Norme: "
		if [ $? = 0 ]; then
			echo "ERROR norme in header of ft_ls ! X("
		else
			echo "${GREEN}Norme of ft_ls header OK ! :) ${RED}"
		fi
		norminette ${PROJ}/libft/${DSRCLIB}/*.c | grep -v "Norme: "
		if [ $? = 0 ]; then
			echo "ERROR norme in project libft ! X("
		else
			echo "${GREEN}Norme of libft OK ! :) ${RED}"
		fi
		norminette ${PROJ}/libft/${DINCLIB}/*.h | grep -v "Norme: "
		if [ $? = 0 ]; then
			echo "ERROR norme in header of libft ! X( ${NC}"
		else
			echo "${GREEN}Norme of libft header OK ! :) ${NC}"
		fi
	elif [ ${choice} = m ]; then # IF MAKE"
		clear
		echo "${BROWN}.________________. m-Make .________________."
		echo "                  \\______/ ${NC}"
		# THEN MAKE
		Make -C ${PROJ} re
		if [ $? = 0 ]; then
			echo "${GREEN}Make re of ft_ls OK :) ${NC}"
			cp ${PROJ}/ft_ls .
		else
			echo "${RED}Error: make re of ft_ls :( ${NC}"
		fi
	elif [ ${choice} = o ]; then # IF FONCT
		clear
		echo "${RED}.________________________. o-Fonct ._______."
		echo "                          \\_______/ ${NC}"
		# THEN FONCT
		echo "Enter arg for compare ft_ls and ls or q for quit:"
		read cfunc
		while [ "${cfunc}" != q ]; do
			clear
			echo "${BLUE}\n/TESTS\\_________________________________ ${NC}"
			echo "Command test: ${PURPLE}${FLAGS} ${BROWN}${cfunc}\n ${NC}"
			echo "/ft_ls send\\____________________________"
			\./ft_ls ${FLAGS} ${cfunc}
			ft_ret=$?
			echo "\n/ls send\\_______________________________"
			ls ${FLAGS} ${cfunc}
			ls_ret=$?
			echo "\n/diff ft_ls and ls\\_____________________"
			\./ft_ls ${FLAGS} ${cfunc} 2>&1 | grep -v "usage: " | cut -d':' -f2 > f_ft_ls
			ls ${FLAGS} ${cfunc} 2>&1 | grep -v "usage: " | cut -d':' -f2 > f_ls
			${EBROWN}
			diff f_ft_ls f_ls
			if [ $? = 0 ]; then
				echo "${GREEN}\nft_ls and ls are equal ! VERY GOOD :) ${NC}"
			else
				echo "${RED}\nft_ls and ls are not equal, is bad ? :| ${NC}"
			fi
			if [ ${ls_ret} -eq ${ft_ret} ]; then
				echo "${GREEN}return of ft_ls and ls are equal ! return ${BROWN}(${ft_ret}) ${NC}"
			else
				echo "${RED}ft_ls and ls return not equal ! ( ls = ${BROWN}[${ls_ret}] ${RED}| ft_ls = ${BROWN}[${ft_ret}] ${RED}) ${NC}"
			fi
			echo "Enter new command or 'q' for quit:"
			read cfunc
		done
	elif [ ${choice} = d ]; then # IF DELET
		clear
		echo "${PURPLE}._________________________________. d-Delet"
		echo "                                   \\_______/ ${NC}"
		# THEN DELET
		Make -C ${PROJ} fclean
		if [ $? = 0 ]; then
			echo "${GREEN}Make fclean of ft_ls OK :) ${NC}"
		else
			echo "${RED}Error: make fclean of ft_ls :( ${NC}"
		fi
		rm -f ft_ls
		rm -f f_*
	elif [ ${choice} = p ]; then # OPTION
		clear
		echo "/OPTION ${VER}\\____________________________"
		echo "Change default flags ? y: for yes"
		read path
		if [ ${path} = y ]; then
			echo "Select default flags for test:"
			read FLAGS
		fi
		echo "\nChange path of ft_ls ? y: for yes"
		read path
		if [ ${path} = y ]; then
			echo "Select path of ft_ls source:"
			read DSRC
			echo "Select path of ft_ls includes:"
			read DINC
		fi
		echo "\nChange path of libft ? y: for yes"
		read path
		if [ ${path} = y ];then
			echo "Select path of libft source:"
			read DSRCLIB
			echo "Select path of libft includes:"
			read DINCLIB
		fi
		echo "\nChange path of project ? y: for yes"
		read path
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
	if [ .t_autoft_ls.sh -ot autoft_ls.sh ] || [ -f ${PROJ}/ft_ls ] || [ -f ${PROJ}/libft/libft.a ] || [ ${FLAGS} != '' ]; then
		echo "\n/MESSAGE\\___________________________________"
		if [ .t_autoft_ls.sh -ot autoft_ls.sh ]; then
			echo "${BROWN}[MAJ Available !]> ${NC}Choice 'q' and relanch autoft_ls for quit version ${BROWN}$(grep "V" .t_autoft_ls.sh | cut -d"(" -f2 | cut -d")" -f1) ${NC}and use version ${BROWN}$(grep "VER='" autoft_ls.sh | sed -n 1p | cut -d"(" -f2 | cut -d")" -f1) ${NC}"
		fi
		if [ -f ft_ls ]; then
			echo "${GREEN}[OPEN exe ft_ls ]> ${NC}The executable ft_ls exist in this directory"
		fi
		if [ -f ${PROJ}/libft/libft.a ]; then
			echo "${GREEN}[OPEN libft.a   ]> ${NC}The lib libft.a is available"
		fi
		if [ ${FLAGS} != '' ]; then
			echo "${PURPLE}[FLAG Activate  ]> ${NC}Default flag defined: ${PURPLE}${FLAGS} ${NC}"
		fi
	fi
	echo "${BLUE}\n f-Files ${GREEN} n-Norme ${BROWN} m-Make ${RED} o-Fonct ${PURPLE} d-Delet ${BLUE}"
	echo "\\_______/${GREEN}\\_______/${BROWN}\\______/${RED}\\_______/${PURPLE}\\_______/ ${NC}"
	echo "New choice or 'q' for quit:"
	read choice
	echo
done
rm -f .t_autoft_ls.sh
echo "${BLUE}\nGOOD BYE :) And see you soon ! ${VER} ${NC}"
