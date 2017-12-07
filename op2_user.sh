#!/bin/bash

dir="/usr/share/Invent-rio"

opcao(){
clear

OPCAO=$(dialog --stdout				\
	--title 'CADASTRAR'			\
	--menu 'Escolha uma opção: '		\
	0 0 0					\
	"1" 'Cadastrar item'			\
	"2" 'Voltar'				)

if [[ $? == "1" ]]
                then
                        cd $dir

                        source menu_user.sh $1
fi


	if [[ $OPCAO == 1 ]]
		then
			OP=8
			source log.sh $OP
			source adicionar_eq_user.sh $1

	elif [[ $OPCAO == 2 ]]
		then
			source menu_user.sh $1

	else

		dialog 							\
			--title 'Erro'
			--msgbox 'Pressione [enter] para voltar.'	\
			0 0


		opcao $1
fi


}

opcao $1
