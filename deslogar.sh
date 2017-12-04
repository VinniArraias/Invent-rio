#!/bin/bash
clear

dir="/usr/share/Invent-rio"


deslogar(){

cd $dir

OPCAO=$(dialog --stdout				\
	--title 'Sair'				\
	--menu 'Você deseja...'			\
	0 0 0					\
	"1" 'Encerrar sessão'			\
	"2" 'Desligar'				\
	"3" 'Voltar')


if [[ $? == "1" ]]
                then
                        cd $dir

                         source menu.sh $1

fi

	if [[ $OPCAO == 1 ]]
		then
			OP=21
			source log.sh $OP
			source login.sh

	elif [[ $OPCAO == 2 ]]
		then
			OP=22
			source log.sh $OP

			clear
			echo "Good-bye..."
			exit 0

	else
		source menu.sh $1

fi

}

deslogar $1
