#charge ldapsearch and 2milion char

if [ -f tldap ] && [ -f 27.txt ]; then
	rm -f tldap 27.txt
	echo "\033[31mOk: I deleted tldap and 27.txt \033[0m"
else
	echo "\033[33mWait please: I place 2 big command in file... \033[0m"
	ldapsearch > tldap
	openssl rand -out 27.txt -base64 $((2**27 * 3/4))
	echo "\033[32mI finished: you can use tldap and 27.txt for the test \033[0m"
fi
