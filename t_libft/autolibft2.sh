#! /bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autolibft2.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegrand <clegrand@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/23 21:26:24 by clegrand          #+#    #+#              #
#    Updated: 2015/11/29 20:25:39 by clegrand         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# Recent header, old Autosh

NC='\033[0m'
LGREEN='\033[0;32m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'

if [[ $# -lt 1 ]]; then
	printf "$0: Usage: _path_of_your_project_\n"
	printf "\tif yours headers is not in the root directory of your project
	you can set DINC in the environnement
	(e.g. \"env DINC=incluses_directory $0 _path_of_your_project_\")

	if your library is not in the root directory of your project
	you can set DLIB in the environnement
	(e.g. \"env DLIB=library_directory $0 _path_of_your_project_\")\n"
	exit 1
fi

echo "${LGREEN}/CHECK LIBFT\\"
echo "${YELLOW}\nHELLO :) !"
cat -e $1/auteur
echo " ${LGREEN}"
echo "Scan files, norme and Makefile ?
>       y: yes
> (other): no"
read -s -n 1 nom
if [ ${nom} = "y" ]
then
echo "\n/SCAN FILE\\"
ls -la $1/*
ls -la $1/* | wc -l

echo "\n/SCAN NORME\\"
echo "> Files.c"
norminette $1/*.c
echo "\n> File.h"
norminette $1/*.h

read -s -n 1 -p "Next (Makefile)"

echo "\n/CHECK MAKEFILE\\"
echo "> Make"
make -C $1
ls -a $1/* | find $1 -name *.o | wc -l
ls -a $1/* | find $1 -name libft.a
echo "> Make re"
make -C $1 re
ls -a $1/* | find $1 -name *.o | wc -l
echo "> Make all"
make -C $1 all
sh detect2.sh $1/libft.a
echo "> Make fclean"
make -C $1 fclean
ls -a $1/* | find $1 -name *.o | wc -l
ls -a $1/* | find $1 -name libft.a
echo "> Make (re)all"
fi
make -C $1

rm -f t_*
rm -f f_*
rm -f remain
rm -f main_test2
rm -f final_test

read -s -n 1 -p "Next (Part 1)"

echo "${YELLOW}\n/SCAN PART I\\"
echo "> Fonction memset"
gcc -Wall -Wextra -Werror source/t_memset.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_memset
./t_memset "Keep calm and call Master chief" 117 12
./t_memset "Keep calm and call Master Chief" 105 30
./t_memset "Keep calm and call Master chief" 97 42

echo "${YELLOW}\n> Fonction bzero"
gcc -Wall -Wextra -Werror source/t_bzero.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_bzero
./t_bzero "Keep calm and call Master chief" 12 | cat -e

echo "${YELLOW}\n> Fonction memcpy"
gcc -Wall -Wextra -Werror source/t_memcpy.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_memcpy
./t_memcpy "Keep calm and call Master chief" "Force of Luigi" 12
./t_memcpy "Keep calm and call Master chief" "Force of Luigi" 42
./t_memcpy "Keep calm and call Master chief" "Force of Luigi" 0
./t_memcpy "Keep calm and call Master chief" "Force of Luigi" 30

echo "${YELLOW}\n> Fonction memccpy"
gcc -Wall -Wextra -Werror source/t_memccpy.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_memccpy
./t_memccpy "Bonjour" "Salut 2" 117 5
./t_memccpy "Salutation !" "Bienvenue" 117 8
./t_memccpy "Bonjour" "Kuenno !" 66 1
./t_memccpy "Bonjour" "Salut" 0 0

echo "${YELLOW}\n> Fonction memmove"
gcc -Wall -Wextra -Werror source/t_memmove.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_memmove
./t_memmove "Keep calm and call Master chief" 12
./t_memmove "Bonjour" 6
./t_memmove "abcdef" 5

echo "${YELLOW}\n> Fonction memchr"
gcc -Wall -Wextra -Werror source/t_memchr.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_memchr
./t_memchr "Bonjour" 66 4
./t_memchr "bonjour" 111 2
./t_memchr "bon
jour" 32 8
./t_memchr "Is back" 107 7
./t_memchr "Is	back" 9 4

echo "${YELLOW}\n> Fonction memcmp"
gcc -Wall -Wextra -Werror source/t_memcmp.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_memcmp
./t_memcmp "Bonjour" "Bonjour" 8
./t_memcmp "Bonjour" "Bonjous" 7
./t_memcmp "Bonjour" "Bonjous" 6
./t_memcmp "Bonjour" "Boniour" 5
./t_memcmp "Bonjour" " Bonjour" 8

echo "${YELLOW}\n> Fonction strlen"
gcc -Wall -Wextra -Werror source/t_strlen.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strlen
./t_strlen "Keep calm and call Master chief"
./t_strlen ""

echo "${YELLOW}\n> Fonction strdup"
gcc -Wall -Wextra -Werror source/t_strdup.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strdup
./t_strdup "Keep calm and call Master chief"

echo "${YELLOW}\n> Fonction strcpy"
gcc -Wall -Wextra -Werror source/t_strcpy.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strcpy
./t_strcpy "Keep calm and call Master chief" "Force of Luigi"
./t_strcpy "Force of Luigi" "Keep calm and call Master chief"
./t_strcpy "Bonjour" "bONJOUR"

echo "${YELLOW}\n> Fonction strncpy"
gcc -Wall -Wextra -Werror source/t_strncpy.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strncpy
./t_strncpy "Keep calm and call Master chief" "Force of Luigi" 18
./t_strncpy "Force of Luigi" "Keep calm and call Master chief" 18
./t_strncpy "Keep calm and call Master chief" "Force of Luigi" 5
./t_strncpy "llllll" "abc" 6
./t_strncpy "llllll" "abc\0\0" 6
./t_strncpy "llllll" "abcdefghi" 6

echo "${YELLOW}\n> Fonction strcat"
gcc -Wall -Wextra -Werror source/t_strcat.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strcat
./t_strcat "Keep calm and call Master chief" "Force of Luigi"

echo "${YELLOW}\n> Fonction strncat"
gcc -Wall -Wextra -Werror source/t_strncat.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strncat
./t_strncat "To be " "or not to be" 6
./t_strncat "To be " "efefef" 0

echo "${YELLOW}\n> Fonction strlcat"
gcc -Wall -Wextra -Werror source/t_strlcat.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strlcat
./t_strlcat "Keep calm and call Master chief" "Force of Luigi" 18
./t_strlcat "moi" "c'est " 10

echo "${YELLOW}\n> Fonction strchr"
gcc -Wall -Wextra -Werror source/t_strchr.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strchr
./t_strchr "Keep calm and call Master chief" 97

echo "${YELLOW}\n> Fonction strrchr"
gcc -Wall -Wextra -Werror source/t_strrchr.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strrchr
./t_strrchr "Keep calm and call Master chief" 97

echo "${YELLOW}\n> Fonction strstr"
gcc -Wall -Wextra -Werror source/t_strstr.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strstr
./t_strstr "Keep calm and call Master chief" "Force of Luigi"
./t_strstr "Bonjour" "Keep calm and call Master chief"
./t_strstr "BoNjOuR" "bOnJoUr"
./t_strstr "Bonjour" "Bonjour"
./t_strstr "Bobobobojour" "boboj" 3
./t_strstr "" ""
./t_strstr "1" ""
./t_strstr "" "2"

echo "${YELLOW}\n> Fonction strnstr"
gcc -Wall -Wextra -Werror source/t_strnstr.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strnstr
./t_strnstr "Bonjour" "Bonjour" 2
./t_strnstr "BonjouR" "BonjouR" 6
./t_strnstr "BonJour" "Bonjour" 4
./t_strnstr "Bonjour" "BoNjour" 4
./t_strnstr "Bonjour" "Bonjour" 10
./t_strnstr "Bobobobojour" "boboj" 9
./t_strnstr "Bobobobojour" "boboj" 8
./t_strnstr "Bonjour" "" 8
./t_strnstr "" "Bonjour" 8
./t_strnstr "Bonjour" "r" 7
./t_strnstr "Un deux 9" "9" 3
./t_strnstr "Un deux 9" "deux" 5
./t_strnstr "Un deux 96" "6" 10
./t_strnstr "" "" 4

echo "${YELLOW}\n> Fonction strcmp"
gcc -Wall -Wextra -Werror source/t_strcmp.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strcmp
./t_strcmp "Bonjour" "Bonjour"
./t_strcmp "Bonjour" "bonjour"
./t_strcmp "bonjour" "Bonjour"
./t_strcmp "bonJour" "bonjour"
./t_strcmp "bonjour " " bonjour"

echo "${YELLOW}\n> Fonction strncmp"
gcc -Wall -Wextra -Werror source/t_strncmp.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strncmp
./t_strncmp "Bonjour" "Bonjour" 3
./t_strncmp "Bonjour" "bonjour" 1
./t_strncmp "bonjour" "Bonjour" 0
./t_strncmp "bonjour" "bonjour" 4
./t_strncmp "bonJour" "bonjour" 2
./t_strncmp "bonjour " " bonjour" 7
./t_strncmp "bOnjour" "bonjouR" 4
./t_strncmp "bonjour" "Bonjour" -3
./t_strncmp "abc" "abcde" 3
./t_strncmp "abc" "abc\0defg" 100
./t_strncmp "ab\0cde" "abcc\0e" 20

echo "${YELLOW}\n> Fonction atoi"
gcc -Wall -Wextra -Werror source/t_atoi.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_atoi
./t_atoi "42"
./t_atoi "+117"
./t_atoi "-1424211742"
./t_atoi "/112"
./t_atoi " -424242"
./t_atoi "--42"
./t_atoi "-+42"
./t_atoi "	42"
./t_atoi "-1"
./t_atoi
echo "> Secondary:"
./t_atoi "12345678904242424242"
./t_atoi "12345678902424242424"

echo "${YELLOW}\n> Fonction isalpha"
gcc -Wall -Wextra -Werror source/t_isalpha.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_isalpha
./t_isalpha 4
./t_isalpha 'a'
./t_isalpha 'z'
./t_isalpha 'A'
./t_isalpha 'Z'
./t_isalpha ' '
./t_isalpha '{'

echo "${YELLOW}\n> Fonction isdigit"
gcc -Wall -Wextra -Werror source/t_isdigit.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_isdigit
./t_isdigit 42
./t_isdigit -117
./t_isdigit 14242117
./t_isdigit 1
./t_isdigit 9
./t_isdigit -3

echo "${YELLOW}\n> Fonction isalnum"
gcc -Wall -Wextra -Werror source/t_isalnum.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_isalnum
./t_isalnum ' '
./t_isalnum '0'
./t_isalnum '9'
./t_isalnum '_'
./t_isalnum '@'
./t_isalnum 'A'
./t_isalnum 'L'
./t_isalnum '['
./t_isalnum 'c'
./t_isalnum 'z'

echo "${YELLOW}\n> Fonction isascii"
gcc -Wall -Wextra -Werror source/t_isascii.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_isascii
./t_isascii ''
./t_isascii 117
./t_isascii 128
./t_isascii 127
./t_isascii 0
./t_isascii -1

echo "${YELLOW}\n> Fonction isprint"
gcc -Wall -Wextra -Werror source/t_isprint.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_isprint
./t_isprint '	'
./t_isprint '
'
./t_isprint 'z'
./t_isprint 'A'
./t_isprint '~'
./t_isprint ' '

echo "${YELLOW}\n> Fonction toupper"
gcc -Wall -Wextra -Werror source/t_toupper.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_toupper
./t_toupper 'C'
./t_toupper '0'
./t_toupper ' '
./t_toupper 'a'
./t_toupper '_'
./t_toupper 'l'
./t_toupper '~'

echo "${YELLOW}\n> Fonction tolower"
gcc -Wall -Wextra -Werror source/t_tolower.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_tolower
./t_tolower 'C'
./t_tolower '0'
./t_tolower ' '
./t_tolower 'a'
./t_tolower '_'
./t_tolower 'L'
./t_tolower '~'

read -s -n 1 -p "Next (Part 2)"

echo "${PURPLE}\n/SCAN PART II\\"
echo "\n> Fonction ft_memalloc"
gcc -Wall -Wextra -Werror source/t_memalloc.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_memalloc
./t_memalloc 42 | cat -e
./t_memalloc 3 | cat -e
./t_memalloc -5 | cat -e
./t_memalloc 100 | cat -e
./t_memalloc -1 | cat -e
./t_memalloc 0 | cat -e

echo "\n> Fonction ft_memdel"
gcc -Wall -Wextra -Werror source/t_memdel.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_memdel
./t_memdel

echo "\n> Fonction ft_strnew"
gcc -Wall -Wextra -Werror source/t_strnew.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strnew
./t_strnew 42 | cat -e
./t_strnew 3 | cat -e
./t_strnew -5 | cat -e

echo "\n> Fonction ft_strdel"
gcc -Wall -Wextra -Werror source/t_strdel.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strdel
./t_strdel

echo "\n> Fonction ft_strclr"
gcc -Wall -Wextra -Werror source/t_strclr.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strclr
./t_strclr "Keep calm and call Master chief" | cat -e
./t_strclr 'Bonjour   Force of Luigi   Soon' | cat -e

echo "\n> Fonction ft_striter"
gcc -Wall -Wextra -Werror source/t_striter.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_striter
./t_striter "Keep calm and call Master chief"

echo "\n> Fonction ft_striteri"
gcc -Wall -Wextra -Werror source/t_striteri.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_striteri
./t_striteri "Keep calm and call Master chief"

echo "\n> Fonction ft_strmap"
gcc -Wall -Wextra -Werror source/t_strmap.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strmap
./t_strmap "Keep calm and call Master chief"

echo "\n> Fonction ft_strmapi"
gcc -Wall -Wextra -Werror source/t_strmapi.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strmapi
./t_strmapi "Keep calm and call master chief"

echo "\n> Fonction ft_strequ"
gcc -Wall -Wextra -Werror source/t_strequ.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strequ
./t_strequ "Keep calm and call Master chief" "Force of Luigi"
./t_strequ "Bonjour" "Bonjour"
./t_strequ "Bonjour" "bonjour"

echo "\n> Fonction ft_strnequ"
gcc -Wall -Wextra -Werror source/t_strnequ.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strnequ
./t_strnequ "Keep calm and call Master chief" "Force of Luigi" 30
./t_strnequ "Bonjour" "Bonjour" 7
./t_strnequ "Bonjour" "Bonjous" 6
./t_strnequ "Bonjour" "bonjour" -3
./t_strnequ "ededeqdf" "" 0
./t_strnequ "abcde" "abdfe" 2
./t_strnequ "abc" "abc" 100
./t_strnequ "abcde" "abdde" 5
./t_strnequ "cba" "abc" 2

echo "\n> Fonction ft_strsub"
gcc -Wall -Wextra -Werror source/t_strsub.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strsub
./t_strsub "Keep calm and call Master chief" 12 12
./t_strsub "Bonjour" 1 10
./t_strsub "Bonjour" 9 2

echo "\n> Fonction ft_strjoin"
gcc -Wall -Wextra -Werror source/t_strjoin.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strjoin
./t_strjoin "Keep calm and call Master chief" "Force of Luigi"
./t_strjoin "Bonjour" ""
./t_strjoin "" "Bonjour"

echo "\n> Fonction ft_strtrim"
gcc -Wall -Wextra -Werror source/t_strtrim.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strtrim
./t_strtrim "Keep calm and call Master Chief"
./t_strtrim "Bonjour "
./t_strtrim " Bonjour"
./t_strtrim "  	 Bonjour l"
./t_strtrim "  
Bonjour s "
./t_strtrim "	
  	AAA 	 BBB	
	  	"
./t_strtrim ""
./t_strtrim "		
		   "
./t_strtrim "abc" "abc"

echo "\n> Fonction ft_strsplit"
gcc -Wall -Wextra -Werror source/t_strsplit.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_strsplit
./t_strsplit "Keep calm and call Master chief" " "
./t_strsplit "Boeeoonjjjeoooueuuu .eeeee ere*" "e"
./t_strsplit "*salut*les***etudiants*" '*'
./t_strsplit "***salut****!**" '*'
./t_strsplit "*****" '*'
./t_strsplit "coucou" '*'
./t_strsplit "Helle" 'e'
./t_strsplit " " ' '
./t_strsplit "Hello" 'o'
./t_strsplit "" '*'
./t_strsplit "" '/'
./t_strsplit "Concou tou ." ''

echo "\n> Fonction ft_itoa"
gcc -Wall -Wextra -Werror source/t_itoa.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_itoa
./t_itoa 42
./t_itoa -117
./t_itoa -142424242117424242
./t_itoa -1234
./t_itoa 123456000
./t_itoa -2147483648
./t_itoa 0

echo "\n> Fonction ft_putchar"
gcc -Wall -Wextra -Werror source/t_putchar.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_putchar
./t_putchar 'c'
./t_putchar 'C'
./t_putchar '_'

echo "\n> Fonction ft_putstr"
gcc -Wall -Wextra -Werror source/t_putstr.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_putstr
./t_putstr "Keep calm and call Master chief !"

echo "\n> Fonction ft_putendl"
gcc -Wall -Wextra -Werror source/t_putendl.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_putendl
./t_putendl "Keep calm and call Master chief !!"

echo "\n> Fonction ft_putnbr"
gcc -Wall -Wextra -Werror source/t_putnbr.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_putnbr
./t_putnbr 42
./t_putnbr -117
./t_putnbr -142424242
./t_putnbr -2147483648
./t_putnbr -2147483647
./t_putnbr -4242421174242
./t_putnbr 2147483647
./t_putnbr 2147483648

echo "\n> Fonction ft_putchar_fd"
gcc -Wall -Wextra -Werror source/t_putchar_fd.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_putchar_fd
./t_putchar_fd 'C'
./t_putchar_fd 'l'
cat -e f_putchar_fd

echo "\n> Fonction ft_putstr_fd"
gcc -Wall -Wextra -Werror source/t_putstr_fd.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_putstr_fd
./t_putstr_fd "Keep calm and call Master chief"
cat -e f_putstr_fd

echo "\n> Fonction ft_putendl_fd"
gcc -Wall -Wextra -Werror source/t_putendl_fd.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_putendl_fd
./t_putendl_fd "Keep calm and call Master chief"
./t_putendl_fd "Force of Luigi"
cat -e f_putendl_fd

echo "\n> Fonction ft_putnbr_fd"
gcc -Wall -Wextra -Werror source/t_putnbr_fd.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_putnbr_fd
./t_putnbr_fd 42
./t_putnbr_fd -117
./t_putnbr_fd -142424242424242117424242
cat -e f_putnbr_fd

read -s -n 1 -p "Next (BONUS Part)"

echo "${BLUE}\n/SCAN BONUS PART\\"
echo "\n> Fonction ft_lstnew"
gcc -Wall -Wextra -Werror source/t_lstnew.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_lstnew
./t_lstnew "1234"
./t_lstnew ""
./t_lstnew "Keep calm and call Master chief"

echo "${YELLOW}\n/!\\ UNFINISHED :|\n"

#echo "${BLUE}\n> Fonction ft_"
#gcc -Wall -Wextra -Werror source/t_.c -L $1/${DLIB} -lft -I $1/${DINC} -o t_

ls $1
echo "${BLUE}Have you bonus function ?\n${GREEN}      y: For yes\n${RED}(other): For no${NC}"
read -s -n 1 choice
if [[ ${choice} = y ]]; then
	echo "${GREEN}\c"
else
	echo "${RED}\c"
fi
echo "Ok, you can go to [$1] (copy/paste) \nor you can test individualy fonction with:\n\"./t_functionname arguments ...\" :P${NC}"
make -C $1 clean

echo "${YELLOW}END OF TEST ! Thanks and have nice day ! :)${NC}"
exit 0
