#!/bin/bash
clear

verificacao(){
dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

if [[ -r $1 ]]
	then
		echo
	else
		echo "$CATEGORIA inválida!"
		del
	fi

}


del(){
dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

read -p "Entre com a localidade a ser deletada [0 para voltar ao menu]: " CATEGORIA


if [[ $CATEGORIA == 0 ]]
	then
		dir="/home/vinicius/Projeto/Invent-rio/"
		cd $dir

		source menu.sh
fi


verificacao $CATEGORIA

rm -rf $CATEGORIA

echo "Localidade ($CATEGORIA) excluída com sucesso!"

read -p "Pressione [enter] para retornar ao menu." ENTER

clear

dir="/home/vinicius/Projeto/Invent-rio/"
cd $dir
}

del
