#!/bin/bash

log(){
dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

if [[ $1 == 1 ]]
	then
		INFO="$USER | $date | Função: Listar"
		echo $INFO >> sys_log

elif [[ $1 == 2 ]]
	then
		INFO="$USER | $date | Função: Cadastro_de_patrimônio"
		echo $INFO >> sys_log
		
elif [[ $1 == 3 ]]
	then
		INFO="$USER | $date | Função: Edição_de_patrimônio"
		echo $INFO >> sys_log

elif [[ $1 == 4 ]]
	then
		INFO="$USER | $date | Função: Deletação_de_categoria"
		echo  $INFO >> sys_log

elif [[ $1 == 5 ]]
	then
		INFO="$USER | $date | Função: Deletação_de_patrimônio"
		echo $INFO >> sys_log

elif [[ $1 == 6 ]]
	then
		INFO="$USER | $date | Função: Cadastro_de_categoria"
		echo $INFO >> sys_log

elif [[ $1 == 7 ]]
	then
		INFO="$USER | $date | Função: Log"
		echo $INFO >> sys_log

elif [[ $1 == 8 ]]
	then
		INFO="$USER | $date | Função: Ajuda"
		echo $INFO >> sys_log

elif [[ $1 == 9 ]]
	then
		INFO="$USER | $date | Função: Deslogado_do_sistema"
		echo $INFO > sys_log

else
	echo "Erro de primeiro parâmetro ocorreu."
fi

}

log
