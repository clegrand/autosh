# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoget_next_line.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/11/09 17:36:46 by clegrand          #+#    #+#              #
#    Updated: 2015/01/05 20:02:44 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NC='\033[0;37m'
GREEN='\033[0;32m'
RED='\033[0;31m'
ERED='echo \033[0;91m'
BLUE='\033[0;36m'
BROWN='\033[0;33m'
EBROWN='echo \033[0;33m'
ENC='echo \033[0;37m'

# Please check if main test is well within the directory
MAIN='main3'
MAINS='mainl'
DIFFILE='f_gnldiff.txt'
MAINB='main2'
MAINP='mainp'

# Unfonctional
#ALL="test02.txt test03.txt test04.txt test05.txt test06 test06.txt test1 test2 test3 test4 test5 test6 test7 test8 test9 test10 test11 test12 test13 txt"

rm -f *_gnl
clear

# BEGIN TEST
echo "${BLUE}//AUTO GET_NEXT_LINE \\"
echo "\\ Checker of project// ${NC}"

# CHECK NAME AND BUFF_SIZE
echo "${BLUE}\nH${GREEN}E${BROWN}L${RED}L${BLUE}O ${GREEN}:) ${BROWN}! ${RED}$(cat -e $1/auteur)\n ${NC}"
echo "${BROWN}Want you change or look BUFF_SIZE ?"
echo "      y: For yes"
echo "(other): For no ${NC}"
read include
if [ ${include} = y ]; then
	vi $1/get_next_line.h
fi

