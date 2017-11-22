#!/bin/bash
clear

#Listar as categoras existentes

validacao(){

dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

if [[ -r $1 ]]
	then
		echo
	else
		listar
	fi
}

verificacao_opcao(){

clear

cd /home/vinicius/Projeto/Invent-rio/

echo "1) Listar por completo"
echo "2) Listar todas as categorias existentes"
echo "3) Listar com base na categoria"
echo "4) Retornar à opção listar"
echo

read -p "Entre com uma opção: " OPCAO

if [[ $OPCAO == 1 ]]
	then

	cd /home/vinicius/Projeto/Invent-rio/registros/$1/
	arquivo="$1.csv"

	less $arquivo
	clear
	listar

elif [[ $OPCAO == 2 ]]
	then
		cd /home/vinicius/Projeto/Invent-rio/registros/$1/
		chmod 777 *
		arquivo="$1.csv"
		

		aw=$(awk 'FS=";"{print $2}' $arquivo | sort -u | nl)
		touch catg.csv
		chmod 777 catg.csv
	
		echo "" > catg.csv
			
		echo "$aw" >> catg.csv

		less catg.csv

		clear

		listar

elif [[ $OPCAO == 3 ]]
	then
		echo "a"
		sleep 3

elif [[ $OPCAO == 4 ]]
	then
		listar

else
	echo "Opção inválida!"
	read -p "Pressione [enter] para retornar " ENTER
	clear
	verificacao_opcao
fi

}


listar(){
#clear

#cd /home/vinicius/Projeto/Invent-rio/

read -p "Entre com a sua localidade: [0 para retornar ao menu]: " CATEGORIA


#Ter opçoes para listar por completo, por categorias inputadas pelo usuário

if [[ $CATEGORIA == 0 ]]
	then
		dir="/home/vinicius/Projeto/Invent-rio/"
		cd $dir
		source menu.sh
	fi

cd /home/vinicius/Projeto/Invent-rio/registros/

validacao $CATEGORIA

cd /home/vinicius/Projeto/Invent-rio/registros/$CATEGORIA/

arquivo="$CATEGORIA.csv"

cd /home/vinicius/Projeto/Invent-rio/

verificacao_opcao $CATEGORIA

#less $arquivo

#less $CATEGORIA.csv

dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir
clear
listar
}

listar
