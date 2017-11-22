#!/bin/bash
clear

contador(){
#linha=$(wc -l /registros/register)

dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

linha=$(wc -l register)
linhav=$(echo $linha | cut -d" " -f1)

for ((i=0; i <= $linhav; i++))
do

str=$(cat -n register | grep -n ^ | grep ^$i: | cut -d: -f2)

if [[ $1 == $str ]]
	then
		echo "Localidade já existente!"
		novoa
	fi


done
}

verification(){

length=$(echo ${#S1})

#Fazer algorítimo para transformar os números que estão no arquivo info.txt de cada diretório para saber, respectivamente, o número de laboratórios e o número de bancadas por laboratórios

}

verificacao_categoria1(){

if [[ $1 == "" ]]
	then
		echo "Impossível criar localidade vazia; tente novamente."
		novoa
	fi
}



verificacao_categoria2(){

reg='^[0-100]+$' 
if [[ "$1" =~ $reg ]]
        then
                 echo "$1 não é um número válido. Entre com um número válido"
                 novoa
         fi
}


novoa(){
read -p "Entre com o nome da sua nova localidade: " CATEGORIA

#verificacao_categoria1 $CATEGORIA

#contador $CATEGORIA

dir="/home/vinicius/Projeto/Invent-rio/registros/"

cd $dir 

mkdir $CATEGORIA

if [[ $? == 1 ]]
	then
		novoa
	fi


cd /home/vinicius/Projeto/Invent-rio/registros/$CATEGORIA/

touch catg.csv
chmod 777 catg.csv

touch $CATEGORIA

chmod 777 *
cd /home/vinicius/Projeto/Invent-rio/
echo "Localidade ($CATEGORIA) criada com sucesso!"
echo
read -p "Digite [enter] para retornar ao menu " ENTER

source menu.sh

}



novob(){
dir="/home/vinicius/Projeto/Invent-rio/registros/"

cd /home/vinicius/Projeto/Invent-rio/registros/$CATEGORIA/

read -p "Entre com o número de laboratórios existentes: " NUMERO_LABORATORIOS
verificacao_categoria2 $NUMERO_LABORATORIOS

read -p "Entre com o número de bancadas por laboratórios: " BANCADA_LABORATORIOS

touch info.txt

echo "$NUMERO_LABORATORIOS;$BANCADA_LABORATORIOS" >> info.txt

echo "Localidade criada com sucesso!"
		

dir="/home/vinicius/Projeto/Invent-rio/"
cd $dir
}

novoa