# CHECK FILES
echo "${BLUE}\n/SCAN FILES\\_____. ${NC}"
ls -R $1/*

# SKIP NORME
echo "${BROWN}\nSkip norme ?"
echo "(other): For yes"
echo "      n: For no ${NC}"
read norme

# CHECK NORME
if [ ${norme} = n ]; then
	echo "${BLUE}\n/SCAN NORME\\_____. ${RED}"
	norminette $1/*.c | grep -v "Norme: "
	if [ $? == 1 ]; then
		echo "${GREEN}File.c OK ! ${RED}"
	else
		echo "${RED}ERROR norme in get_next_line.c X( ${RED}"
	fi
	norminette $1/*.h | grep -v "Norme: "
	if [ $? == 1 ]; then
		echo "${GREEN}File.h OK ! ${RED}"
	else
		echo "${RED}ERROR norme in get_next_line.h X( ${RED}"
	fi
	if [ -d $1/libft ]; then
		norminette $1/libft/*.c | grep -v "Norme: "
		if [ $? == 1 ]; then
			echo "${GREEN}libft.c OK ! ${RED}"
		else
			echo "${RED}ERROR norme in one or more libft.c :( ${RED}"
		fi
		norminette $1/libft/includes/libft.h | grep -v "Norme: "
		if [ $? == 1 ]; then
			echo "${GREEN}libft.h OK !\n ${BROWN}"
		else
			echo "${RED}ERROR norme in libft.h :(\n ${BROWN}"
		fi
	fi

	read -p 'Next (Compil choice)' gnl
fi

# CHECK TYPE OF COMPIL AND COMPIL
if [ -d $1/libft ]
then
	echo "${BLUE}\n/COMPIL WITH LIBFT\\_____. ${NC}"
	make -C $1/libft/ fclean
	make -C $1/libft/
	gcc -Wall -Wextra -Werror -I $1/libft/includes/ -c $1/get_next_line.c
	gcc -Wall -Wextra -Werror -I $1/libft/includes/ -I $1 -c ${MAIN}.c
	gcc -Wall -Wextra -Werror -I $1/libft/includes/ -I $1 -c ${MAINP}.c
	gcc -o fail_gnl get_next_line.o ${MAINP}.o -L $1/libft/ -lft
	gcc -o test_gnl get_next_line.o ${MAIN}.o -L $1/libft/ -lft
	if [ $? = 0 ]
	then
		echo "${GREEN}VERY WELL :) You have use libft ! ${NC}"
	else
		echo "${RED}NOT COMPIL :( Are you sur to use libft ? ${NC}"
		exit
	fi
else
	echo "${BLUE}\n\n/COMPIL WITHOUT LIBFT\\_____. ${NC}"
	gcc -Wall -Wextra -Werror -c $1/get_next_line.c
	gcc -Wall -Wextra -Werror -c ${MAIN}.c -I $1/libft/includes -I $1
	gcc -Wall -Wextra -Werror -c ${MAINP}.c -I $1/libft/includes -I $1
	gcc -o fail_gnl get_next_line.o ${MAINP}.o
	gcc -o test_gnl get_next_line.o ${MAIN}.o
	if [ $? = 1 ]
	then
		echo "${RED}NOT COMPIL X( Sorry your project does not compil ${NC}"
		exit
	fi
fi

${EBROWN}
read -p 'Next (Test function)' gnl
${ENC}

# CHECK FONCTION
echo "${BLUE}/TEST FONCTION\\_____. ${NC}"
echo "Ok, Enter file(s) now:"
read files
echo "${BLUE}_On parameters_____. ${NC}"
./test_gnl ${files}
fonc=$?
if [ ${fonc} = 1 ]; then
	echo "${RED}Error :( Your fonction return bad number ${NC}"
elif [ ${fonc} = 2 ]; then
	echo "${RED}OUPS ! :| This error concern main test, sorry ${NC}"
elif [ ${fonc} = 0 ]; then
	echo "${GREEN}GOOD ! :) ${NC}"
else
	echo "${RED}OH NO !!! X( Fonction exit ! ${NC}"
fi
${EBROWN}
echo "Continue for standard file ? yes: 'y' or no: (other)"
${ENC}
read choice2
if [ ${choice2} = y ]; then
	echo "${BLUE}_On stdin_____. ${NC}"
	cat ${files} | ./test_gnl
	fonc=$?
	if [ ${fonc} = 1 ]; then
		echo "${RED}Error :( Your fonction return bad number ${NC}"
	elif [ ${fonc} = 2 ]; then
		echo "${RED}OUPS ! :| This error concern main test, sorry ${NC}"
	elif [ ${fonc} = 0 ]; then
		echo "${GREEN}GOOD ! :) ${NC}"
	else
		echo "${RED}OH NO !!! X( Fonction exit ! ${NC}"
	fi

	${EBROWN}
	read -p 'Next (Check difference of origin file)'
	${ENC}
fi

# CHECK DIFF
echo "${BLUE}/CHECK DIFFERENCE\\_____. ${NC}"
if [ -d $1/libft ]; then
	make -C $1/libft/ fclean
	make -C $1/libft/
	gcc -Wall -Wextra -Werror -I $1/libft/includes/ -c $1/get_next_line.c
	gcc -Wall -Wextra -Werror -I $1/libft/includes/ -I $1 -c ${MAINS}.c
	gcc -o speed_gnl get_next_line.o ${MAINS}.o -L $1/libft/ -lft
else
	gcc -Wall -Wextra -Werror -c $1/get_next_line.c
	gcc -Wall -Wextra -Werror -c ${MAINS}.c -I $1/libft/includes -I $1
	gcc -o speed_gnl get_next_line.o ${MAINS}.o
fi
echo "Write name file at compare"
read file
echo "I place: ${BROWN}${file} ${NC}in file: ${BROWN}${DIFFILE} ${NC}for compare... ${NC}"
time ./speed_gnl ${file} > ${DIFFILE}
${ERED}
diff ${file} ${DIFFILE}
vdiff=$?
if [ ${vdiff} = 1 ]; then
	echo "One or more line(s) not equal :(\n ${NC}"
elif [ ${vdiff} = 0 ]; then
	echo "${GREEN}Good :) ! Your programme return identical of origin file\n ${NC}"
else
	echo "ERROR: Are you sur to choice file ? :|\n ${NC}"
fi

echo "${BROWN}Have you done ${BLUE}B${GREEN}O${BROWN}N${RED}U${BLUE}S ${BROWN}?"
echo "      y: For yes"
echo "(other): For no ${NC}"
read choice

# CHECK BONUS
if [ ${choice} = y ]; then
	echo "${BLUE}/CHECK BONUS\\_____. ${NC}"
	if [ -d $1/libft ]; then
		make -C $1/libft/ fclean
		make -C $1/libft/
		gcc -Wall -Wextra -Werror -I $1/libft/includes/ -c $1/get_next_line.c
		gcc -Wall -Wextra -Werror -I $1/libft/includes/ -I $1 -c ${MAINB}.c
		gcc -o bonus_gnl get_next_line.o ${MAINB}.o -L $1/libft/ -lft
	else
		gcc -Wall -Wextra -Werror -c $1/get_next_line.c
		gcc -Wall -Wextra -Werror -c ${MAINB}.c -I $1/libft/includes -I $1
		gcc -o bonus_gnl get_next_line.o ${MAINB}.o
	fi
	./bonus_gnl ${file} ${files}
	fonc=$?
	if [ ${fonc} = 1 ]; then
		echo "${RED}Error :( Your fonction return bad number ${NC}"
	elif [ ${fonc} = 2 ]; then
		echo "${RED}OUPS ! :| This error concern main test, sorry ${NC}"
	elif [ ${fonc} = 0 ]; then
		echo "${GREEN}GOOD ! :) ${NC}"
	else
		echo "${RED}OH NO !!! X( Fonction exit ! ${NC}"
	fi
fi

rm -f *.o

${EBROWN}
read -p 'Next (Manual check files)'
${ENC}

# READ FILES
view $1/get_next_line.c $1/get_next_line.h
if [ -d $1/libft ]; then
	view $1/libft/includes/libft.h
	make -C $1/libft fclean
	echo "libft content: ${BROWN}`ls -1 $1/libft/*.c | wc -l` ${NC}fonction(s)"
fi
echo "${BLUE}END OF TEST, thanks and see you soon ;) ${NC}"
