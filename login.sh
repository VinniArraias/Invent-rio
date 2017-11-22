#!/bin/bash
clear

incorrect(){

echo
echo "Usuário ou senha incorretos! Tente novamente."
login
}


login(){

USER="admin"
PASS="fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7" #admin

read -p "Usuário: " LOGIN
read -s -p "Senha: " SENHA


SHASENHA=$(echo $SENHA | sha256sum | cut -d" " -f1)

# [[ $LOGIN == $USER ]] && [[ $SHASENHA == $PASS ]] && echo "entrou" || login

if [[ $LOGIN == $USER ]]
	then
		if [[ $SHASENHA == $PASS ]]
			then
				echo
				source menu.sh
		else
			sleep 3
			incorrect	

		fi
	else
		sleep 3
		incorrect	
fi
}


login
