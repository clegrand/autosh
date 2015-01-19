# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autofdf.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/12/16 13:57:59 by clegrand          #+#    #+#              #
#    Updated: 2015/01/19 19:31:02 by clegrand         ###   ########.fr        #
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

NAME='fdf'
VER='(V3.53.M9)'
PATHO="c_${NAME}_"
GIT="vogsphere@vogsphere.42.fr:intra/2014/activities/${NAME}/"

if [ -e ../${PATHO}$1 ]; then
	echo "${GREEN}$1 exist ! ${NC}"
else
	echo "${BROWN}Directory ${PURPLE}${PATHO}$1 ${BROWN}does not exist, you want to create git file ? ${NC}"
	read -s -n 1 git
	if [ ${git} = y ]; then
		git clone ${GIT}$1 ../${PATHO}$1
		if [ $? = 0 ]; then
			echo "${GREEN}Great: git succes ! ${PURPLE}${PATHO}$1 ${GREEN}created ${NC}"
			PROJ=../${PATHO}$1
		else
			echo "${RED}Fail git ${NC}"
			PROJ=$1
		fi
	else
		PROJ=$1
	fi
fi

# option default
BEFORE=''
AFTER=''

# Map for o-Funct
FILE_TAB=("" "Blip Blup Blomp Ban Chang chang" empty.fdf 4x4.fdf 4x4v2.fdf test_maps/pnp_flat.fdf test_maps/basictest.fdf test_maps/pentenegpos.fdf 42.fdf 43.fdf 44.fdf 45.fdf test_maps/plat.fdf test_maps/elem.fdf test_maps/pyra.fdf test_maps/pyramide.fdf test_maps/pylone.fdf test_maps/mars.fdf yolo.fdf hard.fdf hard2.fdf map.fdf map2.fdf map3.fdf fdf)
SIZE_TAB=${#FILE_TAB[*]}

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
echo "Choice test or 'q' for quit auto ${NAME}:"
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
		#grep printf ${PROJ}/${DSRC}/*.c
		#grep printf ${PROJ}/${DINC}/*.h
		norminette ${PROJ} | grep -v "^Norme: " | grep -v ": Norminette can't check this file\.$"
		#norminette ${PROJ}/${DSRC}/*.c | grep -v "Norme: "
		if [ $? = 0 ]; then
			echo "ERROR norme in project ${NAME} ! X( ${NC}"
		else
			echo "${GREEN}Norme of ${NAME} OK ! :) ${NC}"
		fi
		#Obsolete version of check norminette
		#norminette ${PROJ}/${DINC}/*.h | grep -v "Norme: "
		#if [ $? = 0 ]; then
		#	echo "ERROR norme in header of ${NAME} ! X("
		#else
		#	echo "${GREEN}Norme of ${NAME} header OK ! :) ${RED}"
		#fi
		#norminette ${PROJ}/libft/${DSRCLIB}/*.c | grep -v "Norme: "
		#if [ $? = 0 ]; then
		#	echo "ERROR norme in project libft ! X("
		#else
		#	echo "${GREEN}Norme of libft OK ! :) ${RED}"
		#fi
		#norminette ${PROJ}/libft/${DINCLIB}/*.h | grep -v "Norme: "
		#if [ $? = 0 ]; then
		#	echo "ERROR norme in header of libft ! X( ${NC}"
		#else
		#	echo "${GREEN}Norme of libft header OK ! :) ${NC}"
		#fi
	elif [ ${choice} = m ]; then # IF MAKE"
		clear
		echo "${BROWN}.________________. m-Make .________________."
		echo "                  \\______/ ${NC}"
		# THEN MAKE
		Make -C ${PROJ} re
		if [ $? = 0 ]; then
			echo "${GREEN}Make re of ${NAME} OK :) ${NC}"
		else
			echo "${RED}Error: make re of ${NAME} :( ${NC}"
		fi
	elif [ ${choice} = o ]; then # IF FONCT
		clear
		echo "${RED}.________________________. o-Fonct ._______."
		echo "                          \\_______/ ${NC}"
		# THEN FONCT
		i=0
		while [ $i -lt ${SIZE_TAB} ]; do
			echo "${BLUE}/Send ${FILE_TAB[$i]} ${NC}"
			./fdf ${FILE_TAB[$i]} &
			${PROJ}/${NAME} ${BEFORE} ${FILE_TAB[$i]} ${AFTER}
			echo "${BLUE}\\_______________. ${NC}"
			i=$(($i + 1))
		done
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
	elif [ ${choice} = p ]; then # OPTION
		clear
		echo "/OPTION ${VER}\\____________________________"
		echo "\nChange flag of ${NAME} ? y: for yes"
		read -s -n 1 path
		if [ ${path} = y ]; then
			echo "Select before flag of ${NAME}:"
			read -a BEFORE
			echo "Select after flag of ${NAME}:"
			read -a AFTER
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
	if [ .t_auto${NAME}.sh -ot auto${NAME}.sh ] || [ -f ${PROJ}/${NAME} ] || [ -f ${PROJ}/libft/libft.a ] || [ ${BEFORE} ] || [ ${AFTER} ]; then
		echo "\n/MESSAGE\\___________________________________"
		if [ .t_auto${NAME}.sh -ot auto${NAME}.sh ]; then
			echo "${BROWN}[MAJ Available !]> ${NC}Choice 'q' and relanch auto${NAME} for quit version ${BROWN}$(grep "V" .t_auto${NAME}.sh | cut -d"(" -f2 | cut -d")" -f1) ${NC}and use version ${BROWN}$(grep "VER='" auto${NAME}.sh | sed -n 1p | cut -d"(" -f2 | cut -d")" -f1) ${NC}"
		fi
		if [ ${BEFORE} ]; then
			echo "${PURPLE}[BEFORE flag    ]> ${NC}Flag ${PURPLE}${BEFORE} ${NC}place before name file"
		fi
		if [ ${AFTER} ]; then
			echo "${PURPLE}[AFTER flag     ]> ${NC}Flag ${PURPLE}${AFTER} ${NC}place after name file"
		fi
		if [ -f ${NAME} ]; then
			echo "${GREEN}[OPEN exe       ]> ${NC}The executable ${GREEN}${NAME} ${NC}exist in ${GREEN}${PROJ} ${NC}"
		fi
		if [ -f ${PROJ}/libft/libft.a ]; then
			echo "${GREEN}[OPEN libft.a   ]> ${NC}The lib ${GREEN}libft.a ${NC}is available"
		fi
	fi
	echo "${BLUE}\n f-Files ${GREEN} n-Norme ${BROWN} m-Make ${RED} o-Fonct ${PURPLE} d-Delet ${BLUE}"
	echo "\\_______/${GREEN}\\_______/${BROWN}\\______/${RED}\\_______/${PURPLE}\\_______/ ${NC}"
	echo "New choice or 'q' for quit:"
	read -s -n 1 choice
	echo
done
rm -f .t_auto${NAME}.sh
echo "${BLUE}\nGOOD BYE :) And see you soon ! ${NC}${VER}"
