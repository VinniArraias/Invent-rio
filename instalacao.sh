#!/bin/bash

install_local(){

cd ..
cp -R Invent-rio/ /usr/share
ln -s /usr/share/Invent-rio/login.sh /usr/bin/Inventario &>/dev/null

}


install_arquivo(){
dir="/usr/share/Invent-rio"
cd $dir

chmod 777 *

mkdir registros
chmod 777 registros/

cd $dir/registros/

touch categ.csv
touch catg.csv
touch gerados.sh
touch listag
echo "Padrão" > listag

touch listagem
echo "Padrão" > listagem

touch user_atual.sh
echo "admin" > user_atual.sh

touch users
echo "admin" > users

touch users.csv

touch usersr2.csv
echo "admin" > usersr2.csv

touch usersr.csv
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
}

install_local
install_arquivo
