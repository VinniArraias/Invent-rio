#!/bin/bash

dir="/usr/share/Invent-rio"


log(){
cd $dir/registros/
USER=$(cat user_atual.sh)

cd $dir
date=$(date)


if [[ $1 == 1 ]]
	then
		INFO="$USER | $date | Função: Listagem"
		echo "$INFO" >> sys_log


elif [[ $1 == 2 ]]
	then
		INFO="$USER | $date | Função: Listagem de localidades"
		echo "$INFO" >> sys_log

		
elif [[ $1 == 3 ]]
	then
		INFO="$USER | $date | Função: Listagem de itens"
		echo "$INFO" >> sys_log


elif [[ $1 == 4 ]]
	then
		INFO="$USER | $date | Função: Listagem de baixas"
		echo  "$INFO" >> sys_log


elif [[ $1 == 5 ]]
	then
		INFO="$USER | $date | Função: Listagem de usuários cadastrados"
		echo "$INFO" >> sys_log


elif [[ $1 == 6 ]]
	then
		INFO="$USER | $date | Função: Cadastros"
		echo "$INFO" >> sys_log


elif [[ $1 == 7 ]]
	then
		INFO="$USER | $date | Função: Cadastros de localidades"
		echo "$INFO" >> sys_log


elif [[ $1 == 8 ]]
	then
		INFO="$USER | $date | Função: Cadastros de itens"
		echo "$INFO" >> sys_log


elif [[ $1 == 9 ]]
	then
		INFO="$USER | $date | Função: Cadastro de usuários"
		echo "$INFO" >> sys_log


elif [[ $1 == 10 ]]
        then
                INFO="$USER | $date | Função: Edição"
                echo "$INFO" >> sys_log


elif [[ $1 == 11 ]]
        then
                INFO="$USER | $date | Função: Edição de descrição de itens"
                echo "$INFO" >> sys_log


elif [[ $1 == 12 ]]
        then
                INFO="$USER | $date | Função: Edição de ambiente de itens"
                echo "$INFO" >> sys_log


elif [[ $1 == 13 ]]
        then
                INFO="$USER | $date | Função: Edição de apelido de itens"
                echo "$INFO" >> sys_log


elif [[ $1 == 14 ]]
        then
                INFO="$USER | $date | Função: Transferência de itens"
                echo "$INFO" >> sys_log


elif [[ $1 == 15 ]]
        then
                INFO="$USER | $date | Função: Deletação"
                echo "$INFO" >> sys_log


elif [[ $1 == 16 ]]
        then
                INFO="$USER | $date | Função: Deletação de localidades"
                echo "$INFO" >> sys_log


elif [[ $1 == 17 ]]
        then
                INFO="$USER | $date | Função: Deletação de itens"
                echo "$INFO" >> sys_log


elif [[ $1 == 18 ]]
         then
                 INFO="$USER | $date | Função: Deletação de usuários"
                 echo "$INFO" >> sys_log


elif [[ $1 == 19 ]]
         then
                 INFO="$USER | $date | Função: Alteração de localidade"
                 echo "$INFO" >> sys_log


elif [[ $1 == 20 ]]
         then
                 INFO="$USER | $date | Função: Saída"
                 echo "$INFO" >> sys_log


elif [[ $1 == 21 ]]
         then
                 INFO="$USER | $date | Função: Encerramento de sessão"
                 echo "$INFO" >> sys_log


elif [[ $1 == 22 ]]
         then
                 INFO="$USER | $date | Função: Desligamento"
                 echo "$INFO" >> sys_log


elif [[ $1 == 23 ]]
         then
                 INFO="$USER | $date | Função: Mais opções"
                 echo "$INFO" >> sys_log

elif [[ $1 == 24 ]]
         then
                 INFO="$USER | $date | Função: Listagem de log"
                 echo "$INFO" >> sys_log


elif [[ $1 == 25 ]]
         then
                 INFO="$USER | $date | Função: Ajuda"
                 echo "$INFO" >> sys_log


else
	echo 
fi

}

log $1
