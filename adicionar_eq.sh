#!/bin/bash
clear

dir="/usr/share/Invent-rio"

return_menu(){

if [[ $1 == 0 ]]
	then
		#dir="/home/vinicius/Projeto/Invent-rio/"
		cd $dir
		source menu.sh $LOCALIDADE
	fi
}

verificacao_categoria(){

#dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir/registros/

if [[ -r $1 ]]
         then
                 echo
 
         else #Se a categoria ($1) não existir, então

	dialog									\
		--title 'Localidade'						\
		--msgbox "Esta localidade ($1) não existe; tente novamente."	\
		0 0


	 #echo "Esta localidade ($1) não existe; tente novamente."
 		add_equip1 $LOCALIDADE
fi
}


add_equip1(){

#dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $di/registros/


LOCALIDADE=$1

	if [[ $? == "1" ]]
		then
			cd $dir

			source op2.sh $1
fi


return_menu $LOCALIDADE

verificacao_categoria $LOCALIDADE
}


add_equip2(){

#dir="/home/vinicius/Projeto/Invent-rio/registros/$LOCALIDADE/"
cd $dir/registros/$LOCALIDADE/


exec 3>&1

VALUES=$(dialog --ok-label "Cadastrar"				\
	--backtitle "Linux User Managment"			\
	--title "Cadastrar novo item"				\
	--form "Entre com os dados do novo item a seguir:"	\
	15 50 0							\
	"Categoria       :" 1 1 "" 1 18 40 0			\
	"Descrição       :" 2 1 "" 2 18 40 0			\
	"Nome do ambiente:" 3 1 "" 3 18 40 0			\
	"Apelido         :" 4 1 "" 4 18 40 0			\
	"Quantidade      :" 5 1 "1" 5 18 40 0			\
	2>&1 1>&3)

exec 3>&-

i=1
IFSold=$IFS
export IFS="
"
declare -i NUMB
for valores in $VALUES;do
case $i in
1)CATEGORIAA="$valores";;
2)NOME_PRODUTO="$valores";;
3)NUMERO_LAB="$valores";;
4)DESCRICAO="$valores";;
5)NUMB="$valores";;
esac
i=`expr $i + 1`
done
export IFS="$IFSold"


CATEGORIA=$(echo $CATEGORIAA | tr 'A-Z' 'a-z')

	if [[ $VALUES == "" ]]
		then
			#cd /home/vinicius/Projeto/Invent-rio/
			cd $dir
			source op2.sh $1
fi

if [[ $CATEGORIA == "" || $NOME_PRODUTO == "" || $NUMERO_LAB == "" || $DESCRICAO == "" || $NUMB == "" ]]
	then
		dialog							\
		--title 'Erro'						\
		--msgbox 'Nenhum campo pode ficar vazio.'		\
		0 0

		add_equip2 $1
fi

if [[ $NUMB == "0" ]]
		then
			cd $dir

			dialog						\
				--title 'Erro'				\
				--msgbox 'Valor de quantidade inválido'	\
				0 0

			source op2.sh $1
fi



for i in $(seq $NUMB)
	do

	arquivo="$dir/registros/$LOCALIDADE/$LOCALIDADE.csv"
	arquivog="$dir/registros/"

INFOx=";$CATEGORIA;$NOME_PRODUTO;$NUMERO_LAB;$DESCRICAO"
cd $arquivog

echo $INFOx >> gerados.sh


NUMBER=$(wc -l gerados.sh)

IDx=$(echo $NUMBER | cut -d" " -f1)

ID="00000$IDx"

INFO="$ID;$CATEGORIA;$NOME_PRODUTO;$NUMERO_LAB;$DESCRICAO"
#NUMERO_LAB NUMERO_BANK LADO_BANK

echo $INFO >> $arquivo 


if [[ $? == 1 ]]
	then
		#echo "Algum erro aconteceu durante o cadastro; tente novamente."

		dialog 										\
			--msgbox 'Algum erro ocorrou durante o cadastro; tente novamente.'	\
			0 0

		add_equip2 $1
	else

echo
fi

done

if [[ $NUMB == 1 ]]
                then
                dialog                                                                          \
                        --title 'Sucesso'                                                      	\
                        --msgbox "Cadastado com sucesso!\n Seu número de patrimônio é $ID"      \
                        0 0

	else
		dialog										\
			--title 'Sucesso'							\
			--msgbox "$NUMB itens cadastrados com sucesso!"				\
			0 0
fi
#dir="/home/vinicius/Projeto/Invent-rio/"

cd $dir

source op2.sh $1
}

add_equip1 $1
add_equip2 $1
