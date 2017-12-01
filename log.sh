#!/bin/bash

dir="/usr/share/Invent-rio"


log(){
cd $dir

date=$(date)


if [[ $1 == 1 ]]
	then
		INFO="$USER | $date | Função: Listagem"
		echo "$INFO" >> sys_log


elif [[ $1 == 2 ]]
	then
		INFO="$USER | $date | Função: Cadastro"
		echo "$INFO" >> sys_log

		
elif [[ $1 == 3 ]]
	then
		INFO="$USER | $date | Função: Edição de item"
		echo "$INFO" >> sys_log


elif [[ $1 == 4 ]]
	then
		INFO="$USER | $date | Função: Deletação"
		echo  "$INFO" >> sys_log


elif [[ $1 == 5 ]]
	then
		INFO="$USER | $date | Função: Logoff"
		echo "$INFO" >> sys_log


elif [[ $1 == 6 ]]
	then
		INFO="$USER | $date | Função: Mais opções"
		echo "$INFO" >> sys_log


elif [[ $1 == 7 ]]
	then
		INFO="$USER | $date | Função: Listagem de localidades"
		echo "$INFO" >> sys_log


elif [[ $1 == 8 ]]
	then
		INFO="$USER | $date | Função: Listagem de itens"
		echo "$INFO" >> sys_log


elif [[ $1 == 9 ]]
	then
		INFO="$USER | $date | Função: Cadastro de localidades"
		echo "$INFO" >> sys_log


elif [[ $1 == 10 ]]
        then
                INFO="$USER | $date | Função: Cadastro de itens"
                echo "$INFO" >> sys_log


elif [[ $1 == 11 ]]
        then
                INFO="$USER | $date | Função: Deletação de localidade"
                echo "$INFO" >> sys_log


elif [[ $1 == 12 ]]
        then
                INFO="$USER | $date | Função: Deletação de item"
                echo "$INFO" >> sys_log


elif [[ $1 == 13 ]]
        then
                INFO="$USER | $date | Função: Listagem de log"
                echo "$INFO" >> sys_log


elif [[ $1 == 14 ]]
        then
                INFO="$USER | $date | Função: Ajuda"
                echo "$INFO" >> sys_log


elif [[ $1 == 15 ]]
        then
                INFO="$USER | $date | Função: Cadastro de usuários"
                echo "$INFO" >> sys_log


elif [[ $1 == 16 ]]
        then
                INFO="$USER | $date | Função: Listagem de usuários"
                echo "$INFO" >> sys_log


elif [[ $1 == 17 ]]
        then
                INFO="$USER | $date | Função: Remoção de usuários"
                echo "$INFO" >> sys_log

else
	echo "Erro de primeiro parâmetro ocorreu."
fi

}

log $1
