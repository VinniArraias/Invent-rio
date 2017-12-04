#!/bin/bash

install_dialog(){
apt-get update
apt-get install dialog -y

}

install_local(){

cd ..
cp -R Invent-rio/ /usr/share
ln -s /usr/share/Invent-rio/login.sh /usr/bin/Inventario &>/dev/null

}


install_arquivo(){
dir="/usr/share/Invent-rio"
cd $dir

touch sys_log

chmod 777 *

mkdir registros
chmod 777 registros/

cd $dir/registros/

touch categ.csv
touch catg.csv
touch gerados.sh
touch listag
#echo "Padrão" > listag

touch listagem
#echo "Padrão" > listagem

touch user_atual.sh
#echo "admin" > user_atual.sh

touch users
#echo "admin" > users

touch users.csv

touch usersr2.csv
#echo "admin" > usersr2.csv

touch usersr.csv
#echo "admin;fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7" > usersr.csv

chmod 777 *

echo "Padrão" > listag

echo "Padrão" > listagem

echo "admin" > user_atual.sh

echo "admin" > users

echo "admin" > usersr2.csv

echo "admin;fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7" > users.csv

echo "admin;fc8252c8dc55839967c58b9ad755a59b61b67c13227ddae4bd3f78a38bf394f7" > usersr.csv



mkdir Padrão

chmod 777 *


cd $dir/registros/Padrão/

touch baixas.csv
touch cat.csv
touch catg.csv
touch Padrão
touch Padrão.csv

chmod 777 *
cd $dir

clear

echo "A instalação foi concluída com sucesso!"
echo
echo "Para iniciar o inventário, digite Inventario e pressione enter."
echo "Obrigado por confiar em nossa equipe!"
}


info(){

clear

echo "Bem-vindo ao setup de instalação do inventário"
echo
echo "O setup instalará e configurará o inventário por completo em seu computador."
echo "Esta instalação necessitará de uma conexão com a internet."
read -p "Deseja instalar o inventário em seu sistema [S/N]?: " OPCAO
echo

	if [[ $OPCAO == "s" || $OPCAO == "S" ]]
		then
			echo "O programa começará a instalação em: "
			sleep 2

			echo "5 segundos..."
			sleep 1
			echo "4 segundos..."
			sleep 1
			echo "3 segundos..."
			sleep 1
			echo "2 segundos..."
			sleep 1
			echo "1 segundo..."
			sleep 1
			echo
			sleep 2
			clear

	elif [[ $OPCAO == "n" || $OPCAO == "N" ]]
		then
			clear
			echo "Instalação cancelada"
			exit 0

	else
		clear
		echo "Opção inválida!"
		read -p "Pressione [enter] para continuar" ENTER
		info
fi


}

info
install_dialog
install_local
install_arquivo
